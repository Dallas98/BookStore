<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    int typeSystem = Integer.parseInt(request.getParameter("typeSystem"));

    int hot_ID = 0;
    String hot_bookName = "";
    float hot_nowprice = 0;
    String hot_picture = "";
%>
<div class="row">

    <%
        ResultSet rs_relate = conn.executeQuery(
                "select top 6 ID,BookName,nowprice,picture from tb_book where typeID=" + typeSystem + " ");

        int relate_ID = 0;
        String relate_bookName = "";
        float relate_nowprice = 0;
        String relate_picture = "";

        int s3 = 0;
        while (rs_relate.next()) {
            relate_ID = rs_relate.getInt(1);
            relate_bookName = rs_relate.getString(2);
            relate_nowprice = rs_relate.getFloat(3);
            relate_picture = rs_relate.getString(4);
    %>

    <div class="col-lg-2 col-md-3 col-sm-4 col-xs-12">
        <div class="product-grid transition">
            <div class="actions">
                <div class="image">
                    <a href="bookDetail.jsp?ID=<%=relate_ID%>"><img
                            src="../images/book/<%=relate_picture%>"> </a>
                </div>
                <div class="button-group">
                    <div class="cart">
                        <button class="btn btn-primary btn-primary" type="button"
                                data-toggle="tooltip" title=""
                                onclick='javascript:window.location.href="cart_add.jsp?bookID=<%=relate_ID%>&num=1"; '
                                data-original-title="���빺�ﳵ">
                            <i class="fa fa-shopping-cart"></i>
                        </button>
                    </div>

                </div>
            </div>
            <div class="caption">
                <div class="name" style="height: 40px">
                    <a style="width: 90%" href="bookDetail.jsp?ID=<%=relate_ID%>"><span
                            style="color: #0885B1">����:</span> <%=relate_bookName%>
                    </a>
                </div>


                <p class="price" style="margin-top: 40px">
					<span class="price-tax">�۸�:<%=relate_nowprice%> Ԫ
					</span>
                </p>
            </div>
        </div>
    </div>
    <%
            s3++;
        }
    %>

</div>