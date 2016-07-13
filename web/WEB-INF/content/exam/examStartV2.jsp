<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/thirdpart/sweetalert/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/thirdpart/sweetalert/sweetalert.min.js"></script>
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
<script type="text/javascript" src="${pageContext.request.contextPath}/js/examlist/classie.js"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/js/examlist/main.js"></script> --%>
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
		if(id != 'random'){
			swal({   title: "是否开始考试?",   
				text: "考试即将开始，请做好准备，点击开始后，页面将打开考试须知，同意后即可开始答题！",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "开始",   
				cancelButtonText: "取消",   
				closeOnConfirm: true,  closeOnCancel: true }, 
				function(){ 
					$.fnLoadNewPaperQuestionList(id);
					/* var url = "${pageContext.request.contextPath}/examination_json/getQuestionList";
					examCache.paper_id = id;
					var json = JSON.stringify(examCache);
					var req = "&data=" + json;
					$.post(url,req,function(data, status){
						var res = jQuery.parseJSON(data);
						res = jQuery.parseJSON(res.output);
						$.fnLoadNewPaperQuestionList(res.data.paper_id);
						
					},"html").error(function() { swal("系统故障"); }); */
				 });
		}else{
			swal({   title: "是否开始考试?",   
				text: "您即将开始随机模拟练习，系统将按您的身份信息随机组装试卷，60题（共100分）。",   
				type: "warning",   
				showCancelButton: true,   
				confirmButtonColor: "#DD6B55",   
				confirmButtonText: "开始",   
				cancelButtonText: "取消",   
				closeOnConfirm: true,   closeOnCancel: true }, 
				function(){ 
					var url = "${pageContext.request.contextPath}/examJson/createRandomPaper";
					$.post(url,null,function(data, status){
						var res = jQuery.parseJSON(data);
						res = jQuery.parseJSON(res.output);
						$.fnLoadNewPaperQuestionList(res.data.paper_id);
						
					},"html").error(function() { swal("系统故障"); });
				 });
			
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
				$("#dvExamPage").show();
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
	},
	
});
$(function(){
//	$.fnLoadExam();
//	$.fnNotice();
var id = $('#examId').val();
//alert(id);
/* var item = $('.content__item');
classie.add(item, 'content__item--show'); */
	$.fnExamStartInit(id);
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
<input id="examId" type="hidden" value="${examId }"/>
<div class="container">
			<!-- <button id="menu-toggle" class="menu-toggle"><span>Menu</span></button>
			<div id="theSidebar" class="sidebar sidebar--open" style="disploy:none">
				<button class="close-button fa _sidebar_button fa-close"></button>
				<h4>
					<span>
						仿真实训考试系统
					</span>
				</h4>
			</div> -->
			<div id="theGrid" class="main">
				
				<section class="content content--show">
					<div class="scroll-wrap">
						<article class="content__item content__item--show" id="dvExamPage">
						</article>
					</div>
					<button class="close-button"><i class="fa fa-close"></i><span>Close</span></button>
				</section>
			</div>
		</div>
	
</body>
</html>