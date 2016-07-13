<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$.extend({
	updatePaper: function(){
		BootstrapDialogUtil.close();
	},
	modThisLine: function(detailId, obj){
		var detail = new Object();
		detail.detail_id = detailId;
		detail.detail_score = $(obj).parent().parent().find("input[name=test_score]").val();
		detail.detail_score_manual = $(obj).parent().parent().find("input[name=test_score_manual]").val();
		detail.detail_seq = $(obj).parent().parent().find("input[name=detail_seq]").val();
		console.log($(obj));
		var json = JSON.stringify(detail);
		var url = "examJson/updateOneLine";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result !="1"){
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
		
	},
	delThisLine: function(detailId, obj){
		var detail = new Object();
		detail.detail_id = detailId;
		console.log($(obj));
		var json = JSON.stringify(detail);
		var url = "examJson/deleteQuestionFromPaper";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$.getPaperQuestions();
			if(res.result !="1"){
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
		
	},
	getPaperResult: function(){
		var uri = "${pageContext.request.contextPath}/examJson/testHisQuery";
		var json = JSON.stringify(cacheObject);
		console.log(json);
		var req = "&data=" + json;
		$.post(uri,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblQuesList1234").empty();
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td class="center">' + line.stu_name + '</td >';
					tr += '<td class="center">' + (line.test_date == null? '-':line.test_date) + '</td>';
					tr += '<td class="center">' + line.score + '</td >';
					tr += '<td class="center">' + line.correct + '</td>';
					tr += '<td class="center">' + line.wrong + '</td>';
					tr += '</tr>';
					$("#tblQuesList1234").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	setTimeout("$.getPaperResult()", 1000);
});
</script>
<style>
<!--
.question_input
{
	width: 100%;
}
.question_input tr
{
	border-bottom: 1px solid #c6c7c2;
}
.question_input td
{
	color: #333;
	font-size: 1em;
	padding: 6px 10px;
	text-align: center;
	background: #fff;
	padding: 4px;
}
-->
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;">
	<table class="cu-table" style="width: 100%;">
		<thead>
			<tr>
				<th width="50%">姓名</th>
				<th width="5%">日期</th>
				<th width="5%">得分</th>
				<th width="5%">正确</th>
				<th width="10%">错误</th>
			</tr>
		</thead>
		<tbody id="tblQuesList1234">
		</tbody>
	</table>
	
</div> 