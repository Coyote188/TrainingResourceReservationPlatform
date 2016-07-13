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
					tr += '<td><input type="number" name="test_score_manual" value="' + line[3] + '" min="0" step="1" style="width:40px;"></td>';
					tr += '<td><input type="number" name="detail_seq" value="' + line[4] + '" min="0" step="1" style="width:40px;"></td>';
					
					tr += '<td>' + line[5] + '</td>';
					tr += '<td>' + line[6] + '</td>';
					tr += '<td>' + line[7] + '</td>';
					tr += '<td><a onclick="$.modThisLine(\'' + line[0] + '\',this)">保存</a><a onclick="$.delThisLine(\'' + line[0] + '\',this)">删除</a></td>';
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
				<th width="10%">修改</th>
			</tr>
		</thead>
		<tbody id="tblPaperDetailList">
		</tbody>
	</table>
	
</div> 