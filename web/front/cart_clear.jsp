<%@ page contentType="text/html; charset=GBK" language="java" %>
<%
session.removeAttribute("cart");//�Ƴ�Session
response.sendRedirect("cart_null.jsp");//ת�����ﳵΪ��ҳ��
%>
