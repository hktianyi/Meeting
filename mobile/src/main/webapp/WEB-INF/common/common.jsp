<%@ page pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setAttribute("FILE_DOMAIN", "http://effie.china-caa.org:81/");
%>
<meta charset="utf-8" />
<%--<title>${APP_NAME}</title>--%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta name="renderer" content="webkit">
<!-- 防止被转码 -->
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta content="IE=edge" http-equiv="x-ua-compatible">
<meta content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport">
<meta content="yes" name="apple-mobile-web-app-capable">
<meta content="yes" name="apple-touch-fullscreen">
<!-- Fonts -->
<%--<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css'>--%>
<!-- Icons -->
<%--<link href="http://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" media="all" rel="stylesheet" type="text/css">--%>
<!-- Styles -->
<link href="${_PATH}/static/css/local.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/css/keyframes.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/css/materialize.min.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/css/swiper.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/css/swipebox.min.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/css/style.css?${_VERSION}" rel="stylesheet" type="text/css">
<link href="${_PATH}/static/plugins/qtip2/jquery.qtip.min.css?${_VERSION}" rel="stylesheet" type="text/css">
<%--<link rel="shortcut icon" href="${_PATH}/favicon.ico" type="image/x-icon" />--%>
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
    .note.note-info {
        background-color: #f5f8fd;
        border-color: #8bb4e7;
        color: #010407;
    }
    .note {
        margin: 0 0 20px;
        padding: 15px 30px 15px 15px;
        border-left: 5px solid #eee;
        border-radius: 0 4px 4px 0;
    }
    .qtip-custom {
        background-color: lightblue;
        border: 1px solid lightblue;
    }
</style>
<script src="${_PATH}/static/plugins/jquery-2.2.2.min.js" type="text/javascript"></script>
<%--<script src="https://code.jquery.com/jquery-migrate-1.4.1.js" type="text/javascript"></script>--%>
<script type="text/javascript">
    var _PATH = '${_PATH}';
</script>