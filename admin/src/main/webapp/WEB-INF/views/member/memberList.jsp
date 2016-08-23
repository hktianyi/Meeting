<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      <a href="${_PATH}/main.html">首页</a>
      <i class="fa fa-angle-right"></i>
    </li>
    <li>
      <span>会员信息</span>
    </li>
  </ul>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-filter"></i>筛选
        </div>
        <div class="tools">
          <a href="javascript:;" class="expand" data-original-title="" title=""> </a>
        </div>
      </div>
      <div class="portlet-body form" style="display: none;">
        <form class="form-horizontal" role="form">
          <div class="form-body">
            <div class="row">
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">用户名:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="fullname">
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">邮箱:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="useremail">
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">公司名:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="company">
                  </div>
                </div>
              </div>
              <div class="col-md-2">
                <div class="form-group">
                  <button type="button" class="btn blue" onclick="getDataList()"><i
                      class="fa fa-search"></i> 查询
                  </button>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
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
          params.fullname = $("#fullname").val();
          params.useremail = $("#useremail").val();
          params.company = $("#company").val();
        },
        "dataSrc": function (resp) {
          var data = resp.data;
          var time = new Date().getTime();
          for (var i = 0, len = data.length; i < len; i++) {
            data[i].appellation = (data[i].appellation == '1' ? '先生' : '女士');
            data[i].status = (data[i].status == 'VALID' ? '激活' : '未激活');

            //操作按钮
            data[i].action = '<a href="' + _PATH + '/${MODULE_NAME}/edit?id=' + data[i].id + '" type="button" class="btn btn-primary btn-xs">详情</a>' +
                '<a href="javascript:active(\'' + data[i].id + '\',\'' + data[i].username + '\');" type="button" class="btn btn-blue btn-xs">激活</a>' +
                '<a href="javascript:del(\'' + data[i].id + '\',\'' + data[i].username + '\');" type="button" class="btn btn-danger btn-xs">删除</a>';
          }
          return data;
        }
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "用户名", "name": "fullname", "data": "fullname", "sWidth": "8%"},
        {"sTitle": "邮箱", "name": "useremail", "data": "useremail", "sWidth": "8%"},
        {"sTitle": "称谓", "name": "appellation", "data": "appellation", "sWidth": "6%"},
        {"sTitle": "职位", "name": "job", "data": "job", "sWidth": "6%"},
        {"sTitle": "电话", "name": "telphone", "data": "telphone", "sWidth": "8%"},
        {"sTitle": "状态", "name": "status", "data": "status", "sWidth": "6%"},
        {"sTitle": "操作", "data": function (data) {
          return '<div class="btn-group btn-group-xs btn-group-solid">' +
              '<a href="' + _PATH + '/${MODULE_NAME}/edit?id=' + data.id + '" type="button" class="btn btn-primary btn-xs">详情</a>' +
              '<div class="btn-group">' +
              '<button class="btn grey btn-xs dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">' +
              '更多<i class="fa fa-angle-down"></i></button>' +
              '<ul class="dropdown-menu">' +
              '<li><a href="javascript:active(\'' + data.id + '\',\'' + data.fullname + '\')">激活</a></li>' +
              '<li><a href="javascript:del(\'' + data.id + '\')">删除</a></li>' +
              '</ul></div>' +
              '</div>';
        }, "sWidth": "6%"}
      ]
    });
  }
  function active(id, name) {
    layer.confirm('确认激活【' + name + '】？', {
      btn: ['激活', '取消'] //按钮
    }, function () {
      $.ajax(_PATH + '/${MODULE_NAME}/active/' + id, {
        type: 'DELETE',
        success: function (resp) {
          if (resp.statusCode === 200) {
            layer.msg('激活成功');
            getDataList();
          }
          else  layer.msg('激活失败', {icon: 6});
        },
        error: function () {
          layer.msg('激活失败', {icon: 6});
        }
      });
    });
  }
</script>