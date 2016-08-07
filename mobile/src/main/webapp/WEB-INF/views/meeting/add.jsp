<%@ page pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<!--[if IE 8]> <html class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
<!--<![endif]-->
<head>
    <%@include file="../../common/common.jsp" %>
    <style type="text/css">
   /*     .input-field{margin-top: 2rem;}*/
        .input-field label{left: 0rem; top: 1.2rem; font-size: 1.2rem;}
        .input-field label.active{font-size: 1.2rem;}
        .input-field input{text-indent: 10px;}
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
        <jsp:include page="../../common/toolbar.jsp"></jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div>
                <div class="p-t-20">
                    <ul class="tabs">
                        <li class="tab"><a class="active" href="#test1">活动信息</a></li>
                        <li class="tab"><a href="#test2">活动日程</a></li>
                    </ul>
                </div>

                <div id="test1">
                    <!-- Form Inputs -->
                    <form id="form" method="post" action="${_PATH}/meeting/add">
                    <div class="form-inputs">
                        <div class="input-field animated fadeinright">
                            <input id="name"  name="name" type="text" class="validate">
                            <label for="name">活动名称</label>
                        </div>
                        <div class="input-field animated fadeinright">
                            <input id="address" name="address" type="text" class="validate">
                            <label for="address">活动地址</label>
                        </div>
                        <div class="input-field animated fadeinright delay-1">
                            <input id="startTime" name="startTime" type="text" class="validate">
                            <label for="startTime">活动开始时间</label>
                        </div>
                        <div class="input-field animated fadeinright delay-2">
                            <input id="endTime" name="endTime" type="text">
                            <label for="endTime">活动结束时间</label>
                        </div>
                        <div class="input-field animated fadeinright delay-4">
                            <input id="meetingType" name="meetingType" type="text" class="validate">
                            <label for="meetingType">活动类型</label>
                        </div>
                        <div class="input-field animated fadeinright delay-4">
                            <input id="free" name="free" type="text" class="validate">
                            <label for="free">活动费用</label>
                        </div>
                        <div class="input-field animated fadeinright delay-5">
                            <textarea class="materialize-textarea" id="introduction" name="introduction"></textarea>
                            <label for="introduction">活动简介</label>
                        </div>
                        <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6"
                           href="javascript:submit();">
                            提交
                        </a>

                    </div>
                  </form>
                </div>

                <div id="test2">
                    <div class="container activity p-l-r-20">
                        <div class="row m-l-0">
                            <div class="col">

                                <div class="contact">
                                    <span class="date">4 - 5 pm</span>
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        37 New friends
                                    </p>
                                    <div class="friends">
                                        <img alt="" class="circle" src="../static/img/user3.jpg">
                                        <img alt="" class="circle" src="../static/img/user4.jpg">
                                        <img alt="" class="circle" src="../static/img/user.jpg">
                                    </div>
                                </div>

                                <div class="contact">
                                    <span class="date">1 - 2 pm</span>
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        Jake Soul
                                    </p>
                                    <span>A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</span>
                                </div>

                                <div class="contact">
                                    <img alt="" src="../static/img/user.jpg">
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        Robert Green
                                    </p>
                                    <span>7 New notifications</span>
                                </div>

                                <div class="contact">
                                    <span class="date">4 - 8 am</span>
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        Camilla Oller
                                    </p>
                                    <span>One morning, when Gregor Samsa woke from troubled dreams, he found himself transformed in his bed into a horrible vermin.</span>
                                </div>

                                <div class="contact">
                                    <span class="date">2 - 3 am</span>
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        Added 3 new photos.
                                    </p>
                                    <div class="friends">
                                        <img alt="" class="circle" src="../static/img/user4.jpg">
                                        <img alt="" class="circle" src="../static/img/user2.jpg">
                                        <img alt="" class="circle" src="../static/img/user3.jpg">
                                    </div>
                                </div>

                                <div class="contact">
                                    <span class="date">1 - 2 pm</span>
                                    <div class="dot z-depth-1">
                                    </div>
                                    <p>
                                        Mike Lee <i class="ion-android-attach"></i>
                                    </p>
                                    <span>Sent you an attachment.</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Footer -->
            <jsp:include page="../../common/pageFooter.jsp"></jsp:include>

        </div> <!-- End of Main Contents -->

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<%--<script type="text/javascript" src="${_PATH}/static/plugins/custom/meeting.js"></script>--%>
<script type="text/javascript">
    function submit(){
        $("#form").submit();
    }
    validate();
    var lableMap = {};
    function validate(){
        var validate = $("#form").validate({
            debug: true,
            submitHandler: function (form) {
                form.submit();
            },
            errorPlacement: function (error, element) {
                var next = element.next(1);
                if(!lableMap[ $(element).attr("name")])
                    lableMap[ $(element).attr("name")] = next.html();

                next.html(error[0].innerText);
            },
            success: function (element) {
                var next = element.next(1);
               // console.log($(element).attr("name"));
                next.html('');
            },
            focusInvalid: false, //当为false时，验证无效时，没有焦点响应
            onkeyup: true,
            rules: {
                name: {required: true, rangelength: [6, 20]},
                address:{required: true, rangelength: [6, 64]},
                startTime:{required: true},
                endTime:{required: true},
                meetingType:{required: true},
                free:{required: true},
                introduction:{required: true}
            },
            messages: {
                name: {required: "请输入名称", rangelength: $.validator.format("请输入{0}到{1}位字符串")},
                address:{required: "请输入地址", rangelength: $.validator.format("请输入{0}到{1}位字符串")},
                startTime:{required: "开始时间不能为空",},
                endTime:{required: "结束时间不能为空",},
                meetingType:{required: "请选择会议类型",},
                free:{required: "请输入费用",},
                introduction:{required: "请输入会议简介",}
            }
        });
    }

</script>
</body>
</html>