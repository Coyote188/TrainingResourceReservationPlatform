<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
HttpSession s = request.getSession(); 
%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnLoadAnswerPaper: function(){
		var request = new Object();
		request.paper_id = "<%=s.getAttribute("paper_id") %>";;
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("examJson/paperHisDetailList",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				var answerPaper = res.data.ans_paper[0];
				$("#examDate").html(answerPaper[0]);
				$("#examHard").html(answerPaper[2]);
				$("#examDue").html(answerPaper[1]);
				$("#examTcr").html(answerPaper[3]);
				$("#examAllScore").html(answerPaper[5]);
				$("#examScore").html(answerPaper[6]);
				$("#examDesc").html(answerPaper[4]);
				$.each(res.data.ans_list,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td>' + line[0] + '</td>';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '<td>' + line[3] + '</td>';
					tr += '<td>' + line[4] + '</td>';
					tr += '<td>' + line[5] + '</td>';
					tr += '</tr>';
					$("#tblExamHisDetail").append(tr);
				});
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	setTimeout("$.fnLoadAnswerPaper()", 500);
});
</script>
<style>
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px; overflow-y: scroll; width: 99%;">
	<table class="cu-table" style="width: 100%;">
		<tbody>
			<tr>
				<td width="10%">考试时间</td>
				<td id="examDate" width="40%"></td>
				<td width="10%">试题难度</td>
				<td id="examHard" width="40%"></td>
			</tr>
			<tr>
				<td>考试时长</td>
				<td id="examDue"></td>
				<td>出题人</td>
				<td id="examTcr"></td>
			</tr>
			<tr>
				<td>总分</td>
				<td id="examAllScore"></td>
				<td>得分</td>
				<td id="examScore"></td>
			</tr>
			<tr>
				<td>试题描述</td>
				<td colspan="3" id="examDesc">
				</td>
			</tr>
		</tbody>
	</table>
	
	<!-- 问题清单 -->
	<table class="cu-table" style="width: 100%;" id="tblExamHisDetail">
		<thead>
			<tr>
				<th width="2%"></th>
				<th width="60%">题目</th>
				<th width="10%">题目归属</th>
				<th width="6%">题目类型</th>
				<th width="10%">答案类型</th>
				<th width="10%">结果</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
</div>