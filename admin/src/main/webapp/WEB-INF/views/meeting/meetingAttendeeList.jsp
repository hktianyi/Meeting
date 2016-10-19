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
    <div class="portlet box blue">
      <div class="portlet-title">
        <div class="caption">
          <i class="fa fa-filter"></i>筛选
        </div>
        <div class="tools">
          <a href="javascript:;" class="collapse" data-original-title="" title=""> </a>
        </div>
      </div>
      <div class="portlet-body form">
        <form class="form-horizontal" role="form">
          <div class="form-body">
            <div class="row">
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">用户名:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="name">
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">电话:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="mobile">
                  </div>
                </div>
              </div>
              <div class="col-md-3">
                <div class="form-group">
                  <label class="control-label col-md-4">邮箱:</label>
                  <div class="col-md-8">
                    <input class="form-control" type="text" id="email">
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
        "url": _PATH + "/attendee/load",
        "type": "POST",
        "data": function (params) {
          params.name = $("#name").val();
          params.mobile = $("#mobile").val();
          params.email = $("#email").val();
        }
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "邀请码", "name": "id", "data": "id", "sWidth": "5%"},
        {"sTitle": "姓名", "name": "name", "data": "name", "sWidth": "5%"},
        {
          "sTitle": "称谓", "name": "salutation", "data": function (data) {
          if(data.salutation) return data.salutation == '1' ? '先生' : '女士';
          else return '';
        }, "sWidth": "5%"
        },
        {"sTitle": "公司", "name": "company", "data": "company", "sWidth": "6%"},
        {"sTitle": "职级", "name": "title", "data": "title", "sWidth": "8%"},
        {"sTitle": "电话", "name": "mobile", "data": "mobile", "sWidth": "7%"},
        {"sTitle": "邮箱", "name": "email", "data": "email", "sWidth": "8%"},
        {
          "sTitle": "报名时间", "name": "createTime", "data": function (data) {
          return moment(data.createTime).format('YYYY-M-D HH:mm');
        }, "sWidth": "6%"
        },
        {
          "sTitle": "状态", "name": "createTime", "data": function (data) {
            if(data.status) return data.status === 'VALID' ? '已签到' : '已报名';
            else return '';
        }, "sWidth": "4%"
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