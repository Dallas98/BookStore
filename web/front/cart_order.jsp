<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<!-- ����java.sql.ResultSet�� -->
<%@ page import="java.util.Vector" %>
<!-- ����Java�������� -->
<%@ page import="com.model.Bookelement" %>
<!-- ���빺�ﳵͼ��ģ���� -->
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<!-- ����ChStr��Ķ��� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<!-- ����ConnDB��Ķ��� -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK">
    <title>Insert title here</title>
</head>
<body>
<%
    if (session.getAttribute("cart") == "") {//�жϹ��ﳵ�����Ƿ�Ϊ��
        out.println(
                "<script language='javascript'>alert('����û�й���!');window.location.href='index.jsp';</script>");
    }
    String Username = (String) session.getAttribute("username");//��ȡ������˻�����
    if (Username != "") {
        try {//��׽�쳣
            ResultSet rs_user = conn.executeQuery("select * from tb_Member where username='" + Username + "'");
            if (!rs_user.next()) {//�����ȡ���˻������ڻ�Ա��Ϣ���в����ڣ���ʾ�Ƿ���Ա��
                session.invalidate();//����Session
                out.println(
                        "<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
                return;//����
            } else {//����Ϸ���Ա���򱣴涩��
                String recevieName = chStr.chStr(request.getParameter("recevieName"));//��ȡ������ջ�������
                String address = chStr.chStr(request.getParameter("address"));//��ȡ������ջ��˵�ַ
                String tel = request.getParameter("tel");//��ȡ����ĵ绰����
                String bz = chStr.chStr(request.getParameter("bz"));//��ȡ����ı�ע
                int orderID = 0;//���屣�涩��ID�ı���
                Vector cart = (Vector) session.getAttribute("cart");//��ȡ���ﳵ����
                int number = 0;//���屣��ͼ�������ı���
                float nowprice = (float) 0.0;//���屣��ͼ��۸�ı���
                float sum = (float) 0;//����ͼ����ı���
                float Totalsum = (float) 0;//����ͼ������ı���
                boolean flag = true;//��Ƕ����Ƿ���Ч��Ϊtrue��ʾ��Ч
                int temp = 0;//���淵���Զ����ɵĶ����ŵı���
                int ID = -1;
                //���붩����������
                float bnumber = cart.size();
                String sql = "insert into tb_Order(bnumber,username,recevieName,address,tel,bz) values("
                        + bnumber + ",'" + Username + "','" + recevieName + "','" + address + "','" + tel
                        + "','" + bz + "')";
                temp = conn.executeUpdate_id(sql);//���涩����������
                if (temp == 0) {//������صĶ�����Ϊ0����ʾ���Ϸ�
                    flag = false;
                } else {
                    orderID = temp;//�����ɵĶ����Ÿ�ֵ������ID����
                }
                String str = "";//������붩����ϸ��Ϣ��SQL���
                //���붩����ϸ������
                for (int i = 0; i < cart.size(); i++) {
                    Bookelement mybookelement = (Bookelement) cart.elementAt(i);//��ȡ���ﳵ�е�һ��ͼ��
                    ID = mybookelement.ID;//��ȡͼ��ID
                    nowprice = mybookelement.nowprice;//��ȡͼ��۸�
                    number = mybookelement.number;//��ȡͼ������
                    sum = nowprice * number;//����ͼ����
                    str = "insert into tb_order_Detail (orderID,bookID,price,number) values(" + orderID + ","
                            + ID + "," + nowprice + "," + number + ")";//���붩����ϸ��SQL���
                    temp = conn.executeUpdate(str);//���涩����ϸ
                    Totalsum = Totalsum + sum;//�ۼӺϼƽ��
                    if (temp == 0) {//�������ֵΪ0����ʾ���Ϸ�
                        flag = false;
                    }
                }

                if (!flag) {//���������Ч
                    out.println("<script language='javascript'>alert('������Ч');history.back();</script>");
                } else {
                    session.removeAttribute("cart");//��չ��ﳵ
                    out.println("<script language='javascript'>alert('�������ɣ����ס���Ķ�����[" + orderID
                            + "]');window.location.href='index.jsp';</script>");//��ʾ���ɵĶ�����
                }
                conn.close();//�ر����ݿ�����
            }
        } catch (Exception e) {//�����쳣
            out.println(e.toString());//����쳣��Ϣ
        }
    } else {
        session.invalidate();//����Session
        out.println(
                "<script language='javascript'>alert('���ȵ�¼���ٽ��й���!');window.location.href='index.jsp';</script>");
    }
%>
</body>
</html>