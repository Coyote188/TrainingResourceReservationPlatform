<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$.extend({
	fnQuestionEditPageInit: function(){
		var question = new Object();
		question.question_id = cacheObject.question; //参数未取到
		var json = JSON.stringify(question);
		var req = "&data=" + json;
		$.post("exam/getOneQuestion",req,function(data, status){
			var res = jQuery.parseJSON(data.output);
			if(res.result == 1){
				
				var _question = res.data.question;
				$("#sltAnsType").val(_question.qtAnsType);
				selectDictItem("#slt_stu_rank","stu_rank",_question.userRank);
				selectDictItem("#slt_knowlage","knowlage",_question.qtClass);
				$("#txtQuestion").val(_question.qtQuestion);
				$("#iptQuesDeg").val(_question.qtDegDifficulty);
				$("#sltQtContentType").val(_question.qtContentType);
				
				var _answer = res.data.answer;
				$.each(_answer, function(index, answer){
					var _html = '';
					_html += '<tr data-id="' + answer.id + '">';
					_html += '<td>';
					_html += '<textarea data-name="ansContent" rows="2" cols="50" style="resize: none;">'+ answer.ansContent +'</textarea>';
					_html += '</td>';
					_html += '<td>';
					_html += '<input data-name="ansProportion" type="text" class="input30" value="' + answer.ansProportion + '">';
					_html += '</td>';
					_html += '<td>';
					_html += '<select data-name="ansResult" class="select20">';
					if(answer.ansResult == "R"){
						_html += '<option value="R" selected="selected">正确</option>';
						_html += '<option value="W">错误</option>';
					}else{
						_html += '<option value="R">正确</option>';
						_html += '<option value="W" selected="selected">错误</option>';
					}
					_html += '</select>';
					_html += '</td>';
					_html += '</tr>';
					$("#tblAnswerList").append(_html);
				});
				
				
			}else{
				//TODO 出错
			}
		});
	},
	fnUpdateQuestion: function(){
		var _question = new Object();
		_question.id = cacheObject.question;
		_question.qtAnsType = $("#sltAnsType").val();
		_question.userRank = $("#slt_stu_rank").val();
		_question.qtClass = $("#slt_knowlage").val();
		_question.qtQuestion = $("#txtQuestion").val();
		_question.qtDegDifficulty = $("#iptQuesDeg").val();
		_question.qtContentType = $("#sltQtContentType").val();
		
		//
		var _ansList = new Array();
		$("#tblAnswerList tbody").find("tr").each(function(index, line){
			var _answer = new Object();
			_answer.id = $(line).attr("data-id");
			_answer.ansContent = $(line).find("textarea[data-name=ansContent]").text();
			console.log(encodeURI(_answer.ansContent));
			_answer.ansProportion = $(line).find("input[data-name=ansProportion]").val();
			_answer.ansResult = $(line).find("select").val();
			_ansList.push(_answer);
		});
		_question.answer = _ansList;
		console.log(_question);
		var json = JSON.stringify(_question);
		var req = "&data=" + encodeURI(encodeURI(json));
		console.log(req);
		$.ajaxFileUpload({
			url:'upload/uploadifyWithQuestionUpdate?option=question_update' + req,
			secureuri:false,
			fileElementId:['uploadify'],
			dataType: 'json',
			data: json,
			success: function (data, status){
				cu.toast.close();
				var res = jQuery.parseJSON(data.output);
				cu.toast(res.msg);
				if("1" == res.result){
					$.fnQuestionEditPageInit();
				}
				BootstrapDialogUtil.close();
			},
			error: function (data, status, e){
				cu.toast.close();
				alert(e);
			}
		});
	},
	fnSelectedUnitInit:function(){
		if(answer.ansResult == "R"){
			
		}
	}
});
$(function(){
	 setTimeout("$.fnQuestionEditPageInit();", 500);
});
</script>
<style>
.fileUpload{
	width: 100%;
	border: 1px solid #aed0ea;
}
.fileUpload tr{
	border-top: 1px solid #aed0ea;
}
.fileUpload textarea{
	margin: 5px 0 5px 0;
}
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;">
	<table class="cu-table" style="width: 100%;">
		<tbody>
			<tr>
				<th scope="row">答案类型</th>
				<td>
					<select class="select30" id="sltAnsType">
						<option value="ANS_S">单选</option>
						<option value="ANS_M">多选</option>
						<option value="ANS_F">填空</option>
					</select>
				</td>
				<th>适用学员</th>
				<td>
					<select id="slt_stu_rank" class="select30">
						<option></option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">问题归属</th>
				<td>
					<select id="slt_knowlage" class="select30">
					</select>
				</td>
				<th>难度系数</th>
				<td>
					<input type="text" onkeyup="this.value=this.value.replace(/\D/g, '')" class="input30" id="iptQuesDeg">
				</td>
			</tr>
			<tr>
				<th scope="row">问题类型</th>
				<td>
					<select class="select20" id="sltQtContentType">
						<option value="Q_TXT">文本</option>
						<option value="Q_PIC">图文</option>
					</select>
				</td>
				<th>
					文件
				</th>
				<td>
					<a href="javascript:;" style="margin-left: 40%;" class="fileUpController">选择文件
						<input id='uploadify' size="50" name='uploadify' type='file'  onchange="fileChange(this);" style="cursor: pointer;"/>
					</a>
				</td>
			</tr>
			<tr>
				<th scope="row">问题</th>
				<td colspan="3">
					<textarea rows="5" cols="100" style="resize: none;" id="txtQuestion"></textarea>
				</td>
			</tr>
		</tbody>
		
	</table>
	<table class="cu-table" style="width: 100%;" id="tblAnswerList">
		<thead>
			<tr>
				<th>
					答案内容
				</th>
				<th>
					答案占比
				</th>
				<th>
					结果
				</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<div style="text-align: right; padding-top: 15px;">
		<input type="button" value="更新" class="button" onclick="$.fnUpdateQuestion();">
	</div>
</div> 