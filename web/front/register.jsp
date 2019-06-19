<%@ page contentType="text/html; charset=GBK" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=GBK">
    <title>ע��-һ������</title>
    <link rel="stylesheet" href="css/mr-01.css" type="text/css">

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
<!-- �������� -->
<div id="mr-mainbody" class="container mr-mainbody">
    <div class="row">
        <div id="mr-content" class="mr-content col-xs-12">
            <div class="login-wrap"
                 style="margin-bottom: 60px; margin-top: 50px">
                <div style="max-width: 540px; margin: 0 auto;">
                    <a href="index.jsp" title="���������ҳ"><img
                            src="images/booklogo.png"></a>
                </div>
                <div class="login">
                    <div class="page-header" style="pause: none;">
                        <h1 class="login_h1">��Աע��</h1>
                    </div>
                    <!-- ��Աע��� -->
                    <form id="member-registration" action="register_deal.jsp"
                          onsubmit="return regis();" method="post" class="form-horizontal">

                        <fieldset>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="username-lbl" for="username" class="required">
                                        �˻� ��</label>
                                </div>
                                <div class="col-sm-8">
                                    <!-- �˻��ı��� -->
                                    <input type="text" name="username" id="username" value=""
                                           class="required" size="38" required
                                           aria-required="true"><span class="star">&nbsp;*</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="password-lbl1" for="password-lbl1" class="required">
                                        ��ʵ���� ��</label>
                                </div>
                                <div class="col-sm-8">
                                    <!-- ������ʵ�������ı��� -->
                                    <input type="text" name="truename" id="jform_username"
                                           value="" class="validate-username required" size="38"
                                           required="required" aria-required="true"><span
                                        class="star">&nbsp;*</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="password-lbl2" for="password-lbl2" class="required">
                                        ���� ��</label>
                                </div>
                                <div class="col-sm-8">
                                    <!-- �����ı��� -->
                                    <input type="password" name="pwd" id="pwd" value=""
                                           autocomplete="off" class="validate-password required"
                                           size="38" maxlength="99" required
                                           aria-required="true"><span class="star">&nbsp;*</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="password-lbl3" for="password-lbl3" class="required">
                                        ȷ������ ��</label>
                                </div>
                                <div class="col-sm-8">
                                    <!-- ȷ�������ı��� -->
                                    <input type="password" name="pwd2" id="pwd2" value=""
                                           autocomplete="off" class="validate-password required"
                                           size="38" maxlength="99" required
                                           aria-required="true"><span class="star">&nbsp;*</span>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="password-lbl4" for="password-lbl4" class="required">
                                        ��ϵ�绰 ��</label>
                                </div>
                                <div class="col-sm-8" style="clear: none;">
                                    <!-- ������ϵ�绰���ı��� -->
                                    <input type="text" name="tel" class="validate-email " id="tel"
                                           value="" size="38" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-4 control-label">
                                    <label id="password-lbl5" for="password-lbl5" class="required">
                                        ���� ��</label>
                                </div>
                                <div class="col-sm-8" style="clear: none;">
                                    <!-- ����������ı��� -->
                                    <input type="email" name="email" class="validate-email"
                                           id="jform_email2" value="" size="38" aria-required="true">
                                </div>
                            </div>
                            <div class="form-group">
                                <div style="float: right; padding-right: 216px;">
                                    һ������<a href="agreement.jsp" target="_blank" style="color: #0885B1;">��ʹ�����</a>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-4 col-sm-8">
                                    <button type="submit" class="btn btn-primary login">ͬ��Э�鲢ע��</button>
                                </div>
                            </div>
                            <div class="form-group" style="margin: 20px;">
                                <label
                                        style="float: right; color: #858585; margin-right: 80px; margin-top: 10px; font-size: 14px;">�����˺ţ�<a
                                        href="login.jsp">ȥ��¼</a></label>
                            </div>
                        </fieldset>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- //�������� -->
</body>
<!-- ��֤�����ע����Ϣ�Ƿ�Ϸ� -->
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script>
    function regis() {
        /* ----------- ��֤������˻��Ƿ�Ϸ� ------------------------- */
        if (/^[\u4e00-\u9fa5]+$/.test($('#username').val())) {
            alert("�˻��������뺺�֣�");
            return false;
        }
        /* ----------- ��֤�������ϵ�绰�Ƿ�Ϸ� --------------------- */
        if (isNaN($('#tel').val())) {
            alert("��ϵ�绰����������");
            return false;
        }
        /* ----------- ��֤��������������Ƿ�һ�� --------------------- */
        var pwd = document.getElementById("pwd").value;
        var pwd2 = document.getElementById("pwd2").value;
        if (pwd !== pwd2) {
            alert('����ǰ��һ�£�');
            return false;
        }
        return true;
    }
</script>
<!-- //��֤�������Ϣ�Ƿ�Ϸ� -->
</html>