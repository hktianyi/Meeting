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
            <jsp:param name="title" value="会议详细"></jsp:param>
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
                    <!-- Form Inputs -->
                    <div class="form-inputs">
                        <div class="input-field animated fadeinright">
                            <input id="name" type="text" class="validate" name="name" value="">
                            <label class="active">姓名/Name:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <%--<input id="salutation" type="text" class="validate" name="salutation" value="">--%>
                                <h5 class="active">称谓/Salutation:</h5>
                            <select class="browser-default" name="salutation" id="salutation">
                                <option value="1" selected>先生/Mr</option>
                                <option value="2">女士/Ms.</option>
                            </select>
                            <%--<label class="active">称谓/Salutation:</label>--%>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="company" type="text" class="validate" name="company" value="">
                            <label class="active">公司/Company:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="title" type="text" class="validate" name="title" value="">
                            <label class="active">职位/Title:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="email" type="text" class="validate" name="email" value="">
                            <label class="active">邮箱/Email:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="mobile" type="text" class="validate" name="mobile" value="">
                            <label class="active">手机/Mobile:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <%--<input id="travelType" type="text" class="validate" name="travelType" value="">--%>
                            <%--<label class="active">证件类型/Type of Travel Document:</label>--%>
                                <h5 class="active">证件类型/Type of Travel Document:</h5>
                            <select class="browser-default" name="travelType" id="travelType">
                                <option value="1" selected>身份证</option>
                                <option value="2">护照</option>
                                <option value="3">台胞证</option>
                                <option value="4">台湾通行证</option>
                                <option value="5">港澳通行证</option>
                                <option value="6">香港身份证</option>
                            </select>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="travelName" type="text" class="validate" name="travelName" value="">
                            <label class="active">证件姓名/Name on Travel Document:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="travelNo" type="text" class="validate" name="travelNo" value="">
                            <label class="active">证件号码/Travel Document No.：</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="contactName" type="text" class="validate" name="contactName" value="">
                            <label class="active">联系人姓名/Contact Name:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="contactEmail" type="text" class="validate" name="contactEmail" value="">
                            <label class="active">联系人邮箱/Contact Email:</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="contactMobile" type="text" class="validate" name="contactMobile" value="">
                            <label class="active">联系人电话/Contact Mobile:</label>
                        </div>
                        <div style="padding: 20px 40px;">
                            <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:next();">下一步</a>
                        </div>
                    </div>
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
                        <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="${_PATH}/meetingcode/qrcodecheck">报名</a>
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
    function next() {
        $("#test3").click();
    }
</script>
</body>
</html>