<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
    ResultSet rs = conn.executeQuery("select * from tb_book order by INTime Desc");
%>
<html>
<head>
    <title>一间书屋――后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <link href="CSS/style.css" rel="stylesheet">
</head>

<body>
<jsp:include page="banner.jsp"/>
<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>

        <td align="center" valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="18" height="45" align="right">&nbsp;</td>
                    <td colspan="3" class="tableBorder_B_dashed"><img src="images/manage_ico1.GIF" width="11"
                                                                      height="11">&nbsp;<a href="superType.jsp">
                        [大分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a
                            href="subType.jsp">[小分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico3.GIF"
                                                                                   width="12" height="12">&nbsp;<a
                            href="book_add.jsp">[添加图书信息]</a></td>
                    <td width="24">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td height="10" colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td height="29" align="right">&nbsp;</td>
                    <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
                    <td width="989" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>图书列表</b>
                    </td>
                    <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!---->
            <table width="92%" height="192" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td valign="top">
                        <table width="100%" height="14" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="13" align="center">&nbsp;</td>
                            </tr>

                        </table>
                        <table width="100%" height="60" border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF"
                               bordercolordark="#FFFFFF" bordercolorlight="#E6E6E6">
                            <tr bgcolor="#eeeeee">
                                <td width="40%" height="24" align="center">书名称</td>
                                <td width="22%" align="center">价格</td>
                                <td width="11%" align="center">是否新品</td>
                                <td width="11%" align="center">是否特价</td>
                                <td width="8%" align="center">修改</td>
                                <td width="8%" align="center">删除</td>
                            </tr>
                            <%
                                String str = (String) request.getParameter("Page");
                                if (str == null) {
                                    str = "0";
                                }
                                int pagesize = 10;
                                rs.last();
                                int RecordCount = rs.getRow();
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
                                    float nowPrice = rs.getFloat("nowPrice");
                                    String newbook = rs.getInt("newbook") == 0 ? "否" : "是";
                                    String sale = rs.getInt("sale") == 0 ? "否" : "是";
                            %>

                            <tr style="padding:5px;">
                                <td height="20" align="center"><a href="book_detail.jsp?ID=<%=ID%>"><%=bookName%>
                                </a></td>
                                <td align="center"><%=nowPrice%>元</td>
                                <td align="center"><%=newbook%>
                                </td>
                                <td align="center"><%=sale%>
                                </td>
                                <td align="center"><a href="book_modify.jsp?ID=<%=ID%>"><img src="images/modify.gif"
                                                                                             width="19" height="19"></a>
                                </td>
                                <td align="center"><a href="book_del.jsp?ID=<%=ID%>"><img src="images/del.gif"
                                                                                          width="20" height="20"></a>
                                </td>
                            </tr>
                            <%
                                    try {
                                        if (!rs.next()) {
                                            break;
                                        }
                                    } catch (Exception e) {
                                    }
                                }
                            %>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td height="30" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
                                    <%if (Page > 1) {%>
                                    <a href="index.jsp?Page=1">第一页</a>　<a href="index.jsp?Page=<%=Page-1%>">上一页</a>
                                    <%
                                        }
                                        if (Page < maxPage) {
                                    %>
                                    　<a href="index.jsp?Page=<%=Page+1%>">下一页</a>　<a href="index.jsp?Page=<%=maxPage%>">最后一页&nbsp;</a>
                                    <%
                                        }
                                    %>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!---->
        </td>

        <td width="182" valign="top">
            <table width="100%" height="431" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="199" valign="top" bgcolor="#FFFFFF">
                        <jsp:include page="navigation.jsp"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<jsp:include page="copyright.jsp"/>
</body>
</html>
