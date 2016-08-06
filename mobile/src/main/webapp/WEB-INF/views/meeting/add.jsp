<%@ page pageEncoding="UTF-8" language="java" %>
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
                    <div class="form-inputs">
                        <div>
                            <div class="input-field animated fadeinright">
                                <input id="first_name" type="text" class="validate">
                                <label for="first_name">First Name</label>
                            </div>
                            <div class="input-field animated fadeinright delay-1">
                                <input id="last_name" type="text" class="validate">
                                <label for="last_name">Last Name</label>
                            </div>
                        </div>
                        <div class="input-field animated fadeinright delay-2">
                            <input id="email" type="email">
                            <label for="email">Email</label>
                        </div>
                        <div class="input-field animated fadeinright delay-3">
                            <input id="telephone" type="text" class="validate">
                            <label for="telephone">Telephone</label>
                        </div>
                        <div class="input-field animated fadeinright delay-4">
                            <input id="city" type="text" class="validate">
                            <label for="city">City</label>
                        </div>

                        <div class="input-field animated fadeinright delay-5">
                            <textarea class="materialize-textarea" id="textarea1"></textarea>
                            <label for="textarea1">Write your message here</label>
                        </div>

                        <p class="remember animated bouncein delay-6">
                            <input type="checkbox" id="test5" />
                            <label for="test5">This is an awesome checkbox</label>
                        </p>

                        <a class="waves-effect waves-light btn-large primary-color width-100 animated bouncein delay-6" href="index.html">Send</a>
                    </div>
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
</body>
</html>