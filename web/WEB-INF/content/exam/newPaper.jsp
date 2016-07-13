<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;
cacheObject.paperId = null;
$.extend({
	searchAllQuestions: function(){
		var request = new Object();
		request.ans_type = $("input[type=radio][name=rd_ans_type]:checked").val();
		request.degDifficultyFrom = $("#rgDegDifficulty_st").val(); 
		request.degDifficultyTo = $("#rgDegDifficulty_nd").val();
		request.question_type = $("input[type=radio][name=rd_question_type]:checked").val();
		request.clazz = $("#sltClass").val();
		
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("exam/questionSearch",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$("#tblQuesList_newpaper").empty();
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<th></td>';
					tr += '<td>' + line[3] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[5] + '</td>';
					tr += '<td>' + line[4] + '</td>';
					tr += '<td>' + line[6] + '</td>';
					tr += '<td><input type="checkbox" name="chk_question_selected" value="' + line[0] + '"></td>';
					tr += '</tr>';
					$("#tblQuesList_newpaper").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnPaperSubmit: function(){
		if(!confirm("保存试卷后，可在我的试卷中对试卷的分数做调整，是否确定保存？")){
			return;
		}
		var paper = new Object();
		paper.paper_id = cacheObject.paperId;
		var json = JSON.stringify(paper);
		var url = "examJson/submitNewPaper";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				var paperId = res.data.paper_id;
				cacheObject.paperId = paperId;
				$("#dvPaperConfigration").hide();
				$("#dvQuestionsSearchArgs").show();
				$("#dvQuestionsSearchResult").show();
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnNewPaper: function(){
		var paper = new Object();
		paper.test_duration = $("#ipt_test_duration").val();
		paper.test_score = $("#ipt_test_score").val();
		paper.test_difficulty = $("#slt_test_difficulty").val();
		paper.test_desc = $("#txt_test_desc").val();
		console.log(paper.test_desc);
		paper.test_date = $("#ipt_test_date").val();
		if(confirm("确认无误，确认提交！")){
			var json = JSON.stringify(paper);
			var url = "examJson/createNewPaper";
			var req = "&data=" + json;
			$.post(url,req,function(data, status){
				var res = jQuery.parseJSON(data);
				res = jQuery.parseJSON(res.output);
				if(res.result =="1"){
					var paperId = res.data.paper_id;
					cacheObject.paperId = paperId;
					$("#dvPaperConfigration").hide();
					$("#dvQuestionsSearchArgs").show();
					$("#dvQuestionsSearchResult").show();
				} else {
					cu.toast(res.msg);
				}
			},"html").error(function() { alert("系统故障"); });
		}
	},
	fnQuestionAddList: function(){
		if(!confirm("您已经选择了部分试题，确认添加到试卷中，添加后在当前页面无法修改！"))
			return;
		var paper = new Object();
		paper.paper_id = cacheObject.paperId;
		var questionArray = new Array();
		$("#tblQuesList_newpaper").find("input[type=checkbox]:checked").each(function(index, checkbox){
			var questionId = $(checkbox).val();
			var question = new Object();
			question.question_id = questionId;
			questionArray.push(question);
		});
		paper.question_list = questionArray;
		var json = JSON.stringify(paper);
		var url = "examJson/addQuestionList";
		var req = "&data=" + json;
		$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result !="1"){
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnQuestionSeletedList: function(){
		var uri = "exam/paperTmp";
		BootstrapDialogUtil.loadUriDialog("试卷修改", uri, "800", "#fff", true);
	}
});
$(function(){
	$.searchAllQuestions();
	selectDictItem("#sltClass","knowlage","basic");
	$("#ipt_test_date").datepicker();
});
</script>
<style>
.paper_class{
	width: 100%;
	box-sizing: border-box;
}
.paper_class tr{
	font-size: 14px;
	border: 1px solid #aed0ea;
	color: #2779aa;
    font-size: 1em;
    text-align: center;
}
.paper_class_td{
	padding: 4px 0 4px 0;
	border: 1px solid #aed0ea;
}
.paper_class td{
	padding: 4px 0 4px 0;
}
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;overflow-y: scroll;overflow-x: hidden;">
	<div>
		<font color="red" size="2">
		1、根据实际情况添写试卷概述信息（难度、时长、总分、描述）后，创建保存试卷；<br>
		2、根据试卷查询窗口中提示，选择对应试题查询条件，点击查询，系统将列出所有符合条件的试题以供选择；<br>
		3、勾选对应试题，点击填加按钮，将试题添加到该试卷中即可完成试卷的组卷操作。在已选题清单中，列出所有该试卷包含试题。<br>
		4、在全部试题选择完成后，需要按个人要求，对试题分数等内容做相应调整，请在已选试题清单中调整，最终保存试卷即可。<br>
		5、在保存完成之前，请勿刷新该页面。
		</font>
	</div>
	<!-- 试卷配置 -->
	<div id="dvPaperConfigration">
		<div style="width: 100%; height: 20px; background-color: #5599FF; text-align: center;">
			<label style="color: #fff; ">
				试卷设置
			</label>
		</div>
		<table class="paper_class">
			<tbody>
				<tr>
					<td class="paper_class_td">考试难度</td>
					<td>
						<select class="select20" id="slt_test_difficulty">
							<option value="easy">简单</option>
							<option value="simple">中等</option>
							<option value="hard">困难</option>
						</select>
					</td>
					<td class="paper_class_td">考试时长</td>
					<td><input type="number" class="input30" step="10" min="30" max="200" id="ipt_test_duration">分钟</td>
					<td class="paper_class_td">考卷总分</td>
					<td><input type="number" class="input30" step="10" min="60" id="ipt_test_score">分</td>
					<td class="paper_class_td">考试时间</td>
					<td><input type="datetime" class="input30" step="10" min="60" id="ipt_test_date"></td>
				</tr>
				<tr>
					<td class="paper_class_td">考试描述</td>
					<td colspan="5">
						<textarea rows="6" style="width: 95%;" id="txt_test_desc"></textarea>
					</td>
					<td></td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<input type="button" onclick="$.fnNewPaper();" class="button red" value="创建试卷" style="width: 120px; margin: 5px 0 5px 70%;">
	</div>
	<!-- 试题查询 -->
	<div id="dvQuestionsSearchArgs" hidden="true">
		<div style="width: 100%; height: 20px; background-color: #5599FF; text-align: center;">
			<label style="color: #fff; ">
				试卷查询
			</label>
		</div>
		<table class="cu-table" style="width: 100%;">
			<tbody>
				<tr>
					<td class="paper_class_td">试题难度</td>
					<td>
						<input id="rgDegDifficulty_st" type="range" min="0" max="100" step="1">
						<br>至<br>
						<input id="rgDegDifficulty_nd" type="range" min="0" max="100" step="1">
					</td>
					<td>题目类型</td>
					<td>
						文字<input type="radio" name="rd_question_type" value="Q_TXT" checked="checked">
						<!-- 图片<input type="radio" name="rd_question_type" value="Q_PIC">
						视频<input type="radio" name="rd_question_type" value="Q_MOV">
						音频<input type="radio" name="rd_question_type" value="Q_VIO"> -->
					</td>
				</tr>
				<tr>
					<td>试题类型</td>
					<td>
						<select class="select20" id="sltClass"></select>
					</td>
					<td>答案类型</td>
					<td>
						单选<input type="radio" name="rd_ans_type" value="ANS_S" checked="checked">
						多选<input type="radio" name="rd_ans_type" value="ANS_M">
					</td>
				</tr>
			</tbody>
		</table>
		<input type="button" onclick="$.fnQuestionSeletedList();" class="button gray" value="已选题清单" style="width: 170px; margin: 5px 0 5px 20%;">
		<input type="button" onclick="$.searchAllQuestions();" class="button green" value="查询" style="width: 120px; margin: 5px 0 5px 20%;">
		<input type="button" onclick="$.fnPaperSubmit();" class="button green" value="保存试卷(完成时)" style="width: 120px; margin: 5px 0 5px 20%;">
	</div>
	<!-- 问题清单 -->
	<div id="dvQuestionsSearchResult" hidden="true" >
		<div style="width: 100%; height: 40px; background-color: #5599FF; text-align: center; line-height: 40px;">
			<label style="color: #fff; margin-left: 20%;">题库</label>
			<input type="button" value="填加" class="button yellow" style="margin: 0px 0 0px 70%; width: 80px; height: 20px; padding: 1px 0 1px 0; line-height: 20px;" onclick="$.fnQuestionAddList()">
		</div>
		<table class="cu-table" style="width: 100%;">
			<thead>
				<tr>
					<th width="2%"></th>
					<th width="8%">题目类型</th>
					<th width="8%">答案类型</th>
					<th width="20%">题目</th>
					<th width="6%">题干类型</th>
					<th width="4%">难度系数</th>
					<th width="10%">日期</th>
					<th width="5%">选择</th>
				</tr>
			</thead>
			<tbody id="tblQuesList_newpaper">
			</tbody>
		</table>
	</div>
</div> 