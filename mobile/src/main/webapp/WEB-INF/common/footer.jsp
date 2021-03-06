<%@ page pageEncoding="UTF-8" language="java" %>
<%--<div class="copyright"> 2016 © ${APP_NAME}. 后台管理系统.</div>--%>
<!--[if lt IE 9]>
<script src="../../static/plugins/respond.min.js"></script>
<script src="../../static/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="${_PATH}/static/plugins/jquery.swipebox.min.js"></script>
<script src="${_PATH}/static/plugins/jquery.smoothState.min.js"></script>
<script src="${_PATH}/static/plugins/materialize.min.js"></script>
<script src="${_PATH}/static/plugins/swiper.min.js"></script>
<script src="${_PATH}/static/plugins/jquery.mixitup.min.js"></script>
<script src="${_PATH}/static/plugins/masonry.min.js"></script>
<%--<script src="${_PATH}/static/plugins/chart.min.js"></script>--%>
<script src="${_PATH}/static/plugins/functions.js"></script>
<script src="${_PATH}/static/plugins/layer/layer.js" type="text/javascript"></script>
<script src="${_PATH}/static/plugins/layer/extend/layer.ext.js" type="text/javascript"></script>
<script src="${_PATH}/static/plugins/qtip2/jquery.qtip.js" type="text/javascript"></script>

<script src="${_PATH}/static/plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="${_PATH}/static/plugins/scrollpagination.js"></script>
<script type="text/javascript">

    function isNotNull(str) {
        if (null == str || '' == str || undefined == str || 'undefined' == str){
            return false;
        }
        return true;
    }

    function serializeTable(formId, recordId) {
      var form = $('#plan_mtfl_cbqd');
      var data = [];
      var flag = true;
      form.find('select').each(function (index, element) {
        var param = {};
        param.formId = formId;
        param.recordId = recordId;
        param.id = $(element).attr('rid');
        param.eleName = element.name;
        param.eleValue = $(element).is(':checked') ? (/\s*_other$/.test(input.name) ? ('checked ' + $('#' + input.name).val()) : 'checked') : '';
        data.push(param);
      });
      return flag ? data : false;
    }
</script>