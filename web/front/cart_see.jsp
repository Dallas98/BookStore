<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<!-- ����java.sql.ResultSet�� -->
<%@ page import="java.util.Vector" %>
<!-- ����Java�������� -->
<%@ page import="java.text.DecimalFormat" %>
<!-- �����ʽ�����ֵ��� -->
<%@ page import="com.model.Bookelement" %>
<!-- ���빺�ﳵͼ���ģ���� -->
<!-- ����com.tools.ConnDB��Ķ��� -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    String username = (String) session.getAttribute("username");//��ȡ��Ա�˺�
    //���û�е�¼������ת����¼ҳ��
    if (username == "" || username == null) {
        response.sendRedirect("login.jsp");//�ض���ҳ�浽��Ա��¼ҳ��
        return;//����
    } else {
        Vector cart = (Vector) session.getAttribute("cart");//��ȡ���ﳵ����
        if (cart == null || cart.size() == 0) {//������ﳵΪ��
            response.sendRedirect("cart_null.jsp");//�ض���ҳ�浽���ﳵΪ��ҳ��
        } else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>�ҵĹ��ﳵ-һ������</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>

<body>
<jsp:include page="index-loginCon.jsp"/>
<!-- ��վͷ�� -->
<%@ include file="common-header.jsp" %>
<!-- //��վͷ�� -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">
        <!-- ҳ���������� -->
        <div id="mr-content" class="mr-content col-xs-12">
            <div id="mrshop" class="mrshop common-home">
                <div class="container_oc">
                    <div class="row">
                        <div id="content_oc1" class="col-sm-12">
                            <h1>�ҵĹ��ﳵ</h1>
                            <!-- ��ʾ���ﳵ�е�ͼ�� -->
                            <div class="table-responsive cart-info">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="text-center image">ͼ��ͼƬ</td>
                                        <td class="text-left name">������</td>
                                        <td class="text-left quantity">����</td>
                                        <td class="text-right price">����</td>
                                        <td class="text-right total">�ܼ�</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- �������ﳵ�е�ͼ�鲢��ʾ -->
                                    <%
                                        float sum = 0;
                                        DecimalFormat fnum = new DecimalFormat("##0.0");//������ʾ���ĸ�ʽ
                                        int ID = -1;//����ͼ��ID�ı���
                                        String bookname = "";//���������Ƶı���
                                        String picture = "";//����ͼ��ͼƬ�ı���
                                        //�������ﳵ�е�ͼ��
                                        for (int i = 0; i < cart.size(); i++) {
                                            Bookelement bookitem = (Bookelement) cart.elementAt(i);//��ȡһ��ͼ��
                                            sum = sum + bookitem.number * bookitem.nowprice;//�����ܼƽ��
                                            ID = bookitem.ID;//��ȡͼ��ID
                                            if (ID > 0) {
                                                ResultSet rs_book = conn.executeQuery("select * from tb_book where ID=" + ID);
                                                if (rs_book.next()) {
                                                    bookname = rs_book.getString("bookname");//��ȡ������
                                                    picture = rs_book.getString("picture");//��ȡͼ��ͼƬ
                                                }
                                                conn.close();//�ر����ݿ������
                                            }
                                    %>
                                    <!-- ��ʾһ��ͼ����Ϣ -->
                                    <tr>
                                        <td class="text-center image" width="20%"><a
                                                href="bookDetail.jsp?ID=<%=bookitem.ID%>">
                                            <img width="80px" src="../images/book/<%=picture%>"> </a></td>
                                        <td class="text-left name"><a
                                                href="bookDetail.jsp?ID=<%=bookitem.ID%>"><%=bookname%>
                                        </a>
                                        </td>
                                        <td class="text-left quantity"><%=bookitem.number%>��</td>
                                        <td class="text-right price"><%=bookitem.nowprice%>Ԫ</td>
                                        <td class="text-right total"><%=(bookitem.nowprice * bookitem.number)%>Ԫ
                                        </td>
                                    </tr>
                                    <!-- ��ʾһ��ͼ����Ϣ -->
                                    <%
                                        }
                                        String sumString = fnum.format(sum);//��ʽ���ܼƽ��
                                    %>
                                    <!-- //�������ﳵ�е�ͼ�鲢��ʾ -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- //��ʾ���ﳵ�е�ͼ�� -->
                            <!-- ��ʾ�ܼƽ��  -->
                            <div class="row cart-total">
                                <div class="col-sm-4 col-sm-offset-8">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
												<span>
													<strong>�ܼ�:</strong>
													<p><%=sumString%>Ԫ</p>
												</span>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- //��ʾ�ܼƽ��  -->
                        </div>
                    </div>

                    <!-- ��д������Ϣ -->
                    <div class="row">
                        <div id="content_oc2" class="col-sm-12">
                            <h1>������Ϣ</h1>
                            <!-- ��д������Ϣ�ı� -->
                            <form action="cart_order.jsp" method="post" id="myform">
                                <div class="table-responsive cart-info">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="text-right" width="20%">�ջ���������</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="recevieName" name="recevieName" size="10"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">�ջ����ֻ���</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="tel" name="tel" size="10"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">�ջ��˵�ַ��</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="address" name="address" size="1"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">��ע��</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" name="bz" size="1" class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </form>
                            <!-- //��д������Ϣ�ı� -->
                        </div>
                    </div>
                    <!-- //��д������Ϣ -->
                    <br/>
                    <!-- ��ʾ֧����ʽ -->
                    <div class="row">
                        <div id="content_oc3" class="col-sm-12">
                            <h1>֧����ʽ</h1>
                            <div class="table-responsive cart-info">
                                <table class="table table-bordered">
                                    <tbody>
                                    <tr>
                                        <td class="text-left"><img src="images/zhifubao.png"/></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                            <br/> <br/>
                            <div class="buttons">
                                <div class="pull-left">
                                    <a href="index.jsp" class="btn btn-primary btn-default">��������</a>
                                </div>
                                <div class="pull-left">
                                    <a href="cart_clear.jsp" class="btn btn-primary btn-default">��չ��ﳵ</a>
                                </div>
                                <div class="pull-right">
                                    <a href="javascript:zhifu();" class="tigger btn btn-primary btn-primary">����</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //��ʾ֧����ʽ -->
                </div>
            </div>
        </div>
        <!-- //ҳ���������� -->
    </div>
</div>
<!-- ��Ȩ�� -->
<%@ include file="common-footer.jsp" %>
<!-- //��Ȩ�� -->

<!-- ʹ��jBox���ʵ��һ��֧���Ի��� -->
<script type="text/javascript" src="js/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jBox/jquery.jBox-2.3.min.js"></script>
<link type="text/css" rel="stylesheet" href="js/jBox/Skins2/Pink/jbox.css"/>
<script type="text/javascript">
    function zhifu() {
        //��֤�ջ�������
        if ($('#recevieName').val() === "") {
            alert('�ջ�����������Ϊ�գ�');
            return;
        }
        //��֤�ջ����ֻ�
        if ($('#tel').val() === "") {
            alert('�ջ����ֻ�����Ϊ�գ�');
            return;
        }
        //��֤�ֻ����Ƿ�Ϸ�
        if (isNaN($('#tel').val())) {
            alert("�ֻ�������������");
            return;
        }
        //��֤�ջ��˵�ַ
        if ($('#address').val() === "") {
            alert('�ջ��˵�ַ����Ϊ�գ�');
            return;
        }
        //���öԻ�����Ҫ��ʾ������
        var html = '<div class="popup_cont">'
            + '<p>ɨһɨ֧��</p>'
            + '<strong>��<font id="show_money_info"><%=sumString%>Ԫ</font></strong>'
            + '<div style="width: 256px; height: 250px; text-align: center; margin-left: auto; margin-right: auto;" >'
            + '<image src="images/YP.jpg" width="256" height="256" /></div>'
            + '</div><p style="text-align:center">��ע��֧����ȫ</p>';
        var content = {
            state1: {
                content: html,
                buttons: {
                    'ȡ��': 0,
                    '֧��': 1
                },
                buttonsFocus: 0,
                submit: function (v, h, f) {
                    if (v == 0) {//ȡ����ť����Ӧ�¼�
                        return true; //�رմ���
                    }
                    if (v == 1) {//֧����ť����Ӧ�¼�
                        document.getElementById('myform').submit();//�ύ��
                        return true;
                    }
                    return false;
                }
            }
        };
        $.jBox.open(content, '֧��', 400, 450);//��֧������
    }
</script>
<!-- // ʹ��jBox���ʵ��һ��֧���Ի��� -->
</body>
</html>
<% }
}
%>
