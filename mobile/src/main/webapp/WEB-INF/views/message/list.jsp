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
<style>
    .loading {
        color:#303030;
        font-size:20px;
        padding:5px 10px;
        text-align:center;
        width:450px;
        margin:0px auto;
        display:none;
        border-radius: 5px;
    }
</style>
<body>
<div class="m-scene" id="main"> <!-- Main Container -->

    <!-- Sidebars -->
    <jsp:include page="../../common/menu.jsp"></jsp:include>
    <!-- End of Sidebars -->

    <!-- Page Content -->
    <div id="content" class="page">

        <!-- Toolbar -->
        <jsp:include page="../../common/toolbar.jsp">
            <jsp:param name="title" value="信息"></jsp:param>
            <jsp:param name="isCommnoBanner" value="0"></jsp:param>
        </jsp:include>

        <!-- Main Content -->
        <div class="animated fadeinup" id="tt">

        </div> <!-- End of Main Contents -->
        <div class="loading" id="loading">加载中……</div>
        <div class="loading" id="nomoreresults">加载完毕！</div>

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<script>
    var page = 1;
    $(function(){
        $('#tt').scrollPagination({
            'contentPage': '${_PATH}/message/list',
            'contentData': {pageNo:page,pageSize:10},
            'scrollTarget': $(window),
            'heightOffset': 10,
            'beforeLoad': function(){
                console.log(page)
                page = page+1;
                $('#loading').fadeIn();
            },
            'afterLoad': function(elementsLoaded){
                $('#loading').fadeOut();
                var i = 0;
                $(elementsLoaded).fadeInWithDelay();
                if ($('#tt').children().size() > 100){
                    $('#nomoreresults').fadeIn();
                    $('#tt').stopScrollPagination();
                }
            }
        });

        // code for fade in element by element
        $.fn.fadeInWithDelay = function(){
            var delay = 0;
            return this.each(function(){
                $(this).delay(delay).animate({opacity:1}, 200);
                delay += 100;
            });
        };

    });
</script>
</body>
</html>