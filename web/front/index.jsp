<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %><%-- ����java.sql.ResultSet�� --%>
<%-- ����com.tools.ConnDB��Ķ��� --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    /* �����ϼ�ͼ����Ϣ */
    ResultSet rs_new = conn.executeQuery("select top 12 t1.ID, t1.BookName,t1.price,t1.picture,t2.TypeName "
            + "from tb_book t1,tb_subType t2 where t1.typeID=t2.ID and "
            + "t1.newBook=1 order by t1.INTime desc");//��ѯ�����ϼ�ͼ����Ϣ
    int new_ID = 0;//���������ϼ�ͼ��ID�ı���
    String new_bookname = "";//���������ϼ������Ƶı���
    float new_nowprice = 0;//���������ϼ�ͼ��۸�ı���
    String new_picture = "";//���������ϼ�ͼ��ͼƬ�ı���
    String typeName = "";//����ͼ�����ı���

    /* ����ͼ����Ϣ */
    ResultSet rs_sale = conn
            .executeQuery("select top 12 t1.ID, t1.BookName,t1.price,t1.nowPrice,t1.picture,t2.TypeName "
                    + "from tb_book t1,tb_subType t2 where t1.typeID=t2.ID and t1.sale=1 "
                    + "order by t1.INTime desc");//��ѯ����ͼ����Ϣ
    int sale_ID = 0;//�������ͼ��ID�ı���
    String s_bookname = "";//������������Ƶı���
    float s_price = 0;//�������ͼ���ԭ�۸�ı���
    float s_nowprice = 0;//�������ͼ��Ĵ��ۺ�۸�ı���
    String s_introduce = "";//�������ͼ����ı���
    String s_picture = "";//�������ͼ��ͼƬ�ı���
%>
<%
    /* ����ͼ����Ϣ */
    ResultSet rs_hot = conn
            .executeQuery("select top 2 ID,BookName,nowprice,picture " + "from tb_book order by hit desc");//��ѯ����ͼ����Ϣ
    int hot_ID = 0;//��������ͼ��ID�ı���
    String hot_bookName = "";//�������������Ƶı���
    float hot_nowprice = 0;//��������ͼ��۸�ı���
    String hot_picture = "";//��������ͼ��ͼƬ�ı���
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>һ������-SHUer�Լ�������</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">
    <script src="js/jsArr01.js" type="text/javascript"></script>


    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<jsp:include page="index-loginCon.jsp"/>
<!-- ��վͷ�� -->
<%@ include file="common-header.jsp" %>
<!-- //��վͷ�� -->
<!-- �ֲ���漰����ͼ�� -->
<div class="container mr-sl mr-sl-1">
    <div class="mr-spotlight mr-spotlight-1  row">
        <!-- ��ʾ�ֲ���� -->
        <div
                class=" col-lg-9 col-md-12  col-sm-3 hidden-sm   col-xs-6 hidden-xs ">
            <div class="mr-module module " id="Mod159">
                <div class="module-inner">
                    <div class="module-ct">
                        <div class="mijoshop">
                            <div class="container_oc">
                                <div class="slideshow">
                                    <div id="slidershow" class="nivoSlider">
                                        <a href="#" class="nivo-imageLink" style="display: block;"><img
                                                src="images/img1.jpg" class="img-responsive"
                                                style="display: none;"> </a>
                                        <a href="#" class="nivo-imageLink" style="display: none;">
                                            <img src="images/img2.jpg" class="img-responsive" style="display: none;">
                                        </a>
                                        <a href="#" class="nivo-imageLink" style="display: none;">
                                            <img src="images/img4.jpg" class="img-responsive"
                                                 style="display: none;">
                                        </a>
                                        <a href="#" class="nivo-imageLink" style="display: none;">
                                            <img src="images/img4.png" class="img-responsive"
                                                 style="display: none;">
                                        </a>
                                    </div>
                                </div>
                                <script type="text/javascript">
                                    //ʵ�ֵ��ûõ�Ƭ����ֲ����

                                    jQuery(document).ready(function () {
                                        jQuery('#slidershow').nivoSlider();
                                    });

                                </script>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ��ʾ����ͼ�� -->
        <div
                class="col-lg-3  col-md-6 hidden-md   col-sm-3 hidden-sm   col-xs-6 hidden-xs ">
            <div class="mr-module module highlight " id="Mod160">
                <div class="module-inner">
                    <h3 class="module-title ">
                        <span>����ͼ��</span>
                    </h3>
                    <div class="module-ct">
                        <div class="mijoshop">
                            <div class="container_oc">
                                <div class="box_oc">
                                    <!-- ѭ����ʾ����ͼ�� ���������ͼ����Ϣ-->
                                    <%
                                        while (rs_hot.next()) {//����һ��ѭ��
                                            hot_ID = rs_hot.getInt(1); //��ȡͼ��ID
                                            hot_bookName = rs_hot.getString(2); //��ȡ������
                                            hot_nowprice = rs_hot.getFloat(3); //��ȡͼ��۸�
                                            hot_picture = rs_hot.getString(4); //��ȡͼ��ͼƬ
                                    %>
                                    <div class="box-product product-grid">
                                        <div>
                                            <div class="image">
                                                <a href="bookDetail.jsp?ID=<%=hot_ID%>"><img
                                                        src="../images/book/<%=hot_picture%>" width="250px">
                                                </a>
                                            </div>
                                            <div class="name">
                                                <a href="bookDetail.jsp?ID=<%=hot_ID%>"><%=hot_bookName%>
                                                </a>
                                            </div>
                                            <!-- �Ǽ������� -->
                                            <div class="rating">
													<span class="fa fa-stack"><i
                                                            class="fa fa-star fa-stack-2x"></i><i
                                                            class="fa fa-star-o fa-stack-2x"></i> </span> <span
                                                    class="fa fa-stack"><i
                                                    class="fa fa-star fa-stack-2x"></i><i
                                                    class="fa fa-star-o fa-stack-2x"></i> </span> <span
                                                    class="fa fa-stack"><i
                                                    class="fa fa-star fa-stack-2x"></i><i
                                                    class="fa fa-star-o fa-stack-2x"></i> </span> <span
                                                    class="fa fa-stack"><i
                                                    class="fa fa-star fa-stack-2x"></i><i
                                                    class="fa fa-star-o fa-stack-2x"></i> </span> <span
                                                    class="fa fa-stack"><i
                                                    class="fa fa-star fa-stack-2x"></i><i
                                                    class="fa fa-star-o fa-stack-2x"></i> </span>
                                            </div>
                                            <!-- // �Ǽ������� -->
                                            <!-- ͼ��۸� -->
                                            <div class="price">
													<span class="price-new">�۸�<%=hot_nowprice%> Ԫ
													</span>
                                            </div>
                                            <!-- // ͼ��۸� -->
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- // ѭ����ʾ����ͼ�� ���������ͼ����Ϣ-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- // ��ʾ����ͼ�� -->
    </div>
</div>
<!-- //�ֲ���漰����ͼ��  -->
<!-- �����ϼܼ�����ͼ��չʾ -->
<nav class="container mr-masstop  hidden-sm hidden-xs">
    <div class="custom">
        <div>
            <div class="ja-tabswrap default" style="width: 100%;">
                <div id="myTab" class="container">

                    <h3 class="index_h3">
                        <span class="index_title">�����ϼ�</span>
                    </h3>
                    <!-- //�����ϼ�ѡ� -->
                    <div class="ja-tab-content ja-tab-content col-6 active"
                         style="opacity: 1; width: 100%; visibility: visible;">
                        <div class="ja-tab-subcontent">
                            <div class="mijoshop">
                                <div class="container_oc">
                                    <div class="row">
                                        <!-- ѭ����ʾ�����ϼ�ͼ�� �����12��ͼ����Ϣ-->
                                        <%
                                            while (rs_new.next()) {//����һ��ѭ��
                                                new_ID = rs_new.getInt(1); //��ȡ�����ϼ�ͼ���ID
                                                new_bookname = rs_new.getString(2); //��ȡ�����ϼ�ͼ���������
                                                new_nowprice = rs_new.getFloat(3); //��ȡ�����ϼ�ͼ��ļ۸�
                                                new_picture = rs_new.getString(4); //��ȡ�����ϼ�ͼ���ͼƬ
                                                typeName = rs_new.getString(5); //��ȡ�����ϼ�ͼ������
                                        %>
                                        <div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
                                            <div class="product-thumb transition">
                                                <div class="actions">
                                                    <div class="image">
                                                        <a href="bookDetail.jsp?ID=<%=new_ID%>"> <img
                                                                src="../images/book/<%=new_picture%>"
                                                                alt="<%=new_bookname%>" class="img-responsive"></a>
                                                    </div>
                                                    <div class="button-group">
                                                        <div class="cart">
                                                            <button class="btn btn-primary btn-primary" type="button"
                                                                    data-toggle="tooltip"
                                                                    onclick='javascript:window.location.href="cart_add.jsp?bookID=<%=new_ID%>&num=1"; '
                                                                    style="display: none; width: 33.3333%;"
                                                                    data-original-title="���뵽���ﳵ">
                                                                <i class="fa fa-shopping-cart"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="caption">
                                                    <div class="name" style="height: 40px">
                                                        <a href="bookDetail.jsp?ID=<%=new_ID%>"> <span
                                                                style="color: #0885B1">������</span> <%=new_bookname%>
                                                        </a>
                                                    </div>
                                                    <p class="price">
                                                        �۸�<%=new_nowprice%>Ԫ
                                                    </p>
                                                </div>
                                            </div>
                                        </div>
                                        <%
                                            }
                                        %>
                                        <!-- //ѭ����ʾ�����ϼ�ͼ�飺���12��ͼ����Ϣ -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //�����ϼ�ѡ� -->
                    <!-- ����ͼ��ѡ� -->
                    <h3 class="index_h3"><span class="index_title">����ͼ��</span></h3>
                    <div class="ja-tab-subcontent">
                        <div class="mijoshop">
                            <div class="container_oc">
                                <div class="row">
                                    <!-- ѭ����ʾ����ͼ�� �����12��ͼ����Ϣ-->
                                    <%
                                        while (rs_sale.next()) {//����һ��ѭ��
                                            sale_ID = rs_sale.getInt(1); //��ȡ����ͼ���ID
                                            s_bookname = rs_sale.getString(2); //��ȡ����ͼ���������
                                            s_price = rs_sale.getFloat(3); //��ȡ����ͼ���ԭ��
                                            s_nowprice = rs_sale.getFloat(4); //��ȡ����ͼ����ּ�
                                            s_picture = rs_sale.getString(5); //��ȡ����ͼ���ͼƬ
                                            typeName = rs_sale.getString(6); //��ȡ����ͼ������
                                    %>
                                    <div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
                                        <div class="product-thumb transition">
                                            <div class="actions">
                                                <div class="image">
                                                    <a href="bookDetail.jsp?ID=<%=sale_ID%> "><img
                                                            src="../images/book/<%=s_picture%>"
                                                            alt="<%=s_bookname%>" class="img-responsive"> </a>
                                                </div>
                                                <div class="button-group">
                                                    <div class="cart">
                                                        <button class="btn btn-primary btn-primary" type="button"
                                                                data-toggle="tooltip"
                                                                onclick='javascript:window.location.href="cart_add.jsp?bookID=<%=sale_ID%>&num=1"; '
                                                                style="display: none; width: 33.3333%;"
                                                                data-original-title="���뵽���ﳵ">
                                                            <i class="fa fa-shopping-cart"></i>
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="caption">
                                                <div class="name" style="height: 40px">
                                                    <a href="bookDetail.jsp?ID=<%=sale_ID%>"
                                                       style="width: 95%"> <span
                                                            style="color: #0885B1">������</span><%=s_bookname%>
                                                    </a>
                                                </div>
                                                <div class="name" style="margin-top: 10px">
                                                    <span style="color: #0885B1">���ࣺ</span><%=typeName%>
                                                </div>
                                                <span class="price"> �ּۣ�<%=s_nowprice%> Ԫ
												</span><br> <span class="oldprice">ԭ�ۣ�<%=s_price%> Ԫ
												</span>
                                            </div>
                                        </div>
                                    </div>
                                    <%
                                        }
                                    %>
                                    <!-- ѭ����ʾ����ͼ�� �����12��ͼ����Ϣ-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- //����ͼ�� ѡ�-->
            </div>
        </div>
    </div>
</nav>
<!-- //�����ϼܼ�����ͼ��չʾ -->
<!-- ��Ȩ�� -->
<%@ include file="common-footer.jsp" %>
<!-- //��Ȩ�� -->
</body>
</html>