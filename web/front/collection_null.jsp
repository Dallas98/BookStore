<%--
  Created by IntelliJ IDEA.
  User: 99025
  Date: 2019/6/19
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>我的收藏-一间书屋</title>
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
<!-- 网站头部 -->
<%@ include file="common-header.jsp" %>
<!-- //网站头部 -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div id="mrshop" class="mrshop common-home">
        <div class="container_oc">

            <div class="row">
                <div id="content_oc1" class="col-sm-12">
                    <h1>我的收藏</h1>
                    <div class="table-responsive cart-info">暂时没有收藏</div>
                </div>
            </div>
            <br/> <br/>
            <div class="row">
                <div id="content_oc2" class="col-sm-12">
                    <br/> <br/>
                    <div class="buttons">
                        <div class="pull-right">
                            <a href="index.jsp" class="tigger btn btn-primary btn-primary">继续购物</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- 版权栏 -->
<%@ include file="common-footer.jsp" %>
<!-- //版权栏 -->
</body>
</html>