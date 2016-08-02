<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>绩效考核列表</span>
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
        "url": _PATH + "/${MODULE_NAME}/load",
        "type": "POST",
        "data": function (params) {
          //params.hotelName = $("#hotelName").val();
          //params.counties = $("#counties").val();
          //params.levels = $("#levels").val();
        }
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "任务名称", "name": "name", "data": "name", "sWidth": "8%"},
        {"sTitle": "任务类型", "name": "taskType", "data": "taskType", "sWidth": "8%"},
        {"sTitle": "状态", "name": "status", "data": function (data) {
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
        }, "sWidth": "6%"},
        {"sTitle": "创建时间", "name": "createTime", "data": function (data) {
          return moment(data.createTime).format('YYYY-M-D HH:mm');
        }, "sWidth": "6%"},
        {
          "sTitle": "操作", "data": function (data) {
          return '<a href="' + _PATH + '/kpi/edit/' + data.taskType + '?id=' + data.id + '" type="button" class="btn btn-primary btn-xs">填报</a>';
        }, "sWidth": "6%"
        }
      ]
    });
  }
</script>