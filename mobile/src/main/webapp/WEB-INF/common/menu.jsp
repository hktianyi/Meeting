<%@ page pageEncoding="UTF-8" language="java" %>
<!-- Sidebars -->
<!-- Left Sidebar -->
<ul id="slide-out-left" class="side-nav collapsible">
  <li>
    <div class="sidenav-header primary-color">

      <div class="nav-avatar">
        <img class="circle avatar" src="../static/img/user.jpg" alt="">
        <div class="avatar-body">
          <h3>${user.userName}</h3>
        </div>
      </div>
    </div>
  </li>
  <li><a href="${_PATH}/main" class="no-child">活动中心</a></li>
  <li>
    <div class="collapsible-header">
      用户信息
    </div>
    <div class="collapsible-body">
      <ul class="collapsible">
        <li>
          <a href="${_PATH}/member/personal">个人信息</a>
          <a href="${_PATH}/member/modifyPwd">修改密码</a>
        </li>
      </ul>
    </div>
  </li>
  <li><a href="news.html" class="no-child">活动通知</a></li>
  <li><a href="contact.html" class="no-child">消息推送</a></li>
  <li><a href="${_PATH}/feedback" class="no-child">用户反馈</a></li>
  <li><a href="tel:18511696693" class="no-child">联系我们</a></li>
  <li><a href="${_PATH}/logout" class="no-child">退出登录</a></li>
</ul>
<!-- End of Sidebars -->
