<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%><%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Bookelement"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String username = "";
	username = (String) session.getAttribute("username");
	if (username == "" || username == null) {
		out.println("<script language='javascript'>alert('���ȵ�¼!');window.location.href='index.jsp';</script>");
	} else {
		ResultSet rs = conn.executeQuery(
				"select * from tb_order t1,tb_order_detail t2,tb_book t3 where t2.bookID=t3.ID and t1.OrderID=t2.orderID and t1.username='"
						+ username + "' order by t1.OrderDate desc");
		rs.last();
		int RecordCount = rs.getRow();
		if (RecordCount == 0) {
			out.println("<script language='javascript'>window.location.href='order_null.jsp';</script>");
			return;
		}
		rs.beforeFirst();
		int orderID = 0;
		int number = 0;
		String recevieName = "";
		String tel = "";
		String bookName = "";
		float price = 0;
		String orderDate = "";
%>
<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>�ҵĹ��ﳵ-����Book</title>
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
			<!-- ��ʾ�����б� -->
			<div id="mr-content" class="mr-content col-xs-12">
				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>�ҵĶ���</h1>
									<div class="table-responsive cart-info">
										<table class="table table-bordered">
											<thead>
												<tr>
													<td class="text-center image">������</td>
													<td class="text-center name">��Ʒ����</td>
													<td class="text-center name">��������</td>
													<td class="text-center name">����</td>
													<td class="text-center name">���ѽ��</td>
													<td class="text-center quantity">�ջ�������</td>
													<td class="text-center price">�ջ����ֻ�</td>
													<td class="text-center total">�µ�����</td>
												</tr>
											</thead>
											<tbody>
												<%
													while (rs.next()) {
															orderID = rs.getInt("orderID");
															bookName = rs.getString("bookName");
															number = rs.getInt("number");
															recevieName = rs.getString("recevieName");
															tel = rs.getString("tel");
															price = rs.getFloat("price");
															orderDate = rs.getString("orderDate");
															orderDate = orderDate.substring(0, 16);
												%>
												<tr>
													<td class="text-center image" width="10%"><%=orderID%>
													</td>
													<td class="text-center name"><%=bookName%></td>
													<td class="text-center quantity"><%=number%>��</td>
													<td class="text-center quantity"><%=price%>Ԫ</td>
													<td class="text-center quantity"><%=number * price%>Ԫ</td>
													<td class="text-center quantity"><%=recevieName%></td>
													<td class="text-center quantity"><%=tel%></td>
													<td class="text-center quantity"><%=orderDate%></td>
												</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
							</div>
						</div>
						<br /><br />
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<br />
								<br />
								<div class="buttons">
									<div class="pull-right">
										<a href="index.jsp" class="tigger btn btn-primary btn-primary">��������</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		<!-- //��ʾ�����б� -->
		</div>
	</div>
	<!-- ��Ȩ�� -->
	<%@ include file="common-footer.jsp"%>
	<!-- //��Ȩ�� -->
</body>
</html>
<%
	conn.close();
	}
%>
