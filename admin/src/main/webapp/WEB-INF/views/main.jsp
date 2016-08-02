<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="view" uri="/taglib/view.tld" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<tiles:putAttribute name="common" value="/WEB-INF/common/common.jsp"/>
<tiles:putAttribute name="header" value="/WEB-INF/common/header.jsp"/>
<tiles:putAttribute name="menu" value="/WEB-INF/common/menu.jsp"/>
<tiles:putAttribute name="footer" value="/WEB-INF/common/footer.jsp"/>
<tiles:putAttribute name="title" value="${APP_NAME}"/>
<c:if test="${not empty body}">
  <tiles:putAttribute name="body" value="/WEB-INF/views${body}"/>
</c:if>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
  <tiles:insertAttribute name="common"/>
  <title><tiles:insertAttribute name="title" ignore="true"/></title>
</head>
<body class="page-sidebar-closed-hide-logo page-content-white page-header-fixed page-sidebar-fixed">
<tiles:insertAttribute name="header"/>
<div class="page-container">
  <div class="page-sidebar-wrapper">
    <div class="page-sidebar navbar-collapse collapse">
      <ul class="page-sidebar-menu  page-header-fixed " data-keep-expanded="false" data-auto-scroll="true"
          data-slide-speed="200">
        <%--<li class="sidebar-toggler-wrapper">
          <div class="sidebar-toggler"> </div>
        </li>--%>
        <c:choose>
          <c:when test="${menuChange}">
            <li class="nav-item open">
              <a href="javascript:void(0);" data-action="" class="nav-link nav-toggle">
                <i class="fa fa-edit"></i><span class="title">在线填报</span></a>
              <ul class="sub-menu" style="display: block;">
                <c:forEach items="${_taskDetails}" var="_taskDetail">
                  <li class="nav-item">
                    <a href="javascript:void(0);" data-action="/kpi/edit/${_taskDetail.taskType}?id=${_taskDetail.id}" class="nav-link">
                      <i class="fa fa-tachometer"></i><span class="title">
                      <c:forEach items="${dic_taskType}" var="dic">
                        <c:if test="${_taskDetail.taskType eq dic.value}">${dic.zhName}</c:if>
                      </c:forEach>
                    </span></a>
                  </li>
                </c:forEach>
              </ul>
            </li>
          </c:when>
          <c:otherwise>
            <view:menu/>
          </c:otherwise>
        </c:choose>
      </ul>
    </div>
  </div>
  <div class="page-content-wrapper">
    <div class="page-content">
      <tiles:insertAttribute name="body" ignore="true"/>
    </div>
  </div>
</div>
<tiles:insertAttribute name="footer"/>
<script type="text/javascript">
  $(function () {
    $('.page-sidebar-menu').on('click', 'a[data-action^="/"]', function () {
      window.location.href = _PATH + $(this).data('action');
    })
  })
</script>
</body>
</html>
