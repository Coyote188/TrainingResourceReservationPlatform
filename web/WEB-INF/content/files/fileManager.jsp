<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<link href="${pageContext.request.contextPath}/css/v2/style.css" rel="stylesheet" />
<%
HttpSession s = request.getSession(); 
%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnKnowlageRemove: function(knowlage){
		if(!confirm("是否确定删除该资源？"))
			return;
		var request = new Object();
		request.knowlage = knowlage;
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("publicJson/knowlageDel",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$.searchKnowlage();
			}
		});
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
					tr += '<td class="center">' + line[2] + '</td>';
					tr += '<td class="center">' + line[1] + '</td >';
					tr += '<td class="center">' + line[8] + '</td >';
					tr += '<td class="center"><input type="button" class="group_btn" style="width:60px; margin: 5px 0 5px 0" value="删除" onclick="$.fnKnowlageRemove(\'' + line[0] + '\')"></td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
					index ++;
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnFileUpload: function(){
		var uri = "public/fileUpload?kl=" + "<%=s.getAttribute("kl") %>" + "&file=" + "<%=s.getAttribute("file") %>";
		BootstrapDialogUtil.loadUriDialog("上传资源", uri, "800", "#fff", true);
	}
});
$(function(){
	$.searchKnowlage();
});
</script>
<style>
</style>
<section class="rt_wrap content mCustomScrollbar">
 <div class="rt_content">
      <div class="page_title">
       <h2 class="fl">${menuName}</h2>
       <a href="javascript:void(0)" onclick="$.fnFileUpload()" class="fr top_rt_btn add_icon">上传文件</a>
      </div>
      <section class="mtb">
       <div>
		<font size="2" color="red">
		1、上传文件格式为pdf、ppt、doc、xls、mp4格式内容文件；<br>
		2、文件上传时，请严格控制文件小于100M，但由于浏览器性能问题，可能大于100M文件也会由于网络原因上传失败，请重试。<br>
		3、删除文件时，并不能及时从服务器删除原文件，该类文件将于固定时间由后台程序自动删除。
		</font>
		</div>
      </section>
      <table class="table">
       <tr>
        <th width="2%" class="center">序号</th>
        <th class="center">内容摘要</th>
        <th class="center">分类</th>
        <th class="center">创建日期</th>
        <th class="center">修改</th>     
       </tr>
     <tbody id="tblQuesList">
		</tbody>
      </table>
    
 </div>
</section>