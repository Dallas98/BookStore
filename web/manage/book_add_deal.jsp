<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="ins_book" scope="page" class="com.dao.BookDaoImpl"/> 
<jsp:useBean id="book" scope="page" class="com.model.Book">
<jsp:setProperty name="book" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String bookName=chStr.chStr(book.getBookName());
ResultSet rs=conn.executeQuery("select * from tb_book where bookname='"+bookName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('��ͼ����Ϣ�Ѿ���ӣ�');window.location.href='book_add.jsp';</script>");
}else{
	int ret=0;
        ret=ins_book.insert(book);
	if (ret!=0){
          out.println("<script language='javascript'>alert('ͼ����Ϣ��ӳɹ���');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('ͼ����Ϣ���ʧ�ܣ�');//window.location.href='book_add.jsp';</script>");
        }
}
%>