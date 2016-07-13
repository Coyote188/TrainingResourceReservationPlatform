<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<jsp:include page="./include/common-header.jsp"></jsp:include>
<%
  SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy");
  String year = dateFormater.format(new Date());
%>
<link href="${pageContext.request.contextPath}/css/login.css"
	rel="stylesheet" />
<script type="text/javascript">
$(document).ready(function(){
        var msg = '${msg}';
        if(msg != '') {
           showMsg(msg+"！");
        }
   
   clickImgCode();
   listenerFocus();

	$("#login-form").submit(function(){
		var userName = $("#user-name").val();
		var password = $("#pass-word").val();
		var code = $("#code").val();
		if(trim(userName)=='') {
			showMsg("请输入用户名！");
			$("#user-name").focus();
			return false;
		} else if(trim(password) == '') {
			showMsg("请输入密码！");
			$("#pass-word").focus();
			return false;
		} else if(trim(code) == '') {
			showMsg("请输入验证码！");
			$("#code").focus();
			return false;
		}
		waitLoading("正在登录...");
		return true;
	});
});

function clickImgCode() {
	  $("#imgCode").click(function(){
		  var num = parseInt(Math.random()*10000);
		  $(this).attr("src","captcha?num="+num);
	  });
}

function listenerFocus() {
	$("input[type=text],input[type=password]").focus(function(){
		$(".prompt-error").html("");
		var tag = $(this).attr("id");
		if(tag == 'code') {
			$(this).removeClass("input-text-code");
			$(this).addClass("input-text-code-focus ");
		} else {
			$(this).removeClass("input-text");
			$(this).addClass("input-text-focus");
		}
	}).blur(function(){
		var tag = $(this).attr("id");
		if(tag == 'code') {
			$(this).removeClass("input-text-code-focus");
			$(this).addClass("input-text-code");
		} else {
			$(this).removeClass("input-text-focus");
			$(this).addClass("input-text");
		}
	});
}
</script>
<body>
	<div class="full-header">
		<div class="navbar navbar-default navbar-static-top m-b-0"
			role="navigation">
			<div class="navbar-header">
				<strong><a class="logo navbar-brand" href="index"></a></strong>
			</div>
			<div class="navbar-collapse collapse">
				<div class="nav navbar-nav navbar-left p-t-10">
					<!--  <h4>${projectName }</h4> -->
					<h2 class="m-t-0">
						<strong>XXX部队通信仿真训练平台</strong>
					</h2>
				</div>
			</div>
		</div>
		<!-- navbar-default -->
	</div>
	<div class="wrap">
		<div class="login">
			<div class="login-row">
				<div class="container">
					<div class="row">
						<div class="col-md-7">
							<div class="text-right">
								<%-- <img alt="" src="${pageContext.request.contextPath}/images/main.png" /> --%>
							</div>
						</div>
						<div class="col-md-5">
							<div class="login-main">
								<div class="login-main-top"></div>
								<div class="login-main-wrap">
									<div class="login-main-content">
										<div class="login-title"></div>
										<div class="login-content">
											<form action="login" method="post" id="login-form">
												<div class="login-label">用户名：</div>
												<div class="login-input">
													<input type="text" id="user-name" class="input-text"
														name="userName" value="${userName }" />
												</div>
												<div class="login-label">密&nbsp;&nbsp;码：</div>
												<div class="login-input">
													<input type="password" id="pass-word" name="password"
														class="input-text" value="${password }">
												</div>
												<!--  
												<div class="login-label">验证码：</div>
												<div class="login-input">
													<input type="text" id="code" name="code"
														class="input-text-code" value="${code }"> <img
														alt="验证码" title="看不清，请点击刷新" id="imgCode" src="captcha" />
												</div>
												-->
												<div class="prompt-error p-t-5 p-l-20">${msg }</div>
												<div class="p-t-15 text-center">
													<input type="submit" class="login-btn" value="登录" />
													<!--  &nbsp;&nbsp;&nbsp;&nbsp;
											     <input type="button" class="login-btn reg" value="注册" />-->
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- row -->
				</div>
				<!-- container -->
			</div>
			<!-- login-row -->
		</div>
	</div>
	<!-- wrap -->

</body>
</html>