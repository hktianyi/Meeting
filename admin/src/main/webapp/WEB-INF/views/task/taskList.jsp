<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>任务管理</span>
    </li>
  </ul>
  <div class="page-toolbar">
    <a href="${_PATH}/task/edit" class="btn btn-circle blue btn-outline btn-xs">&nbsp;添加&nbsp;</a>
  </div>
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
        {"sTitle": "任务类型数量", "name": "taskTypes", "data": function (data) {
          return data.taskTypes ? data.taskTypes.split(',').length : 0;
        }, "sWidth": "8%"},
        {"sTitle": "填报机构数量", "name": "organCodes", "data": function (data) {
          return data.organCodes ? data.organCodes.split(',').length : 0;
        }, "sWidth": "8%"},
        {"sTitle": "开始时间", "name": "startDate", "data": function (data) {
          return data.startDate && moment(data.startDate).format('YYYY-M-D');
        }, "sWidth": "8%"},
        {"sTitle": "结束时间", "name": "endDate", "data": function (data) {
          return data.endDate && moment(data.endDate).format('YYYY-M-D');
        }, "sWidth": "8%"},
//        {"sTitle": "状态", "name": "status", "data": function (data) {
//          switch (data.status) {
//            case 'TEMP':
//              return '未提交';
//            case 'COMMIT':
//              return '已提交';
//            case 'VALID':
//              return '审核通过';
//            case 'INVALID':
//              return '审核未通过';
//            default:
//              return data.status;
//          }
//        }, "sWidth": "6%"},
        {"sTitle": "操作", "data": function (data) {
          return '<a href="' + _PATH + '/${MODULE_NAME}/edit?id=' + data.id + '" type="button" class="btn btn-primary btn-xs">详情</a>';
        }, "sWidth": "6%"}
      ]
    });
  }
  function del(id, name) {
    layer.confirm('确认删除【' + name + '】?？', {
      btn: ['删除', '取消'] //按钮
    }, function () {
      $.ajax(_PATH + '/${MODULE_NAME}/delete?id=' + id, {
        type: 'DELETE',
        success: function (resp) {
          if (resp.statusCode === 200) {
            layer.msg('删除成功');
            getDataList();
          }
          else  layer.msg('删除失败', {icon: 6});
        },
        error: function () {
          layer.msg('删除失败', {icon: 6});
        }
      });
    });
  }
</script>