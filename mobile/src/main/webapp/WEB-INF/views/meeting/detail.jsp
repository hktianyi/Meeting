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
            <jsp:param name="title" value="活动详情/Event Detail"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div>
                <div class="p-t-20">
                    <ul class="tabs">
                        <li class="tab"><a class="active" href="#test1">活动信息/Event Info</a></li>
                        <li class="tab"><a href="#test2">实效节日程/Event Agenda</a></li>
                    </ul>
                </div>

                <div id="test1" class="meetingDetail">
                    <!-- Form Inputs -->
                    <div class="form-inputs">
                        <div class="input-field animated fadeinright">
                            <p class="valueStyle">
                                ${meeting.name}
                            </p>
                            <label class="active">会议名称/Event's Title</label>
                        </div>
                        <div class="input-field animated fadeinright delay-1">
                            <p class="valueStyle">
                                ${meeting.startTime} - ${meeting.endTime}
                            </p>
                            <label class="active">活动时间/Date</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <p class="valueStyle">
                                ${meeting.address}
                            </p>
                            <label class="active">活动地址一/Address 1</label>
                        </div>
                        <div class="input-field animated fadeinright delay-5">
                            <p class="valueStyle">
                                ${meeting.introduction}
                            </p>
                            <label class="active">具体位置一/Location 1</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <p class="valueStyle">
                                海南国际会展中心<br/>&nbsp;&nbsp;
                                Hainan International Convention & Exhibition Center
                            </p>
                            <label class="active">活动地址二/Address 2</label>
                        </div>
                        <div class="input-field animated fadeinright delay-5">
                            <p class="valueStyle">
                                海南省海口市秀英区滨海大道258号<br/>&nbsp;&nbsp;
                                No.258 Binhai Avenue, Xiuying District Haikou, Hainan 570311, China
                            </p>
                            <label class="active">具体位置二/Location 2</label>
                        </div>
                    </div>
                </div>

                <div id="test2">
                    <div class="container activity p-l-r-20" style=" padding-left: 100px !important;">
                        <div class="row m-l-0">
                            <div class="col">
                                <c:forEach items="${schedules}" var="item" varStatus="status">
                                    <c:if test="${status.first}">
                                        <c:set scope="page" var="t_index" value="0"></c:set>
                                        <c:set scope="page" var="t_now" value="${item.scheduleDate}"></c:set>
                                        <div class="contact" style="padding: 16px 0;">
                                        <span class="date" style=" left: -130px;">
                                                ${item.scheduleDate}
                                        </span>
                                            <div class="dot z-depth-1" style="width: 50px;height: 50px;line-height: 42px;text-align: center;left: -56px;top: 0px;border: 4px solid #bbb;">
                                                报到
                                            </div>
                                        </div>
                                    </c:if>
                                    <c:if test="${t_now ne item.scheduleDate}">
                                        <c:if test="${item.scheduleDate eq '2016-09-05'}">
                                            <div class="contact" style="padding: 16px 0;">
                                        <span class="date" style=" left: -130px;">
                                                ${item.scheduleDate}
                                        </span>
                                                <div class="dot z-depth-1" style="width: 50px;height: 50px;line-height: 42px;text-align: center;left: -56px;top: 0px;border: 4px solid #bbb;">
                                                    结束
                                                </div>
                                            </div>
                                        </c:if>
                                    <c:if test="${item.scheduleDate ne '2016-09-05'}">
                                        <c:set scope="page" var="t_index" value="${t_index+1}"></c:set>
                                        <c:set scope="page" var="t_now" value="${item.scheduleDate}"></c:set>
                                        <div class="contact" style="padding: 16px 0;">
                                        <span class="date" style=" left: -130px;">
                                                ${item.scheduleDate}
                                        </span>
                                            <div class="dot z-depth-1" style="width: 50px;height: 50px;line-height: 42px;text-align: center;left: -56px;top: 0px;border: 4px solid #bbb;">
                                                Day${t_index}
                                            </div>
                                        </div>
                                        </c:if>
                                    </c:if>
                                    <div class="contact" style="padding: 16px 0;">
                                        <%--<span class="date" style=" left: -140px;top: 10px;">
                                        ${item.scheduleDate}
                                        </span>--%>
                                        <span class="date" style=" left: -120px;">
                                        ${item.startTime} ${empty item.endTime ? '' : '-'} ${item.endTime}  ${item.timeOfDay}
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
                             <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/join/${meeting.id}">
                               编辑个人信息/Edit Personal Info
                             </a>
                         </c:when>
                         <c:otherwise>
                             <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meeting/join/${meeting.id}">
                               登记注册/Registration
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
<script>
//    $(function () {
//        layer.tips('上台演讲', 'test');
//    })
</script>
</body>
</html>