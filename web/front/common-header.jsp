<%@ page language="java" contentType="text/html; charset=GBK"
         pageEncoding="GBK" %>
<header id="mr-header" class="wrap mr-header">
    <div class="container">
        <div class="row">
            <!-- //��վLogo -->
            <!-- �������� -->
            <nav id="mr-mainnav"
                 class="col-xs-12 col-md-6 mr-mainnav navbar navbar-default">
                <div class="mr-navbar navbar-collapse collapse">
                    <div class="mr-megamenu animate slide" data-duration="400"
                         data-responsive="true">
                        <ul class="nav navbar-nav level0">
                            <li itemprop="name" data-id="435" data-level="1"><a
                                    id="index" itemprop="url" class="" href="index.jsp"
                                    data-target="#">��ҳ </a></li>
                            <li itemprop="name" data-id="510" data-level="1"><a
                                    id="jingying" itemprop="url" class=""
                                    href="bookList.jsp?type=14" data-target="#">��Ӫ��</a></li>

                            <li itemprop="name" data-id="510" data-level="1"><a
                                    id="wenyi" itemprop="url" class="" href="bookList.jsp?type=15"
                                    data-target="#">���������</a></li>

                            <li itemprop="name" data-id="510" data-level="1"><a
                                    id="jiaoyu" itemprop="url" class="" href="bookList.jsp?type=16"
                                    data-target="#">������</a></li>
                            <li itemprop="name" data-id="510" data-level="1"><a
                                    id="shenghuo" itemprop="url" class=""
                                    href="bookList.jsp?type=17" data-target="#">������</a></li>
                        </ul>
                    </div>

                </div>
            </nav>
            <!-- //�������� -->
        </div>
    </div>
</header>
<script>
    // ��ȡҳ�����
    function GetString(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");//������ʽ
        var r = window.location.search.substr(1).match(reg);//��ȡ���������
        if (r != null)
            return unescape(r[2]);//����������
        return null;
    }

    var type = GetString('type');
    if (type === '14') {
        var jingying = document.getElementById('jingying');
        jingying.style.backgroundColor = "#8c0f14";

    }
    if (type === '15') {
        var wenyi = document.getElementById('wenyi');
        wenyi.style.backgroundColor = "#8c0f14";

    }
    if (type === '16') {
        var jiaoyu = document.getElementById('jiaoyu');
        jiaoyu.style.backgroundColor = "#8c0f14";

    }
    if (type === '17') {
        var shenghuo = document.getElementById('shenghuo');
        shenghuo.style.backgroundColor = "#8c0f14";

    }
    if (type == null) {//Ĭ�ϵ�¼�޵��
        var index = document.getElementById('index');
        index.style.backgroundColor = "#8c0f14";

    }
</script>