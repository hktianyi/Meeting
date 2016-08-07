<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String title = request.getParameter("title");
%>
<!-- Toolbar -->
<div id="toolbar" class="primary-color">
  <div class="open-left" id="open-left" data-activates="slide-out-left">
    <i class="ion-android-menu"></i>
  </div>
  <span class="title"><%=title%>${param.isCommnoBanner}</span>
  <%--<div class="open-right" id="open-right" data-activates="slide-out">--%>
    <%--<i class="ion-android-person"></i>--%>
  <%--</div>--%>
</div>
<c:if test="${empty param.isCommnoBanner}">
<div class="h-banner animated fadeindown">
  <div class="parallax">
    <!-- Slider -->
    <div class="swiper-container slider">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../static/img/5.jpg" alt="">
        </div>
        <%--<div class="swiper-slide">--%>
          <%--<img src="../static/img/8.jpg" alt="">--%>
        <%--</div>--%>
      </div>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
    </div>
    <!-- End of Slider -->
    <div class="banner-title">${user.userName}</div>
  </div>
</div>
</c:if>
