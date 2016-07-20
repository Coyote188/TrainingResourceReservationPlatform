<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
%>

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
	<link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet" type="text/css">
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
	
	<script src="${pageContext.request.contextPath}/js/login/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/supersized.3.2.7.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/jquery.validate.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
        var msg = '${msg}';
        if(msg != '') {
           showMsg(msg+"！");
        }
	$("#login-form").submit(function(){
		var userName = $("#user-name").val();
		var password = $("#pass-word").val();
		if(trim(userName)=='') {
			showMsg("请输入用户名！");
			$("#user-name").focus();
			return false;
		} else if(trim(password) == '') {
			showMsg("请输入密码！");
			$("#pass-word").focus();
			return false;
		}
		waitLoading("正在登录...");
		return true;
	});
});
jQuery(function($){
    $.supersized({
        // 功能
        slide_interval     : 4000,    // 转换之间的长度
        transition         : 1,    // 0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马
        transition_speed   : 1000,    // 转型速度
        performance        : 1,    // 0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）
        min_width          : 0,    // 最小允许宽度（以像素为单位）
        min_height         : 0,    // 最小允许高度（以像素为单位）
        vertical_center    : 1,    // 垂直居中背景
        horizontal_center  : 1,    // 水平中心的背景
        fit_always         : 0,    // 图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸）
        fit_portrait       : 1,    // 纵向图像将不超过浏览器高度
        fit_landscape      : 0,    // 景观的图像将不超过宽度的浏览器
        slide_links        : 'blank',    // 个别环节为每张幻灯片（选项：假的，'民'，'名'，'空'）
        slides             : [    // 幻灯片影像
                                 {image : './images/1.jpg'},{image : './images/2.jpg'},{image : './images/3.jpg'},
                                 {image : './images/4.jpg'},{image : './images/5.jpg'},{image : './images/6.jpg'},
                                 {image : './images/7.jpg'},{image : './images/8.jpg'},{image : './images/9.jpg'}
                       ]
    });
});
</script>
<body>
	<div class="full-header" style="height: 150px; width: 100%;">
	</div>
	<h1>
		<strong>丽江贵峰机动车驾驶人科目二训练考试服务平台</strong>
	</h1>
	<div class="login-container">
		<div class="login-container-background">
			<form action="login" method="post" id="login-form" novalidate="novalidate">
				<div>
					<input type="text" name="userName" class="username" placeholder="用户名" autocomplete="off" id="user-name" value="${userName }" />
				</div>
				<div>
					<input type="password" name="password" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" id="pass-word" value="${password }">
				</div>
				<button id="submit" type="submit">登 陆</button>
			</form>
		</div>
	</div>
	<div id="alert-msg" class="register-tis" style="display: none;"></div>
	<div id="wait-msg" class="register-tis msg-body" style="display: none;">系统正在登...</div>
</body>
</html>