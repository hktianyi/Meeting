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
<div class="m-scene" id="main"> <!-- Main Container -->

    <!-- Sidebars -->
    <jsp:include page="../../common/menu.jsp"></jsp:include>
    <!-- End of Sidebars -->

    <!-- Page Content -->
    <div id="content" class="page">

        <!-- Toolbar -->
        <jsp:include page="../../common/toolbar.jsp">
            <jsp:param name="title" value="登陆成功，欢迎您！"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div id="test1" class="meetingAdd">
                <!-- Form Inputs -->
                <form id="form" method="post" action="${_PATH}/member/checkcode">
                <div class="form-inputs">
                    <center> <img src="${_PATH}/static/img/head-logo.png" style="width: 200px;" align="center"></center>
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;尊敬的评委，感谢您拨冗前往参与2016大中华区艾菲奖终审评审会！您的学识和见解将为大中华区艾菲奖及整个行业做出宝贵的贡献。有任何问题，可请联系大中华区艾菲奖国际赛是部专员 Lily He（+86 186-3257-8088）。再次感谢您的参与！</h4>
                    <div class="input-field animated fadeinright">
                        <input id="meetCode"  name="meetCode" type="text" class="validate">
                        <label for="meetCode">请输入您的邀请码</label>
                    </div>
                    <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
                       href="javascript:checkCode();">
                        查询会议
                    </a>

                </div>
              </form>
            </div>

            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<%--<script type="text/javascript" src="${_PATH}/static/plugins/custom/meeting.js"></script>--%>
<script type="text/javascript">
    function checkCode(){
        //$("#form").submit();
        $.ajax({
            type: "post",
            dataType: "json",
            url: "${_PATH}/meetingcode/checkcode",
            data: {meetCode: $("#meetCode").val()},
            success: function (data) {
                if (data.status == "1") {
                    //alert("验证通过！");
                    var meetingId = data.meetingId;
                    window.location = _PATH + "/meeting/detail/"+meetingId;
                } else {
                    alert("该验证码不存在！");
                }

//                alert("验证通过！");
//                var meetingId = 2;
//                window.location = _PATH + "/meeting/detail/"+meetingId;
            }
        });


        //var meetingId = 2;
        //window.location = _PATH + "/meeting/detail/"+meetingId;
    }

</script>
</body>
</html>