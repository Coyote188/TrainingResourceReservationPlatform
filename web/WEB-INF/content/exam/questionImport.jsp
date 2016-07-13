<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;
$.extend({
	fileUpload: function(){
		if(!$.uploadNull("uploadify")){
			alert("请选择上传文件");
			return ;
		}
		cu.toast("Loading ... ",{type : "load"});
		$("#btnUpload").disabled;
		$.ajaxFileUpload({
			url:'upload/questionImport',
			secureuri:false,
			fileElementId:['uploadify'],
			dataType: 'json',
			success: function (data, status){
				var res = jQuery.parseJSON(data.output);
				if("1" == res.result){
					$.searchQuestions();
				}
				cu.toast.close();
			},
			error: function (data, status, e){
				alert(e);
				cu.toast.close();
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
	},
	searchQuestions: function(){
		$.post("exam/myQuestionList",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$("#tblQuesList").empty();
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<th></td>';
					tr += '<td>' + line[3] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[5] + '</td>';
					tr += '<td>' + line[4] + '</td>';
					tr += '<td>' + line[6] + '</td>';
					tr += '<td><input type="button" class="button green" style="width:60px; margin: 5px 0 5px 0" value="删除" onclick="$.fnQuestionRemove(\'' + line[0] + '\')"></td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnQuestionRemove: function(id){
		var question = new Object();
		question.id = id;
		if(!confirm("是否确定删除该题？"))
			return;
		var json = JSON.stringify(question);
		var req = "&data=" + json;
		$.post("exam/rmQuestion",req,function(data, status){
			var res = jQuery.parseJSON(data.output);
			cu.toast(res.msg);
			$.searchQuestions();
		});
	}
});
$(function(){
	
});
</script>
<style type="text/css">
.fileUpload {
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
    margin: 10px 0 0 10%;
}
.fileUpload input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.fileUpload:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px; overflow-y: scroll; height: 100%; overflow-x: hidden;">
	<div style="widows: 99%; text-align: center;">
		<div style="text-align: left; margin-top: 5px;">
			<font color="black" size="3" style="margin-left:10%;">示例：</font>
			<font color="red" size="2">请按以下格式编辑文件，题目和答案在同一个xls文件中的不两个工作表中(内容不带解说部分)！</font>
		</div>
		<div style="width: 100%; margin: 5px 0 5px 0;">
			<img alt="" src="${pageContext.request.contextPath}/picture/demo_excel_question.png" width="45%" height="250px">
			<img alt="" src="${pageContext.request.contextPath}/picture/demo_excel_answer.png" width="45%" height="250px">
		</div>
		<font color="red" size="2">请选择.xls文件上传，系统暂提供该系列文件的解析并提供在线阅读服务,请注意检查文件格式。</font>
		<br>
		<div>
			<a href="javascript:;" class="fileUpload"> 选择文件
				<input id='uploadify' name='uploadify' type='file'  onchange="fileChange(this, 'fileUploadFilename');" style="cursor: pointer;"/>
			</a>
			<label id="fileUploadFilename"></label>
		</div>
		
		<br>
		<input class="button green" style="margin:5px 10% 5px 90%;" id="btnUpload" type="button" value="上传" onclick="$.fileUpload();">
	</div>
	<!-- 问题清单 -->
		<table class="cu-table" style="width: 99%;">
			<thead>
				<tr>
					<th width="2%"></th>
					<th width="8%">题目类型</th>
					<th width="8%">答案类型</th>
					<th width="20%">题目</th>
					<th width="6%">题干类型</th>
					<th width="4%">难度系数</th>
					<th width="10%">日期</th>
					<th width="5%">答案</th>
				</tr>
			</thead>
			<tbody id="tblQuesList">
			</tbody>
		</table>
</div> 