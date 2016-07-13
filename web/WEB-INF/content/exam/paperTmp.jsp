<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$.extend({
	updatePaper: function(){
		BootstrapDialogUtil.close();
	},
	getPaperQuestions: function(){
		var paper = new Object();
		paper.paper_id = cacheObject.paperId;
		
		var json = JSON.stringify(paper);
		var url = "examJson/paperDetailList";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblPaperDetailList").empty();
			if(res.result =="1"){
				
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td>' + line[1] + '</td>';
					
					tr += '<td>' + line[2] + '</td >';
					tr += '<td>' + line[3] + '</td>';
					tr += '<td>' + line[4] + '</td>';
					
					tr += '<td>' + line[5] + '</td>';
					tr += '<td>' + line[6] + '</td>';
					tr += '<td>' + line[7] + '</td>';
					tr += '</tr>';
					$("#tblPaperDetailList").append(tr);
				});
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	setTimeout("$.getPaperQuestions()", 1000);
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
				<th width="50%">题目</th>
				<th width="5%">自动分值</th>
				<th width="5%">手动分值</th>
				<th width="5%">排序</th>
				<th width="10%">题目类型</th>
				<th width="10%">答案类型</th>
				<th width="10%">题目分类</th>
			</tr>
		</thead>
		<tbody id="tblPaperDetailList">
		</tbody>
	</table>
	
</div> 