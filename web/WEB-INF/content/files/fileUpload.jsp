<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%
HttpSession s = request.getSession(); 
%>
<style type="text/css">
a {
	cursor: pointer;
}
.fileUpload{
	width: 100%;
	border: 1px solid #aed0ea;
}
.fileUpload tr{
	border-top: 1px solid #aed0ea;
}
.fileUpload textarea{
	margin: 5px 0 5px 0;
}
</style>
<script type="text/javascript">
$.extend({
	fileUpload: function(){
		if(!$.uploadNull("uploadify")){
			alert("请选择上传文件");
			return ;
		}
		cu.toast("Loading ... ",{type : "load"});
		$("#btnUpload").disabled;
		var fileUp = new Object();
		fileUp.knowlage = "<%=s.getAttribute("kl") %>";
		fileUp.fileType = $("#sltFileType").val();
		fileUp.knowDesc =  encodeURI(encodeURI($("#txtKnowlageDesc").val()));
		fileUp.fileDesc = encodeURI(encodeURI($("#txtFileDesc").val()));
		fileUp.name = encodeURI(encodeURI($("#iptName").val()));
		var json = JSON.stringify(fileUp);
		var req = "&data=" + json;
		$.ajaxFileUpload({
			url:'upfile?option=contacts' + req,
			secureuri:false,
			fileElementId:['uploadify'],
			dataType: 'json',
			data: json,
			success: function (data, status){
				cu.toast.close();
				var res = jQuery.parseJSON(data.output);
				cu.toast(res.msg);
				if("1" == res.result){
					$.searchKnowlage();
				}
				BootstrapDialogUtil.close();
			},
			error: function (data, status, e){
				cu.toast.close();
				alert(e);
			}
		});
		return false;
	},
	 uploadNull: function(id){
		id = "#"+id;
		var path = $(id).val();
		if(path==""||path==null){
			cu.info("请选择上传路径！");
			return false ;
		}else{
			return true;
		}
	}
});
</script>
<style type="text/css">
.fileUpController {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.fileUpController input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.fileUpController:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
</style>
	<div >
		<h4>
			<label>教学资料上传</label>
		</h4>
	</div>
	
	<table class="fileUpload" width="98%" cellspacing="0" cellpadding="0" border="0" align="center">
		<tbody>
			<tr>
				<td width="10%">知识点名称</td>
				<td colspan="3">
					<input type="text" class="input60" style="width: 60%;" id="iptName">
				</td>
			</tr>
			<tr>
				<td align="left" colspan="4">
					<a href="javascript:;" style="margin-left: 40%;" class="fileUpController">选择文件
						<input id='uploadify' size="50" name='uploadify' type='file'  onchange="fileChange(this);" style="cursor: pointer;"/>
					</a>
					<br>
					<font color="red" size="2">
					1、请选择.doc、.xls、.pdf、.ppt、.mp4文件上传，系统暂提供该系列文件的解析并提供在线阅读服务；<br>
					2、视频文件最大支持100M，请注意检查文件格式。<br>
					3、请严格按照文件格式选择文件类型（文本资料对应图文资料，视频文件对应视频资料），由于格式不匹配可能造成播放错误，请悉知。
					</font>
				</td>
			</tr>
			<tr>
				<td>内容摘要</td>
				<td colspan="3">
					<textarea rows="4" cols="100" id="txtKnowlageDesc"></textarea>
				</td>
				<td></td><td></td>
			</tr>
			<tr>
				<td>文件描述</td>
				<td>
					<textarea rows="2" cols="60" id="txtFileDesc"></textarea>
				</td>
				<td>文件类型</td>
				<td>
					<select id="sltFileType">
						<option value="TXT">图文资料</option>
						<option value="MOV">视频资料</option>
					</select>
				</td>
			</tr>
		</tbody>
	</table>
	<div style="text-align: right;">
		<input class="button green" style="margin:5px 10% 5px 0;" id="btnUpload" type="button" value="上传" onclick="$.fileUpload();">
	</div>