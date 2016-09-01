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
        "url": _PATH + "/invitationCode/load",
        "type": "POST",
        "data": function (params) {
          //params.hotelName = $("#hotelName").val();
          //params.counties = $("#counties").val();
          //params.levels = $("#levels").val();
        }
      },
      "columns": [
        {"sTitle": "序号", "sWidth": "3%", "defaultContent": ''},
        {"sTitle": "邀请码", "name": "meetcode", "data": "meetcode", "sWidth": "8%"},
        {
          "sTitle": "状态", "name": "bizStatus", "data": function (data) {
          return data.bizStatus == '1' ? '未使用' : (data.name ? (data.status === 'VALID' ? '已签到' : '已报名') : '未报名');
        }, "sWidth": "8%"
        },
        {"sTitle": "姓名", "name": "name", "data": function (data) {
          return data.name || '';
        }, "sWidth": "8%"},
        {"sTitle": "电话", "name": "mobile", "data": function (data) {
          return data.mobile || '';
        }, "sWidth": "8%"},
        {
          "sTitle": "使用时间", "name": "createTime", "data": function (data) {
          return moment(data.createTime).format('YYYY-M-D HH:mm');
        }, "sWidth": "6%"
        },
        {
          "sTitle": "操作", "data": function (data) {
          return '<a href="javascript:signIn(\''+data.meetcode+'\', \''+data.name+'\');" type="button" class="btn btn-primary btn-xs">签到</a>';
        }, "sWidth": "6%"
        }
      ]
    });
  }
  function signIn(meetCode, name) {
    layer.confirm('确认签到【' + (name || meetCode) + '】?', {
      btn: ['签到', '取消'] //按钮
    }, function () {
      $.ajax(_PATH + '/invitationCode/signIn/' + meetCode, {
        type: 'POST',
        success: function (resp) {
          if (resp.statusCode === 200) {
            layer.msg('签到成功');
            getDataList();
          }
          else  layer.msg('签到失败', {icon: 6});
        },
        error: function () {
          layer.msg('签到失败', {icon: 6});
        }
      });
    });
  }
</script>