<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    String sql = "select top 10 t2.bookName,sum(t1.number) as num" +
            " from tb_order_detail t1,tb_book t2 " +
            " where t1.bookID=t2.ID " +
            " group by t2.bookName " +
            " order by num desc";

    ResultSet rs = conn.executeQuery(sql);
    String bookName = "";
    int num = 0;
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
                    <td align="right">&nbsp;</td>
                    <td height="10" colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td height="29" align="right">&nbsp;</td>
                    <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
                    <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>销量排行榜(前10位)</b>
                    </td>
                    <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!---->
            <table width="96%" height="48" border="1" cellpadding="10" cellspacing="0" bordercolor="#FFFFFF"
                   bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
                <tr align="center">
                    <td width="80%">产品名称</td>
                    <td width="20%">销售数量（个）</td>
                </tr>
                <%

                    while (rs.next()) {

                        bookName = rs.getString("bookName");
                        num = rs.getInt("num");
                        //rs.next();

                %>
                <tr align="center">

                    <td><%=bookName%>
                    </td>
                    <td><%=num%>
                    </td>

                </tr>
                <%
                    }
                %>
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

