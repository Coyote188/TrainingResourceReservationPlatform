<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;
$.extend({
	searchQuestions: function(){
		
		$.post("examJson/getMyPaperList",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				
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
					tr += '<td><input type="button" class="button green" style="width:60px; margin: 5px 0 5px 0" value="答案" onclick="$.answerView(' + line[0] + ')"></td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
				});
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	$.searchQuestions();
});
</script>
<style>
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;">
	<!-- 问题清单 -->
	<table class="cu-table" style="width: 100%;" id="tblQuesList">
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
		<tbody>
		</tbody>
	</table>
	
</div> 