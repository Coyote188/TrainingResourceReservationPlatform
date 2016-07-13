<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${pageContext.request.contextPath}/css/v2/style.css" rel="stylesheet" />
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
					tr += '<th class="center">' + (index + 1) + '</th>';
					tr += '<td class="center">' + line[2] + '</td>';
					tr += '<td class="center">' + line[1] + '</td >';
					tr += '<td class="center">' + line[8] + '</td >';
					tr += '<td class="center"><input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="阅读" onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')"></td>';
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
					tr += '<th class="center">' + (index + 1) + '</th>';
					tr += '<td class="center">' + line[2] + '</td>';
					tr += '<td class="center">' + line[1] + '</td >';
					tr += '<td class="center">' + line[8] + '</td >';
					tr += '<td class="center"><input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="阅读" onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')"></td>';
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
<section id="sectionResourceList" class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">${menuName}</h2>
      
      </div>
      <section class="mtb">
       <select class="select" id="sltKnowlageClass">
        <option value="all">全部</option>
       </select>
       <input class="textbox textbox_225" id="iptSrhContent" type="text" style="height:38px"/>
       <input type="button" value="查询" class="group_btn"/>
      </section>
      <table class="table">
       <tr>
       	<th width="2%">序号</th>
        <th>内容摘要</th>
        <th>分类</th>
        <th>创建日期</th>
        <th>修改</th>
       
       </tr>
      <tbody id="tblQuesList">
		</tbody>
      </table>
    
 </div>
</section>
<div id="dvFilePlayer" style="margin-left: 2px; overflow: auto; width: 99%;" hidden="hidden">

</div>