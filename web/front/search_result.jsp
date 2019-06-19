<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<!-- ����java.sql.ResultSet�� -->
<!-- ����com.tools.ConnDB��Ķ��� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<!-- ����ChStr��Ķ��� -->
<%
    String searchword = request.getParameter("searchword");
    searchword = chStr.chStr(searchword);
    ResultSet rs = conn.executeQuery(
            "select * from tb_book t1,tb_subType t2 where t1.typeID=t2.ID and t1.bookName like '%"
                    + searchword + "%' order by INTime Desc");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>ͼ���б�-һ������</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>

<body>
<jsp:include page="index-loginCon.jsp"/>
<!-- ��վͷ�� -->
<%@ include file="common-header.jsp" %>
<!-- //��վͷ�� -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">

        <!-- ��ʾ��������ͼ���б� -->
        <div id="mr-content"
             class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">

            <div id="system-message-container" style="display: none;"></div>

            <div id="mrshop" class="mrshop common-home">
                <div class="container_oc">
                    <ul class="breadcrumb">
                    </ul>
                    <div class="row">
                        <div id="content_oc" class="col-sm-12">
                            <div class="box_oc">
                                <div class="box-heading">
                                    <h1 class="mrshop_heading_h1">�������</h1>
                                </div>
                                <div class="box-content1">
                                    <hr>
                                    <div class="row">
                                        <%
                                            String str = (String) request.getParameter("Page");
                                            if (str == null) {
                                                str = "0";
                                            }
                                            int pagesize = 12;
                                            rs.last();
                                            int RecordCount = rs.getRow();

                                            if (RecordCount == 0) {
                                                out.println(
                                                        "<script language='javascript'>alert('����û�м�¼!');window.location.href='index.jsp';</script>");
                                                return;
                                            }
                                            int maxPage = 0;
                                            maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize) : (RecordCount / pagesize + 1);

                                            int Page = Integer.parseInt(str);
                                            if (Page < 1) {
                                                Page = 1;
                                            } else {
                                                if (Page > maxPage) {
                                                    Page = maxPage;
                                                }
                                            }
                                            rs.absolute((Page - 1) * pagesize + 1);
                                            for (int i = 1; i <= pagesize; i++) {
                                                int ID = rs.getInt("ID");
                                                String bookName = rs.getString("bookName");
                                                String introduce = rs.getString("introduce");
                                                String picture = rs.getString("picture");
                                                String TypeName = rs.getString("TypeName");
                                                float nowPrice = rs.getFloat("nowPrice");
                                                String newbook = rs.getInt("newbook") == 0 ? "��" : "��";
                                                String sale = rs.getInt("sale") == 0 ? "��" : "��";
                                        %>
                                        <div
                                                class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                            <div class="product-thumb">
                                                <div class="actions">
                                                    <div class="image">
                                                        <a href="bookDetail.jsp?ID=<%=ID%> "><img
                                                                src="../images/book/<%=picture%>"
                                                                class="img-responsive"> </a>
                                                    </div>
                                                    <div class="button-group btn-grid">
                                                        <div class="cart">
                                                            <button class="btn btn-primary btn-primary"
                                                                    type="button" data-toggle="tooltip"
                                                                    onclick='javascript:window.location.href="cart_add.jsp?bookID=<%=ID%>&num=1"; '
                                                                    style="display: none; width: 33.3333%;"
                                                                    data-original-title="��ӵ����ﳵ">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </div>
                                                        <div class="wishlist">
                                                            <button class="btn" type="button" data-toggle="tooltip"
                                                                    title="�ղ�">
                                                                <i class="fa fa-heart"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="caption">
                                                        <div class="name">
                                                            <a href="bookDetail.jsp?ID=<%=ID%>" style="width: 95%">
                                                                <span style="color: #0885B1">������</span><%=bookName%>
                                                            </a>
                                                        </div>
                                                        <p class="price">
                                                            <span class="price-new">���ࣺ</span>
                                                            <span><%=TypeName%></span>
                                                            <span class="price-tax">�۸�: <%=nowPrice%>Ԫ
																</span>
                                                        </p>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                        <%
                                                try {
                                                    if (!rs.next()) {
                                                        break;
                                                    }
                                                } catch (Exception e) {
                                                }
                                            }
                                        %>
                                    </div>
                                    <div class="row pagination">
                                        <table width="100%" border="0" cellspacing="0"
                                               cellpadding="0">
                                            <tr>
                                                <td height="30" align="right">��ǰҳ����[<%=Page%>/<%=maxPage%>]&nbsp;
                                                    <%
                                                        if (Page > 1) {
                                                    %> <a
                                                            href="search_result.jsp?Page=1&searchword=<%=searchword%>">��һҳ</a>
                                                    <a
                                                            href="search_result.jsp?Page=<%=Page - 1%>&searchword=<%=searchword%>">��һҳ</a>
                                                    <%
                                                        }
                                                        if (Page < maxPage) {
                                                    %> <a
                                                            href="search_result.jsp?Page=<%=Page + 1%>&searchword=<%=searchword%>">��һҳ</a>
                                                    <a
                                                            href="search_result.jsp?Page=<%=maxPage%>&searchword=<%=searchword%>">���һҳ&nbsp;</a>
                                                    <%
                                                        }
                                                    %>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- //��ʾ��������ͼ���б�-->
        <!-- ��ʾ�������ͼ�� -->
        <jsp:include page="leftHotBook.jsp"/>
        <!-- // ��ʾ�������ͼ�� -->

    </div>
</div>
<!-- ��Ȩ�� -->
<%@ include file="common-footer.jsp" %>
<!-- //��Ȩ�� -->
</body>
</html>