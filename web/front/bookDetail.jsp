<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %><%-- ����java.sql.ResultSet�� --%>
<%-- ����com.tools.ConnDB��Ķ��� --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>һ������</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">
    <script src="js/jsArr01.js" type="text/javascript"></script>
    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">.mr-megamenu.animate .animating > .mega-dropdown-menu, .mr-megamenu.animate.slide .animating > .mega-dropdown-menu > div {
        transition-duration: 400ms !important;
        -webkit-transition-duration: 400ms !important;
    }</style>
</head>

<body>
<jsp:include page="index-loginCon.jsp"/>
<!-- ��վͷ�� -->
<%@ include file="common-header.jsp" %>
<!-- //��վͷ�� -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">
        <!-- ҳ���������� -->
        <div id="mr-content"
             class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
            <div id="mrshop" class="mrshop common-home">
                <div class="container_oc">
                    <div class="row">
                        <div id="content_oc" class="col-sm-12 view-product">
                            <!-- ����ͼ��ID��ȡ����ʾͼ����Ϣ -->
                            <%
                                int typeSystem = 0;//����ͼ������ID�ı���
                                int ID = Integer.parseInt(request.getParameter("ID"));//��ȡͼ��ID
                                if (ID > 0) {
                                    ResultSet rs = conn.executeQuery("select ID,BookName,Introduce,nowprice,picture,price,typeID "
                                            + "from tb_book where ID=" + ID);//����ID��ѯͼ����Ϣ
                                    String bookName = "";//����ͼ�����Ƶı���
                                    float nowprice = (float) 0.0;//����ͼ���ּ۵ı���
                                    float price = (float) 0.0;//����ͼ��ԭ�۵ı���
                                    String picture = "";//����ͼ��ͼƬ�ı���
                                    String introduce = "";//����ͼ�������ı���
                                    if (rs.next()) {//����ҵ���Ӧ��ͼ����Ϣ
                                        bookName = rs.getString(2);//��ȡͼ������
                                        introduce = rs.getString(3);//��ȡͼ������
                                        nowprice = rs.getFloat(4);//��ȡͼ���ּ�
                                        picture = rs.getString(5);//��ȡͼ��ͼƬ
                                        price = rs.getFloat(6);//��ȡͼ��ԭ��
                                        typeSystem = rs.getInt(7);//��ȡͼ�����ID
                                    }
                                    conn.close();//�ر����ݿ�����
                            %>
                            <!-- ��ʾͼ����ϸ��Ϣ -->
                            <div class="row">
                                <div class="col-xs-12 col-md-4 col-sm-4">
                                    <ul class="thumbnails" style="list-style: none">
                                        <li><a class="thumbnail" href="#"> <img src="../images/book/<%=picture%>"></a>
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-xs-12 col-md-8 col-sm-8">
                                    <div style="margin-left: 30px; margin-top: 20px">
                                        <h1 class="product-title"><%=bookName%>
                                        </h1>
                                        <ul class="list-unstyled price">
                                            <li><h2><%=nowprice%>Ԫ</h2></li>
                                        </ul>
                                        <ul class="list-unstyled price">
                                            <li>ԭ��: <%=price%>Ԫ</li>
                                        </ul>
                                        <div class="rating"><p>�̳ǻ��ȫ����99����</p></div>
                                        <div id="product">
                                            <hr>
                                            <div class="form-group">
                                                <label class="control-label" for="shuliang"> ���� </label>
                                                <input type="number" name="quantity" value="1" size="2"
                                                       id="shuliang" class="form-control"> <br>
                                                <div class="btn-group">
                                                    <button type="button" onclick="addCart()"
                                                            class="btn btn-primary btn-primary">
                                                        <i class="fa fa-shopping-cart"></i> ��ӵ����ﳵ
                                                    </button>
                                                    <button type="button" id="button-wishlist" data-toggle="tooltip"
                                                            class="btn"
                                                            title="�ղ�" data-original-title="�ղ�"><i
                                                            class="fa fa-heart"></i></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 description_oc clearfix">
                                    <ul class="nav nav-tabs htabs">
                                        <li class="active" style="width: 150px"><a href="#tab-description"
                                                                                   data-toggle="tab"
                                                                                   aria-expanded="true">ͼ������</a></li>
                                    </ul>
                                    <div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
                                        <div class="tab-pane active" id="tab-description">
                                            <%=introduce%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                } else {//��ȡ����ID���Ϸ�
                                    out.println("<script language='javascript'>alert('���Ĳ�������');window.location.href='index.jsp';</script>");
                                }
                            %>
                            <!-- //��ʾͼ����ϸ��Ϣ -->
                            <!-- ��ʾ���ͼ�� -->
                            <div class="mr-module related-products">
                                <h3 class="module-title ">���ͼ��</h3>
                                <!-- ��ʾ�ײ����ͼ�� -->
                                <jsp:include page="relatedBook.jsp">
                                    <jsp:param name="typeSystem" value="<%=typeSystem%>"/>
                                </jsp:include>
                                <!-- // ��ʾ�ײ����ͼ�� -->
                            </div>
                            <!-- //��ʾ���ͼ�� -->
                            <!-- //����ͼ��ID��ȡ����ʾͼ����Ϣ -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- //ҳ���������� -->
        <!-- ��ʾ�������ͼ�� -->
        <jsp:include page="leftHotBook.jsp">
            <jsp:param name="typeSystem" value="<%=typeSystem%>"/>
        </jsp:include>
        <!-- // ��ʾ�������ͼ�� -->

    </div>
</div>
<!-- ��Ȩ�� -->
<%@ include file="common-footer.jsp" %>
<!-- //��Ȩ�� -->
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script type="text/javascript">
    function addCart() {
        var num = $('#shuliang').val();//��ȡ�����ͼ������
        //��֤����������Ƿ�Ϸ�
        if (num < 1) {//���������������Ϸ�
            alert('��������С��1��');
            return;
        }
        window.location.href = "cart_add.jsp?bookID=<%=ID%>&num=" + num;//������ӹ��ﳵҳ�棬ʵ�ֽ���ͼ����ӵ����ﳵ
    }
</script>
</body>
</html>
