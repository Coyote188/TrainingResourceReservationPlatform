<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://www.yicjx.com/favicon.ico"></link>
<link rel="stylesheet" type="text/css" href="global.css"></link>
<script type="text/javascript" src="jquery-1.js"></script>
<script src="lxb.js" charset="utf-8"></script>
<script src="hm.js"></script>
<script type="text/javascript" src="api.js"></script>
<script type="text/javascript" src="getscript.js"></script>
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
function stlContentCallback_2(jsonString){
	var obj = eval('(' + jsonString + ')');
	if (obj){
		document.getElementById('contentSuccess_2').style.display = 'none';
		document.getElementById('contentFailure_2').style.display = 'none';
		if (obj.isSuccess == 'false'){
			document.getElementById('contentFailure_2').style.display = '';
			document.getElementById('contentFailure_2').innerHTML = obj.message;
		}else{
			document.getElementById('contentSuccess_2').style.display = '';
			document.getElementById('contentSuccess_2').innerHTML = obj.message;
			document.getElementById('contentContainer_2').style.display = 'none';
		}
	}
}
</script>
<script src="/sitefiles/bairong/scripts/independent/validate.js" charset="utf-8" type="text/javascript"></script>
</head>
<body>
<div id="MainArea">
<div id="MainAreaRight">
<div class="SignUpTitle">会员注册</div>
<div class="SignUpContent">

<div style="display:none" class="is_success" id="contentSuccess_2"></div>
<div style="display:none" class="is_failure" id="contentFailure_2"></div>
<div id="contentContainer_2">
<form target="loadContent_2" accept-charset="utf-8" action="/sitefiles/services/cms/action.aspx?publishmentSystemID=1&amp;styleID=2&amp;type=content&amp;channelID=63" enctype="multipart/form-data" method="post" id="frmContent_2">

<table width="98%" cellspacing="2" cellpadding="4" border="0">
	<tbody>
		<tr>
			<td width="70" valign="top"><nobr>车型:</nobr></td>
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
				</select>&nbsp;
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
				displayname="手机" isvalidate="true" style="width: 200px;" value="" class="input_text" name="Source" id="Source">&nbsp;
				<span style="color: red; display: none;" id="Source_msg">*</span>
				<script>event_observe('Source', 'blur', checkAttributeValue); </script>
				<span class="is_nessesary">*</span>
			</td>
		</tr>
		
		<tr>
			<td width="70" valign="top"><nobr>用户名:</nobr></td>
			<td>
				<input type="text" errormessage="用户名必填" regexp="" validatetype="username" maxnum="0" minnum="0" isrequire="true"
				displayname="用户名" isvalidate="true" style="width: 200px;" value="" class="input_text" name="Source" id="Source">&nbsp;
				<span style="color: red; display: none;" id="Source_msg">*</span>
				<script>event_observe('Source', 'blur', checkAttributeValue); </script>
				<span class="is_nessesary">*</span>
			</td>
		</tr>
		<tr>
			<td width="70" valign="top"><nobr>密码:</nobr></td>
			<td>
				<input type="password" errormessage="密码不能为空" regexp="" validatetype="Mobile" maxnum="0" minnum="0" isrequire="true"
				displayname="密码" isvalidate="true" style="width: 200px;" value="" class="input_text" name="Source" id="Source">&nbsp;
				<span style="color: red; display: none;" id="Source_msg">*</span>
				<script>event_observe('Source', 'blur', checkAttributeValue); </script>
				<span class="is_nessesary">*</span>
			</td>
		</tr>
		
		<tr>
			<td width="70" valign="top"><nobr>备注:</nobr></td>
			<td>
				<textarea style="width: 90%; height: 80px;" class="textarea" name="Content" id="Content"></textarea>
			</td>
		</tr>
		<tr>
			<td height="30">验证码:</td>
			<td><input type="text" errormessage="" regexp=""
				validatetype="None" maxnum="4" minnum="4" isrequire="true"
				displayname="验证码" isvalidate="true" name="validateCode"
				class="input_text" id="validateCode" style="width: 50px;"
				value="">&nbsp;<img border="0" align="absmiddle"
				style="cursor: pointer;"
				onclick="this.src='/sitefiles/services/platform/validateCode.aspx?cookieName=SITESERVER.p1.s2&amp;isCrossDomain=False&amp;_r=533?id='+Math.random()"
				src="/sitefiles/services/platform/validateCode.aspx?cookieName=SITESERVER.p1.s2&amp;isCrossDomain=False&amp;_r=533">&nbsp;<span
				style="color: red; display: none;" id="validateCode_msg">*</span>
				<script>event_observe('validateCode', 'blur', checkAttributeValue);</script>
			</td>
		</tr>
		<tr height="30">
			<td>&nbsp;</td>
			<td><input type="button" name="submit_2" value=" 提 交 "
				onclick="if (checkFormValueById('frmContent_2')){document.getElementById('frmContent_2').submit();}"
				id="submit_2">&nbsp;&nbsp;&nbsp;<input type="reset"
				value=" 重 置 ">&nbsp;&nbsp;[Ctrl+Enter] （带<span
				class="is_nessesary">*</span>的为必填项）</td>
		</tr>
	</tbody>
</table>

					</form>
<iframe width="0" height="0" frameborder="0" name="loadContent_2" id="loadContent_2"></iframe>
</div><script src="/sitefiles/bairong/scripts/datepicker/wdatepicker.js" type="text/javascript"></script>
    </div>
  </div>
</div>
</body>
</html>