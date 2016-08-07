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
            <jsp:param name="title" value="会议列表"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">
            <c:if test="${empty dataList}">
                    <p>无会议记录</p>
            </c:if>
            <c:if test="${not empty dataList}">
                <c:forEach begin="0" end="0" var="item"  items="${dataList}">
                    <div class="news-main animated fadein delay-1">
                        <img alt="" src="../static/img/2.jpg">
                        <a href="article.html">
                            <div class="opacity-overlay-black">
                            </div>
                        </a>
                        <div class="top-news animated fadeinright delay-1">
                            <a href="article.html" >
                                <h4 class="top-news-title">
                                    ${item.name}
                                </h4>
                                <p style="margin-left: 20px; margin-right: 20px;">
                                        ${item.introduction}
                                </p>
                                <p style="margin-left: 20px; margin-right: 20px;">
                                        ${item.address}
                                </p>
                            </a>
                            <span class="top-news-channel">${item.startTime}-${item.endTime}</span> <span class="top-news-category">未开始</span>
                            <div class="clr">
                            </div>
                        </div>
                    </div>

                </c:forEach>

                <div>
                    <c:forEach begin="1"  var="item"  items="${dataList}">
                        <div class="single-news animated fadeinright delay-2">
                            <a href="${_PATH}/meeting/detail/${item.id}">
                                <h4 class="single-news-title">
                                   ${item.name}
                                </h4>
                                <p>
                                   ${item.introduction}
                                </p>
                                <p>
                                   ${item.address}
                                </p>
                            </a>
                            <span class="single-news-channel">${item.startTime}-${item.endTime}</span>
                            <span class="single-news-category">结束</span>
                            <div class="clr">
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->


    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
</body>
</html>