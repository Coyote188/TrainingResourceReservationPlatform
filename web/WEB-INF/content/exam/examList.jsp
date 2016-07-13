<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>在线考试系统首页</title>

<script src="${pageContext.request.contextPath}/resource/examV2/js/jquery.js"></script>
<script src="${pageContext.request.contextPath}/resource/examV2/js/L.js"></script>
<script path="/data/language/zh_CN" debug="" init="1" src="${pageContext.request.contextPath}/resource/examV2/js/language.js"></script>
<script>window.L.getText.init({"class":"index","action":"indexDefault"});</script>
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/examV2/css/TpageTable.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/examV2/css/pageTable.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/examV2/css/mainindex.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/examV2/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resource/examV2/css/layout.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/v2/style.css" rel="stylesheet" />
</head>
<body>
	<script language="javascript" charset="UTF-8" src="${pageContext.request.contextPath}/resource/examV2/js/injectLogin.js" login="1"></script>
	<!--考试列表 -->
	<script>  
<!--
var examCache = new Object();
var examQuestions = new Array();
$.extend({
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
$(document).ready(
	function a(){
	  $("#ddf-header_searchChoose").mouseenter(
		function () {
		  $("#ddf-header_searchChoosePop").css("display","block");
		}
	).mouseleave(
		function () { 
		  $("#ddf-header_searchChoosePop").css("display","none");
		}
	);
  }
);

$(document).ready(
  function systemChoose(){
	  $("#popupbox").mouseenter(
		function () {
		  $("#popup").css("display","block");
		}
	).mouseleave(
		function () { 
		  $("#popup").css("display","none");
		}
	);
  }
);
/*ie6 选中区块 边框变色
$(document).ready(
  function box_border(){
	  $(".ddf-box").mouseenter(
		function () {
		  $(".ddf-box").addClass("ddf-box_h");
		}
	).mouseleave(
		function () { 
		  $(".ddf-box").removeClass("ddf-box_h");
		}
	);
  }
);*/

$.extend({
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
	fnSwitchMainFrame:function(_switch){
		if(_switch){
			$("#myExamList").hide();
			$("#myAchievement").show();
			$("#lidffSubitemH").addClass("ddf-subitem").removeClass("ddf-subitem_h");
			$("#lidffSubitem").addClass("ddf-subitem_h").removeClass("ddf-subitem");
		}else{
			$("#myExamList").show();
			$("#myAchievement").hide();
			$("#lidffSubitem").addClass("ddf-subitem").removeClass("ddf-subitem_h");
			$("#lidffSubitemH").addClass("ddf-subitem_h").removeClass("ddf-subitem");
		}
	},
	fnQueryMyAchievement:function(){
		$.fnSwitchMainFrame(true);
		var cacheObject = new Object();
		cacheObject.usr = "session";
		var uri = "${pageContext.request.contextPath}/examJson/testHisQuery";
		var json = JSON.stringify(cacheObject);
		var req = "&data=" + json;
		$.post(uri,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblQuesList").empty();
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td class="center">' + line.preset_time + '</td>';
					tr += '<td class="center">' + (line.test_date == null? '未考试':line.test_date) + '</td>';
					tr += '<td class="center">' + line.score + '</td >';
					tr += '<td class="center">' + line.correct + '</td>';
					tr += '<td class="center">' + line.wrong + '</td>';
					tr += '</tr>';
					$("#tblQuesList").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
</script>

	<!-- top ddf-status 开始 -->

	<!--  top ddf-status 结束 -->
	<!-- header头部 开始 -->
	<div class="ddf-header">
		<div class="ddf-wrapper">
			<a class="ddf-header_logo" href="">
				<img src="${pageContext.request.contextPath}/resource/examV2/images/ic_logo_white.png">
				<h1 class="ddf-header_logo_outWords">在线考试系统</h1>
			</a>
			<ul class="ddf-header_nav">
				<li><a href="${pageContext.request.contextPath}/navV2/nav.jsp" class="ddf-header_nav_sub_sel">返回导航</a></li>
			</ul>
		</div>
	</div>
	<!-- 公告区块 开始 -->
	<div class="ddf-wrapper">
		<div class="q-scroll">
			<span class="q-noticeName">公告</span>
			<ul class="q-list">
				<!-- <li><a href="http://oes.orivon.com/user.php?a=noticeDetail&amp;noticeId=1" target="_blank">首页置顶公告</a></li> -->
				<li>首页置顶公告</li>
			</ul>
		</div>
		<script> 
            function autoScroll(obj){  
                $(obj).find(".q-list").animate({                                                
                
                    marginTop : "-35px"  
                },500,function(){  
                    $(this).css({marginTop : "0px"}).find("li:first").appendTo(this);  
                });
            }  
            $(function(){
                if($('.q-scroll').find(".q-list li").length > 1){
                    setInterval('autoScroll(".q-scroll")',3000);
				}
            });
    </script>
	</div>
	<!-- 公告区块 结束-->
	<!-- header头部 结束 -->
<script>
	window.L.extension.injectLogin(function(){
	    $('#userLoginBlock ul:eq(0) a:eq(0)').click();
	}, 'loginAfter');
	$(document).ready(function() {
		window.L.open('oDialogDiv').skinLayout(-1);                                                                      //重新布局弹出层
	})
</script>
	<!-- header头部 结束 -->

	<div class="ddf-wrapper" style="height: 100%; overflow-y: scroll;">
		<!-- // 侧边列 -->
		<div class="ddf-sidebar fl">
			<div class="ddf-user">
				<div class="ddf-user_photo">
					<a href="#"><img src="${pageContext.request.contextPath}/resource/examV2/images/ic_head.jpg" width="53" height="53"></a>
				</div>
				<div class="ddf-user_info">
					<p class="ddf-user_name">
						<a href="#">${username}</a>
					</p>
					<p class="ddf-user_group"></p>
				</div>
			</div>
			<ul id="ddf-menu" class="ddf-menu">
				<li>
					<a id="ddf-item1" class="ddf-item" href="#"> 
						<em class="ddf-icon_test"></em> <span class="fl">考试测评</span> 
						<em id="ddf-icon1" class="ddf-icon_arrow_down"></em>
					</a> 
					<ul class="ddf-submenu">
						<li><a id="lidffSubitemH" class="ddf-subitem_h" href="#" onclick="$.fnSwitchMainFrame(false);">我的考试</a></li>
						<li><a id="lidffSubitem" class="ddf-subitem" href="#" onclick="$.fnQueryMyAchievement();">我的成绩</a></li>
					</ul>
				</li>
			</ul>
			<dl class="ddf-bbs_latest">
				<dt class="ddf-bbs_title">
					<strong>最新公告</strong>
				</dt>
				<dd class="ddf-bbs_con" noticeid="3">
					<a href="javascript:void( );">点击随机试卷可以生成随机练习题。</a><br>
					<a href="javascript:void( );">如有疑问，请联系系统管理员！</a><br> 
					<a href="javascript:void( );">系统试用中，如有问题请联系管理人员</a><br> 
					<a href="javascript:void( );">模拟仿真考试系统正在为您服务!</a><br> 
					<span class="ddf-date"></span>
				</dd>
			</dl>
		</div>
		<script type="text/javascript"></script>

		<!-- 主体 开始-->
		<div class="ddf-main fr" style="min-height: 758px; overflow: hidden;" id="myExamList">
			<ul id="ddf-tags" class="ddf-tab">
				<li>
					<a id="ddf-tabnav0" class="ddf-tabnav_h" href="javascript:void(0)">可参加的考试</a>
				</li>
			</ul>
			<div id="ddf-tagContent">
				<!-- 一周内要参加的考试 开始 -->
				<div id="ddf-tagContent0" class="ddf-tagContent ddf-selectTag fl">
					<!-- // 列表项目 -->
					<table id="getExamPageTable" class="TpageTable">
						<tbody>
							<tr>
								<td>
									<div class="">
										<div class="ddf-box">
											<!---封面图片区--->
											<div class="ddf-pic_cover">
												<img src="${pageContext.request.contextPath}/resource/examV2/images/cover_test.jpg" width="120" height="120">
											</div>
											<!---右侧区--->
											<div class="ddf-box_con">
												<!---课程、考试、计划 标题区--->
												<em class="ddf-icon_test_2"></em>
												<h3 class="ddf-box_title ddf-text_overflow">随机出题&自由练习</h3>
												<!---按钮区--->
												<div class="ddf-box_btn_area">
													<div class="ddf-box_btnox" id="exam_btn_15">
														<a href="${pageContext.request.contextPath}/examination/examStartV2?id=random" onclick="" class="ddf-btn ddf-btn_enter">参加考试</a>
													</div>
													<div class="ddf-box_btn_area_msgbox" id="exam_btn_area_msgbox_15"></div>
												</div>
												<!---课程、考试、计划 信息概要区--->
												<ul class="ddf-info mt10">
													<li class="ddf-info_item fl mr30"><span
														class="ddf-info_name">出题人：</span> <span
														class="ddf-info_con">管理员</span></li>
													<li class="ddf-info_item fl mr30"><span
														class="ddf-info_name">难度：</span> <span
														class="ddf-info_con">随机</span></li>
													<li class="ddf-info_item fl mr30"><span
														class="ddf-info_name">总分：</span> <span
														class="ddf-info_con">100</span></li>
													<li class="ddf-info_item fl mr30"><span
														class="ddf-info_name">限时：</span> <span
														class="ddf-info_con">30分钟</span></li>
												</ul>
											</div>
										</div>
									</div></td>
							</tr>
							<c:forEach items="${exams}" var="e">
								<tr>
									<td><div class="">
											<div class="ddf-box">
												<!---封面图片区--->
												<div class="ddf-pic_cover">
													<img
														src="${pageContext.request.contextPath}/resource/examV2/images/cover_test.jpg"
														width="120" height="120">
												</div>
												<!---右侧区--->
												<div class="ddf-box_con">
													<!---课程、考试、计划 标题区--->
													<em class="ddf-icon_test_2"></em>
													<h3 class="ddf-box_title ddf-text_overflow">${e.test_desc}</h3>
													<!---按钮区--->
													<div class="ddf-box_btn_area">
														<div class="ddf-box_btnox" id="exam_btn_15">
															<a
																href="${pageContext.request.contextPath}/examination/examStartV2?id=${e.test_id}"
																onclick="" class="ddf-btn ddf-btn_enter">参加考试</a>
														</div>
														<div class="ddf-box_btn_area_msgbox"
															id="exam_btn_area_msgbox_15"></div>
													</div>
													<!---课程、考试、计划 信息概要区--->
													<ul class="ddf-info mt10">

														<li class="ddf-info_item fl mr30"><span
															class="ddf-info_name">出题人：</span> <span
															class="ddf-info_con">${e.test_user}</span></li>
														<li class="ddf-info_item fl mr30"><span
															class="ddf-info_name">难度：</span> <span
															class="ddf-info_con">${e.test_difficulty}</span></li>
														<li class="ddf-info_item fl mr30"><span
															class="ddf-info_name">总分：</span> <span
															class="ddf-info_con">${e.test_score}</span></li>
														<li class="ddf-info_item fl mr30"><span
															class="ddf-info_name">限时：</span> <span
															class="ddf-info_con">${e.test_duration}分钟</span></li>
													</ul>
												</div>
											</div>
										</div></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 主体 结束 -->
		<!-- 我的成绩查询 -->
		<div class="ddf-main fr" style="min-height: 758px; display: none;  overflow: hidden;" id="myAchievement">
			<div class="page_title">
				<h2 class="fl">考试成绩查询</h2>
			</div>
			<table class="table">
				<tr>
					<th class="center" width="8%">考试时间</th>
					<th class="center" width="8%">答题时间</th>
					<th class="center" width="6%">得分</th>
					<th class="center" width="4%">正确题目</th>
					<th class="center" width="10%">错误题目</th>
				</tr>
				<tbody id="tblQuesList">
				</tbody>
			</table>
		</div>
	</div>

	<!-- footer 底部 开始 -->
	<!---------- footer 底部 开始 ----------------------------------->
	<div class="ddf-footer">
		<div id="footer" class="ddf-wrapper">
			<p>
				<a href="javascript:void( );" target="_blank">Powered by </a>
			</p>
		</div>
	</div>
	<!---------- footer 底部 结束 ----------------------------------->
	<!-- footer 底部 结束 -->
<script>
	//弹出公告
	$(function(){
		var id = 0;
		if(id!=0){
			L.open('oDialogDiv')(
				window.L.getText("最新公告"),
				'iframe:./user.php?a=indexNoticeDetail&noticeId='+id,
				'50%',
				'auto',
				[
					3,    
					{    
					},
				]
			)
		}
	}
	)
</script>
	<script src="${pageContext.request.contextPath}/resource/examV2/js/pageTable.js"></script>
	<script src="${pageContext.request.contextPath}/resource/examV2/js/openIndex.js"></script>
	<script src="${pageContext.request.contextPath}/resource/examV2/js/exam.js"></script>
</body>
</html>