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
    .unread {
        font-weight:bold;
        color: #333;
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
        <div class="animated fadeinup">
            <c:if test="${empty list}">
                <p>没有任何消息</p>
            </c:if>
            <c:if test="${not empty list}">
                <h6 class="p-10">我的信息</h6>
                <ul class="faq collapsible animated fadeinright delay-1" style="margin:0 0" data-collapsible="accordion">
                    <c:forEach var="item" items="${list}">
                        <li class="">
                            <div class="collapsible-header ${item.status eq 'VALID' ? 'unread' : ''}" data-id="${item.id}"><i class="ion-android-arrow-dropdown right"></i>${item.title} [<fmt:formatDate value="${item.createTime}" type="both"/>]</div>
                            <div class="collapsible-body" style="display: none;"><p>${item.content}</p></div>
                        </li>
                    </c:forEach>
                </ul>
            </c:if>
        </div>

    </div> <!-- End of Page Content -->

</div> <!-- End of Page Container -->

<%@include file="../../common/footer.jsp" %>
<script type="text/javascript">
    $(function () {
        $(document).on('click', '.collapsible .unread', function () {
            var _this = $(this);
            _this.removeClass('unread');
            $.post(_PATH + '/message/markRead/' + _this.data('id'));
        })
    });
</script>
</body>
</html>