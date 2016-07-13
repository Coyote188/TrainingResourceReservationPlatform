<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${pageContext.request.contextPath}/css/v2/style.css" rel="stylesheet" />
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
					tr += '';
					tr += '<td class="center">' + line[7] + '</td>';
					tr += '<td class="center">' + line[3] + '</td >';
					tr += '<td class="center">' + line[4] + '</td>';
					tr += '<td class="center">' + line[5] + '</td>';
					tr += '<td class="center">' + line[6] + '</td>';
					tr += '<td class="center">' + line[2] + '</td>';
					tr += '<td class="center">' + line[8] + '</td>';
					tr += '<td class="center"><input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="查看" onclick="$.fnViewPaperDetail(\'' + line[1] + '\')"></td>';
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
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">考试记录</h2>
       
      </div>
      
      <table class="table" id="tblTestHistory" style="overflow:auto;">
       <tr>
        <th>出题人</th>
        <th>描述</th>
        <th>考试时间</th>
        <th>难度</th>
        <th>考试时长</th>
        <th>得分</th>
        <th>总分</th>
        <th>查看试卷</th>
     
       </tr>
       
      
      </table>
      
 </div>
</section>