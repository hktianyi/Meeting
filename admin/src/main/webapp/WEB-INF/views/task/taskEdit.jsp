<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>任务信息</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-tag"></i>任务信息
        </div>
      </div>
      <div class="portlet-body form">
        <form class="form-horizontal" role="form">
          <div class="form-body">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">任务名:</label>
                  <div class="col-md-9">
                    <input type="text" name="name" class="form-control" value="${data.name}" />
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">任务类型:</label>
                  <div class="col-md-9 form-md-checkboxes">
                    <dl class="md-checkbox-list" style="display: table">
                      <c:forEach items="${dic_taskType}" var="dic">
                        <dd class="md-checkbox" style="display: inline-table; padding-right: 1.8em;">
                          <input type="checkbox" id="taskType${dic.value}" name="taskTypes" value="${dic.value}" class="md-check" <c:if test="${fn:contains(','.concat(data.taskTypes).concat(','), ','.concat(dic.value).concat(','))}">checked</c:if> >
                          <label for="taskType${dic.value}">
                            <span></span>
                            <span class="check"></span>
                            <span class="box"></span> ${dic.zhName} </label>
                        </dd>
                      </c:forEach>
                    </dl>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">任务时间:</label>
                  <div class="col-md-9">
                    <div class="input-group input-large date-picker input-daterange" data-date-format="yyyy-m-d">
                      <input type="text" class="form-control" name="startDate" value="<fmt:formatDate value="${data.startDate}" type="date"/>">
                      <span class="input-group-addon"> 到 </span>
                      <input type="text" class="form-control" name="endDate" value="<fmt:formatDate value="${data.endDate}" type="date"/>">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label class="control-label col-md-3">参与机构:</label>
                  <div class="col-md-9">
                    <p class="form-control-static" id="organTree" name="organTree"></p>
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
                    <c:if test="${empty data.id}">
                      <button type="submit" class="btn green">
                        <i class="fa fa-pencil"></i> 保存
                      </button>
                    </c:if>
                    <button type="button" class="btn default" onclick="history.back()">取消</button>
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
<script type="text/javascript">
  $(function () {
    <c:if test="${empty data.id}">
    var organTree = $('#organTree').jstree({
      'core': {
        'data': {
          url: _PATH + '/sysOrgan/jsTreeAll',
          dataType: 'json',
          data: function (node) {
            return {'pid': node.id === '#' ? '0' : node.id};
          }
        }
      },
      "plugins": ["checkbox"]
    });

    $('form').validate({
      submitHandler: function (form) {
        var organCodes = organTree.jstree('get_selected');
        if(!organCodes || organCodes.length === 0) {
          layer.alert('请选择机构',{icon: 0});
          return;
        }
        $.ajax(_MODULE_NAME + '/save', {
          type: 'POST',
          data: $(form).serialize() + '&organCodes=' + organCodes.join(),
          success: function (resp) {
            if (resp.statusCode === 200) {
              layer.alert('保存成功!', function () {
                try {
                  saveCallback && saveCallback()
                } catch (e) {
                  window.location.href = _MODULE_NAME + '/list';
                }
              })
            }
          },
          error: function (resp) {
            layer.alert('保存失败!');
            var img = new Image();
            img.src = _PATH + '/sendJSError?s=' + _MODULE_NAME + '&e=' + encodeURIComponent(JSON.stringify(resp));
          }
        });
      },
      rules: {
        name: 'required'
      },
      message: {
        name: "请填写任务名称"
      }
    });
    </c:if>
    <c:if test="${not empty data.id}">
    $('input').attr('disabled', 'disabled');
    $('select').attr('disabled', 'disabled');
    var organTree = $('#organTree').jstree({
      'core': {
        'data': {
          url: _PATH + '/task/jsTree/${data.id}',
          dataType: 'json',
          data: function (node) {
            return {'pid': node.id === '#' ? '0' : node.id};
          }
        }
      },
      "plugins": ["checkbox"]
    });
    </c:if>
  });
</script>