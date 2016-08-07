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
    <div id="content" class="page">

        <!-- Toolbar -->
        <div id="toolbar" class="tool-login primary-color animated fadeindown">
            <%--<a href="javascript:history.back()" class="open-left">--%>
            <%--<i class="ion-android-arrow-back"></i>--%>
            <%--</a>--%>
        </div>
        <form id="form" action="${_PATH }/login" method="post">
            <!-- Main Content -->
            <div class="login-form animated fadeinup delay-2 z-depth-1">

                <h1>登录</h1>
                <div class="input-field">
                    <i class="ion-android-contact prefix"></i>
                    <input class="validate" id="login" type="text" placeholder="请输入用户名" name="username">
                </div>

                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-lock prefix"></i>
                    <input class="validate" id="login-psw" type="password" placeholder="请输入密码" name="password">
                </div>
                <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:submit();">登录</a>
                <span>没有帐户? <a class="primary-text" href="${_PATH}/signup">注册</a></span>
            </div><!-- End of Main Contents -->
        </form>


    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->
<%@include file="../common/footer.jsp" %>
<script>
    function submit() {
        var username = $("#login").val();
        var pwd = $("#login-psw").val();
        if (isNotNull(username) && isNotNull(pwd)) {
            $("#form").submit();
        } else {
            alert("请输入用户名和密码！");
        }

    }
    $(function () {
        var errorMsg = "${errorMsg}";
        if (isNotNull(errorMsg)) {
            alert(errorMsg);
            errorMsg = null;
        }
    });

</script>
</body>
</html>