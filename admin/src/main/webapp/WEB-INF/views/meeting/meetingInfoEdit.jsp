<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<link href="${_PATH}/static/plugins/jquery-multi-select/css/multi-select.css" rel="stylesheet" type="text/css" />
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>会议日程管理</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet light portlet-fit bg-inverse ">
      <div class="portlet-title">
        <div class="caption">
          <i class="icon-microphone font-red"></i>
          <span class="caption-subject bold font-red uppercase"> ${data.name}</span>
          <span class="caption-helper"></span>
        </div>
        <%--<div class="actions">
          <div class="btn-group btn-group-devided" data-toggle="buttons">
            <label class="btn btn-transparent dark btn-outline btn-circle btn-sm active">
              <input type="radio" name="options" class="toggle" id="option1">Actions</label>
            <label class="btn btn-transparent dark btn-outline btn-circle btn-sm">
              <input type="radio" name="options" class="toggle" id="option2">Settings</label>
          </div>
        </div>--%>
      </div>
      <div class="portlet-body">
        <div class="timeline  white-bg ">
          <c:forEach items="${data.detail}" var="detail">
            <div class="timeline-item">
              <div class="timeline-badge">
                <div class="timeline-icon">
                  <i class="icon-user-following font-green-haze"></i>
                </div>
              </div>
              <div class="timeline-body">
                <div class="timeline-body-arrow"> </div>
                <div class="timeline-body-head">
                  <div class="timeline-body-head-caption">
                    <a href="javascript:;" class="timeline-body-title font-blue-madison">${detail.title}</a>
                    <span class="timeline-body-time font-grey-cascade">${detail.scheduleDate} &nbsp;&nbsp;&nbsp;&nbsp; ${detail.startTime} ${empty detail.endTime ? '' : '-'} ${detail.endTime}  ${detail.timeOfDay}</span>
                  </div>
                </div>
                <div class="timeline-body-content">
                  <span class="font-grey-cascade">${detail.context}</span>
                </div>
              </div>
            </div>
          </c:forEach>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript" src="${_PATH}/static/plugins/jquery-multi-select/js/jquery.multi-select.js"></script>
<script type="text/javascript" src="${_PATH}/static/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
  var loading = 0;
  $(function () {
    $('.members').multiSelect({selectableOptgroup:true, keepOrder:true});

    // 微信模板消息表单
    $('#form_templateMsg').validate({
      onfocusout: function (element) {
        $(element).valid();
      },
      submitHandler: function (form) {
        if(loading == 1) return;
        if(!$(form).find('#openId').val()) {
          $('#label_openId').text('请选择用户').show();
        } else {
          $('#label_openId').text('');
          loading = 1;
          var openId = $('#form_templateMsg #openId').val();
          var args = $('#form_templateMsg .tab-content .active input').serialize();
          $.ajax(_MODULE_NAME + '/sendTemplateMsg', {
            type: 'POST',
            data: args + '&openId[]=' + openId + '&appId=${appId}&id=' + $('#form_templateMsg .nav-tabs .active a').data('id'),
            success: function (resp) {
              alert(resp.data || '发送成功');
              loading = 0;
            },
            error: function (resp) {
              alert(resp.data || '发送失败');
              loading = 0;
            }
          });
        }
      }
    });

    // 站内信表单
    $('#form_stationMsg').validate({
      rules: {
        title: 'required'
      },
      onfocusout: function (element) {
        $(element).valid();
      },
      submitHandler: function (form) {
        if(loading == 1) return;
        for (var instance in CKEDITOR.instances)
          CKEDITOR.instances[instance].updateElement();

        if(!$(form).find('#memberId').val()) {
          $('#label_memberId').text('请选择用户').show();
        } else if(!$(form).find('#content').val()) {
          $('#label_memberId').text('');
          $('#label_content').text('请填写消息内容').show();
        } else {
          $('#label_memberId').text('');
          $('#label_content').text('');
          loading = 1;
          $.ajax(_MODULE_NAME + '/sendStationMsg', {
            type: 'POST',
            data: $('#form_stationMsg').serialize(),
            success: function (resp) {
              alert(resp.data || '发送成功');
              loading = 0;
            },
            error: function (resp) {
              alert(resp.data || '发送失败');
              loading = 0;
            }
          });
        }
      }
    });
  });
</script>