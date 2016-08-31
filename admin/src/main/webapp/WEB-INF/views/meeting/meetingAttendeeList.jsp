<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>嘉宾信息</span>
    </li>
  </ul>
  <div class="page-toolbar">
    <a href="${_PATH}/attendee/export嘉宾信息.xls" class="btn btn-circle blue btn-outline btn-xs">导出</a>
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
        "url": _PATH + "/attendee/load",
        "type": "POST",
        "data": function (params) {
          //params.hotelName = $("#hotelName").val();
          //params.counties = $("#counties").val();
          //params.levels = $("#levels").val();
        }
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "姓名", "name": "name", "data": "name", "sWidth": "8%"},
        {
          "sTitle": "称谓", "name": "salutation", "data": function (data) {
          return data.salutation == '1' ? '先生' : '女士';
        }, "sWidth": "8%"
        },
        {"sTitle": "公司", "name": "company", "data": "company", "sWidth": "6%"},
        {"sTitle": "职级", "name": "title", "data": "title", "sWidth": "8%"},
        {"sTitle": "电话", "name": "mobile", "data": "mobile", "sWidth": "8%"},
        {
          "sTitle": "报名时间", "name": "createTime", "data": function (data) {
          return moment(data.createTime).format('YYYY-M-D HH:mm');
        }, "sWidth": "6%"
        },
        {
          "sTitle": "操作", "data": function (data) {
          return '<a href="' + _PATH + '/attendee/edit?id=' + data.id + '" type="button" class="btn btn-primary btn-xs">详情</a>';
        }, "sWidth": "6%"
        }
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