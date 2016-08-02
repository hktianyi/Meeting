<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>任务审核列表</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <table class="table table-striped table-bordered table-hover table-header-fixed"></table>
  </div>
</div>
<script type="text/javascript">
  var dataTable;
  $(function () {
    getDataList();
  });
  function getDataList() {
    if (typeof dataTable !== 'undefined') {
      dataTable.draw();
      return;
    }
    dataTable = $("table").DataTable({
      "ajax": {
        "url": _PATH + "/task/loadKpi?taskId=${data.id}",
        "type": "POST"
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "任务名称", "name": "name", "data": "name", "sWidth": "8%"},
        {"sTitle": "任务类型", "name": "taskType", "data": "taskType", "sWidth": "8%"},
        {"sTitle": "填报单位", "name": "tbdw", "data": "tbdw", "sWidth": "10%"},
        {"sTitle": "单位负责人", "name": "dwfzr", "data": function (data) {
          return data.dwfzr || '';
        }, "sWidth": "8%"},
        {"sTitle": "得分", "name": "defen", "data": function (data) {
          return data.defen || '';
        }, "sWidth": "8%"},
        {
          "sTitle": "状态", "name": "status", "data": function (data) {
          switch (data.status) {
            case 'TEMP':
              return '未提交';
            case 'COMMIT':
              return '已提交';
            case 'VALID':
              return '审核通过';
            case 'INVALID':
              return '审核未通过';
            default:
              return data.status;
          }
        }, "sWidth": "6%"
        },
        {"sTitle": "修改时间", "name": "updateTime", "data": function (data) {
          return data.updateTime || '';
        }, "sWidth": "8%"},
        {
          "sTitle": "操作", "data": function (data) {
          return '<a href="' + _PATH + '/task/approveView/' + data.id + '" class="btn btn-primary btn-xs">审核</a>';
        }, "sWidth": "6%"
        }
      ]
    });
  }
</script>