<%@ page contentType="text/html; charset=GBK" language="java"%>
<html>
<head>
<title>��̨����!</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
<style type="text/css">
body{
	margin: 0px;
}
</style>
</head>

<body>
 <table width="100%" height="545" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td style="background-image:url(images/managerlogin_bg.png);"> <form name="form1" method="post" action="Login_M_deal.jsp" onSubmit="return checkM(form1)">
      <table width="448" height="345"  border="0" align="center"  style="margin-top:170px;" cellpadding="0" cellspacing="0" background="images/managerlogin_dialog.png">
        <tr>
          <td height="60" colspan="2" align="center">&nbsp;</td>
        </tr>	  
              
        <tr>
          <td width="55" height="280" align="center" valign="top">&nbsp;</td>
          <td width="436" align="left" valign="top">
          <table style="margin-top:30px" width="88%" height="240"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="99%" height="74" align="center"><input name="manager" type="text" id="manager" size="24" style="background:url('images/manager.png');background-repeat: no-repeat;background-position: left;font-size:18px;padding-left:44px;height:44px;width:300px;"></td>
            </tr>
            <tr>
              <td height="30" align="center"><span class="word_white">
                <input name="PWD" type="password" id="PWD" size="24" style="background:url('images/manager_pwd.png');background-repeat: no-repeat;background-position: left;padding-left:44px;height:44px;width:300px;font-size:18px;">
              </span></td>
            </tr>
            <tr>
              <td height="57" align="center"><input name="Submit" type="submit" class="login_ok" value="ȷ��">
                &nbsp;
                <input name="Submit2" type="reset" class="login_reset" value="����">
            </tr>
            <tr>
              <td height="35" align="right">
                <a href="../front/index.jsp"><img src="images/back.png"> �����̳���ҳ</a></td>
            </tr>            
          </table></td>
        </tr>
</table>
      <table width="491" height="39" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td align="center" >All CopyRights &copy; reserved 2016 ����ʡ���տƼ����޹�˾</td>
        </tr>
      </table>
     </form></td>
   </tr>
 </table>
</body>
</html>
