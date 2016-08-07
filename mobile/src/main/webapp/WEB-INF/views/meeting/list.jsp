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
        <jsp:include page="../../common/toolbar.jsp">
            <jsp:param name="title" value="活动列表"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup">

            <div class="news-main animated fadein delay-1">
                <img alt="" src="../static/img/2.jpg">
                <a href="article.html">
                    <div class="opacity-overlay-black">
                    </div>
                </a>

                <div class="top-news animated fadeinright delay-1">
                    <h4 class="top-news-title">
                        <a href="article.html">A wonderful serenity has taken possession of me</a>
                    </h4>
                    <span class="top-news-channel">CNN - 10 min ago</span> <span class="top-news-category">SCIENCE</span>
                    <div class="clr">
                    </div>
                </div>
            </div>

            <div>
                <div class="single-news animated fadeinright delay-2">
                    <h4 class="single-news-title">
                        <a href="article.html">That I neglect my talents</a>
                    </h4>
                    <span class="single-news-channel">technet.com - 1 min ago</span> <span class="single-news-category">TECH</span>
                    <div class="clr">
                    </div>
                </div>

                <div class="single-news animated fadeinright delay-3">
                    <h4 class="single-news-title">
                        <a href="article.html">Feeling the charm of existence</a>
                    </h4>
                    <span class="single-news-channel">cooking.com - 3h ago</span> <span class="single-news-category">RECIPE</span>
                    <div class="clr">
                    </div>
                </div>

                <div class="single-news animated fadeinright delay-4">
                    <h4 class="single-news-title">
                        <a href="article.html">So absorbed in the exquisite sense</a>
                    </h4>
                    <span class="single-news-channel">theearth.com - 7h ago</span> <span class="single-news-category">ENVIROMENT</span>
                    <div class="clr">
                    </div>
                </div>

                <div class="single-news animated fadeinright delay-5">
                    <h4 class="single-news-title">
                        <a href="article.html">I am so happy my dear friend</a>
                    </h4>
                    <span class="single-news-channel">topgym.com - Yesterday</span> <span class="single-news-category">FITNESS</span>
                    <div class="clr">
                    </div>
                </div>

                <div class="single-news animated fadeinright delay-6">
                    <h4 class="single-news-title">
                        <a href="article.html">The bliss of souls like mine</a>
                    </h4>
                    <span class="single-news-channel">fitness.com - Yesterday</span> <span class="single-news-category">BEAUTY</span>
                    <div class="clr">
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