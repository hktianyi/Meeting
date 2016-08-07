<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
    <%@include file="../../common/common.jsp" %>
</head>
<body>
<div class="m-scene" id="main">
    <jsp:include page="../../common/menu.jsp"></jsp:include>
    <!-- Page Content -->
    <div id="content" class="page">
        <jsp:include page="../../common/backbar.jsp">
            <jsp:param name="title" value="修改密码"></jsp:param>
        </jsp:include>
        <!-- Main Content -->
        <div class="animated fadeinup">

            <!-- Form Inputs -->
            <div class="form-inputs">
                <h4 class="shipping-address">个人信息</h4>
                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-lock prefix"></i>
                    <input class="validate" name="oldPwd" type="password" id="oldPwd">
                    <label for="userPwd">输入原密码</label>
                </div>
                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-lock prefix"></i>
                    <input class="validate" name="userPwd" type="password" id="userPwd">
                    <label for="userPwd">输入新密码</label>
                </div>

                <div class="input-field" style="margin-bottom:20px;">
                    <i class="ion-android-done prefix"></i>
                    <input class="validate" name="confirmPwd" type="password" id="confirmPwd">
                    <label for="confirmPwd">确认密码</label>
                </div>
                <a class="waves-effect waves-light btn-large primary-color width-100" href="javascript:submit()" id="button">修改</a>
            </div>

        </div>

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->
<%@include file="../../common/footer.jsp" %>
<script>
    function submit() {

        var oldPwd = $("#oldPwd").val();
        var userPwd = $("#userPwd").val();
        var confirmPwd = $("#confirmPwd").val();
        if (!isNotNull(oldPwd) || !isNotNull(userPwd) || isNotNull(confirmPwd)) {
            alert("表单不能为空");
            return;
        }
        if (userPwd != confirmPwd) {
            alert("两次新密码输入不一致");
            return;
        }
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${_PATH}/member/modifyPwd",
            data: {oldPwd: oldPwd, userPwd: userPwd},
            success: function (data) {
                if (data.statusCode == 200) {
                    disp_confirm(data.data);
                } else {
                    alert(data.errorInfo);
                }
            }
        })
    }
    function disp_confirm(data) {
        var r = confirm(data)
        if (r == true) {
            window.location.href = "${_PATH}/main";
        }
    }


</script>
</body>
</html>