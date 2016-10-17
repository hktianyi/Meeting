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
        <p style="font-size: 10px !important; margin: 0 !important;">嘉宾信息</p>
      </div>
      <!-- END PAGE TITLE-->
      <!-- END PAGE HEADER-->
      <div class="row">
        <div class="col-md-12">
          <!-- BEGIN PROFILE SIDEBAR -->
          <div class="profile-sidebar">
            <!-- PORTLET MAIN -->
            <div class="portlet light profile-sidebar-portlet ">
              <!-- SIDEBAR USERPIC -->
              <div class="profile-userpic">
                <img src="${_PATH}/static/common/img/logo.png" class="img-responsive" alt=""></div>
              <div class="profile-usertitle">
                <div class="profile-usertitle-name" id="name"> &nbsp; </div>
                <div class="profile-usertitle-job" id="job"> &nbsp; </div>
                <div class="profile-usertitle-job" id="company"> &nbsp; </div>
              </div>
              <div class="profile-userbuttons">
                <button type="button" class="btn green btn-lg"><i class="fa fa-print"></i> 打印二维码</button>
                <%--<button type="button" class="btn btn-circle red btn-sm">Message</button>--%>
              </div>
              <div class="profile-usermenu">
                <ul class="nav">
                  <%--<li>
                    <a href="page_user_profile_1.html">
                      <i class="icon-home"></i> 概览 </a>
                  </li>--%>
                  <%--<li class="active">
                    <a href="${_PATH}/sysUser/profile">
                      <i class="icon-settings"></i> 账户配置 </a>
                  </li>--%>
                  <%--<li>
                    <a href="page_user_profile_1_help.html">
                      <i class="icon-info"></i> 帮助 </a>
                  </li>--%>
                </ul>
              </div>
            </div>
          </div>
          <div class="profile-content">
            <div class="row">
              <div class="col-md-12">
                <div class="portlet light ">
                  <div class="row list-separated profile-stat">
                    <div class="col-md-4 col-sm-4 col-xs-6">
                      <div class="uppercase profile-stat-title"> 37</div>
                      <div class="uppercase profile-stat-text"> Projects</div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                      <div class="uppercase profile-stat-title"> 51</div>
                      <div class="uppercase profile-stat-text"> Tasks</div>
                    </div>
                    <div class="col-md-4 col-sm-4 col-xs-6">
                      <div class="uppercase profile-stat-title"> 61</div>
                      <div class="uppercase profile-stat-text"> Uploads</div>
                    </div>
                  </div>
                  <div>
                    <h4 class="profile-desc-title">About Marcus Doe</h4>
                    <span class="profile-desc-text"> Lorem ipsum dolor sit amet diam nonummy nibh dolore. </span>
                    <div class="margin-top-20 profile-desc-link">
                      <i class="fa fa-globe"></i>
                      <a href="http://www.keenthemes.com">www.keenthemes.com</a>
                    </div>
                    <div class="margin-top-20 profile-desc-link">
                      <i class="fa fa-twitter"></i>
                      <a href="http://www.twitter.com/keenthemes/">@keenthemes</a>
                    </div>
                    <div class="margin-top-20 profile-desc-link">
                      <i class="fa fa-facebook"></i>
                      <a href="http://www.facebook.com/keenthemes/">keenthemes</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- END PROFILE CONTENT -->
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
<script type="text/javascript">
  var code = '';
  var $tips = $('#tips'), $name = $('#name'), $job = $('#job'), $company = $('#company');
  $(function () {
//    $('body').addClass('page-container-bg-solid page-sidebar-closed');
//    $('ul.page-sidebar-menu').addClass('page-sidebar-menu-closed');
    document.onkeypress = function (event) {
      if(event.code === 'Enter') {
        clearMemberInfo();
        console.info('扫码成功：' + code);
        $.ajax(_PATH + '/attendee/viewData/' + code, {
          type: 'GET',
          dataType: 'json',
          success: function (resp) {
            fillMemberInfo(resp.data);
          }
        });
        code = '';
      } else if(/^Digit\d$/.test(event.code)) {
        code += event.key;
      }
    };
    $(window).blur(function(){
      $tips.removeClass('note-info').addClass('note-danger').text('请注意！！！ 当前窗口不是激活窗口，无法正常扫码，请点击一下浏览器。');
    });
    $(window).focus(function(){
      $tips.removeClass('note-danger').addClass('note-info').text('嘉宾信息');
    });
  });

  function clearMemberInfo() {
    $name.text('');
    $job.text('');
    $company.text('');
  }

  function fillMemberInfo(member) {
    $name.text(member.name);
    $job.text(member.title);
    $company.text(member.company);
  }

  function printQRCode() {
    $("#qrCode").print({
      globalStyles: false,
      mediaPrint: false,
      stylesheet: null,
      noPrintSelector: ".no-print",
      iframe: true,
      append: null,
      prepend: null,
      manuallyCopyFormValues: false,
      deferred: $.Deferred(),
      timeout: 750,
      title: null,
      doctype: '<!doctype html>'
    });
  }
</script>
</body>
</html>