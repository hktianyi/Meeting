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
            <jsp:param name="title" value="个人信息"></jsp:param>
        </jsp:include>
        <!-- Main Content -->
        <div class="animated fadeinup">
            <!-- Discount -->
            <form id="form" action="${_PATH}/member/personal" method="post">
                <!-- Form Inputs -->
                <div class="form-inputs">
                    <h4 class="shipping-address">个人信息</h4>
                    <div>
                        <div class="input-field">
                            <input type="hidden" id="id" name="id" value="${member.id}">
                            <input id="realName" type="text" class="validate" name="realName" value="${member.realName}">
                            <label for="realName">真实姓名</label>
                        </div>
                    </div>
                    <div class="input-field">
                        <select class="browser-default" name="gender" id="gender">
                            <option value="" disabled selected>性别</option>
                            <option value="1">男</option>
                            <option value="2">女</option>
                        </select>
                    </div>
                    <div class="input-field">
                        <input id="mobile" type="number" name="mobile" value="${member.mobile}">
                        <label for="mobile">联系方式</label>
                    </div>
                    <div class="input-field">
                        <input id="email" type="email" class="validate" name="email" value="${member.email}">
                        <label for="email">邮箱</label>
                    </div>
                    <div class="input-field">
                        <input id="province" type="text" class="validate" name="province" value="${member.province}">
                        <label for="province">省</label>
                    </div>
                    <div class="input-field">
                        <input id="city" type="text" class="validate" name="city" value="${member.city}">
                        <label for="city">市</label>
                    </div>
                    <div class="input-field">
                        <input id="address" type="text" class="validate" name="address" value="${member.address}">
                        <label for="address">详细地址</label>
                    </div>
                    <a class="waves-effect waves-light btn-large primary-color width-100" href="javascript:submit();">修改</a>
                </div>
            </form>
        </div>

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->
<%@include file="../../common/footer.jsp" %>
<script>
    function submit() {
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${_PATH}/member/personal",
            data: $('#form').serialize(),
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