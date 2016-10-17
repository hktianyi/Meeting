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
            <jsp:param name="title" value="信息提交成功/Submitted"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div id="test1" class="meetingAdd">
                <!-- Form Inputs -->
                <form id="form" method="post" action="${_PATH}/member/checkcode">
                <div class="form-inputs">
                    <c:choose>
                        <c:when test="${_USER.hierarchy eq '1'}">
                        <center>
                            <h3>注册成功！请您妥善保存下方您的专属身份二维码，并于活动签到时出示以获得入场证。</h3>
                            <h3>Your registration is now complete! Please save your exclusive QR code ID below to present at our sign-up desk to collect your event pass.</h3>
                            <img src="${FILE_DOMAIN}/qrcode/${_USER.userName}.jpg" style="width: 200px;" align="center" onerror="${_PATH}/static/common/img/logo.png">
                        </center>
                          <div style="padding: 10px 40px;">
                            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:sendToMail();"
                               style="line-height:20px !important;padding-top:8px">
                              发送行程单至邮箱<br>Email me agenda
                            </a>
                          </div>
                          <div style="padding: 5px 40px;">
                            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/detail/2">
                              返回编辑/Back to edit
                            </a>
                          </div>
                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大中华区艾菲奖再次感谢您的参与和支持。若有问题，欢迎联系Hawk Zhou.</h4>
                            <h4>Thanks for your participation and support! Please contact Hawk Zhou if there is any problem.</h4>
                            <h4>Email: hawk.zhou@greaterchinaeffie.org</h4>
                            <h4>Mobile: +86 150-1022-8976</h4>
                            <h4>WeChat: 1248312220</h4>
                        </c:when>
                        <c:otherwise>
                        <center>
                            <h3>提交成功！请您妥善保存下方二维码，此码将是您参会的重要信息。</h3>
                            <h3>Your registration info has been successfully submitted! Please save the QR code for further entry use.</h3>
                            <img src="${FILE_DOMAIN}/qrcode/${_USER.userName}.jpg" style="width: 200px;" align="center" onerror="${_PATH}/static/common/img/logo.png">
                        </center>
                          <div style="padding: 10px 40px;">
                            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:sendToMail();"
                               style="line-height:20px !important;padding-top:8px">
                              发送行程单至邮箱<br>Email me agenda
                            </a>
                          </div>
                          <div style="padding: 5px 40px;">
                            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/detail/2">
                              返回编辑/Back to edit
                            </a>
                          </div>
                            <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;大中华区艾菲奖再次感谢您的参与和支持。若有问题，欢迎联系Lily He.</h4>
                            <h4>Thanks for your participation and support! Please contact Lily He if there is any problem.</h4>
                            <h4>Email: lily.he@greaterchinaeffie.org</h4>
                            <h4>Mobile: +86 186-3257-8088</h4>
                        </c:otherwise>
                    </c:choose>
                </div>
              </form>

              <%--<div style="padding: 20px 40px;">
                <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/export/2" target="_blank">
                  查看定制化行程单/Check customized schedule
                </a>
              </div>--%>
            </div>

            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<%--<script type="text/javascript" src="${_PATH}/static/plugins/custom/meeting.js"></script>--%>
<script type="text/javascript">
  $(function () {
    window.sessionStorage && sessionStorage.setItem("dis2", "ss2");
  });
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

    function sendToMail() {
      var index = layer.load(1, {
        shade: [0.3,'#fff'] //0.1透明度的白色背景
      });
      $.ajax(_PATH+'/meeting/export/2?type=mail', {
        type: 'GET',
        success: function (resp) {
          layer.close(index);
          layer.msg("发送成功");
        },
        error: function (resp) {
          layer.close(index);
          layer.msg("发送失败");
        }
      });
    }
</script>
</body>
</html>