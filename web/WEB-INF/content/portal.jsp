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
	<meta http-equiv="description">
	<link href="${pageContext.request.contextPath}/css/loginStyle.css" rel="stylesheet" type="text/css">
	
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
</script>
<body>
<div id="bodyLoginFom">
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
				<button id="cancel" onclick="$.closeWindow();" style="background-color: #ff7744">取消</button>
			</form>
		</div>
	</div>
	<div id="alert-msg" class="register-tis" style="display: none;"></div>
	<div id="wait-msg" class="register-tis msg-body" style="display: none;">系统正在登...</div>
</div>
</body>
</html>