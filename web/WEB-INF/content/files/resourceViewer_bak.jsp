<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
HttpSession s = request.getSession(); 
%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnKnowlageRemove: function(paper_id){
		alert("!!!!");
	},
	fnPopPaperConfigClose: function(){
		$.searchQuestions();
	},
	searchKnowlage: function(){
		var knowlage = "<%=s.getAttribute("kl") %>";
		var fileType = "<%=s.getAttribute("file") %>";
		var viewer = "<%=s.getAttribute("viewer") %>";
		var fileMgr = new Object();
		fileMgr.knowlage = knowlage;
		fileMgr.fileType = fileType;
		fileMgr.viewer = viewer;
		var json = JSON.stringify(fileMgr);
		var req = "&data=" + json;
		$.post("publicJson/fileList",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$("#tblQuesList").empty();
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<th>' + (index + 1) + '</td>';
					tr += '<td>' + line[2] + '</td>';
					tr += '<td>' + line[1] + '</td >';
					tr += '<td>' + line[8] + '</td >';
					tr += '<td><input type="button" class="button red" style="width:60px; margin: 5px 0 5px 0" value="阅读" onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')"></td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
					index ++;
				});
				cu.toast(res.msg);
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnResourceSearch: function(){
		var knowlage = $("#sltKnowlageClass").val();
		var fileType = "<%=s.getAttribute("file") %>";
		var viewer = "<%=s.getAttribute("viewer") %>";
		var searchArg = $("#iptSrhContent").val();
		var fileMgr = new Object();
		fileMgr.knowlage = knowlage;
		fileMgr.fileType = fileType;
		fileMgr.viewer = viewer;
		fileMgr.search = searchArg;
		var json = JSON.stringify(fileMgr);
		var req = "&data=" + json;
		$.post("publicJson/fileList",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$("#tblQuesList").empty();
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<th>' + (index + 1) + '</td>';
					tr += '<td>' + line[2] + '</td>';
					tr += '<td>' + line[1] + '</td >';
					tr += '<td>' + line[8] + '</td >';
					tr += '<td><input type="button" class="button red" style="width:60px; margin: 5px 0 5px 0" value="阅读" onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')"></td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
					index ++;
				});
				cu.toast(res.msg);
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	openFile: function(fileId, fileType){
		$("#dvResourceList").hide();
		$("#dvFilePlayer").show();
		cacheObject.fileId = fileId;
		cacheObject.fileType = fileType;
		$("#dvFilePlayer").load("favorate/favoratePlayer?fileId="+ fileId +"&fileType="+ fileType);
	}
});
$(function(){
	$.searchKnowlage();
	selectDictItem("#sltKnowlageClass","knowlage","all");
});
</script>
<style>
</style>
<div id="dvResourceList" style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px; overflow-y:scroll; height: 100%;">
	<div style="width:100%; text-align: right;">
		<input id="iptSrhContent" type="text" class="input30">
		<select class="select20" id="sltKnowlageClass">
			<option value="all">全部</option>
		</select>
		<input type="button" onclick="$.fnResourceSearch()" value="查找" class="button green" style="width:100px; margin: 5px 10% 5px 0;">
	</div>
	<!-- 问题清单 -->
	<table class="cu-table" style="width: 100%;">
		<thead>
			<tr>
				<th width="2%"></th>
				<th width="50%">内容摘要</th>
				<th width="10%">分类</th>
				<th width="10%">创建日期</th>
				<th width="5%">修改</th>
			</tr>
		</thead>
		<tbody id="tblQuesList">
		</tbody>
	</table>
	
</div>
<div id="dvFilePlayer" style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px; overflow: auto; width: 100%;" hidden="hidden">

</div>