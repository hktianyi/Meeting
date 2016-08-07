<%@ page pageEncoding="UTF-8" language="java" %>
<%
  String title = request.getParameter("title");
%>
<!-- Toolbar -->
<div id="toolbar" class="primary-color">
  <a class="open-left" href="javascript:history.back()">
    <i class="ion-android-arrow-back"></i>
  </a>
  <span class="title"><%=title%></span>
</div>