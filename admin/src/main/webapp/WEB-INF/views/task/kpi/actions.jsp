<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html;charset=utf-8" %>
<div class="actions btn-set right" style="float: right;">
  <c:choose>
    <c:when test="${'approve' eq operType}">
      <button type="button" onclick="approve('VALID')" class="btn green">
        <i class="fa fa-check"></i> 审核通过
      </button>
      <button type="button" onclick="approve('INVALID')" class="btn blue">
        <i class="fa fa-reply"></i> 审核不通过
      </button>
      <script type="text/javascript">
        function approve(type) {
          $("#status").val(type);
          $.post(_PATH + '/task/approve/${data.id}', {status:type}, function (resp) {
            layer.alert('操作成功', {icon: 1}, function () {
              window.location.href = _PATH + '/task/approveList';
            });
          });
        }
      </script>
    </c:when>
    <c:otherwise>
      <button type="button" onclick="save('TEMP')" class="btn blue">
        <i class="fa fa-check"></i> 保存
      </button>
      <button type="button" onclick="save('COMMIT')" class="btn green">
        <i class="fa fa-reply"></i> 提交
      </button>
      <script type="text/javascript">
        <c:choose>
          <c:when test="${data.status eq 'TEMP'}">
            function save(type) {
              $("#status").val(type);
              $.post(_PATH + '/kpi/save', $('form').serialize(), function (resp) {
                layer.alert('操作成功', {icon: 1}, function () {
                  window.location.href = _PATH + '/kpi/list';
                });
              });
            }
          </c:when>
          <c:otherwise>
            $(function () {
              $('input').attr('disabled', 'disabled');
              layer.msg('数据审核中,无法修改');
            });
            function save(type) {
              layer.msg('数据审核中,无法修改');
            }
          </c:otherwise>
        </c:choose>
      </script>
    </c:otherwise>
  </c:choose>
</div>
