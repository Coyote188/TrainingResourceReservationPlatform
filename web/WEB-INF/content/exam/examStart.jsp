<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%-- <link href="${pageContext.request.contextPath}/css/exam.css" rel="stylesheet" type="text/css"> --%>
<link href="${pageContext.request.contextPath}/css/button.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/js/examlist/font-awesome.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/js/examlist/normalize.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/js/examlist/style1.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/examlist/modernizr.custom.js"></script>
<link href="${pageContext.request.contextPath}/css/exam.css" rel="stylesheet" type="text/css">
<style>
<!-- /* news */
.news {
	width: 958px;
	margin: 0 auto;
	border: 1px solid #ccc;
	height: 25px;
	overflow: hidden;
	box-shadow: 1px 1px 10px #aaa;
	position: relative;
}

.news .list {
	width: 920px;
	margin: 0 20px;
	position: absolute;
	top: 0;
	left: 0;
}

.news .list li {
	width: 900px;
	padding: 3px 0 3px 20px;
	background: url('${pageContext.request.contextPath}/js/examlist/icon/speaker.png') no-repeat center left;
	overflow: hidden;
	white-space: nowrap;
	-o-text-overflow: ellipsis;
	text-overflow: ellipsis;
}

.news .list li a,img {
	border: 0;
}

.news .list li a {
	color: #666;
	font-size: 14px;
	text-decoration: none;
}

.news .list li a:hover {
	color: #999;
}
-->
</style>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/examlist/classie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/examlist/main.js"></script> --%>
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
				var gridItem = '';
				gridItem += '<a class="grid__item" href="#" examIndex="' + item[0] + '">';
				gridItem += '<h2 class="title title--preview">' + item[6] + '</h2>';
				gridItem += '<div class="loader"></div>';
				gridItem += '<span class="category">出题人:' + item[4] + '</span>';
				gridItem += '<div class="meta meta--preview">';
				gridItem += '<img class="meta__avatar" src="${pageContext.request.contextPath}/js/examlist/icon/1.png" alt="author03"> ';
				gridItem += '<span class="meta__date"><i class="fa fa-calendar-o"></i>难度[' + item[3] + ']-分数[' + item[5] + ']</span>';
				gridItem += '<span class="meta__reading-time"><i class="fa fa-clock-o"></i>答题时间[' + item[2] + ']</span>';
				gridItem += '</div>';
				gridItem += '</a>';
				$("#gridItemFreePractice").after(gridItem);
			});
			
			if(res.result =="1"){
				$.fnImportJavaScript('${pageContext.request.contextPath}/js/examlist/classie.js');
				$.fnImportJavaScript('${pageContext.request.contextPath}/js/examlist/main.js');
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnImportJavaScript: function(url){
		var script=document.createElement("script");
		script.type="text/javascript";
		script.src=url;
		document.getElementsByTagName('head')[0].appendChild(script);
	},
	fnExamStartInit: function(id){
		if(typeof(id) != 'undefined'){
			if(!confirm("即将开始考试，考试过程中切勿关闭或刷新窗口,考试完成后，请提交试卷，并不要急于关闭窗口，以便系统统计结果。")){
				return;
			}else{
				
			}
		}else{
			if(!confirm("您即将开始随机模拟练习，系统将按您的身份信息随机组装试卷，60题（共100分）。")){
				return;
			}else{
				
				var url = "${pageContext.request.contextPath}/examJson/createRandomPaper";
				$.post(url,null,function(data, status){
					var res = jQuery.parseJSON(data);
					res = jQuery.parseJSON(res.output);
					$.fnLoadNewPaperQuestionList(res.data.paper_id);
					
				},"html").error(function() { alert("系统故障"); });
			}
		}
		
	},
	fnLoadNewPaperQuestionList: function(id){
		examCache.paper_id = id;
		//examCache.timeDue = timeDur*60*1000;
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
	},
	fnNotice: function(content){
		var t; 
		$("#divNoticeNews").hover(function(){ 
			 clearInterval(t);
		},function(){ 
			 t = setInterval(function(){ 
					var ul = $("#divNoticeNews").find(".list"); 
					var liHeight = ul.find("li:last").height();
					ul.animate({marginTop : liHeight +"px"},1000,function(){ 
						ul.find("li:last").prependTo(ul);
						ul.find("li:first").hide(); 
						ul.css({marginTop:0}); 
						ul.find("li:first").fadeIn(800); 
					});         
			},3000); 
		 }).trigger("mouseleave"); 
	}
});
$(function(){
	$.fnLoadExam();
	$.fnNotice();
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
<div class="container">
			<button id="menu-toggle" class="menu-toggle"><span>Menu</span></button>
			<div id="theSidebar" class="sidebar sidebar--open">
				<button class="close-button fa _sidebar_button fa-close"></button>
				<h4>
					<span>
						仿真实训考试系统
					</span>
				</h4>
			</div>
			<div id="theGrid" class="main">
				<section class="grid">
					<header class="top-bar">
						<h2 class="top-bar__headline">考试列表</h2>
						<div class="news" id="divNoticeNews">
							<ul class="list" style="margin-top: 4.65281px;">
								<li><a target="_blank" href="#">请点击以下试卷开始答题!</a></li>
								<li><a target="_blank" href="#">点击随机试卷可以生成随机练习题。</a></li>
								<li><a target="_blank" href="#">如有疑问，请联系系统管理员！</a></li>
								<li><a target="_blank" href="#">系统试用中，如有问题请联系管理人员</a></li>
								<li><a target="_blank" href="#">模拟仿真考试系统正在为您服务!</a></li>
							</ul>
						</div>
					</header>
					<a id="gridItemFreePractice" class="grid__item" href="#">
						<h2 class="title title--preview">随机出题&自由练习</h2>
						<div class="loader"></div>
						<span class="category">出题人:system</span>
						<div class="meta meta--preview">
							<img class="meta__avatar" src="${pageContext.request.contextPath}/js/examlist/icon/system.png" alt="author01"> 
							<span class="meta__date"><i class="fa fa-calendar-o"></i>难度[随机]-分数[100]</span>
							<span class="meta__reading-time"><i class="fa fa-clock-o"></i>30 分钟</span>
						</div>
					</a>
				</section>
				<section class="content">
					<div class="scroll-wrap">
						<article class="content__item" id="dvExamPage">
						</article>
					</div>
					<button class="close-button"><i class="fa fa-close"></i><span>Close</span></button>
				</section>
			</div>
		</div>



	<!-- <div style="width: 80%; margin: 0 auto;" id="dvExamSelect" class="jkbd-main-main erjiyemian">
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
	
	</div> -->
</body>
</html>