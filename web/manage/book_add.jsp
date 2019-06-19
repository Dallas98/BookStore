<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    ResultSet rs_super = conn.executeQuery("select ID,superType from V_type group by ID,superType");
    int superID = -1;
    String superName = "";
    if (rs_super.next()) {
        superID = rs_super.getInt(1);
    } else {
        out.println("<script language='javascript'>alert('请先录入类别信息!');window.location.href='index.jsp';</script>");
        return;
    }
%>
<html>
<head>
    <title>一间书屋――后台管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <link href="CSS/style.css" rel="stylesheet">
    <script language="javascript" src="JS/jquery.min.js"></script>
    <script language="javascript">
        /***************************调用函数*************************/
        $(document).ready(function () {
            selSubType(<%=superID%>);
        });

        function selSubType(val) {

            $.get("selSubType.jsp",
                {superID: val},
                function (data) {
                    $("#subType").html(data); 		//显示获取到的小分类
                });
        }
    </script>
</head>
<script language="javascript">
    function mycheck() {
        if (form1.bookName.value == "") {
            alert("请输入书名称！");
            form1.bookName.focus();
            return;
        }
        if (form1.picture.value == "") {
            alert("请输入图片文件的路径！");
            form1.picture.focus();
            return;
        }
        if (form1.price.value == "") {
            alert("请输入图书的定价！");
            form1.price.focus();
            return;
        }
        if (isNaN(form1.price.value)) {
            alert("您输入的定价错误，请重新输入！");
            form1.price.value = "";
            form1.price.focus();
            return;
        }
        if (form1.introduce.value == "") {
            alert("请输入图书简介！");
            form1.introduce.focus();
            return;
        }
        form1.submit();
    }
</script>
<body>
<jsp:include page="banner.jsp"/>
<table width="1280" height="288" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
    <tr>

        <td align="center" valign="top">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="10" height="38" align="right">&nbsp;</td>
                    <td colspan="3" class="tableBorder_B_dashed"><img src="images/manage_ico1.GIF" width="11"
                                                                      height="11">&nbsp;<a href="superType.jsp">
                        [大分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a
                            href="subType.jsp">[小分类信息管理]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico3.GIF"
                                                                                   width="12" height="12">&nbsp;<a
                            href="book_add.jsp">[添加图书信息]</a></td>
                    <td width="12">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td height="10" colspan="3">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td height="29" align="right">&nbsp;</td>
                    <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
                    <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>添加图书信息</b>
                    </td>
                    <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!---->
            <form action="book_add_deal.jsp" method="post" name="form1">
                <table width="94%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF">
                    <tr>
                        <td width="14%" height="27">&nbsp;书名称：</td>
                        <td height="27" colspan="3">&nbsp;
                            <input name="bookName" type="text" class="Sytle_text" id="bookID2" size="50">&nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="27">&nbsp;所属大类：</td>
                        <td width="31%" height="27">&nbsp;
                            <select name="supertype" class="textarea" id="supertype" onChange="selSubType(this.value)">
                                <%
                                    rs_super.first();
                                    do {
                                        superID = rs_super.getInt(1);
                                        superName = rs_super.getString(2);
                                %>
                                <option value="<%=superID%>"><%=superName%>
                                </option>
                                <%} while (rs_super.next());%>
                            </select></td>
                        <td width="13%" height="27"> &nbsp;所属小类：</td>
                        <td width="42%" height="27" id="subType">正在调用小分类信息……</td>
                    </tr>
                    <tr>
                        <td height="41">&nbsp;图片文件：</td>
                        <td height="41">&nbsp;
                            <input name="picture" type="text" class="Style_upload" id="picture">
                        </td>
                        <td height="41">&nbsp;定　　价：</td>
                        <td height="41">
                            <span style="float:left;"><input name="price" type="text" class="Sytle_text"
                                                             id="price"></span><span
                                style="float:left;padding-top:10px;">&nbsp;(元)</span></td>
                    </tr>
                    <tr>
                        <td height="45">&nbsp;是否新品：</td>
                        <td>&nbsp; <input name="newBook" type="radio" class="noborder" value="1" checked>
                            是
                            <input name="newBook" type="radio" class="noborder" value="0">
                            否
                        </td>
                        <td>&nbsp;是否特价：</td>
                        <td><input name="sale" type="radio" class="noborder" value="1" checked>
                            是
                            <input name="sale" type="radio" class="noborder" value="0">
                            否
                        </td>
                    </tr>
                    <tr>
                        <td height="103">&nbsp;图书简介：</td>
                        <td colspan="3"><span class="style5">&nbsp; </span>
                            <textarea name="introduce" cols="60" rows="5" style="height:180px;"
                                      id="introduce"></textarea></td>
                    </tr>
                    <tr>
                        <td height="38" colspan="4" align="center">
                            <input name="Button" type="button" class="btn_bg_short" value="保存" onClick="mycheck()">
                            &nbsp;
                            <input name="Submit2" type="reset" class="btn_bg_short" value="重置">
                            &nbsp;
                            <input name="Submit3" type="button" class="btn_bg_short" value="返回"
                                   onClick="JScript:history.back(-1)">
                        </td>
                    </tr>
                </table>
            </form>
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
