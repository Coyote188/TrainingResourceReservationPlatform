<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/exam.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/button.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<style type="text/css">
.jkbd-width {
    width: 1200px;
}
.wid-auto {
    margin: 0 auto;
}
h1 {
	font-family: "微软雅黑";
	font-size: 40px;
	margin: 20px 0;;
	border-bottom: solid 1px #ccc;
	padding-bottom: 20px;
	letter-spacing: 2px;
}

.time-item strong {
	background: #C71C60;
	color: #fff;
	line-height: 49px;
	font-size: 36px;
	font-family: Arial;
	padding: 0 10px;
	margin-right: 10px;
	border-radius: 5px;
	box-shadow: 1px 1px 3px rgba(0, 0, 0, 0.2);
}

#day_show {
	float: left;
	line-height: 49px;
	color: #c71c60;
	font-size: 32px;
	margin: 0 10px;
	font-family: Arial, Helvetica, sans-serif;
}

.item-title .unit {
	background: none;
	line-height: 49px;
	font-size: 24px;
	padding: 0 10px;
	float: left;
}
.imagetable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #999999;
	border-collapse: collapse;
}
.imagetable th {
	background:#b5cfd2 url('${pageContext.request.contextPath}/css/images/cell-blue.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
.imagetable td {
	background:#dcddc0 url('${pageContext.request.contextPath}/css/images/cell-grey.jpg');
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #999999;
}
</style>
<script type="text/javascript">
<!--
var examCache = new Object();
var examQuestions = new Array();
$.extend({
	fnLoadExam: function(){
		var url = "${pageContext.request.contextPath}/examination_json/getExam";
		
		$.post(url,null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			
			$.each(res.data, function(index, item){
				var paper = '<tr><td>' + item[1] + '</td><td>' + item[2] + '</td><td>' + item[3] + 
				'</td><td>' + item[4] + '</td><td>' + item[5] + '</td><td>' + item[6] + 
				'</td><td><button type="button" style="width:100px;margin: 0;" class="button red float-r" onclick="$.fnExamStartInit(\'' + item[0] + '\',\'' + item[2] + '\')" type="button">开始考试</button></td></tr>';
				$("#tblExamList").append(paper);
			});
			
			if(res.result =="1"){
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnExamStartInit: function(id, timeDur){
		if(!confirm("即将开始考试，考试过程中切勿关闭或刷新窗口,考试完成后，请提交试卷，并不要急于关闭窗口，以便系统统计结果。")){
			return;
		}
		examCache.paper_id = id;
		examCache.timeDue = timeDur*60*1000;
		var json = JSON.stringify(examCache);
		var url = "${pageContext.request.contextPath}/examination_json/getQuestionList";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			
			if(res.result =="1"){
				examQuestions = res.data;
				$("#dvExamSelect").hide();
				$("#dvExamPage").load("${pageContext.request.contextPath}/examination/exam");
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	$.fnLoadExam();
});
//-->
</script>
<style>
<!--
-->
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XXX考试系统</title>
</head>
<body>
<div>
	<div style="width: 80%; margin: 0 auto;" id="dvExamSelect" class="jkbd-main-main erjiyemian">
		<table id="tblExamList" style="width: 100%;" class="imagetable">
		<thead>
			<tr>
				<th>考试时间</th>
				<th>考试时长</th>
				<th>难度</th>
				<th>试卷创建者</th>
				<th>试卷分数</th>
				<th>试卷描述</th>
				<th></th>
			</tr>
		</thead>
			<tbody>
			</tbody>
		</table>
	</div>
	<div style="width: 100%;" id="dvExamPage">
	
	</div>
</div>
</body>
</html>