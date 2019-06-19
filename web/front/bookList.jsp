<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	String type = request.getParameter("type");
	String typeName = "";
	if (type.equals("14")) {
		typeName = "经营类";
	}
	if (type.equals("15")) {
		typeName = "程序设计类";
	}
	if (type.equals("16")) {
		typeName = "教育类";
	}
	if (type.equals("17")) {
		typeName = "生活类";
	}

	ResultSet rs = conn
			.executeQuery("select * from tb_book t1,tb_subType t2 where t1.typeID=t2.ID and t2.superType="
					+ Integer.parseInt(type) + " order by INTime Desc");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>图书列表-一间书屋</title>
<link rel="stylesheet" href="css/mr-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>

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
	<!-- 网站头部 -->
	<%@ include file="common-header.jsp"%>
	<!-- //网站头部 -->
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">
			<!-- //分页显示图书列表 -->
			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">

				<div id="system-message-container" style="display: none;"></div>

				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<ul class="breadcrumb">
						</ul>
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<div class="box_oc">
									<div class="box-heading">
										<h1 class="mrshop_heading_h1"><%=typeName%></h1>
									</div>
									<div class="box-content">
										<hr>
										<div class="row">
											<%
												String str = (String) request.getParameter("Page");
												if (str == null) {
													str = "0";
												}
												int pagesize = 12;
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
													String picture = rs.getString("picture");
													String TypeName = rs.getString("TypeName");
													float nowPrice = rs.getFloat("nowPrice");
													String newbook = rs.getInt("newbook") == 0 ? "否" : "是";
													String sale = rs.getInt("sale") == 0 ? "否" : "是";
											%>

											<div
												class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="product-thumb">
													<div class="actions">
														<div class="image">
															<a style="width: 95%" href="bookDetail.jsp?ID=<%=ID%> "><img
																src="../images/book/<%=picture%>"
																class="img-responsive"> </a>
														</div>
														<div class="button-group btn-grid">
															<div class="cart">
																<button class="btn btn-primary btn-primary"
																	type="button" data-toggle="tooltip"
																	onclick='javascript:window.location.href="cart_add.jsp?bookID=<%=ID%>&num=1"; '
																	style="display: none; width: 33.3333%;"
																	data-original-title="添加到购物车">
																	<i class="fa fa-shopping-cart"></i>
																</button>
															</div>
															<div class="wishlist">
																<button class="btn" type="button" data-toggle="tooltip"
																	title="收藏">
																	<i class="fa fa-heart"></i>
																</button>
															</div>
														</div>
													</div>
													<div>
														<div class="caption">
															<div class="name">
																<a href="bookDetail.jsp?ID=<%=ID%>" style="width: 95%">
																	<span style="color: #0885B1">名称：</span><%=bookName%></a>
															</div>

															<p class="price">
																<span class="price-new">分类：</span> <span><%=TypeName%></span>
																<span class="price-tax">价格: <%=nowPrice%>元
																</span>
															</p>
														</div>

													</div>
												</div>
											</div>
											<%
												try {
														if (!rs.next()) {
															break;
														}
													} catch (Exception e) {
													}
												}
											%>
										</div>
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												cellpadding="0">
												<tr>
													<td height="30" align="right">当前页数：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a href="bookList.jsp?Page=1&type=<%=type%>">第一页</a> <a
														href="bookList.jsp?Page=<%=Page - 1%>&type=<%=type%>">上一页</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
														href="bookList.jsp?Page=<%=Page + 1%>&type=<%=type%>">下一页</a>
														<a href="bookList.jsp?Page=<%=maxPage%>&type=<%=type%>">最后一页&nbsp;</a>
														<%
															}
														%>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- //分页显示图书列表 -->
			<!-- 显示左侧热门图书 -->
			<jsp:include page="leftHotBook.jsp">
				<jsp:param name="type" value="<%=type%>" />
			</jsp:include>
			<!-- // 显示左侧热门图书 -->
		</div>
	</div>
	<!-- 版权栏 -->
	<%@ include file="common-footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>