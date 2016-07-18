<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/idx/validate.js" charset="utf-8" type="text/javascript"></script>
<style type="text/css">
.is_nessesary {
	color: #ff0000;
	font-weight: bold;
}

.is_text {
	border: #cfd8e1 1px solid;
	background-color: #fff;
	width: 320px;
	height: 18px;
	line-height: 18px;
	vertical-align: middle
}

.is_upload {
	border: #cfd8e1 1px solid;
	width: 388px;
}

.is_textarea {
	border: #cfd8e1 1px solid;
	background-color: #fff;
	width: 320px;
	height: 90px
}

.is_btn {
	line-height: 16px
}

.is_success {
	margin: 0 auto;
	font: 14px Arial, Helvetica, sans-serif;
	color: #090 !important;
	padding: 10px 10px 10px 45px;
	width: 90%;
	background: url(/sitefiles/services/cms/images/success.gif) no-repeat
		left center;
	text-align: left;
	line-height: 160%;
	font-weight: bold;
}

.is_failure {
	margin: 0 auto;
	font: 14px Arial, Helvetica, sans-serif;
	color: #CC0000 !important;
	padding: 10px 10px 10px 45px;
	width: 90%;
	background: url(/sitefiles/services/cms/images/failure.gif) no-repeat
		left center;
	text-align: left;
	line-height: 160%;
	font-weight: bold;
}
</style>
<script type="text/javascript">
$.extend({
	fnOnRegistInfoSubmit: function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/regist?' + $("#frmContent_2").serialize(),
			dataType:'json',
			type:"post",
			success: function(doc) {
				var res = $.parseJSON(eval(doc).output).result;
				if(res == "1"){
					alert("注册成功，请登录！");
					window.location.href = "portals";
				}else{
					alert($.parseJSON(eval(doc).output).msg);
				}
				
			}
		});
	},
	fnOnGenCaptcha: function(){
		$("#validateCode_Img").click(function(){
			var num = parseInt(Math.random()*10000);
			$(this).attr("src","${pageContext.request.contextPath}/captcha?num="+num);
		});
	},
	fnOnLoginLoad: function(){
		 window.parent.location.reload();
	}
});
$(function(){
	$.fnOnGenCaptcha();
	$("#validateCode_Img").attr("src","${pageContext.request.contextPath}/captcha");
});
</script>
</head>
<body>
<div id="MainArea">
<div id="MainAreaRight">
<div class="SignUpTitle">会员注册</div>
<div class="SignUpContent">
	<div id="contentContainer_2">
		<form target="loadContent_2" accept-charset="utf-8" action="${pageContext.request.contextPath}/regist" enctype="multipart/form-data" method="post" id="frmContent_2">
		
		<table id="frmRegInfomation" width="98%" cellspacing="2" cellpadding="4" border="0">
			<tbody>
				<tr>
					<td width="70" valign="top"><nobr>驾考类型:</nobr></td>
					<td>
						<select errormessage="" regexp="" validatetype="None" maxnum="0" minnum="0" isrequire="true" displayname="班型"  isvalidate="true" class="select" name="Title" id="Title">
							<option value="C1">C1小型汽车</option>
							<option value="C2">C2小型自动档汽车</option>
							<option value="B1">B1中型客车</option>
							<option value="B2">B2大型货车</option>
							<option value="A1">A1大型客车</option>
							<option value="A2">A2大型牵引车</option>
						</select>&nbsp;
						<span style="color: red; display: none;" id="Title_msg">*</span>
						<script>
							event_observe('Title', 'blur', checkAttributeValue);
						</script>
						<span class="is_nessesary">*</span></td>
				</tr>
				<tr>
					<td width="70" valign="top"><nobr>姓名:</nobr></td>
					<td>
						<input type="text" errormessage="为便于领取稿费，姓名不能为空。" regexp="" validatetype="None" maxnum="0" minnum="0" isrequire="true" displayname="姓名" isvalidate="true"
						style="width: 200px;" value="" class="input_text" name="Author" id="Author">
						&nbsp;
						<span style="color: red; display: none;" id="Author_msg">*</span>
						<script> event_observe('Author', 'blur', checkAttributeValue);</script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				<tr>
					<td width="70" valign="top"><nobr>证件类型:</nobr></td>
					<td>
						<select errormessage="" regexp="" validatetype="None" maxnum="0" minnum="0" isrequire="true" displayname="证件类型" isvalidate="true" class="select" name="SubTitle" id="SubTitle">
							<option value="身份证">身份证</option>
							<option value="护照">护照</option>
							<option value="军官证">军官证</option>
							<option value="警官证">警官证</option>
							<option value="其他">其他</option>
						</select>
						&nbsp;
						<span style="color: red; display: none;" id="SubTitle_msg">*</span>
						<script>
							event_observe('SubTitle', 'blur', checkAttributeValue);
						</script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				<tr>
					<td width="70" valign="top"><nobr>证件号码:</nobr></td>
					<td>
						<input type="text" errormessage="证件号码为必填项" regexp="" validatetype="None" 
							maxnum="0" minnum="0" isrequire="true" displayname="证件号码" isvalidate="true" style="width: 200px;"
							value="" class="input_text" name="Summary" id="Summary">&nbsp;
						<span style="color: red; display: none;" id="Summary_msg">*</span>
						<script>event_observe('Summary', 'blur', checkAttributeValue);</script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				<tr>
					<td width="70" valign="top"><nobr>手机号码:</nobr></td>
					<td>
						<input type="text" errormessage="手机号码为必填项" regexp="" validatetype="Mobile" maxnum="0" minnum="0" isrequire="true"
						displayname="手机" isvalidate="true" style="width: 200px;" value="" class="input_text" name="mobil_no" id="mobil_no">&nbsp;
						<span style="color: red; display: none;" id="mobil_no_msg">*</span>
						<script>event_observe('mobil_no', 'blur', checkAttributeValue); </script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				
				<tr>
					<td width="70" valign="top"><nobr>用户名:</nobr></td>
					<td>
						<input type="text" errormessage="用户名由 3-10位的字母下划线和数字组成，且以字母开头" regexp="" validatetype="Username" maxnum="0" minnum="0" isrequire="true"
							displayname="用户名" isvalidate="true" style="width: 200px;" value="" class="input_text" name="username" id="username">
						&nbsp;
						<span style="color: red; display: none;" id="username_msg">*</span>
						<script>event_observe('username', 'blur', checkAttributeValue); </script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				<tr>
					<td width="70" valign="top"><nobr>密码:</nobr></td>
					<td>
						<input type="password" errormessage="密码长度必需在6-22位的字母、数字特殊符号等" regexp="" validatetype="Password" maxnum="0" minnum="0" isrequire="true"
							displayname="密码" isvalidate="true" style="width: 200px;" value="" class="input_text" name="Password" id="Password">
						&nbsp;
						<span style="color: red; display: none;" id="Password_msg">*</span>
						<script>event_observe('Password', 'blur', checkAttributeValue); </script>
						<span class="is_nessesary">*</span>
					</td>
				</tr>
				<tr>
					<td height="30">验证码:</td>
					<td>
						<input type="text" errormessage="" regexp="" validatetype="None" maxnum="4" minnum="4" 
							isrequire="true" displayname="验证码" isvalidate="true" name="validateCode"
							class="input_text" id="validateCode" style="width: 50px;" value="">
						&nbsp;
						<img border="0" align="absmiddle" style="cursor: pointer;" id="validateCode_Img" src="captcha">
						&nbsp;
						<span style="color: red; display: none;" id="validateCode_msg">*</span>
						<script>event_observe('validateCode', 'blur', checkAttributeValue);</script>
					</td>
				</tr>
				<tr height="30">
					<td>&nbsp;</td>
					<td>
						<input type="button" name="submit_2" value=" 提 交 " onclick="if (checkFormValueById('frmContent_2')){$.fnOnRegistInfoSubmit();}" id="submit_2">
						<!-- 
						<input type="button" name="submit_2" value=" 提 交 " onclick="if (checkFormValueById('frmContent_2')){document.getElementById('frmContent_2').submit();window.close();}" id="submit_2">
						 -->
						&nbsp;&nbsp;&nbsp;
						<input type="reset" value=" 重 置 " onclick="">
						&nbsp;&nbsp;[Ctrl+Enter] （带<span class="is_nessesary">*</span>的为必填项）
					</td>
				</tr>
			</tbody>
		</table>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>