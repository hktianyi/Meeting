<%@ page pageEncoding="UTF-8" language="java" %>
<div class="page-bar">
  <ul class="page-breadcrumb">
    <li>
      首页
    </li>
  </ul>
  <div class="page-toolbar">
    <button type="button" class="btn btn-circle blue btn-outline btn-xs">&nbsp;?&nbsp;</button>
  </div>
</div>
<div class="row">
  <div class="col-md-12">
    <div class="tiles">
    </div>
  </div>
</div>
<script type="text/javascript">
  $(function () {
    $.getJSON(_PATH + '/task/findTaskList', function (resp) {
      if(resp.statusCode === 200) {
        var tiles = '';
        for(var i in resp.data) {
          tiles += '<a href="'+_PATH+'/task/taskDetail/'+resp.data[i].id+'"><div class="tile double bg-purple-studio"><div class="tile-body"><h4>'+resp.data[i].name+'</h4><p></p>' +
              '</div><div class="tile-object"><div class="name"> 任务时间: </div><div class="number"> ' +
          moment(resp.data[i].startDate).format('YYYY-MM-DD') + ' 到 ' +moment(resp.data[i].endDate).format('YYYY-MM-DD')+' </div></div></div></a>';
        }
        $('.tiles').html(tiles);
      }
    });
  });
</script>