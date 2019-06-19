<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    String PID = "";
    String bookname = "";
    int superID1 = -1;
    int subID1 = -1;
    String introduce = "";
    String picture = "";
    float price = 0f;
    float nowprice = 0f;
    int sale = 0;
    int newbook = 0;
    PID = request.getParameter("ID");
    if (PID != null && PID != "") {
        int ID = Integer.parseInt(PID);
        ResultSet rs = conn.executeQuery("select * from V_book where ID=" + ID);
        if (!rs.next()) {
            out.println("<script lanuage='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';</script>");
        } else {
            superID1 = rs.getInt("superID");
            subID1 = rs.getInt("subID");
            bookname = rs.getString("bookname");
            introduce = rs.getString("introduce");
            price = rs.getFloat("Price");
            nowprice = rs.getFloat("nowPrice");
            picture = rs.getString("picture");
            newbook = rs.getInt("newbook");
            sale = rs.getInt("sale");
        }
        ResultSet rs_super = conn.executeQuery("select ID,superType from V_type group by ID,superType");
        int superID = -1;
        String superName = "";
        if (!rs_super.next()) {
            out.println("<script language='javascript'>alert('����¼�������Ϣ!');window.location.href='index.jsp';</script>");
            return;
        }
%>
<html>
<head>
    <title>����Book�D�D��̨����</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <link href="CSS/style.css" rel="stylesheet">
    <script language="javascript" src="JS/jquery.min.js"></script>
    <script language="javascript">
        /***************************���ú���*************************/
        $(document).ready(function () {
            selSubType(<%=superID1%>);
        });

        function selSubType(val) {

            $.get("selSubType.jsp",
                {superID: val},
                function (data) {
                    $("#subType").html(data); 		//��ʾ��ȡ����С����
                });
        }
    </script>
</head>
<script language="javascript">
    function mycheck() {
        if (form1.bookName.value == "") {
            alert("�����������ƣ�");
            form1.bookName.focus();
            return;
        }
        if (form1.picture.value == "") {
            alert("������ͼƬ�ļ���·����");
            form1.picture.focus();
            return;
        }
        if (form1.price.value == "") {
            alert("������ͼ��Ķ��ۣ�");
            form1.price.focus();
            return;
        }
        if (isNaN(form1.price.value)) {
            alert("������Ķ��۴������������룡");
            form1.price.value = "";
            form1.price.focus();
            return;
        }
        if (form1.introduce.value == "") {
            alert("������ͼ���飡");
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
                        [�������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a
                            href="subType.jsp">[С������Ϣ����]</a>&nbsp;&nbsp;&nbsp;<img src="images/manage_ico3.GIF"
                                                                                   width="12" height="12">&nbsp;<a
                            href="book_add.jsp">[���ͼ����Ϣ]</a></td>
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
                    <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>�޸�ͼ����Ϣ</b>
                    </td>
                    <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <!---->
            <form action="book_modify_deal.jsp" method="post" name="form1">
                <table width="94%" border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                    <tr>
                        <td width="14%" height="27">&nbsp;�����ƣ�
                            <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
                        <td height="27" colspan="3">&nbsp;
                            <input name="bookName" type="text" class="Sytle_text" value="<%=bookname%>" size="50">
                            &nbsp;&nbsp;
                        </td>
                    </tr>
                    <tr>
                        <td height="27">&nbsp;�������ࣺ</td>
                        <td width="31%" height="27">&nbsp;
                            <select name="supertype" class="textarea" id="supertype" onChange="selSubType(this.value)">
                                <%
                                    rs_super.first();
                                    do {
                                        superID = rs_super.getInt(1);
                                        superName = rs_super.getString(2);
                                %>
                                <option value="<%=superID%>"<%
                                    if (superID == superID1) {
                                        out.println(" selected");/*ע��˴��ķֺ�*/
                                    }
                                %>><%=superName%>
                                </option>
                                <%} while (rs_super.next());%>
                            </select></td>
                        <td width="13%" height="27"> &nbsp;����С�ࣺ</td>
                        <td width="42%" height="27" id="subType">���ڵ���С������Ϣ����</td>
                    </tr>
                    <tr>
                        <td height="16">&nbsp;ͼƬ�ļ���</td>
                        <td height="27" colspan="3">&nbsp;
                            <input name="picture" type="text" class="Style_upload" id="picture" value="<%=picture%>"
                                   size="30">
                            (�˴�ֻ��дͼƬ�ļ�·������)
                        </td>
                    </tr>
                    <tr>
                        <td height="27" align="center">�������ۣ�</td>
                        <td height="27"><span style="float:left;"><input name="price" type="text" class="Sytle_text"
                                                                         id="price3" value="<%=price%>"
                                                                         size="14"></span><span
                                style="float:left;padding-top:10px;">&nbsp;(Ԫ)</span>
                        </td>
                        <td height="27" align="center">��&nbsp;&nbsp;&nbsp;&nbsp;�ۣ�</td>
                        <td height="27"><span style="float:left;"><input name="nowPrice" type="text" class="Sytle_text"
                                                                         id="price4" value="<%=nowprice%>" size="14">
</span><span style="float:left;padding-top:10px;">&nbsp;(Ԫ)</span></td>
                    </tr>
                    <tr>
                        <td height="45">&nbsp;�Ƿ���Ʒ��</td>
                        <td>&nbsp; <input name="newBook" type="radio" class="noborder"
                                          value="1"<%if(newbook==1){out.print(" checked");}%>>
                            ��
                            <input name="newBook" type="radio" class="noborder"
                                   value="0"<%if(newbook==0){out.print(" checked");}%>>
                            ��
                        </td>
                        <td>&nbsp;�Ƿ��ؼۣ�</td>
                        <td><input name="sale" type="radio" class="noborder"
                                   value="1"<%if(sale==1){out.print(" checked");}%>>
                            ��
                            <input name="sale" type="radio" class="noborder"
                                   value="0"<%if(sale==0){out.print(" checked");}%>>
                            ��
                        </td>
                    </tr>
                    <tr>
                        <td height="103">&nbsp;ͼ���飺</td>
                        <td colspan="3"><span class="style5">&nbsp; </span>
                            <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce"
                                      style="height:180px"><%=introduce%></textarea></td>
                    </tr>
                    <tr>
                        <td height="38" colspan="4" align="center">
                            <input name="Button" type="button" class="btn_bg_short" value="����" onClick="mycheck()">
                            &nbsp;
                            <input name="Submit2" type="reset" class="btn_bg_short" value="����">
                            &nbsp;
                            <input name="Submit3" type="button" class="btn_bg_short" value="����"
                                   onClick="JScript:history.back()">
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

<%
    } else {
        out.println("<script language='javascript'>alert('���Ĳ�������!');window.location.href='index.jsp';");
    }
%>