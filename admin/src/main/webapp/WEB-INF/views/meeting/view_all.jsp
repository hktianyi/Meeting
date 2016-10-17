<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
  <%@include file="/WEB-INF/common/common.jsp" %>
  <title>艾菲签到</title>
  <link href="${_PATH}/static/pages/user/css/profile.min.css" rel="stylesheet" type="text/css"/>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-container-bg-solid page-full-width">
<div class="page-container" style="margin-top: 0 !important;">
  <div class="page-content-wrapper">
    <div class="page-content">
      <div class="note note-info" id="tips">
        <p style="font-size: 10px !important; margin: 0 !important;">已报名嘉宾二维码</p>
      </div>
      <!-- END PAGE TITLE-->
      <!-- END PAGE HEADER-->
      <div class="row">
        <div class="col-md-12">
          <div class="row">
          <c:forEach items="${dataList}" var="data" varStatus="status">
            <c:if test="${status.index ne 0 && status.index%6 eq 0}"></div><div class="row"></c:if>
            <div class="col-md-2 col-sm-2 col-xs-6">
              <div class="color-demo tooltips">
                <div class="color-view bg-white bg-font-white bold uppercase"> <img width="130px" src="${FILE_DOMAIN}/qrcode/${data.id}.jpg"> </div>
                <div class="color-info bg-white c-font-14 sbold"> ${data.name} </div>
              </div>
            </div>
          </c:forEach>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- BEGIN CORE PLUGINS -->
<script src="${_PATH}/static/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN THEME GLOBAL SCRIPTS -->
<script src="${_PATH}/static/common/js/app.min.js" type="text/javascript"></script>
<!-- END THEME GLOBAL SCRIPTS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="${_PATH}/static/plugins/layer/layer.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN THEME LAYOUT SCRIPTS -->
<script src="${_PATH}/static/common/js/layout.min.js" type="text/javascript"></script>
<%--<script src="${_PATH}/static/common/js/demo.min.js" type="text/javascript"></script>--%>
<!-- END THEME LAYOUT SCRIPTS -->
</body>
</html>