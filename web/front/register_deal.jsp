<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.ResultSet"
	pageEncoding="GBK"%>
<!-- ����ConnDB��Ķ��� -->	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!-- ����MemberDaoImpl��Ķ��� -->	
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl" />
<!-- ����Member��Ķ��󣬲���Member����������Խ��и�ֵ -->	
<jsp:useBean id="member" scope="request" class="com.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("GBK");//��������ı���ΪGBK
		String username = member.getUsername();//��ȡ��Ա�˺�
		ResultSet rs = conn.executeQuery("select * from tb_Member where username='" + username + "'");
		if (rs.next()) {//����������������
			out.println("<script language='javascript'>alert('���˺��Ѿ����ڣ�������ע�ᣡ');"
					+ "window.location.href='register.jsp';</script>");
		} else {
			int ret = 0;//��¼���¼�¼�����ı���
			ret = ins_member.insert(member);//����д�Ļ�Ա��Ϣ���浽���ݿ�
			if (ret != 0) {
				session.setAttribute("username", username);//����Ա�˺ű��浽Session��
				out.println("<script language='javascript'>alert('��Աע��ɹ���');"
						+ "window.location.href='index.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('��Աע��ʧ�ܣ�');"
						+ "window.location.href='register.jsp';</script>");
			}
		}
	%>
</body>
</html>