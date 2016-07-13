<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/thirdpart/sweetalert/sweetalert.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/thirdpart/sweetalert/sweetalert.min.js"></script>
<style type="text/css">
.jkbd-main-main *{
	box-sizing:content-box !important;
}
.erjiyemian{
	width: 100%;
	height: 100%;
}
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
.timu-item{
	
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
</style>
<script type="text/javascript">
<!--
var intDiff = 60;//倒计时总秒数量
var cache = new Object;
var s = 0;
$.extend({
	fnExamAgreements: function(arg){
		if(arg){
			$(".kaoshi-popup-container").show();
			$("#fnAgreementFrame").show();
		}else{
			$(".kaoshi-popup-container").hide();
			$("#fnAgreementFrame").hide();
			$.fnGetBasicInformation();
		}
	},
	timer : function(intDiff) {
		s = setInterval(function() {
			
			var minute = 0, second = 0;//时间默认值		
			if (intDiff > 0) {
				minute = Math.floor(intDiff / 60);
				second = Math.floor(intDiff) - (minute * 60);
			}
			
			if (minute <= 9)
				minute = '0' + minute;
			if (second <= 9)
				second = '0' + second;
			$('#left-time').html(minute + ':' + second);
			
			intDiff--;
			console.info("intDiff:"+intDiff);
			if(intDiff==0){
				clearInterval(s);
				console.info("为零进入强制交卷");
				//强制交卷
				$.fnSubmit();
				$.fnKaoShiJiaoJuan(1);
				
			}
				
		}, 1000);
	},
	fnNextMoveLi: function(dire, _li){
		var _liList = new Array();
		$("#divQuestionsPaperListViewer").find("ul").each(function(idx, ul){
			$(ul).find("li").each(function(i1, li){
				_liList.push(li);
			});
		});
		var nextLi = null;
		$.each(_liList, function(index, li){
			if(li == _li){
				if(dire == 'next'){
					console.log(_liList[index + 1]);
					nextLi = _liList[index + 1];
				}else{
					nextLi = _liList[index - 1];
				}
				return false;
			}
		});
		return nextLi;
	},
	fnNextQuestion: function(){
		var tmpCurr = cache.curr;
		$("#divQuestionsPaperListViewer").find("li").each(function(index, li){
			if($(li).attr("data-id") == tmpCurr){
				var nextLi = $.fnNextMoveLi('next', li);
				console.log(nextLi);
				cache.curr = $(nextLi).attr('data-id');
				if(typeof cache.curr != "undefined" && cache.curr.length>0){
					$.fnShowQuestion(cache.curr);
				}else{
					alert("最后一题！");
				}
				
				//判断是否最后一题
				
			}
		});
	},
	fnFrontQuestion: function(){
		var tmpCurr = cache.curr;
		$("#divQuestionsPaperListViewer").find("li").each(function(index, li){
			if($(li).attr("data-id") == tmpCurr){
				var prevLi = $.fnNextMoveLi('front', li);
				cache.curr = $(prevLi).attr('data-id');
				if(typeof cache.curr != "undefined" && cache.curr.length>0){
					$.fnShowQuestion(cache.curr);
				}else{
					alert("第一题！");
				}
			}
		});
	},
	fnSignQuestionList: function(questionId, result){
		$("#divQuestionsPaperListViewer").find("li").each(function(index, li){
			if($(li).attr("data-id") == questionId){
				$(li).addClass(result);
			}
		});
	},
	fnAnswer:function(ansId){
		var ansList = $.fnSelectedAnswer();
		var answer = new Object();
		answer.qtId = cache.curr;
		answer.testId = examCache.paper_id;
		answer.ansList = ansList;
		answer.ansId = ansId;
		answer.ansPaper = cache.anspaper;
		console.log(answer);
		console.log(cache);
		var json = JSON.stringify(answer);
		var url = "${pageContext.request.contextPath}/examination_json/submitOneAnswer";
		var req = "&data=" + json;
		console.log(req);
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			console.log(res);
			
			if(res.data.result == 'F'){
				$.fnSignQuestionList(cache.curr, "cuo");
			}else{
				$.fnSignQuestionList(cache.curr, "dui");
			}
			$.fnNextQuestion();
		},"html").error(function() { alert("系统故障"); });
	},
	fnFillInAnswer:function(fillIns){
		var answer = new Object();
		answer.qtId = cache.curr;
		answer.testId = examCache.paper_id;
		answer.ansList = fillIns;
		answer.ansPaper = cache.anspaper;
		console.log(answer);
		console.log(cache);
		var json = JSON.stringify(answer);
		var url = "${pageContext.request.contextPath}/examination_json/submitFillInAnswer";
		var req = "&data=" + json;
		console.log(req);
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			console.log(res);
			
			if(res.data.result == 'F'){
				$.fnSignQuestionList(cache.curr, "cuo");
			}else{
				$.fnSignQuestionList(cache.curr, "dui");
			}
			$.fnNextQuestion();
		},"html").error(function() { alert("系统故障"); });
	},
	fnSelectAnswer:function(btn){
		$(btn).addClass("xuan");
	},
	fnSelectedAnswer:function(){
		var answerArr = new Array();
		$("#divAnsList").find("button.option-btn").filter(".xuan").each(function(index, selected){
			//TODO selected ans submit
			console.log(selected);
			var dataAnswer = $(selected).attr("data-answer");
			answerArr.push(dataAnswer);
		});
		return answerArr;
	},
	fnSubmit: function(){
		$(".kaoshi-popup-container").show();
		$("#fnTestHandlePaper").show();
	},
	fnKaoShiJiaoJuan: function(arg){
		if(arg == 1){
			var request = new Object();
			request.answerPaperId = cache.anspaper;
			var json = JSON.stringify(request);
			var url = "${pageContext.request.contextPath}/examination_json/handInAnExamPaper";
			var req = "&data=" + json;
			$.post(url,req,function(data, status){
				var res = jQuery.parseJSON(data);
				res = jQuery.parseJSON(res.output);
				if(res.result == '1'){
					$("#fnTestAchievement").show();
					var examResult = res.data;
					$("#text_test_result_1").html(examResult.endDate);
					$("#text_test_result_2").html(examResult.due);
					$("#text_test_result_3").html(examResult.all);
					$("#text_test_result_4").html(examResult.right);
					$("#text_test_result_5").html(examResult.wrong);
					$("#text_test_result_6").html(examResult.score);
				}
			},"html").error(function() { alert("系统故障"); });
		}else if(arg == 2){
			$("#fnTestHandlePaper").hide();
			$(".kaoshi-popup-container").hide();
		}else if(arg == 3){
			/* window.parent.location = "${pageContext.request.contextPath}/examination/examStart"; */
			window.parent.location = "${pageContext.request.contextPath}/examination/examList";
		}
	},
	fnShowQuestionList: function(){
		var cnt = 0;
		console.log(examQuestions.question_list);
		console.log(examQuestions.question_list_fillin);
		var tmpList = examQuestions.question_list_single;
		if(typeof(tmpList) != "undefined")
			$.each(tmpList,function(index, question){
				var li = '<li data-id="' + question.questionId + '" detail-id="' + question.id + '" class="row0 col0">' + (cnt++ + 1) + '</li>';
				$("#ulQuestionList").append(li);
			});
		tmpList = examQuestions.question_list_multi;
		if(typeof(tmpList) != "undefined")
			$.each(tmpList,function(index, question){
				var li = '<li data-id="' + question.questionId + '" detail-id="' + question.id + '" class="row0 col0">' + (cnt +++1) + '</li>';
				$("#ulQuestionList1").append(li);
			});
		tmpList = examQuestions.question_list_fillin;
		if(typeof(tmpList) != "undefined")
			$.each(tmpList,function(index, question){
				var li = '<li data-id="' + question.questionId + '" detail-id="' + question.id + '" class="row0 col0">' + (cnt +++1) + '</li>';
				$("#ulQuestionList2").append(li);
			});
		$("#i_cnt_question").html(cnt);
		$.fnQuestionItemClick();
		cache.curr_index = 1;
		cache.curr = examQuestions.question_list[0].questionId;
		$.fnShowQuestion(examQuestions.question_list[0].questionId);
	},
	fnGetBasicInformation: function(){
		var request = new Object();
		request.testId = examCache.paper_id;
		var json = JSON.stringify(request);
		var url = "${pageContext.request.contextPath}/examination_json/getBasicInformation";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#bStuName").html(res.data.stu);
			$("#bTimeTotal").html(res.data.time);
			$("#bTotalScore").html(res.data.score);
			$.timer(res.data.time * 60);
		//测试
		//	$.timer(10);
		},"html").error(function() { alert("系统故障"); });
	},
	fnOpenNewAnswerPaper: function(){
		var request = new Object();
		request.testId = examCache.paper_id;
		var json = JSON.stringify(request);
		var url = "${pageContext.request.contextPath}/examination_json/prepareAnswerPaper";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			cache.anspaper=res.data;
		},"html").error(function() { alert("系统故障"); });
	},
	fnQuestionItemClick: function(liId){
		$("#divQuestionsPaperListViewer").find("li").each(function(index, item){
			$(item).click(function(){
				cache.curr = $(item).attr("data-id");
				cache.curr_index = $(item).text();
				$.fnShowQuestion(cache.curr);
			});
		});
	},
	fnShowQuestion: function(questionId){
		$("#divMediaContainer").empty();
		var question = new Object();
		question.question_id = questionId;
		var json = JSON.stringify(question);
		var url = "${pageContext.request.contextPath}/examination_json/getQuestion";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			var tmpQuestionCache = null;
			
			var qt_seq = $("#dvExamQuestionContnetArea").find("[data-id=i_qt_seq]");
			
			$(qt_seq).html(cache.curr_index);
			
			var ans_type = res.data.ans_type;
			if(ans_type == 'ANS_F'){
				var _tmpQuestionContent = res.data.question;
				$.each(res.data.ans, function(index, item){
					var ansBtn = '<input type="text" data-id="' + item.id + '" name="fill-in" style="width:100px; border:0; border-bottom:1px solid #000; text-align:center;">';
					var _substr = "{" + item.id + "}";
					_tmpQuestionContent = _tmpQuestionContent.replace(_substr ,ansBtn);
					console.log(_substr);
					console.log(_tmpQuestionContent);
				});
				$("#dvExamQuestionContnetArea").find("[data-id=ul_answer_list]").empty();
				$("#divAnsList").empty();
				var i_qt_content = $("#dvExamQuestionContnetArea").find("[data-id=i_qt_content]");
				$(i_qt_content).html(_tmpQuestionContent);
				if(ans_type == "ANS_F"){
					var submitBtn = '<button data-item="check" class="option-btn option-check" type="button">确定</button>';
					$("#divAnsList").append(submitBtn);
					$("#divAnsList").find("button[data-item=check]").click(function(){
						//TODO submit answers
						var fillIn = null;
						var fillIns = new Array();
						$(i_qt_content).find("input[name=fill-in]").each(function(index, input){
							fillIn = new Object();
							var ansId = $(this).attr("data-id");
							fillIn.ansId = ansId;
							var ansVal = $(this).val();
							fillIn.ansVal = ansVal;
							console.log(fillIn);
							fillIns.push(fillIn);
						});
						$.fnFillInAnswer(fillIns);
					});
				}
			}else{
				//考试内容
				var i_qt_content = $("#dvExamQuestionContnetArea").find("[data-id=i_qt_content]");
				$(i_qt_content).html(res.data.question);
				//答案列表
				$("#divQuestionsPaperListViewer").find("li").each(function(index, questionItem){
					if($(questionItem).attr("data-id") == questionId){
						$(qt_seq).html($(questionItem).text());
						cache.curr_index = $(questionItem).text();
						tmpQuestionCache = $(questionItem);
					}
				});
				var seq = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
				var ul_answer_list = $("#dvExamQuestionContnetArea").find("[data-id=ul_answer_list]");
				
				$(ul_answer_list).empty();
				var clazz=$(tmpQuestionCache).attr("class");
				if(clazz.indexOf("dui") < 0 && clazz.indexOf("cuo") < 0){
					$("div").find("[data-item=result-tip]").css('display','none');
					$("#divAnsList").css('display','block');
					
					$("#divAnsList").empty();
					$("#divAnsList").append('<label>请选择：</label>');
					$.each(res.data.ans, function(index, item){
						var answer_item = '';
						var ansSeq = seq.charAt(index);
						answer_item = '<li>' + ansSeq + '.' + item.content + '</li>';
						$(ul_answer_list).append(answer_item);
						
						var ansBtn = '<button data-answer="' + item.id + '" class="option-btn" type="button">' + ansSeq + '</button>';
						$("#divAnsList").append(ansBtn);
					});
					//绑定事件
					$("#divAnsList").find("button[type=button]").each(function(index, btn){
						if(ans_type == "ANS_S"){
							$(btn).click(function(){
								var ansId = $(this).attr("data-answer");
								$.fnAnswer(ansId);
							});
						}else{
							$(btn).click(function(){
								//TODO add select event
								if($(btn).hasClass("xuan")){
									$(btn).removeClass("xuan");
								}else{
									$(btn).addClass("xuan");
								}
							});
						}
					});
					if(ans_type == "ANS_M"){
						var submitBtn = '<button data-item="check" class="option-btn option-check" type="button">确定</button>';
						$("#divAnsList").append(submitBtn);
						$("#divAnsList").find("button[data-item=check]").click(function(){
							//TODO submit answers
							/* $("#divAnsList").find("button[type=button]").each(function(index, button){
								if($(btn).hasClass("xuan")){
									//收集已选答案
								}
							}); */
							$.fnAnswer("");
						});
					}
					if(ans_type == "ANS_F"){
						var submitBtn = '<button data-item="check" class="option-btn option-check" type="button">确定</button>';
						$("#divAnsList").append(submitBtn);
						$("#divAnsList").find("button[data-item=check]").click(function(){
							//TODO submit answers
							$("#divAnsList").find("button[type=button]").each(function(index, button){
								if($(btn).hasClass("xuan")){
									
								}
							});
						});
					}
				}else{
					//TODO 回顾时
					//查询答题纸
					var html = null;
					if(clazz.indexOf("dui") > 0){
						html = '<p class="dui"><span class="al">回答正确!</span></p>';
					}

					if(clazz.indexOf("cuo") > 0){
						html = '<p class="cuo"><span class="al">回答错误!</span></p>';
					}
					$("div").find("[data-item=result-tip]").html(html);
					$("div").find("[data-item=result-tip]").css('display','block');
					$("#divAnsList").css('display','none');
				}
			}
			
			
			//file
			var files = res.data.file;
			if(typeof files != 'undefined'){
				$.each(files, function(index, file){
					var img = '<img alt="" src="${pageContext.request.contextPath}' + file[0] + '" width="300" height="200"><br><font color="1" size="2">图' + (index + 1) + ': ' + file[2]+ '</font><br><br><br>';
					$("#divMediaContainer").append(img);
					return false;
				});
			}
			
			
			if(res.result !="1"){
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnQuestionInit: function(){
		examination_cache.question_length = examQuestions.question_list.length;
		examination_cache.question_index = 0;
		$.fnGetQuestion(examination_cache.question_index);
	}/* ,
	fnExamTimer: function(){
		examCache.timeDue = examCache.timeDue - 1000;
		$("#lblExamTimer").html(examCache.timeDue/1000);
		if(examCache.timeDue < 1000){
			Window.clearInterval(examination_cache.interval);
			alert("考试结束，答案即将提交！");
			$.fnAnswerSubmit();
		}
	} */
});
$(function() {
	$.fnExamAgreements(true);
	console.log(examQuestions);
	$.fnShowQuestionList();
	$.fnOpenNewAnswerPaper();
	
});
//-->
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XXX考试系统</title>
</head>
<body>
	<div class="jkbd-main-main erjiyemian">
		<div class="kaoshi-container">
			<div class="ks-loading jkbd-loading"></div>
			<div class="kaoshi-container-inner jkbd-width wid-auto">
				<div class="kaoshi-popup-container">
					<div class="kaoshi-wrong-container">
						<div class="wrong-header">
							<div class="kaoshi-wrong-close"></div>
						</div>
						<div class="wrong-content">
							<p class="title">您刚做的题目答题错误，正确答案如下：</p>
							<p class="explain"></p>
							<p class="right-answer">
								正确答案：<span data-item="right-answer"></span>
							</p>
						</div>
						<div class="operate-container">
							<button type="button" class="kaoshi-btn-disable">继续考试</button>
							<p>以上正确答案确认无误后点击“继续考试”按钮开始下一题答题</p>
						</div>
						<div class="wrong-fotter">
							<p>
								页面将在<span>3</span>秒后自动关闭，回到考试状态！
							</p>
						</div>
					</div>
					<div class="kaoshi-jiaojuan-container" id="fnTestHandlePaper">
						<div class="jiaojuan-header"></div>
						<h2>考试确认窗口</h2>
						<div class="jiaojuan-content">
							<p>操作提示：</p>
							<p>1：点击【确认交卷】，将提交考试成绩，结束考试！</p>
							<p>2：点击【继续考试】，将关闭本窗口，继续考试！</p>
						</div>
						<div class="jiaojuan-fotter">
							<button data-item="submit" class="first-c" type="button" onclick="$.fnKaoShiJiaoJuan(1);">确认交卷</button>
							<button data-item="cancel" type="button" onclick="$.fnKaoShiJiaoJuan(2);">继续考试</button>
						</div>
					</div>
					<div class="kaoshi-jiaojuan-container" id="fnTestAchievement">
						<div class="jiaojuan-header"></div>
						<h2>考试完成</h2>
						<div class="jiaojuan-content">
							<h2>请稍后查询考试成绩</h2>
						</div>
						<div class="jiaojuan-content" style="display: none;">
							<p>考试成绩</p>
							<p>考试完成时间 <i id="text_test_result_1"></i></p>
							<p>共用时<i id="text_test_result_2"></i></p>
							<p>共答<i id="text_test_result_3"></i>题，答对<i id="text_test_result_4"></i>题，答错<i id="text_test_result_5"></i>题</p>
							<p>得分<i id="text_test_result_6"></i></p>
						</div>
						<div class="jiaojuan-fotter">
							<button data-item="cancel" type="button" onclick="$.fnKaoShiJiaoJuan(3);">完成</button>
						</div>
					</div>
					<div class="kaoshi-jiaojuan-container" id="fnAgreementFrame" style="width: 80%; height: 80%; margin-left: -40%;">
						<div class="jiaojuan-header"></div>
						<h2>考试协议</h2>
						<div class="jiaojuan-content" style="height: 450px;">
							<iframe src="${pageContext.request.contextPath}/exam/examAgreements" width="99%" height="100%"/>
						</div>
						<div class="jiaojuan-fotter" style="text-align: center;">
							<button data-item="submit" type="button" onclick="$.fnExamAgreements(false);">同意</button>
						</div>
					</div>
				</div>
				<div class="shiti-mask-container">
					<div class="shiti-mask-zz"></div>
					<div class="mask-img-content">
						<div class="mask-close"></div>
						<div class="mask-content"></div>
					</div>
				</div>
				<div class="kaoshi-wapper">
					<div class="info-up">
						<div class="infoup-left">
							<fieldset class="kaochang-info">
								<legend>考试</legend>
								<span>理论知识考试</span>
							</fieldset>
							<fieldset class="kaosheng-info">
								<legend>考生信息</legend>
								<div>
				<!-- 				<img src="/web/jkbd-app/resources/images/diandian.png">     -->
									<p class="name">考生姓名：<b id="bStuName"></b></p>
									<p>考试题数：<i id="i_cnt_question"></i>题</p>
									<p>考试时间：<i id=bTimeTotal></i>分钟</p>
									<p>合格标准：满分<i id="bTotalScore"></i>分</p>
								</div>
							</fieldset>
						</div>
						<div class="infoup-center">
							<fieldset class="kaochang-main" id="dvExamQuestionContnetArea">
								<legend>考试题目</legend>
								<div class="timu-container">
									<div class="timu-item clearfix">
										<div class="timu-content float-l">
											<div class="timu-x">
												<i class="i10" data-id="i_qt_seq">11.</i>
												<p class="timu-p" data-id="i_qt_content"></p>
											</div>
											<ul data-id="ul_answer_list">
											</ul>
										</div>
										<div class="result-container ">
											<div data-item="result-tip" class="result-info float-l" style="">
											</div>
											<div class="options-container float-l " id="divAnsList">
												<label>请选择：</label>
											</div>
										</div>
									</div>
								</div>
								<div class="media-container float-l" id="divMediaContainer">
								</div>
							</fieldset>
						</div>
					</div>
					<div class="info-middle clearfix">
						<fieldset class="time-info float-l">
							<legend>剩余时间</legend>
							<span id="left-time" >00:00</span>
						</fieldset>
						<fieldset class="tip-container float-l">
							<legend>提示信息</legend>
							<div class="tip-content">选择题，选择一个答案！</div>
						</fieldset>
						<div class="fun-btns clearfix float-l">
							<button data-item="prev" class="option-btn first-c bd_3blue float-l" onclick="$.fnFrontQuestion();" type="button">上一题</button>
							<button data-item="next" class="xiayiti option-btn bd_3blue float-l" onclick="$.fnNextQuestion();" type="button">下一题</button>
							<button data-item="jiaojuan" class="jiaojuan option-btn float-r" onclick="$.fnSubmit();" type="button">交卷</button>
						</div>
					</div>
					<div style="padding-top: 0;" class="info-down">
						<fieldset class="">
							<legend>答题信息</legend>
							<div data-item="datika-container" class="datika-container" id="divQuestionsPaperListViewer">
								<ul class="datika clearfix float-l-ul"
									data-type="question_list_fillin" >
									<div class="page_title">
										<h2 class="fl" style="text-align: left;">单选题</h2>
									</div>
								</ul>
								
								<ul class="datika clearfix float-l-ul" data-type="question_list_single" id="ulQuestionList">
									
								</ul>
								<ul class="datika clearfix float-l-ul"
									data-type="question_list_fillin" >
									<div class="page_title">
										<h2 class="fl" style="text-align: left;">多选题</h2>
									</div>
								</ul>
								<ul class="datika clearfix float-l-ul" data-type="question_list_multi" id="ulQuestionList1">
									
								</ul>
								<ul class="datika clearfix float-l-ul"
									data-type="question_list_fillin" >
									<div class="page_title">
										<h2 class="fl" style="text-align: left;">填空题</h2>
									</div>
								</ul>

								<ul class="datika clearfix float-l-ul" data-type="question_list_fillin" id="ulQuestionList2">
									
								</ul>
							</div>
						</fieldset>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>