<%@ page pageEncoding="UTF-8" language="java" %>
<!-- Toolbar -->
<div id="toolbar" class="halo-nav box-shad-none">
  <div class="open-left" id="open-left" data-activates="slide-out-left">
    <i class="ion-android-menu"></i>
  </div>
  <span class="title none">${user.userName}</span>
  <%--<div class="open-right" id="open-right" data-activates="slide-out">--%>
    <%--<i class="ion-android-person"></i>--%>
  <%--</div>--%>
</div>

<div class="h-banner animated fadeindown">
  <div class="parallax">
    <!-- Slider -->
    <div class="swiper-container slider">
      <div class="swiper-wrapper">
        <div class="swiper-slide">
          <img src="../static/img/5.jpg" alt="">
        </div>
        <div class="swiper-slide">
          <img src="../static/img/8.jpg" alt="">
        </div>
      </div>
      <!-- Add Pagination -->
      <div class="swiper-pagination"></div>
    </div>
    <!-- End of Slider -->
    <div class="banner-title">${user.userName}</div>
  </div>
</div>
