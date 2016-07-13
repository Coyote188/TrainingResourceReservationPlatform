<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${pageContext.request.contextPath}/css/v2/style.css"
	rel="stylesheet" />
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnStuConfig00001: function(paperId){
		cacheObject.paperId = paperId;
		var uri = "exam/paperStuManager?paper_id="+paperId;
		BootstrapDialogUtil.loadUriDialog("考生管理", uri, "800", "#fff", true);
	},
	fnPopPaperConfigClose: function(){
		$.searchQuestions();
	},
	searchQuestions: function(){
		
		$.post("examJson/myPapersList",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
				
					tr += '<td class="center" >' + line[4] + '</td>';
					tr += '<td class="center" >' + line[1] + '</td >';
					tr += '<td class="center" >' + line[3] + '</td>';
					tr += '<td class="center" >' + line[2] + '</td>';
					tr += '<td class="center" >' + line[5] + '</td>';
					tr += '<td class="center" ><input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="考生" onclick="$.fnStuConfig00001(\'' + line[0] + '\')"></td>';
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
<section class="rt_wrap content mCustomScrollbar">
	<div class="rt_content">
		<div class="page_title">
			<h2 class="fl">考生管理</h2>
		</div>
		
		<table class="table">
			<tr>
				
				<th class="center"  width="20%">试卷描述</th>
				<th class="center"  width="8%">考试时长</th>
				<th class="center"  width="6%">总分</th>
				<th class="center"  width="4%">创建者</th>
				<th class="center"  width="10%">创建日期</th>
				<th class="center"  width="5%">修改</th>
			</tr>
			<tbody id="tblQuesList">
			</tbody>
		</table>

	</div>
</section>