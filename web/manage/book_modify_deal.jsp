<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="up_book" scope="page" class="com.dao.BookDaoImpl"/>
<jsp:useBean id="book" scope="page" class="com.model.Book">
<jsp:setProperty name="book" property="*"/>
</jsp:useBean>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
Integer id=book.getID();
ResultSet rs=conn.executeQuery("select * from tb_book where ID="+id);
if (!rs.next()){
	out.println("<script language='javascript'>alert('���Ĳ�������');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        ret=up_book.update(book);
	if (ret!=0){
          out.println("<script language='javascript'>alert('ͼ����Ϣ�޸ĳɹ���');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('ͼ����Ϣ�޸�ʧ�ܣ�');window.location.href='index.jsp';</script>");
        }
}
%>
