<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
    <%@include file="../../common/common.jsp" %>
    <style type="text/css">
   /*     .input-field{margin-top: 2rem;}*/
        .input-field label{left: 0rem; top: 1.2rem; font-size: 1.2rem;}
        .input-field label.active{font-size: 1.2rem;}
        .input-field input{text-indent: 10px;}
    </style>
</head>
<body>
<div class="m-scene" id="main"> <!-- Main Container -->

    <!-- Sidebars -->
    <jsp:include page="../../common/menu.jsp"></jsp:include>
    <!-- End of Sidebars -->

    <!-- Page Content -->
    <div id="content" class="page">

        <!-- Toolbar -->
        <jsp:include page="../../common/toolbar.jsp"></jsp:include>

        <!-- Main Content -->
        <div>
            <div style="height: calc(30vh - 56px);" class="animated fadeinup valign-wrapper fullscreen center-align">
                <a style="margin: 0 auto;" href="index.html" class="waves-effect waves-light btn-large primary-color valign animated bouncein delay-2">
                    会议提交成功！
                </a>
            </div>
            <p>会议邀请地址：http://127.0.0.1:8080/meeting/preDetail</p>
            <p>会议邀请二维码：</p>
        </div>

        <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<%--<script type="text/javascript" src="${_PATH}/static/plugins/custom/meeting.js"></script>--%>
<script type="text/javascript">
    function submit(){
        $("#form").submit();
    }
    validate();
    var lableMap = {};
    function validate(){
        var validate = $("#form").validate({
            debug: true,
            submitHandler: function (form) {
                form.submit();
            },
            errorPlacement: function (error, element) {
                var next = element.next(1);
                if(!lableMap[ $(element).attr("name")])
                    lableMap[ $(element).attr("name")] = next.html();

                next.html(error[0].innerText);
            },
            success: function (element) {
                var next = element.next(1);
               // console.log($(element).attr("name"));
                next.html('');
            },
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应
            onkeyup: true,
            rules: {
                name: {required: true, rangelength: [6, 20]},
                address:{required: true, rangelength: [6, 64]},
                startTime:{required: true},
                endTime:{required: true},
                meetingType:{required: true},
                free:{required: true},
                introduction:{required: true}
            },
            messages: {
                name: {required: "请输入名称", rangelength: $.validator.format("请输入{0}到{1}位字符串")},
                address:{required: "请输入地址", rangelength: $.validator.format("请输入{0}到{1}位字符串")},
                startTime:{required: "开始时间不能为空",},
                endTime:{required: "结束时间不能为空",},
                meetingType:{required: "请选择会议类型",},
                free:{required: "请输入费用",},
                introduction:{required: "请输入会议简介",}
            }
        });
    }

</script>
</body>
</html>