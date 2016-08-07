<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
    <%@include file="../common/common.jsp" %>
</head>
<body>
<div class="m-scene" id="main">
    <!-- Page Content -->
    <div id="content" class="grey-blue signup">

        <!-- Toolbar -->
        <div id="toolbar" class="tool-signup primary-color animated fadeindown">
            <a href="javascript:history.back()" class="open-left">
                <i class="ion-android-arrow-back"></i>
            </a>
        </div>

        <!-- Main Content -->
        <form id="form" method="post" action="${_PATH}/singup">
            <div class="signup-form animated fadeinup delay-2 z-depth-1">

                <h1>注册</h1>
                <div class="input-field">
                    <i class="ion-android-contact prefix"></i>
                    <input class="validate" name="userName" type="text" id="userName" des="用户名">
                    <label for="userName">用户名</label>
                </div>

                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-lock prefix"></i>
                    <input class="validate" name="userPwd" type="password" id="userPwd">
                    <label for="userPwd">密码</label>
                </div>

                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-done prefix"></i>
                    <input class="validate" name="confirmPwd" type="password" id="confirmPwd">
                    <label for="confirmPwd">确认密码</label>
                </div>
                <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:submit();">注册</a>
                <span>已有帐号? <a class="primary-text" href="${_PATH}/login">登录</a></span>
            </div><!-- End of Main Contents -->
        </form>
    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->
<%@include file="../common/footer.jsp" %>

<script>
    function submit() {
        $("#form").submit();
    }

    var validate = $("#form").validate({
        debug: true,
        submitHandler: function (form) {
            form.submit();
        },
        onfocusout: function (element) {
            $(element).valid();
        },
        errorPlacement: function (error, element) {
            var next = element.next(1);
            next.html(error[0].innerText);
        },
        success: function (element) {
            console.log(element);
            var next = element.next(1);
            next.html('');
        },
        onkeyup: true,
        submitHandler: function (form) {
            form.submit();
        },
        rules: {
            userName: {required: true, rangelength: [5, 20],remote:{type:"post",url:${_PATH}+"/validUserName",data:{userName:function(){return $("#userName").val()}}}},
            userPwd: {required: true, rangelength: [8, 20]},
            confirmPwd: {required: true, equalTo: "#userPwd"}
        },
        messages: {
            userName: {required: "请输入用户名", rangelength: $.validator.format("请输入{0}到{1}位字符串"),remote:"用户名已存在"},
            userPwd: {
                required: "请输入密码", rangelength: $.validator.format("请输入{0}到{1}位密码")
            },
            confirmPwd: {
                required: "请再次输入密码",
                equalTo: "两次输入不一致"
            }
        }
    });

</script>
</body>
</html>