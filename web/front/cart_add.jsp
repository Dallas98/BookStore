<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%> <!-- ����java.sql.ResultSet�� -->	
<%@ page import="java.util.Vector"%> <!-- ����Java�������� -->
<%@ page import="com.model.Bookelement"%> <!-- ���빺�ﳵͼ��ģ���� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/> <!-- ����ConnDB��Ķ��� -->    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String username=(String)session.getAttribute("username");//��ȡ��Ա�˺�
	String num = (String) request.getParameter("num");//��ȡͼ������
	//���û�е�¼������ת����¼ҳ��
	if (username == null || username == "") {
		response.sendRedirect("login.jsp");//�ض���ҳ�浽��Ա��¼ҳ��
		return;//����
	}

	int ID = Integer.parseInt(request.getParameter("bookID"));//��ȡͼ��ID
	String sql = "select * from tb_book where ID=" + ID;//�������ͼ��ID��ѯͼ����Ϣ��SQL���
	ResultSet rs = conn.executeQuery(sql);//����ͼ��ID��ѯͼ��
	float nowprice = 0;//���屣��ͼ��۸�ı���
	if (rs.next()) {//�����ѯ��ָ��ͼ��
		nowprice = rs.getFloat("nowprice");//��ȡ��ͼ��ļ۸�
	}
	Bookelement mybookelement = new Bookelement();//�������湺�ﳵ��ͼ����Ϣ��ģ����Ķ���mybookelement
	mybookelement.ID = ID;//��ͼ��ID���浽mybookelement������
	mybookelement.nowprice = nowprice;//��ͼ��۸񱣴浽mybookelement������
	mybookelement.number = Integer.parseInt(num);//�������������浽mybookelement������
	boolean Flag = true;//��¼���ﳵ���Ƿ��Ѿ�������Ҫ��ӵ�ͼ��
	Vector cart = (Vector) session.getAttribute("cart");//��ȡ���ﳵ����
	if (cart == null) {//������ﳵ����Ϊ��
		cart = new Vector();//����һ�����ﳵ����
	} else {
		//�жϹ��ﳵ���Ƿ��Ѿ������������ͼ��
		for (int i = 0; i < cart.size(); i++) {
			Bookelement bookitem = (Bookelement) cart.elementAt(i);//��ȡ���ﳵ�ڵ�һ��ͼ��
			if (bookitem.ID == mybookelement.ID) {//�����ǰҪ��ӵ�ͼ���Ѿ��ڹ��ﳵ��
				bookitem.number = bookitem.number + mybookelement.number;//ֱ�Ӹı乺������
				cart.setElementAt(bookitem, i);//���±��浽���ﳵ��
				Flag = false;//���ñ�Ǳ���FlagΪfalse�������ﳵ�д��ڸ�ͼ��
			}
		}
	}
	if (Flag)//������ﳵ�ڲ����ڸ�ͼ��
		cart.addElement(mybookelement);//��Ҫ�����ͼ�鱣�浽���ﳵ��
	session.setAttribute("cart", cart);//�����ﳵ������ӵ�Session��
	conn.close();//�ر����ݿ������
	response.sendRedirect("cart_see.jsp");//�ض���ҳ�浽�鿴���ﳵҳ��
%>
</body>
</html>