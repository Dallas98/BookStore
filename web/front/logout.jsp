<%@ page contentType="text/html; charset=GBK" language="java" %>
<html>
<head>
    <title>正在退出</title>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<%
    session.invalidate();
    response.sendRedirect("index.jsp");
%>
</body>
</html>
