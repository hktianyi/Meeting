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
      <jsp:param name="title" value="活动报名"></jsp:param>
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

        <div id="test1" class="meetingDetail">
          <form id="form1" method="post">
            <div class="form-inputs">
              <div class="input-field animated fadeinright">
                <input id="name" type="text" class="validate" name="name" value="${ma.name}" required>
                <label class="active">姓名/Name:</label>
              </div>
              <div class="input-field animated fadeinright sex">
                <h5 class="active">称谓/Salutation:</h5>
                <input id="salutation1" type="radio" name="salutation" value="1" checked><label for="salutation1">先生/Mr</label>
                <input id="salutation2" type="radio" name="salutation" value="2"><label for="salutation2">女士/Ms</label>
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
                  <option value="身份证" selected>身份证</option>
                  <option value="护照">护照</option>
                  <option value="台胞证">台胞证</option>
                  <option value="台湾通行证">台湾通行证</option>
                  <option value="港澳通行证">港澳通行证</option>
                  <option value="香港身份证">香港身份证</option>
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
                <c:if test="${'COMMIT' eq ma.status || empty ma.status}">
                  <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
                     href="javascript:next();">报名</a>
                </c:if>
              </div>
            </div>
          </form>
        </div>

        <div id="test2">
          <!-- Form Inputs -->
          <div class="form-inputs">
            <div class="input-field animated fadeinright">
              <h5>入住日期:</h5>
              <select class="browser-default" name="stayDate" id="stayDate">
                <option value="2016-09-02" selected>9月2日周五</option>
                <option value="2016-09-03">9月3日周六</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>退房日期:</h5>
              <select class="browser-default" name="leaveDate" id="leaveDate">
                <option value="2016-09-04" selected>9月4日周日</option>
                <option value="2016-09-04">9月5日周一</option>
              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>9月2日周五自助晚餐:</h5>
              <select class="browser-default" name="dinner1" id="dinner1">
                <option value="1" selected>需要</option>
                <option value="2">不需要</option>

              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>9月3日周六答谢晚宴:</h5>
              <select class="browser-default" name="dinner2" id="dinner2">
                <option value="1" selected>参加</option>
                <option value="2">不参加</option>

              </select>
            </div>
            <div class="input-field animated fadeinright">
              <h5>9月4日周日搜狐之夜晚宴，暨评委证书颁发仪式:</h5>
              <select class="browser-default" name="dinner3" id="dinner3">
                <option value="1" selected>参加</option>
                <option value="2">不参加</option>
              </select>
            </div>
          </div>
          <div style="padding: 20px 40px;">
            <input type="hidden" class="validate" name="id" value="${ai.id}">
            <input type="hidden" class="validate" name="meetingId" value="${meetingId}">
            <c:if test="${'COMMIT' eq ai.status || empty ai.status}">
              <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
                 href="javascript:signUp();">报名</a>
            </c:if>
          </div>
        </div>
      </div>
      <!-- Footer -->
      <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

    </div> <!-- End of Main Contents -->

  </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<script type="text/javascript">
  $(function () {
    if (isNotNull('${ma.salutation}')) {
      $("#salutation${ma.salutation}").attr('checked', 'checked');
    }
    if (isNotNull('${ma.travelType}')) {
      $("#travelType").val('${ma.travelType}');
    }
    if (isNotNull('${ai.stayDate}')) {
      $("#stayDate").val('${ai.stayDate}');
    }
    if (isNotNull('${ai.leaveDate}')) {
      $("#leaveDate").val('${ai.leaveDate}');
    }
    if (isNotNull('${ai.dinner1}')) {
      $("#dinner1").val('${ai.dinner1}');
    }
    if (isNotNull('${ai.dinner2}')) {
      $("#dinner2").val('${ai.dinner2}');
    }
    if (isNotNull('${ai.dinner3}')) {
      $("#dinner3").val('${ai.dinner3}');
    }
  });
  function next() {
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
    if (!(isNotNull(name) && isNotNull(salutation) && isNotNull(company) && isNotNull(title) && isNotNull(email) && isNotNull(mobile) && isNotNull(travelType) && isNotNull(travelName) && isNotNull(travelNo) && isNotNull(contactName) && isNotNull(contactEmail) && isNotNull(contactMobile))) {
      alert("请填写完整的信息！");
      return;
    }
    $.ajax({
      type: "post",
      dataType: "json",
      url: "${_PATH}/meeting/sign",
      data: $('#form1').serialize(),
      success: function (resp) {
        if (resp.statusCode === 200) {
          $("#test3").click();
        } else {
          alert(resp.errorInfo);
        }
      },
      error: function (resp) {
        alert('报名失败');
      }
    })
  }

  function signUp() {
    var stayDate = $("#stayDate").val();
    var leaveDate = $("#leaveDate").val();
    var dinner1 = $("#dinner1").val();
    var dinner2 = $("#dinner2").val();
    var dinner3 = $("#dinner3").val();
    if (!(isNotNull(stayDate) && isNotNull(leaveDate) && isNotNull(dinner1) && isNotNull(dinner2) && isNotNull(dinner3))) {
      alert("请填写完整的食宿信息！");
      return;
    }
    $.ajax({
      type: "post",
      dataType: "json",
      url: "${_PATH}/meeting/sign",
      data: $('#form1').serialize(),
      success: function (resp) {
        if (resp.statusCode === 200) {
          window.location.href = "${_PATH}/meetingcode/qrcodecheck";
        } else {
          alert(resp.errorInfo);
        }
      },
      error: function (resp) {
        alert('报名失败');
      }
    })
  }
</script>
</body>
</html>