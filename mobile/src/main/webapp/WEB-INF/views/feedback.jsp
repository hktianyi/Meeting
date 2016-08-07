<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
    <%@include file="../common/common.jsp" %>
    <style type="text/css">
        label.error {
            left: 150px;
            color: red;
        }
    </style>
</head>
<body>
<div class="m-scene" id="main">
    <jsp:include page="../common/menu.jsp"></jsp:include>
    <!-- Page Content -->
    <div id="content" class="page">
        <jsp:include page="../common/toolbar.jsp">
            <jsp:param name="title" value="活动反馈"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>
        <!-- Main Content -->
        <div class="animated fadeinup">

            <!-- Form Inputs -->
            <div class="form-inputs">
                <form action="${_PATH }/saveFeedback" method="post" id="saveFeedback">
                    <h4 class="center">活动反馈</h4>
                    <div>
                        <div class="input-field animated fadeinright">
                            <input id="comeType" name="comeType" type="text" class="validate">
                            <label for="comeType">来时交通工具类型</label>
                        </div>
                        <div class="input-field animated fadeinright delay-1">
                            <input id="comeTicket" name="comeTicket" type="text" class="validate">
                            <label for="comeTicket">来时航班/车次</label>
                        </div>
                    </div>
                    <div class="input-field animated fadeinright delay-2">
                        <input id="backType" name="backType" type="text">
                        <label for="backType">回时交通工具类型</label>
                    </div>
                    <div class="input-field animated fadeinright delay-3">
                        <input id="backTicket" name="backTicket" type="text" class="validate">
                        <label for="backTicket">回时航班/车次</label>
                    </div>
                    <div class="input-field animated fadeinright delay-4">
                        <input id="dinner" name="dinner" type="text" class="validate">
                        <label for="dinner">用餐</label>
                    </div>

                    <div class="input-field animated fadeinright delay-5">
                        <textarea class="materialize-textarea" id="activity" name="activity"></textarea>
                        <label for="activity">活动</label>
                    </div>
                    <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="javascript:submit();">提交</a>
                    <%--<input type="submit" class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-4" value="提交"/>--%>
                </form>
            </div>

        </div> <!-- End of Page Content -->

    </div> <!-- End of Page Container -->
</div>
<%@include file="../common/footer.jsp" %>
<script type="text/javascript">
    function submit() {
        $("#saveFeedback").submit();
    }
    var validate = $("#saveFeedback").validate({
        debug: true, //调试模式取消submit的默认提交功能
        //errorClass: "label.error", //默认为错误的样式类为：error
        focusInvalid: true, //当为false时，验证无效时，没有焦点响应
        onkeyup: true,
        submitHandler: function (form) {   //表单提交句柄,为一回调函数，带一个参数：form
            alert("提交表单");
            form.submit();   //提交表单
        },

        rules: {
            comeType: {
                required: true,
                maxlength: 50
            },
            comeTicket: {
                required: true,
                maxlength: 50
            },
            backType: {
                required: true,
                maxlength: 50
            },
            backTicket: {
                required: true,
                maxlength: 50
            },
            dinner: {
                required: true,
                maxlength: 50
            },
            activity: {
                required: true,
                maxlength: 200
            }
        },
        messages: {
            comeType: {
                required: "不能为空",
                maxlength: "不能大于50个字符"
            },
            comeTicket: {
                required: "不能为空",
                maxlength: "不能大于50个字符"
            },
            backType: {
                required: "不能为空",
                maxlength: "不能大于50个字符"
            },
            backTicket: {
                required: "不能为空",
                maxlength: "不能大于50个字符"
            },
            dinner: {
                required: "不能为空",
                maxlength: "不能大于50个字符"
            },
            activity: {
                required: "不能为空",
                maxlength: "不能大于200个字符"
            }
        }
    });

</script>
</body>
</html>