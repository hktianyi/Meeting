<%@ page pageEncoding="UTF-8" language="java" %>
<%@taglib prefix="view" uri="/taglib/view.tld" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="page-sidebar-wrapper">
  <div class="page-sidebar navbar-collapse collapse">
    <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
        data-slide-speed="200">
      <%--<li class="sidebar-toggler-wrapper">
        <div class="sidebar-toggler"> </div>
      </li>--%>
      <view:menu/>
    </ul>
  </div>
</div>
<script type="text/javascript">
  $(function () {
    $('body').addClass('page-container-bg-solid page-sidebar-closed');
    $('ul.page-sidebar-menu').addClass('page-sidebar-menu-closed');
  });
</script>