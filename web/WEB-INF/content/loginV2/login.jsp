    <%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
response.setHeader("Pragma","No-cache"); 
response.setHeader("Cache-Control","no-cache"); 
response.setDateHeader("Expires", 0); 
response.flushBuffer();
SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy年MM月dd日");
String date = dateFormater.format(new Date());
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统登录</title>
<link href="${pageContext.request.contextPath}/resource/loginV2/css/login.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<link href="${pageContext.request.contextPath}/resource/loginV2/css/demo.css" rel="stylesheet" rev="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/loginV2/js/jquery1.42.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/loginV2/js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resource/loginV2/js/Validform_v5.3.2_min.js"></script>

<script src="${pageContext.request.contextPath}/js/login/common.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/supersized.3.2.7.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/login/jquery.validate.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog.js" type="text/javascript"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog-util.js" type="text/javascript"></script>
	
<script>
$(function(){

$(".i-text").focus(function(){
$(this).addClass('h-light');
});

$(".i-text").focusout(function(){
$(this).removeClass('h-light');
});

$("#username").focus(function(){
 var username = $(this).val();
 if(username=='输入账号'){
 $(this).val('');
 }
});

$("#username").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入账号');
 }
});


$("#password").focus(function(){
 var username = $(this).val();
 if(username=='输入密码'){
 $(this).val('');
 }
});


$("#yzm").focus(function(){
 var username = $(this).val();
 if(username=='输入验证码'){
 $(this).val('');
 }
});

$("#yzm").focusout(function(){
 var username = $(this).val();
 if(username==''){
 $(this).val('输入验证码');
 }
});


/* 
$(".registerform").Validform({
	tiptype:function(msg,o,cssctl){
		var objtip=$(".error-box");
		cssctl(objtip,o.type);
		objtip.text(msg);
	},
	ajaxPost:true
}); */
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
</head>
<body>
<div class="header">
  <h1 class="headerLogo"><a title="通信仿真模拟系统" target="_blank" href="#"><img alt="logo" src="${pageContext.request.contextPath}/resource/loginV2/images/ic_logo_head.gif"></a></h1>
	<div class="headerNav">
		<h4><%=date%>
	</div>
</div>

<div class="banner">

<div class="login-aside">
  <div id="o-box-up"></div>
  <div id="o-box-down"  style="table-layout:fixed;">
   <div class="error-box"></div>
   
   <form id="login-form" class="registerform" action="login" method="post" >
   <div class="fm-item">
	   <label for="logonId" class="form-label">系统登陆：</label>
	   <input type="text" value="" placeholder="用户名" maxlength="100" name="userName" id="user-name" class="i-text"  datatype="s4-18" errormsg="用户名至少6个字符,最多18个字符！"  >    
       <div class="ui-form-explain"></div>
  </div>
  
  <div class="fm-item">
	   <label for="logonId" class="form-label">登陆密码：</label>
	   <input type="password" value="" placeholder="密码" name="password" maxlength="100" id="pass-word" class="i-text" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！">    
       <div class="ui-form-explain"></div>
  </div>
  
<!--  <div class="fm-item pos-r">
	   <label for="logonId" class="form-label">验证码</label>
	   <input type="text" value="输入验证码" maxlength="100" id="yzm" class="i-text yzm" nullmsg="请输入验证码！" >    
       <div class="ui-form-explain"><img src="images/yzm.jpg" class="yzm-img" /></div>
  </div>-->
  
  <div class="fm-item">
	   <label for="logonId" class="form-label"></label>
	   <input type="submit" value="" tabindex="4" id="send-btn" class="btn-login"> 
       <div class="ui-form-explain"></div>
  </div>
  
  </form>
  
  </div>

</div>

	<div class="bd">
		<ul>
			<li style="background:url(<%=basePath%>/resource/loginV2/images/ic_slide_1.jpg) #CCE1F3 center 0 no-repeat;"></li>
			<li style="background:url(<%=basePath%>/resource/loginV2/images/ic_slide_2.png) #BCE0FF center 0 no-repeat;"></li>
		</ul>
	</div>

	<div class="hd"><ul></ul></div>
</div>
<script type="text/javascript">jQuery(".banner").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });</script>


<div class="banner-shadow"></div>

<div class="footer">
   <p> 版权所有    Copyright 2016-2017  Corporation, All Rights Reserved</p>
</div>

<div style="text-align:center;">

</div>
</body>
</html>