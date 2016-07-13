<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnViewPaperDetail: function(paper_id){
		cacheObject.paperId = paper_id;
		var uri = "exam/paperHisDetail?paper_id=" + paper_id;
		BootstrapDialogUtil.loadUriDialog("考试结果", uri, "800", "#fff", true);
	},
	fnPopPaperConfigClose: function(){
		$.searchAnswerPaperHis();
	},
	searchAnswerPaperHis: function(){
		$.post("examJson/myExamHisItems",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<th></td>';
					tr += '<td>' + line[7] + '</td>';
					tr += '<td>' + line[3] + '</td >';
					tr += '<td>' + line[4] + '</td>';
					tr += '<td>' + line[5] + '</td>';
					tr += '<td>' + line[6] + '</td>';
					tr += '<td>' + line[2] + '</td>';
					tr += '<td>' + line[8] + '</td>';
					tr += '<td><input type="button" class="button green" style="width:60px; margin: 5px 0 5px 0" value="查看" onclick="$.fnViewPaperDetail(\'' + line[1] + '\')"></td>';
					tr += '</tr>';
					$("#tblTestHistory").append(tr);
				});
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	$.searchAnswerPaperHis();
});
</script>
<style>
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin:30px; overflow-y: scroll; width: 99%; height: 100%;">
	<!-- 问题清单 -->
	<table class="cu-table" style="width: 100%;" id="tblTestHistory">
		<thead>
			<tr>
				<th width="2%"></th>
				<th width="5%">出题人</th>
				<th width="55%">描述</th>
				<th width="10%">考试时间</th>
				<th width="4%">难度</th>
				<th width="5%">考试时长</th>
				<th width="5%">得分</th>
				<th width="5%">总分</th>
				<th width="5%">查看试卷</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
</div> 