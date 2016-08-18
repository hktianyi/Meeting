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
            <jsp:param name="title" value="信息提交成功"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div id="test1" class="meetingAdd">
                <!-- Form Inputs -->
                <form id="form" method="post" action="${_PATH}/member/checkcode">
                <div class="form-inputs">
                    <center>
                        <h3>报名成功！</h3>
                        <h3>请您妥善保存下方二维码：</h3>
                        <img src="${_PATH}/static/img/qru6.jpg" style="width: 200px;" align="center">
                    </center>
                    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请扫描右下角二维码关注大中华区艾菲奖官方微信公众号，以便及时了解活动信息。若有任何问题，欢迎联系Lily He: +86 186-3257-8088 </h4>

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
        <%--$.ajax({--%>
            <%--type: "post",--%>
            <%--dataType: "json",--%>
            <%--url: "${_PATH}/member/checkcode",--%>
            <%--data: {meetCode: $("#meetCode").val()},--%>
            <%--success: function (data) {--%>
<%--//                if (data.status == "1") {--%>
<%--//                    alert("验证通过！");--%>
<%--//                    var meetingId = data.meetingId;--%>
<%--//                    window.location = _PATH + "/meeting/detail/"+meetingId;--%>
<%--//                } else {--%>
<%--//                    alert("该验证码不存在！");--%>
<%--//                }--%>

                <%--alert("验证通过！");--%>
                <%--var meetingId = 2;--%>
                <%--window.location = _PATH + "/meeting/detail/"+meetingId;--%>
            <%--}--%>
        <%--});--%>


        var meetingId = 2;
        window.location = _PATH + "/meeting/detail/"+meetingId;
    }

</script>
</body>
</html>