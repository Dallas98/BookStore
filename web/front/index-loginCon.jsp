<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />
<%
	String username = (String) session.getAttribute("username");

	if (username == null || username == "") {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">�绰��400-675-1066</span><a
						href="login.jsp">��¼</a>&nbsp; �� &nbsp;<a href="register.jsp">ע��</a>
				</p>
			</div>
			<div class="toolbar-ct-2">
				<a href="orderList.jsp">�ҵĶ���</a>&nbsp;&nbsp; | &nbsp;&nbsp; �ҵ��ղ�
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/booklogo.png">
					</div>
					<div>
						<!-- ������ -->
						<div class="search_box">
							<div class="top-nav-search">
								<form method="post" action="search_result.jsp">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="����������" /> <input type="image"
										src="images/search.png" class="search_box_img"
										onFocus="this.blur()" />
								</form>
							</div>
						</div>
						<!-- //������ -->



					</div>
				</div>

				<div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3">


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;">
						<a href="cart_see.jsp" style="color: #E33737; font-size: 20px;"><i
							class="fa fa-cart1"></i> �ҵĹ��ﳵ</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	} else {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="fa fa-phone"></i> <span style="margin-right: 15px;">�绰��400-675-1066</span>���ã�<%=username%>
					&nbsp; &nbsp;<a href="modifyMember.jsp">�޸�</a>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="logout.jsp">�˳�</a>
				</p>
			</div>
			<div class="toolbar-ct-2">
				<a href="orderList.jsp">�ҵĶ���</a>&nbsp;&nbsp; | &nbsp;&nbsp; <a
					href="">�ҵ��ղ�</a>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/booklogo.png">
					</div>
					<div>
						<!-- ������ -->
						<div class="search_box">
							<div class="top-nav-search">
								<form method="post" action="search_result.jsp">
									<input type="text" name="searchword" size="38"
										style="border: 0px;" class="top-nav-search-input"
										placeholder="����������" /> <input type="image"
										src="images/search.png" class="search_box_img"
										onFocus="this.blur()" />
								</form>
							</div>
						</div>
						<!-- //������ -->



					</div>
				</div>

				<div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3">


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;">
						<a href="cart_see.jsp" style="color: #E33737; font-size: 20px;"><i
							class="fa fa-cart1"></i> �ҵĹ��ﳵ</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	}
%>