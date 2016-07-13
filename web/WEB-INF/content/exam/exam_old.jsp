<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
<!--
var examination_cache = new Object();
$.extend({
	fnNextQuestion: function(){
		examination_cache.question_index ++;
		if(examination_cache.question_index < examination_cache.question_length){
			$.fnGetQuestion(examination_cache.question_index);
		}
	},
	fnFrontQuestion: function(){
		examination_cache.question_index --;
		if(examination_cache.question_index < examination_cache.question_length){
			$.fnGetQuestion(examination_cache.question_index);
		}
	},
	fnAnswer:function(){
		var index = examination_cache.question_index;
		var ansList = new Array();
		if($("#ulAnsList").find("input[name=answer]:checked").length > 0){
			$("#ulAnsList").find("input[name=answer]:checked").each(function(i, answer){
				var ansItem = $(answer).val();
				ansList.push(ansItem);
			});
			examQuestions[index].ans = ansList;
			if(confirm("回答完此题，确认后进入下一题")){
				if((index + 1) >= examQuestions.length){
					$.fnSubmit();
				}else
					$.fnNextQuestion();
			}
		}else{
			alert("请选择至少一个答案！");
		}
	},
	fnSubmit: function(){
		var json = JSON.stringify(examQuestions);
		var url = "examination_json/handInAnExamPaper";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			
		},"html").error(function() { alert("系统故障"); });
	},
	fnGetQuestion: function(index){
		var question = new Object();
		question.question_id = examQuestions[index].questionId;
		var json = JSON.stringify(question);
		var url = "examination_json/getQuestion";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#dvExamQuestionContnetArea").empty();
			if(res.data.content_type == 'Q_TXT'){
				var h4 = '<h4>' + res.data.question + '</h4>';
				$("#dvExamQuestionContnetArea").append(h4);
			}else{
				var h4 = '<h4>' + res.data.question + '</h4>';
				$("#exam_question_file").append(h4);
			}
			
			//file
			var files = res.data.file;
			if(typeof files != 'undefined'){
				$.each(files, function(index, file){
					var img = '<img alt="" src="${pageContext.request.contextPath}' + file[0] + '"><br><font color="1" size="2">图' + (index + 1) + ': ' + file[2]+ '</font><br><br><br>';
					$("#dvExamQuestionContnetArea").append(img);
				});
			}
			
			var ans_type = res.data.ans_type;
			$("#ulAnsList").empty();
			$.each(res.data.ans, function(index, item){
				var answer_item = '';
				if(ans_type == 'ANS_S'){
					answer_item = '<li value="' + item.id + '" type="disc"><input type="radio" value="' + item.id + '" name="answer"> ' + item.content + '</li>';
				}else{
					answer_item = '<li value="' + item.id + '" type="square"><input type="checkbox" value="' + item.id + '" name="answer"> ' + item.content + '</li>';
				}
				$("#ulAnsList").append(answer_item);
			});
			
			if(res.result !="1"){
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnQuestionInit: function(){
		examination_cache.question_length = examQuestions.length;
		examination_cache.question_index = 0;
		$.fnGetQuestion(examination_cache.question_index);
	},
	fnExamTimer: function(){
		examCache.timeDue = examCache.timeDue - 1000;
		$("#lblExamTimer").html(examCache.timeDue/1000);
		if(examCache.timeDue < 1000){
			Window.clearInterval(examination_cache.interval);
			alert("考试结束，答案即将提交！");
			$.fnAnswerSubmit();
		}
	}
});
$(function(){
	$.fnQuestionInit();
	examination_cache.interval = setInterval("$.fnExamTimer()",1000);
});
//-->
</script>
<style>
<!--
.exam_content
{
	width: 100%;
	height: 60%;
	position: relative;
	float: left;
	background-color: #fff;
	border-bottom:  4px solid #dbeaf9;
	overflow: auto;
}
.exam_content_content
{
	width: 100%;
	height: 80%;
	position: relative;
	float: left;
	background-color: #fff;
	border-bottom:  1px solid #dbeaf9;
	overflow: auto;
}
.exam_content_content_timer
{
	width: 100%;
	height: 8%;
	position: relative;
	float: left;
	background-color: #fff;
	border-bottom:  1px solid #dbeaf9;
	overflow: hidden;
	line-height: 40px;
}
.exam_content_content_timer input
{
	margin-top: 5px;
	float: right;
}
.exam_content_control
{
	width: 100%;
	height: 10%;
	position: relative;
	float: left;
	background-color: #fff;
	padding: 2% 20px 0 20px;
}
.exam_content_control input
{
	margin: 10px 20px 5px 20px;
}
.exam_media
{
	width: 40%;
	height: 40%;
	float: left;
	position: relative;
	background-color: #fff;
	border-right: 4px solid #dbeaf9;
	overflow: auto;
}
.exam_answer
{
	width: 60%;
	height: 40%;
	position: relative;
	float: left;
	background-color: #fff;
	overflow: auto;
}
.exam_answer_content
{
	width: 100%;
	height: 80%;
}
.exam_answer_content ol
{
	margin: 10px 0 10px 30px;
}
.exam_answer_content li
{
	margin: 0 0 10px 5px;
}
.exam_answer_control
{
	width: 100%;
	height: 10%;
	padding-right: 10%;
}
-->
</style>
<div>
	<div class="exam_content">
		<div class="exam_content_content_timer" id="dvExamTimer">
			考试时间：<font id="lblExamTimer" color="red" size="2"> </font>秒
			<input type="button" value="交卷" onclick="$.fnSubmit()" class="button yellow">
		</div>
		<div class="exam_content_content" id="dvExamQuestionContnetArea">
			
		</div>
		<div class="exam_content_control">
			<!-- <input type="button" value="上一题" style="float: left; position: relative;" onclick="$.fnFrontQuestion();">
			<input type="button" value="下一题" style="float: right; position: relative;" onclick="$.fnNextQuestion();"> -->
		</div>
	</div>
	<div class="exam_media" id="exam_question_file">
	
	</div>
	<div class="exam_answer">
		<div class="exam_answer_content">
			<ol id="ulAnsList">
				
			</ol>
		</div>
		<div class="exam_answer_control">
			<input type="button" value="确认答案" class="button red" style="float: right; position: relative;" onclick="$.fnAnswer()">
		</div>
	</div>
</div>