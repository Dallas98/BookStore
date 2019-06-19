<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>一间书屋</title>
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
<!-- 网站头部 -->
<%@ include file="common-header.jsp" %>
<!-- //网站头部 -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">
        <!-- 页面主体内容 -->
        <div id="mr-content"
             class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
            <div id="mrshop" class="mrshop common-home">
                <div class="container_oc">
                    <div class="row">
                        <div id="content_oc" class="col-sm-12 view-product">
                            <!-- 根据图书ID获取并显示图书信息 -->
                            <%
                                int typeSystem = 0;//保存图书类型ID的变量
                                int ID = Integer.parseInt(request.getParameter("ID"));//获取图书ID
                                if (ID > 0) {
                                    ResultSet rs = conn.executeQuery("select ID,BookName,Introduce,nowprice,picture,price,typeID "
                                            + "from tb_book where ID=" + ID);//根据ID查询图书信息
                                    String bookName = "";//保存图书名称的变量
                                    float nowprice = (float) 0.0;//保存图书现价的变量
                                    float price = (float) 0.0;//保存图书原价的变量
                                    String picture = "";//保存图书图片的变量
                                    String introduce = "";//保存图书描述的变量
                                    if (rs.next()) {//如果找到对应的图书信息
                                        bookName = rs.getString(2);//获取图书名称
                                        introduce = rs.getString(3);//获取图书描述
                                        nowprice = rs.getFloat(4);//获取图书现价
                                        picture = rs.getString(5);//获取图书图片
                                        price = rs.getFloat(6);//获取图书原价
                                        typeSystem = rs.getInt(7);//获取图书类别ID
                                    }
                                    conn.close();//关闭数据库连接
                            %>
                            <!-- 显示图书详细信息 -->
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
                                            <li><h2><%=nowprice%>元</h2></li>
                                        </ul>
                                        <ul class="list-unstyled price">
                                            <li>原价: <%=price%>元</li>
                                        </ul>
                                        <div class="rating"><p>商城活动：全场满99包邮</p></div>
                                        <div id="product">
                                            <hr>
                                            <div class="form-group">
                                                <label class="control-label" for="shuliang"> 数量 </label>
                                                <input type="number" name="quantity" value="1" size="2"
                                                       id="shuliang" class="form-control"> <br>
                                                <div class="btn-group">
                                                    <button type="button" onclick="addCart()"
                                                            class="btn btn-primary btn-primary">
                                                        <i class="fa fa-shopping-cart"></i> 添加到购物车
                                                    </button>
                                                    <button type="button" id="button-wishlist" data-toggle="tooltip"
                                                            class="btn"
                                                            title="收藏" data-original-title="收藏"><i
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
                                                                                   aria-expanded="true">图书描述</a></li>
                                    </ul>
                                    <div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
                                        <div class="tab-pane active" id="tab-description">
                                            <%=introduce%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                } else {//获取到的ID不合法
                                    out.println("<script language='javascript'>alert('您的操作有误');window.location.href='index.jsp';</script>");
                                }
                            %>
                            <!-- //显示图书详细信息 -->
                            <!-- 显示相关图书 -->
                            <div class="mr-module related-products">
                                <h3 class="module-title ">相关图书</h3>
                                <!-- 显示底部相关图书 -->
                                <jsp:include page="relatedBook.jsp">
                                    <jsp:param name="typeSystem" value="<%=typeSystem%>"/>
                                </jsp:include>
                                <!-- // 显示底部相关图书 -->
                            </div>
                            <!-- //显示相关图书 -->
                            <!-- //根据图书ID获取并显示图书信息 -->
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- //页面主体内容 -->
        <!-- 显示左侧热门图书 -->
        <jsp:include page="leftHotBook.jsp">
            <jsp:param name="typeSystem" value="<%=typeSystem%>"/>
        </jsp:include>
        <!-- // 显示左侧热门图书 -->

    </div>
</div>
<!-- 版权栏 -->
<%@ include file="common-footer.jsp" %>
<!-- //版权栏 -->
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script type="text/javascript">
    function addCart() {
        var num = $('#shuliang').val();//获取输入的图书数量
        //验证输入的数量是否合法
        if (num < 1) {//如果输入的数量不合法
            alert('数量不能小于1！');
            return;
        }
        window.location.href = "cart_add.jsp?bookID=<%=ID%>&num=" + num;//调用添加购物车页面，实现将该图书添加到购物车
    }
</script>
</body>
</html>
