<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<!-- ����java.sql.ResultSet�� -->
<!-- ����com.tools.ConnDB��Ķ��� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
    <jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>��Ա��Ϣ�޸�</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<script>
    var pwd1 = document.getElementById("newPwd").value;
</script>
<%
    request.setCharacterEncoding("GBK");
    Integer id = member.getID();
    String pwd = member.getPwd();
    ResultSet rs = conn.executeQuery("select * from tb_Member where ID='" + id + "'");
    String pwdSql = "";
    while (rs.next()) {
        pwdSql = rs.getString("passWord");
    }
    if (!pwd.equals(pwdSql)) {
        out.println("<script language='javascript'>alert('ԭ���벻��ȷ��');window.location.href='modifyMember.jsp';</script>");
        return;
    }

    String newPwd = request.getParameter("newPwd");
    member.setPwd(newPwd);

    int ret = 0;
    ret = ins_member.update(member);
    if (ret != 0) {
        session.setAttribute("username", member.getUsername());
        out.println("<script language='javascript'>alert('��Ա��Ϣ�޸ĳɹ���');window.location.href='index.jsp';</script>");
    } else {
        out.println("<script language='javascript'>alert('��Ա��Ϣ�޸�ʧ�ܣ�');window.location.href='modifyMember.jsp';</script>");
    }
%>
</body>
</html>
