<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>${title }</title>
    <meta http-equiv="content-type" content="text/html;charset=UTF-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="">
    <meta name="author" content="">   
	<meta http-equiv="keywords" content="部队考试">
	<meta http-equiv="description">
	<link href="${pageContext.request.contextPath}/css/jquery-ui-1.8.21.custom.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/chinaccs.ui.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/bootstrap-dialog.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/bootstrap-rewrite.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/layout.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/js/video-js/video-js.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/button.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/js/upload/ajaxfileupload.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/index/learningRec.css" rel="stylesheet" type="text/css">
	
	<script src="${pageContext.request.contextPath}/js/video-js/video.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog-util.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery-ui-1.10.4.custom.min.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/check-card-no.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/utils.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/upload/ajaxfileupload.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/chinaccs.ui.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/layout.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.ui.datepicker-zh-CN.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/highcharts/highcharts.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/ToolsObject.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/cache.js" type="text/javascript"></script>
	<!--[if lt IE 9]>
    <script src="${pageContext.request.contextPath}/js/bootstrap/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap/respond.min.js"></script>
  <![endif]-->
  
  <!--[if lte IE 6]>
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap-ie6.css">
	  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ie.css">
      <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-ie.js"></script>
  <![endif]-->
  </head>
