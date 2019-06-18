<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>��¼-����Book</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">

    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- �������� -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div class="login-wrap" style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="index.jsp" title="���������ҳ"><img src="images/booklogo.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;"> <h1 class="login_h1">��Ա��¼</h1> </div>
						<!-- ��Ա��¼�� -->
						<form action="login_check.jsp" method="post" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">�˻� ��</label>
									</div>
									<div class="col-sm-8">
										<!-- �˻��ı��� -->
										<input type="text" name="username" id="username" value="" size="38"
											class="validate-username required" required="required" autofocus="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">���� ��</label>
									</div>
									<div class="col-sm-8">
										<!-- �����ı��� -->
										<input type="password" name=PWD id="password" value=""
											class="validate-password required" size="38" maxlength="99"
											required="required" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">��֤�� ��</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- ��֤���ı��� -->
										<input type="text" name="checkCode" id="checkCode" value=""
											class="validate-password required" style="float: left;"
											title="��֤�����ִ�Сд" size="18" maxlength="4" required="required"
											aria-required="true"> 
											<!-- ��ʾ��֤�� -->
											<img src="../CheckCode" name="checkCode" onClick="myReload()" width="116"
	 											height="43" class="img_checkcode" id="img_checkCode" />
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="submit" class="btn btn-primary login">��¼</button>
									</div>
								</div>
								<div class="form-group"
									style="border-top: 1px solid #D9D9D9; margin: 20px;">
									<label
										style="float: right; color: #858585; margin-right: 40px; margin-top: 10px; font-size: 14px;">û���˻���<a
										href="register.jsp">����ע��</a></label>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
			<!-- //�������� -->
		</div>
	</div>
	<script language="javascript">
		//ˢ����֤��
		function myReload() {
			document.getElementById("img_checkCode").src = document.getElementById("img_checkCode").src + "?nocache=" + new Date().getTime();
		}
	</script>
</body>
</html>