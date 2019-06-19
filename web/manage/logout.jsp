<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%
    session.invalidate();
    response.sendRedirect("../index.jsp");
%>
