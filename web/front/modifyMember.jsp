<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.ResultSet"%><%-- ����java.sql.ResultSet�� --%>
<%-- ����com.tools.ConnDB��Ķ��� --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" /><%-- ����ChStr��Ķ��� --%>
<%
	String username = (String) session.getAttribute("username");
	if (username != null && username != "") {
		String sql = "select * from tb_member where username='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		int id = -1;
		String truename = "";
		String PWD = "";
		String city = "";
		String address = "";
		String postcode = "";
		String cardNO = "";
		String cardType = "";
		String tel = "";
		String email = "";
		if (rs.next()) {
			id = rs.getInt(1);
			truename = rs.getString(3);
			System.out.println(truename);
			PWD = rs.getString(4);
			city = rs.getString(5);
			address = rs.getString(6);
			postcode = rs.getString(7);
			cardNO = rs.getString(8);
			cardType = rs.getString(9);
			tel = rs.getString(12);
			email = rs.getString(13);
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>ע��-����Book</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">

    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">.mr-megamenu.animate .animating > .mega-dropdown-menu, .mr-megamenu.animate.slide .animating > .mega-dropdown-menu > div {
        transition-duration: 400ms !important;
        -webkit-transition-duration: 400ms !important;
    }</style>
</head>

<body>
	<jsp:include page="index-loginCon.jsp" />
	<!-- ��վͷ�� -->
	<%@ include file="common-header.jsp"%>
	<!-- //��վͷ�� -->

	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- MAIN CONTENT -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="system-message-container" style="display: none;"></div>

				<div class="registration col-sm-6 col-sm-offset-3">

						<!-- ��Աע��� -->
					<form id="member-registration" action="modifyMember_deal.jsp"
						onsubmit="return regis();" method="post"
						class="form-horizontal">

							<fieldset>
								<legend style="color: #929292; font-size: 26px">�޸��û���Ϣ</legend>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">
											�˻� ��</label>
									</div>
									<div class="col-sm-8">
										<!-- �˻��ı��� -->
										<input type="text" name="username" id="username"
									value="<%=username%>" class="required" size="38"
									aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											��ʵ���� ��</label>
									</div>
									<div class="col-sm-8">
										<!-- ������ʵ�������ı��� -->
										<input type="text" name="truename" id="jform_username"
									value="<%=truename%>" class="validate-username required"
									size="38" aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											ԭ���� ��</label>
									</div>
									<div class="col-sm-8">
										<!-- �����ı��� -->
										<input type="password" name="pwd" id="pwd" value=""
									autocomplete="off" class="validate-password required" size="38"
									maxlength="99" required="required" aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>


								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											������ ��</label>
									</div>
									<div class="col-sm-8">
										<!-- �����ı��� -->
										<input type="password" name="newPwd" id="newPwd" value=""
									autocomplete="off" class="validate-password required" size="38"
									maxlength="99" aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											ȷ������ ��</label>
									</div>
									<div class="col-sm-8">
										<!-- ȷ�������ı��� -->
										<input type="password" name="newPwd2" id="newPwd2"
									class="validate-password required" value="" size="38"
									aria-required="true"><span class="star">*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											��ϵ�绰 ��</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- ������ϵ�绰���ı��� -->
										<input type="text" name="tel" class="validate-email " id="tel"
									value="<%=tel%>" size="38" autocomplete="email" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											���� ��</label>
									</div>
									<div class="col-sm-8" style="clear: none;">
										<!-- ����������ı��� -->
										<input type="email" name="email" class="validate-email"
									id="jform_email2" value="<%=email%>" size="38"
									aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8" style="margin-left: 150px;"><input name="ID" type="hidden" value="<%=id%>">
										<button type="submit" class="btn btn-primary pull-left" style="width:100px;">�ύ</button>
							<button type="button" onclick="javascript:history.go(-1)"
								class="btn btn-primary pull-left" style="width:100px;">ȡ��</button>
									</div>
								</div>
							</fieldset>
						</form>
				</div>

			</div>
			<!-- //MAIN CONTENT -->

		</div>
	</div>
	<!-- ��Ȩ�� -->
	<%@ include file="common-footer.jsp"%>
	<!-- //��Ȩ�� -->
</body>
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script>
	function regis() {

		if (/^[\u4e00-\u9fa5]+$/.test($('#username').val())) {
			alert("�˻��������뺺�֣�");
			return false;
		}

		if (isNaN($('#tel').val())) {
			alert("��ϵ�绰����������");
			return false;
		}

		var pwd = document.getElementById("newPwd").value;
		var pwd2 = document.getElementById("newPwd2").value;
		if (pwd !== pwd2) {
			alert('�޸ĺ�����ǰ��һ�£�');
			return false;
		}
		return true;
	}
</script>
</html>
<%
	conn.close();
	} else {
		out.println(
				"<script lanage='javascript'>alert('���ȵ�¼�����޸ĸ�����Ϣ!');window.location.href='index.jsp';</script>");
	}
%>