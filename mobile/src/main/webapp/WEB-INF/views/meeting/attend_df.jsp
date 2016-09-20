<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
  <%@include file="../../common/common.jsp" %>
  <style>
    .sex input {
      display: inline-block;
      padding: 7px 12px;
      font-size: 14px;
      background: #eee;
      border: 0;
      color: inherit;
      border-radius: 2px;
      cursor: pointer;
      color: inherit;
      transition: all 0.3s ease-in;
      -webkit-transition: all 0.3s ease-in;
    }
  </style>
</head>
<body>
<div class="m-scene" id="main"> <!-- Main Container -->

  <!-- Sidebars -->
  <jsp:include page="../../common/menu.jsp"></jsp:include>
  <!-- End of Sidebars -->

  <!-- Page Content -->
  <div id="content" class="page">

    <!-- Toolbar -->
    <jsp:include page="../../common/toolbar.jsp">
      <jsp:param name="title" value="评委登记注册"></jsp:param>
      <jsp:param name="isCommnoBanner" value="0"></jsp:param>
    </jsp:include>

    <!-- Main Content -->
    <div class="animated fadeinup">

      <div>
        <div class="p-t-20">
          <ul class="tabs">
            <li class="tab"><a class="active" href="#test1">个人信息</a></li>
            <li class="tab"><a href="#test2" id="test3">食宿信息</a></li>
          </ul>
        </div>

        <form id="form1" method="post">
          <div id="test1" class="meetingDetail">
            <div class="form-inputs">
              <div class="input-field animated fadeinright">
                <input id="name" type="text" class="validate" name="name" value="${ma.name}" required>
                <label class="active">姓名/Name:</label>
              </div>
              <div class="input-field animated fadeinright sex">
                <h5 class="active">称谓/Salutation:</h5>
                <input id="salutation1" type="radio" name="salutation"
                       value="1" ${ma.salutation eq '1' ? 'checked' : ''}><label for="salutation1">先生/Mr</label>
                <input id="salutation2" type="radio" name="salutation"
                       value="2" ${ma.salutation eq '2' ? 'checked' : ''}><label for="salutation2">女士/Ms</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="company" type="text" class="validate" name="company" value="${ma.company}">
                <label class="active">公司/Company:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="title" type="text" class="validate" name="title" value="${ma.title}">
                <label class="active">职位/Title:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="email" type="email" class="validate" name="email" value="${ma.email}">
                <label class="active">邮箱/Email:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="mobile" type="text" class="validate" name="mobile" value="${ma.mobile}">
                <label class="active">手机/Mobile:</label>
              </div>
              <div class="input-field animated fadeinright">
                <h5 class="active">证件类型/Type of Travel Document:</h5>
                <select class="browser-default" name="travelType" id="travelType">
                  <option value="身份证" ${ma.travelType eq '身份证' ? 'selected' : ''}>身份证</option>
                  <option value="护照" ${ma.travelType eq '护照' ? 'selected' : ''}>护照</option>
                  <option value="台胞证" ${ma.travelType eq '台胞证' ? 'selected' : ''}>台胞证</option>
                  <option value="台胞证" ${ma.travelType eq '回乡证' ? 'selected' : ''}>回乡证</option>
                  <option value="台湾通行证" ${ma.travelType eq '台湾通行证' ? 'selected' : ''}>台湾通行证</option>
                  <option value="港澳通行证" ${ma.travelType eq '港澳通行证' ? 'selected' : ''}>港澳通行证</option>
                  <option value="香港身份证" ${ma.travelType eq '香港身份证' ? 'selected' : ''}>香港身份证</option>
                </select>
              </div>
              <div class="input-field animated fadeinright">
                <input id="travelName" type="text" class="validate" name="travelName" value="${ma.travelName}">
                <label class="active">证件姓名/Name on Travel Document:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="travelNo" type="text" class="validate" name="travelNo" value="${ma.travelNo}">
                <label class="active">证件号码/Travel Document No.：</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="contactName" type="text" class="validate" name="contactName" value="${ma.contactName}">
                <label class="active">联系人姓名/Contact Name:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="contactEmail" type="text" class="validate" name="contactEmail" value="${ma.contactEmail}">
                <label class="active">联系人邮箱/Contact Email:</label>
              </div>
              <div class="input-field animated fadeinright">
                <input id="contactMobile" type="text" class="validate" name="contactMobile" value="${ma.contactMobile}">
                <label class="active">联系人电话/Contact Mobile:</label>
              </div>
              <div style="padding: 20px 40px;">
                <input id="id" type="hidden" class="validate" name="id" value="${ma.id}">
                <input id="meetingId" type="hidden" class="validate" name="meetingId" value="${meetingId}">
                <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
                   href="javascript:next();">下一步</a>
              </div>
            </div>
          </div>

          <div id="test2">
            <!-- Form Inputs -->
            <div class="form-inputs">
              <c:forEach items="${schedules}" var="schedule">
                <div class="input-field animated fadeinright">
                  <h5>${schedule.zhName}:</h5>
                  <c:choose>
                    <c:when test="${schedule.eleType eq 'select'}">
                      <${schedule.eleType} ${schedule.eleAttr} name="${schedule.eleName}" id="${schedule.eleName}" rid="${schedule.id}">
                      <c:forEach items="${schedule.dicList}" var="dic">
                        <option value="${dic.value}" ${dic.value eq schedule.eleValue ? 'selected' : ''}>${dic.zhName}</option>
                      </c:forEach>
                    </${schedule.eleType}>
                    </c:when>
                  </c:choose>
                </div>
              </c:forEach>
          </div>
          <div style="padding: 20px 40px;">
            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
               href="javascript:signUp();">提交</a>
          </div>
        </form>
      </div>
      <!-- Footer -->
      <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

    </div> <!-- End of Main Contents -->
    <script type="text/javascript">
      $(function () {
        $("#isStay").on('change', function () {
          if ($(this).val() == '0') {
            $("#stayDate").attr("disabled", "disabled");
            $("#leaveDate").attr("disabled", "disabled");
          } else {
            $("#stayDate").removeAttr("disabled");
            $("#leaveDate").removeAttr("disabled");
          }
        })
      });
      function next() {
        if (validate1()) {
          $("#test3").click();
        }
      }

      function signUp() {
        if (validate1()) {
          var layerIndex = layer.load(1, {
            shade: [0.3, '#fff'] //0.1透明度的白色背景
          });
          $.ajax(_PATH + '/meeting/sign', {
            type: 'POST',
            data: $('#form1').serialize(),
            success: function (resp) {
              if (resp.statusCode === 200) {
                $.ajax(_PATH + '/meeting/saveSS', {
                  type: 'POST',
                  contentType: 'application/json;charset=utf-8',
                  data: JSON.stringify({'elements': serializeTable('', '${_USER.id}')}),
                  success: function (resp) {
                    if (resp.statusCode === 200) {
                      window.location.href = "${_PATH}/meetingcode/qrcodecheck";
                    }
                    else alert('报名失败');
                    layer.close(layerIndex);
                  }
                });
              }
              else alert('报名失败');
            },
            error: function () {
              alert('报名失败');
              layer.close(layerIndex);
            }
          });
        }
      }

      function validate1() {
        var name = $("#name").val();
        var salutation = $("input[name='salutation']:checked").val();
        var company = $("#company").val();
        var title = $("#title").val();
        var email = $("#email").val();
        var mobile = $("#mobile").val();
        var travelType = $("#travelType").val();
        var travelName = $("#travelName").val();
        var travelNo = $("#travelNo").val();
        var contactName = $("#contactName").val();
        var contactEmail = $("#contactEmail").val();
        var contactMobile = $("#contactMobile").val();
        if (!isNotNull(name)) {
          alert('请填写姓名!');
          return false;
        }
        if (!isNotNull(salutation)) {
          alert('请选择称谓!');
          return false;
        }
        if (!isNotNull(company)) {
          alert('请填写公司!');
          return false;
        }
        if (!isNotNull(title)) {
          alert('请填写职位!');
          return false;
        }
        if (!isNotNull(email)) {
          alert('请填写邮箱!');
          return false;
        }
        if (!isNotNull(mobile)) {
          alert('请填写手机号!');
          return false;
        }
        if (!isNotNull(travelType)) {
          alert('请选择证件类型!');
          return false;
        }
        if (!isNotNull(travelName)) {
          alert('请填写证件名称!');
          return false;
        }
        if (!isNotNull(travelNo)) {
          alert('请填写证件号码!');
          return false;
        }
        if (!isNotNull(contactName)) {
          alert('请填写联系人姓名!');
          return false;
        }
        if (!isNotNull(contactEmail)) {
          alert('请填写联系人邮箱!');
          return false;
        }
        if (!isNotNull(contactMobile)) {
          alert('请填写联系人电话!');
          return false;
        }
        return true;
      }
    </script>
  </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>

</body>
</html>