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
      <jsp:param name="title" value="登记注册/Registration"></jsp:param>
      <jsp:param name="isCommnoBanner" value="0"></jsp:param>
    </jsp:include>

    <!-- Main Content -->
    <div class="animated fadeinup">

      <div>
        <div class="p-t-20">
          <ul class="tabs">
            <li class="tab" style="line-height: 20px !important;"><a class="active" href="#test1">个人信息<br/>Personal Info</a></li>
            <li class="tab" style="line-height: 20px !important;"><a href="#test2" id="test3">活动注册<br/>EVENT REGIST</a></li>
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
                <input id="salutation1" type="radio" name="salutation" value="1" ${ma.salutation eq '1' ? 'checked' : ''}><label for="salutation1">先生/Mr</label>
                <input id="salutation2" type="radio" name="salutation" value="2" ${ma.salutation eq '2' ? 'checked' : ''}><label for="salutation2">女士/Ms</label>
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
              <c:if test="${_USER.hierarchy eq '1'}">
              <div class="input-field animated fadeinright">
                <h5 class="active">证件类型/Type of Travel Document:</h5>
                <select class="browser-default" name="travelType" id="travelType">
                  <option value="身份证/ID" ${ma.travelType eq '身份证/ID' ? 'selected' : ''}>身份证/ID</option>
                  <option value="护照/Passport" ${ma.travelType eq '护照/Passport' ? 'selected' : ''}>护照/Passport</option>
                  <option value="台胞证" ${ma.travelType eq '台胞证' ? 'selected' : ''}>台胞证</option>
                  <option value="台胞证/MTP" ${ma.travelType eq '回乡证/MTP' ? 'selected' : ''}>回乡证/MTP</option>
                  <option value="台湾通行证" ${ma.travelType eq '台湾通行证' ? 'selected' : ''}>台湾通行证</option>
                  <option value="港澳通行证" ${ma.travelType eq '港澳通行证' ? 'selected' : ''}>港澳通行证</option>
                  <option value="香港身份证/Hong Kong ID" ${ma.travelType eq '香港身份证/Hong Kong ID' ? 'selected' : ''}>香港身份证/Hong Kong ID</option>
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
              </c:if>
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
                   href="javascript:next();">下一步/Next</a>
              </div>
            </div>
        </div>

        <div id="test2">
          <!-- Form Inputs -->
          <div class="form-inputs">
            <div class="note note-info">
              <p style="font-size: 10px !important; margin: 0 !important;">请选择以下选项注册活动</p>
              <p style="font-size: 10px !important; margin: 0 !important;">please signup for events you'd like to attend</p>
            </div>
            <c:if test="${_USER.hierarchy eq '1'}">
            <div class="input-field animated fadeinright">
              <h5>是否住宿/Accommodation:</h5>
              <select class="browser-default" name="isStay" id="isStay" rid="1">
                <option value="1" ${ma.isStay eq '1' ? 'selected' : ''}>是/YES</option>
                <option value="0" ${ma.isStay eq '0' ? 'selected' : ''}>否/NO</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>入住日期/Check-in:</h5>
              <select class="browser-default" name="stayDate" id="stayDate" rid="2">
                <option value="2016/10/21" ${ma.stayDate eq '2016/10/21' ? 'selected' : ''}>2016/10/21</option>
                <option value="2016/10/22" ${ma.stayDate eq '2016/10/22' ? 'selected' : ''}>2016/10/22</option>
                <option value="2016/10/23" ${ma.stayDate eq '2016/10/23' ? 'selected' : ''}>2016/10/23</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>退房日期/Check-out:</h5>
              <select class="browser-default" name="leaveDate" id="leaveDate" rid="3">
                <option value="2016/10/22" ${ma.leaveDate eq '2016/10/22' ? 'selected' : ''}>2016/10/22</option>
                <option value="2016/10/23" ${ma.leaveDate eq '2016/10/23' ? 'selected' : ''}>2016/10/23</option>
                <option value="2016/10/24" ${ma.leaveDate eq '2016/10/24' ? 'selected' : ''}>2016/10/24</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2' || _USER.hierarchy eq '3' || _USER.hierarchy eq '4'}">
            <div class="input-field animated fadeinright">
              <h5>艾菲研讨会/Effie Seminar:</h5>
              <select class="browser-default" name="schedule221" id="schedule221" rid="4">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule221 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule221 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2' || _USER.hierarchy eq '3'}">
            <div class="input-field animated fadeinright">
              <h5>自助午餐/Buffet Lunch:</h5>
              <select class="browser-default" name="schedule222" id="schedule222" rid="5">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule222 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule222 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2'}">
            <div class="input-field animated fadeinright">
              <h5>VIP欢迎晚宴/VIP Welcome Dinner:</h5>
              <select class="browser-default" name="schedule223" id="schedule223" rid="6">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule223 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule223 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>艾菲酒会/Effie Reception:</h5>
              <select class="browser-default" name="schedule231" id="schedule231" rid="7">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule231 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule231 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>红毯秀/Red Carpet Show:</h5>
              <select class="browser-default" name="schedule232" id="schedule232" rid="8">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule232 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule232 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2' || _USER.hierarchy eq '3' || _USER.hierarchy eq '4'}">
            <div class="input-field animated fadeinright">
              <h5>艾菲颁奖典礼/Effie Awards Gala:</h5>
              <select class="browser-default" name="schedule233" id="schedule233" rid="9">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule233 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule233 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2' || _USER.hierarchy eq '3'}">
            <div class="input-field animated fadeinright">
              <h5>艾菲派对/Effie After Party:</h5>
              <select class="browser-default" name="schedule234" id="schedule234" rid="10">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule234 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule234 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2' || _USER.hierarchy eq '3' || _USER.hierarchy eq '4'}">
            <div class="input-field animated fadeinright">
              <h5>2016优秀案例赏析会/2016 Effie Forum:</h5>
              <select class="browser-default" name="schedule241" id="schedule241" rid="11">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule241 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule241 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
            <c:if test="${_USER.hierarchy eq '1' || _USER.hierarchy eq '2'}">
            <div class="input-field animated fadeinright">
              <h5>VIP午宴/VIP Luncheon:</h5>
              <select class="browser-default" name="schedule242" id="schedule242" rid="12">
                <%--<option value="1">请选择...</option>--%>
                <option value="1" ${ma.schedule242 eq '1' ? 'selected' : ''}>参加/YES</option>
                <option value="0" ${ma.schedule242 eq '0' ? 'selected' : ''}>不参加/NO</option>
              </select>
            </div>
            </c:if>
          </div>
          <div style="padding: 20px 40px;">
            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:previewSchedule();" target="_blank"
               style="line-height:20px !important;padding-top:8px">
              预览个人行程<br/>preview my agenda
            </a>
          </div>
          <div style="padding: 20px 40px;">
            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
               href="javascript:signUp();">提交/Submit</a>
          </div>
          提交后仍可修改/you can still edit after submission
        </div>
        </form>
      </div>
      <!-- Footer -->
      <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

    </div> <!-- End of Main Contents -->
    <script type="text/javascript">
      $(function () {
        if(window.sessionStorage && sessionStorage.getItem("dis") == 'ss') {
          sessionStorage.removeItem("dis");
          $("#test3").click();
        }
        $("#isStay").on('change', function () {
          if($(this).val() == '0') {
            $("#stayDate").attr("disabled", "disabled");
            $("#leaveDate").attr("disabled", "disabled");
          } else {
            $("#stayDate").removeAttr("disabled");
            $("#leaveDate").removeAttr("disabled");
          }
        });
        $("#stayDate").on('change', function () {
          $("#leaveDate").find('option').removeAttr("disabled");
          if ($(this).val() == '2016/10/22') {
            $("#leaveDate").find('option:eq(0)').attr("disabled", "disabled");
            if($("#leaveDate").val() == '2016/10/22') $("#leaveDate").val('2016/10/23');
          } else if ($(this).val() == '2016/10/23') {
            $("#leaveDate").find('option:eq(0)').attr("disabled", "disabled");
            $("#leaveDate").find('option:eq(1)').attr("disabled", "disabled");
            if($("#leaveDate").val() == '2016/10/22' || $("#leaveDate").val() == '2016/10/23') $("#leaveDate").val('2016/10/24');
          }
        });
      });
      function next() {
        if(validate1()) {
          $("#test3").click();
          $(window).scrollTop(0);
        }
      }

      function previewSchedule() {
        window.sessionStorage && sessionStorage.setItem("dis", "ss");
        window.open(_PATH + '/meeting/previewSchedule/2?' + $('#form1').serialize());
      }

      var index = 0;
      function signUp() {
        if(index !== 0) return;
        index = layer.load(1, {
          shade: [0.3,'#fff'] //0.1透明度的白色背景
        });
        if(validate1()) {
          $.ajax({
            type: "post",
            dataType: "json",
            url: "${_PATH}/meeting/sign",
            data: $('#form1').serialize(),
            success: function (resp) {
              if (resp.statusCode === 200) {
                window.location.href = "${_PATH}/meetingcode/qrcodecheck";
              } else {
                layer.close(index);
                layer.alert(resp.errorInfo);
              }
            },
            error: function (resp) {
              layer.close(index);
              layer.alert('报名失败');
            }
          })
        } else {
          layer.close(index);
          index = 0;
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
        <c:if test="${_USER.hierarchy eq '1'}">
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
        </c:if>
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