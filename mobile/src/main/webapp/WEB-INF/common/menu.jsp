<%@ page pageEncoding="UTF-8" language="java" %>
<!-- Sidebars -->
<!-- Left Sidebar -->
<ul id="slide-out-left" class="side-nav collapsible">
  <li>
    <div class="sidenav-header primary-color">
      <div class="nav-avatar">
        <img class="circle avatar" src="${_PATH}/static/img/user.jpg" alt="">
        <div class="avatar-body">
          <h3>${_USER.userName}</h3>
        </div>
      </div>
    </div>
  </li>
  <li><a href="${_PATH}/meeting/detail/2" class="no-child menuItem">消息/Message</a></li>
  <%--<li><a target="_blank" href="${FILE_DOMAIN}/effie/艾菲国际研讨会.pdf" class="no-child menuItem">活动内容/Event Contents</a></li>--%>
  <li><a href="${_PATH}/meeting/detail/2" class="no-child menuItem">我的活动/My Event</a></li>
  <%--<li><a href="${_PATH}/member/attendeeList" class="no-child">活动详情</a></li>--%>
  <%--<li>
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
  <li><a href="${_PATH}/message" class="no-child">活动通知</a></li>
  <li><a href="${_PATH}/feedback" class="no-child">用户反馈</a></li>
  <li><a href="tel:18511696693" class="no-child">联系我们</a></li>--%>
  <li><a href="${_PATH}/logout" class="no-child menuItem">退出登录/Logout</a></li>
</ul>
<!-- End of Sidebars -->
