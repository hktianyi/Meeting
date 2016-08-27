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

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div id="test1" class="meetingAdd">
                <!-- Form Inputs -->
                <form id="form" method="post" action="${_PATH}/member/checkcode">
                    <div class="form-inputs">
                        <h4>${meetCode}</h4>
                        <c:choose>
                            <c:when test="${qd}"><h3 style="color:green">签到成功</h3></c:when>
                            <c:otherwise><h3 style="color:red">签到失败!</h3></c:otherwise>
                        </c:choose>
                    </div>
                </form>
            </div>

            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->

        <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<%--<script type="text/javascript" src="${_PATH}/static/plugins/custom/meeting.js"></script>--%>
<script type="text/javascript">

</script>
</body>
</html>