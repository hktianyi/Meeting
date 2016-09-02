<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
  .badge-danger:after{
    position: absolute;
    content: ' ';
    height: 6px;
    width: 6px;
    border-radius: 3px;
    background-color: red;
    top: 1.2em;
    right: -.1em;
  }
</style>
<!-- Toolbar -->
<div id="toolbar" class="primary-color">
  <%--<div class="open-left" id="open-left" data-activates="slide-out-left">--%>
    <%--<i class="ion-android-menu"></i>--%>
  <%--</div>--%>
  <span class="title">${param.title}</span>
  <div class="open-right">
    <a href="${_PATH}/message"><i class="ion-android-mail"></i><span class="badge"></span></a>
  </div>
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
<script type="text/javascript">
  $(function () {
    $.getJSON(_PATH + '/message/unReadCount', function (resp) {
      if(resp.data > 0) $('.badge').addClass('badge-danger');
    })
  })
</script>
