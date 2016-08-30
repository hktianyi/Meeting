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
      <span>消息管理</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li class="active">
          <a href="#tab_1_1" data-toggle="tab">微信模板消息<span class="label label-sm label-danger circle">即时</span></a>
        </li>
        <li>
          <a href="#tab_1_2" data-toggle="tab">站内信</a>
        </li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tab_1_1">
          <div class="row">
            <div class="col-md-12">
              <form class="form-horizontal" role="form" id="form_templateMsg">
                <div class="form-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-3">用户:</label>
                        <div class="col-md-9">
                          <select multiple="multiple" class="multi-select double members" id="memberId_wx" name="memberId">
                            <optgroup label="全部">
                              <c:forEach items="${members}" var="member">
                                <option value="${member.id}">${member.userName}</option>
                              </c:forEach>
                            </optgroup>
                          </select>
                          <label for="memberId_wx" class="error" id="label_memberId_wx"></label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="tabbable-line">
                        <ul class="nav nav-tabs">
                          <c:forEach items="${templates}" var="template" varStatus="status">
                            <li ${status.first ? 'class="active"' : ''} >
                              <a href="#template_${template.id}" data-id="${template.id}" data-toggle="tab">${template.name}</a>
                            </li>
                          </c:forEach>
                        </ul>
                        <div class="tab-content">
                          <c:forEach items="${templates}" var="template" varStatus="status">
                            <div class="tab-pane ${status.first ? 'active' : ''}" id="template_${template.id}">
                              <c:forEach items="${template.detail}" var="detail">
                                <div class="row">
                                  <div class="col-md-12">
                                    <div class="form-group">
                                      <label class="control-label col-md-3">${detail.key}:</label>
                                      <div class="col-md-9">
                                        <input type="text" class="form-control" name="${detail.key}" />
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </c:forEach>
                            </div>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-actions">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                          <button type="submit" class="btn green">
                            <i class="fa fa-pencil"></i> 发送
                          </button>
                          <button type="button" class="btn default" onclick="history.back()">返回</button>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6"></div>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="tab-pane" id="tab_1_2">
          <div class="row">
            <div class="col-md-12">
              <form class="form-horizontal" role="form" id="form_stationMsg">
                <div class="form-body">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-3">用户:</label>
                        <div class="col-md-9">
                          <select multiple="multiple" class="multi-select double members" id="memberId" name="memberId[]">
                            <optgroup label="全部">
                              <c:forEach items="${attendees}" var="attendee">
                                <option value="${attendee.id}">${attendee.name}</option>
                              </c:forEach>
                            </optgroup>
                          </select>
                          <label for="memberId" class="error" id="label_memberId"></label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-3">标题:</label>
                        <div class="col-md-9">
                          <input type="text" class="form-control" name="title" value="${data.title}" />
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="control-label col-md-3">内容:</label>
                        <div class="col-md-9">
                          <textarea class="form-control ckeditor" id="content" name="content">${data.content}</textarea>
                          <label for="content" class="error" id="label_content"></label>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="form-actions">
                  <div class="row">
                    <div class="col-md-6">
                      <div class="row">
                        <div class="col-md-offset-3 col-md-9">
                          <button type="submit" class="btn green">
                            <i class="fa fa-pencil"></i> 发送
                          </button>
                          <button type="button" class="btn default" onclick="history.back()">返回</button>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6"></div>
                  </div>
                </div>
              </form>
            </div>
          </div>
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
      rules: {
        title: 'required'
      },
      onfocusout: function (element) {
        $(element).valid();
      },
      submitHandler: function (form) {
        if(loading == 1) return;
        if(!$(form).find('#memberId_wx').val()) {
          $('#label_memberId_wx').text('请选择用户').show();
        } else {
          $('#label_memberId_wx').text('');
          loading = 1;
          var memberId = $('#form_templateMsg select[name="memberId"]').val();
          var args = $('#form_templateMsg .tab-content .active input').serialize();
          $.ajax(_MODULE_NAME + '/sendTemplateMsg', {
            type: 'POST',
            data: args + '&memberIds=' + memberId.join() + '&appId=${appId}&id=' + $('#form_templateMsg .nav-tabs .active a').data('id'),
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