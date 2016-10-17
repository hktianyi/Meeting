<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="/WEB-INF/common/common.jsp" %>
    <title>艾菲签到</title>
    <link href="${_PATH}/static/pages/view/main.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="page-wrapper">
    <header id="header">
        <div class="note note-info" id="tips">
            <p style="font-size: 10px !important; margin: 0 !important;">嘉宾信息</p>
        </div>
    </header>
    <section id="banner">
        <div class="content">
            <header>
                <h2 id="name">The future has landed</h2>
                <p><span id="job">And there are no hoverboards or flying cars.</span><br/>
                    <span id="company">Just apps. Lots of mother flipping apps.</span></p>
            </header>
            <span class="image"><img src="${_PATH}/static/images/pic01.jpg" alt=""/></span>
        </div>
    </section>
</div>
<script type="text/javascript">
    var code = '';
    var $tips = $('#tips'), $name = $('#name'), $job = $('#job'), $company = $('#company');
    $(function () {
//    $('body').addClass('page-container-bg-solid page-sidebar-closed');
//    $('ul.page-sidebar-menu').addClass('page-sidebar-menu-closed');
        document.onkeypress = function (event) {
            if (event.code === 'Enter') {
                clearMemberInfo();
                console.info('扫码成功：' + code);
                $.ajax(_PATH + '/attendee/viewData/' + code, {
                    type: 'GET',
                    dataType: 'json',
                    success: function (resp) {
                        fillMemberInfo(resp.data);
                    }
                });
                code = '';
            } else if (/^Digit\d$/.test(event.code)) {
                code += event.key;
            }
        };
        $(window).blur(function () {
            $tips.removeClass('note-info').addClass('note-danger').text('请注意！！！ 当前窗口不是激活窗口，无法正常扫码，请点击一下浏览器。');
        });
        $(window).focus(function () {
            $tips.removeClass('note-danger').addClass('note-info').text('嘉宾信息');
        });
    });

    function clearMemberInfo() {
        $name.text('');
        $job.text('');
        $company.text('');
    }

    function fillMemberInfo(member) {
        $name.text(member.name);
        $job.text(member.title);
        $company.text(member.company);
    }

    function printQRCode() {
        $("#qrCode").print({
            globalStyles: false,
            mediaPrint: false,
            stylesheet: null,
            noPrintSelector: ".no-print",
            iframe: true,
            append: null,
            prepend: null,
            manuallyCopyFormValues: false,
            deferred: $.Deferred(),
            timeout: 750,
            title: null,
            doctype: '<!doctype html>'
        });
    }
</script>
</body>
</html>