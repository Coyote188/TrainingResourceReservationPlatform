<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<link href="${pageContext.request.contextPath}/css/v2/style.css"
	rel="stylesheet" />
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;
$.extend({
	searchQuestions: function(){
		$.post("exam/myQuestionList",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$("#tblQuesList").empty();
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					
					tr += '<td class="center">' + line[3] + '</td>';
					tr += '<td class="center">' + line[2] + '</td >';
					tr += '<td class="center">' + line[1] + '</td>';
					tr += '<td class="center">' + line[5] + '</td>';
					tr += '<td class="center">' + line[4] + '</td>';
					tr += '<td class="center">' + line[6] + '</td>';
					tr += '<td class="center">'; 
					//tr += '<input type="button" class="button green" style="width:60px; margin: 5px 0 5px 0" value="答案" onclick="$.answerView(\'' + line[0] + '\')">';
					tr += '<input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="删除" onclick="$.fnQuestionRemove(\'' + line[0] + '\')">';
					tr += '<input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="修改" onclick="$.fnQuestionUpdate(\'' + line[0] + '\')">';

					tr += '</td>';
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
	},
	fnQuestionUpdate: function(id){
		cacheObject.question = id;
		BootstrapDialogUtil.loadUriDialog("试题修改", "exam/myQuestionEdit", "800", "#fff", true);
	}
});
$(function(){
	$.searchQuestions();
});
</script>
<style>
</style>
<section class="rt_wrap content mCustomScrollbar">
	<div class="rt_content">
		<div class="page_title">
			<h2 class="fl">我的试题</h2>
		</div>
		
		<table class="table">
			<tr>
				<th class="center" width="10%">题目类型</th>
				<th class="center" width="15%">答案类型</th>
				<th class="center" width="30%">题目</th>
				<th class="center" width="10%">题干类型</th>
				<th class="center" width="10%">难度系数</th>
				<th class="center" width="10%">日期</th>
				<th class="center" width="15%">答案</th>
			</tr>
			<tbody id="tblQuesList">
			</tbody>
		</table>

	</div>
</section>