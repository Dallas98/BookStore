<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%> <!-- 导入java.sql.ResultSet类 -->	
<%@ page import="java.util.Vector"%> <!-- 导入Java的向量类 -->
<%@ page import="com.model.Bookelement"%> <!-- 导入购物车图书模型类 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <!-- 创建ConnDB类的对象 -->    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String username=(String)session.getAttribute("username");//获取会员账号
	String num = (String) request.getParameter("num");//获取图书数量
	//如果没有登录，将跳转到登录页面
	if (username == null || username == "") {
		response.sendRedirect("login.jsp");//重定向页面到会员登录页面
		return;//返回
	}

	int ID = Integer.parseInt(request.getParameter("bookID"));//获取图书ID
	String sql = "select * from tb_book where ID=" + ID;//定义根据图书ID查询图书信息的SQL语句
	ResultSet rs = conn.executeQuery(sql);//根据图书ID查询图书
	float nowprice = 0;//定义保存图书价格的变量
	if (rs.next()) {//如果查询到指定图书
		nowprice = rs.getFloat("nowprice");//获取该图书的价格
	}
	Bookelement mybookelement = new Bookelement();//创建保存购物车内图书信息的模型类的对象mybookelement
	mybookelement.ID = ID;//将图书ID保存到mybookelement对象中
	mybookelement.nowprice = nowprice;//将图书价格保存到mybookelement对象中
	mybookelement.number = Integer.parseInt(num);//将购买数量保存到mybookelement对象中
	boolean Flag = true;//记录购物车内是否已经存在所要添加的图书
	Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象
	if (cart == null) {//如果购物车对象为空
		cart = new Vector();//创建一个购物车对象
	} else {
		//判断购物车内是否已经存在所购买的图书
		for (int i = 0; i < cart.size(); i++) {
			Bookelement bookitem = (Bookelement) cart.elementAt(i);//获取购物车内的一个图书
			if (bookitem.ID == mybookelement.ID) {//如果当前要添加的图书已经在购物车中
				bookitem.number = bookitem.number + mybookelement.number;//直接改变购物数量
				cart.setElementAt(bookitem, i);//重新保存到购物车中
				Flag = false;//设置标记变量Flag为false，代表购物车中存在该图书
			}
		}
	}
	if (Flag)//如果购物车内不存在该图书
		cart.addElement(mybookelement);//将要购买的图书保存到购物车中
	session.setAttribute("cart", cart);//将购物车对象添加到Session中
	conn.close();//关闭数据库的连接
	response.sendRedirect("cart_see.jsp");//重定向页面到查看购物车页面
%>
</body>
</html>