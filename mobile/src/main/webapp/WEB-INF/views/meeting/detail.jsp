<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <jsp:param name="title" value="会议详细"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div>
                <div class="p-t-20">
                    <ul class="tabs">
                        <li class="tab"><a class="active" href="#test1">活动信息</a></li>
                        <li class="tab"><a href="#test2">活动日程</a></li>
                    </ul>
                </div>

                <div id="test1" class="meetingDetail">
                    <!-- Form Inputs -->
                    <div class="form-inputs">
                        <div class="input-field animated fadeinright">
                            <p class="valueStyle">
                                ${meeting.name}
                            </p>
                            <label class="active">会议名称</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <p class="valueStyle">
                                ${meeting.address}
                            </p>
                            <label class="active">活动地址</label>
                        </div>
                        <div class="input-field animated fadeinright delay-1">
                            <p class="valueStyle">
                                ${meeting.startTime}-${meeting.endTime}
                            </p>
                            <label class="active">活动时间</label>
                        </div>
                        <div class="input-field animated fadeinright delay-4">
                            <p class="valueStyle">
                                ${meeting.meetingType}
                            </p>
                            <label class="active">活动类型</label>
                        </div>
                        <div class="input-field animated fadeinright delay-4">
                            <p class="valueStyle">
                                <c:choose>
                                    <c:when test="${meeting.free eq '0' || meeting.free eq '0.00'}">
                                       免费
                                    </c:when>
                                    <c:otherwise>
                                        ${meeting.free}
                                    </c:otherwise>
                                </c:choose>

                            </p>
                            <label class="active">活动费用</label>
                        </div>
                        <div class="input-field animated fadeinright delay-5">
                            <p class="valueStyle">
                                ${meeting.introduction}
                            </p>
                            <label class="active">活动简介</label>
                        </div>
                    </div>
                </div>

                <div id="test2">
                    <div class="container activity p-l-r-20" style=" padding-left: 100px !important;">
                        <div class="row m-l-0">
                            <div class="col">
                                <c:forEach items="${schedules}" var="item">
                                    <div class="contact" style="padding: 16px 0;">
                                        <span class="date" style=" left: -140px;top: 10px;">
                                        ${item.scheduleDate}
                                        </span>
                                        <span class="date" style=" left: -140px;top: 28px;">
                                        ${item.startTime} - ${item.endTime}  ${item.timeOfDay}
                                        </span>
                                        <div class="dot z-depth-1">
                                        </div>
                                        <p>
                                            ${item.title}
                                        </p>
<%--                                        <div class="friends">
                                            <img alt="" class="circle" src="../static/img/user3.jpg">
                                            <img alt="" class="circle" src="../static/img/user4.jpg">
                                            <img alt="" class="circle" src="../static/img/user.jpg">
                                        </div>--%>
                                        <span>${item.context}</span>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                 <div style="padding: 20px 40px;">
                     <c:choose>
                         <c:when test="${signUp}">
                             <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:;">
                                 已报名
                             </a>
                         </c:when>
                         <c:otherwise>
                             <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/join/${meeting.id}">
                                 参加活动
                             </a>
                         </c:otherwise>
                     </c:choose>
                 </div>
            </div>
            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<script type="text/javascript">
    function signUp() {
        <%--$.ajax(_PATH + '/meeting/signUp/${meeting.id}', {--%>
            <%--type:'POST',--%>
            <%--success:function (resp) {--%>
                <%--if(resp.statusCode === 200){--%>
                    <%--//alert('报名成功');--%>
                    <%--window.location = _PATH + "/meeting/join/2";--%>

                <%--}else {--%>
                   <%--// alert('报名失败');--%>
                <%--}--%>
            <%--},--%>
            <%--error: function (resp) {--%>
                <%--alert('报名失败');--%>
            <%--}--%>
        <%--})--%>
        window.location = _PATH + "/meeting/join/2";
    }
</script>
</body>
</html>