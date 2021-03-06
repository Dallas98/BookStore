<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<%@ page import="java.sql.ResultSet" %>
<!-- 导入java.sql.ResultSet类 -->
<%@ page import="java.util.Vector" %>
<!-- 导入Java的向量类 -->
<%@ page import="java.text.DecimalFormat" %>
<!-- 导入格式化数字的类 -->
<%@ page import="com.model.Bookelement" %>
<!-- 导入购物车图书的模型类 -->
<!-- 创建com.tools.ConnDB类的对象 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
    String username = (String) session.getAttribute("username");//获取会员账号
    //如果没有登录，将跳转到登录页面
    if (username == "" || username == null) {
        response.sendRedirect("login.jsp");//重定向页面到会员登录页面
        return;//返回
    } else {
        Vector cart = (Vector) session.getAttribute("cart");//获取购物车对象
        if (cart == null || cart.size() == 0) {//如果购物车为空
            response.sendRedirect("cart_null.jsp");//重定向页面到购物车为空页面
        } else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>我的购物车-一间书屋</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">
</head>

<body>
<jsp:include page="index-loginCon.jsp"/>
<!-- 网站头部 -->
<%@ include file="common-header.jsp" %>
<!-- //网站头部 -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">
        <!-- 页面主体内容 -->
        <div id="mr-content" class="mr-content col-xs-12">
            <div id="mrshop" class="mrshop common-home">
                <div class="container_oc">
                    <div class="row">
                        <div id="content_oc1" class="col-sm-12">
                            <h1>我的购物车</h1>
                            <!-- 显示购物车中的图书 -->
                            <div class="table-responsive cart-info">
                                <table class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <td class="text-center image">图书图片</td>
                                        <td class="text-left name">书名称</td>
                                        <td class="text-left quantity">数量</td>
                                        <td class="text-right price">单价</td>
                                        <td class="text-right total">总计</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- 遍历购物车中的图书并显示 -->
                                    <%
                                        float sum = 0;
                                        DecimalFormat fnum = new DecimalFormat("##0.0");//定义显示金额的格式
                                        int ID = -1;//保存图书ID的变量
                                        String bookname = "";//保存书名称的变量
                                        String picture = "";//保存图书图片的变量
                                        //遍历购物车中的图书
                                        for (int i = 0; i < cart.size(); i++) {
                                            Bookelement bookitem = (Bookelement) cart.elementAt(i);//获取一个图书
                                            sum = sum + bookitem.number * bookitem.nowprice;//计算总计金额
                                            ID = bookitem.ID;//获取图书ID
                                            if (ID > 0) {
                                                ResultSet rs_book = conn.executeQuery("select * from tb_book where ID=" + ID);
                                                if (rs_book.next()) {
                                                    bookname = rs_book.getString("bookname");//获取书名称
                                                    picture = rs_book.getString("picture");//获取图书图片
                                                }
                                                conn.close();//关闭数据库的连接
                                            }
                                    %>
                                    <!-- 显示一条图书信息 -->
                                    <tr>
                                        <td class="text-center image" width="20%"><a
                                                href="bookDetail.jsp?ID=<%=bookitem.ID%>">
                                            <img width="80px" src="../images/book/<%=picture%>"> </a></td>
                                        <td class="text-left name"><a
                                                href="bookDetail.jsp?ID=<%=bookitem.ID%>"><%=bookname%>
                                        </a>
                                        </td>
                                        <td class="text-left quantity"><%=bookitem.number%>件</td>
                                        <td class="text-right price"><%=bookitem.nowprice%>元</td>
                                        <td class="text-right total"><%=(bookitem.nowprice * bookitem.number)%>元
                                        </td>
                                    </tr>
                                    <!-- 显示一条图书信息 -->
                                    <%
                                        }
                                        String sumString = fnum.format(sum);//格式化总计金额
                                    %>
                                    <!-- //遍历购物车中的图书并显示 -->
                                    </tbody>
                                </table>
                            </div>
                            <!-- //显示购物车中的图书 -->
                            <!-- 显示总计金额  -->
                            <div class="row cart-total">
                                <div class="col-sm-4 col-sm-offset-8">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
												<span>
													<strong>总计:</strong>
													<p><%=sumString%>元</p>
												</span>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <!-- //显示总计金额  -->
                        </div>
                    </div>

                    <!-- 填写物流信息 -->
                    <div class="row">
                        <div id="content_oc2" class="col-sm-12">
                            <h1>物流信息</h1>
                            <!-- 填写物流信息的表单 -->
                            <form action="cart_order.jsp" method="post" id="myform">
                                <div class="table-responsive cart-info">
                                    <table class="table table-bordered">
                                        <tbody>
                                        <tr>
                                            <td class="text-right" width="20%">收货人姓名：</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="recevieName" name="recevieName" size="10"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">收货人手机：</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="tel" name="tel" size="10"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">收货人地址：</td>
                                            <td class="text-left quantity">
                                                <div class="input-group btn-block" style="max-width: 400px;">
                                                    <input type="text" id="address" name="address" size="1"
                                                           class="form-control">
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="text-right">备注：</td>
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
                            <!-- //填写物流信息的表单 -->
                        </div>
                    </div>
                    <!-- //填写物流信息 -->
                    <br/>
                    <!-- 显示支付方式 -->
                    <div class="row">
                        <div id="content_oc3" class="col-sm-12">
                            <h1>支付方式</h1>
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
                                    <a href="index.jsp" class="btn btn-primary btn-default">继续购物</a>
                                </div>
                                <div class="pull-left">
                                    <a href="cart_clear.jsp" class="btn btn-primary btn-default">清空购物车</a>
                                </div>
                                <div class="pull-right">
                                    <a href="javascript:zhifu();" class="tigger btn btn-primary btn-primary">结账</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- //显示支付方式 -->
                </div>
            </div>
        </div>
        <!-- //页面主体内容 -->
    </div>
</div>
<!-- 版权栏 -->
<%@ include file="common-footer.jsp" %>
<!-- //版权栏 -->

<!-- 使用jBox插件实现一个支付对话框 -->
<script type="text/javascript" src="js/jBox/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/jBox/jquery.jBox-2.3.min.js"></script>
<link type="text/css" rel="stylesheet" href="js/jBox/Skins2/Pink/jbox.css"/>
<script type="text/javascript">
    function zhifu() {
        //验证收货人姓名
        if ($('#recevieName').val() === "") {
            alert('收货人姓名不能为空！');
            return;
        }
        //验证收货人手机
        if ($('#tel').val() === "") {
            alert('收货人手机不能为空！');
            return;
        }
        //验证手机号是否合法
        if (isNaN($('#tel').val())) {
            alert("手机号请输入数字");
            return;
        }
        //验证收货人地址
        if ($('#address').val() === "") {
            alert('收货人地址不能为空！');
            return;
        }
        //设置对话框中要显示的内容
        var html = '<div class="popup_cont">'
            + '<p>扫一扫支付</p>'
            + '<strong>￥<font id="show_money_info"><%=sumString%>元</font></strong>'
            + '<div style="width: 256px; height: 250px; text-align: center; margin-left: auto; margin-right: auto;" >'
            + '<image src="images/YP.jpg" width="256" height="256" /></div>'
            + '</div><p style="text-align:center">请注意支付安全</p>';
        var content = {
            state1: {
                content: html,
                buttons: {
                    '取消': 0,
                    '支付': 1
                },
                buttonsFocus: 0,
                submit: function (v, h, f) {
                    if (v == 0) {//取消按钮的响应事件
                        return true; //关闭窗口
                    }
                    if (v == 1) {//支付按钮的响应事件
                        document.getElementById('myform').submit();//提交表单
                        return true;
                    }
                    return false;
                }
            }
        };
        $.jBox.open(content, '支付', 400, 450);//打开支付窗口
    }
</script>
<!-- // 使用jBox插件实现一个支付对话框 -->
</body>
</html>
<% }
}
%>
