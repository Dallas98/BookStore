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
    <title>�ҵ��ղ�-һ������</title>
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
<div id="mr-mainbody" class="container mr-mainbody">
    <div id="mrshop" class="mrshop common-home">
        <div class="container_oc">

            <div class="row">
                <div id="content_oc1" class="col-sm-12">
                    <h1>�ҵ��ղ�</h1>
                    <div class="table-responsive cart-info">��ʱû���ղ�</div>
                </div>
            </div>
            <br/> <br/>
            <div class="row">
                <div id="content_oc2" class="col-sm-12">
                    <br/> <br/>
                    <div class="buttons">
                        <div class="pull-right">
                            <a href="index.jsp" class="tigger btn btn-primary btn-primary">��������</a>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- ��Ȩ�� -->
<%@ include file="common-footer.jsp" %>
<!-- //��Ȩ�� -->
</body>
</html>