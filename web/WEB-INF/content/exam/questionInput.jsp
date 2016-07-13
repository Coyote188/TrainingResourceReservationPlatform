<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;
$.extend({
	onRangeChange: function(eleId, lableViewer){
		var val = $("#" + eleId).val();
		$("#" + lableViewer).html(val);
	},
	newAnswerItem: function(){
		cacheObject.index ++;
		html = '<tr>';
		html += '<td>' + cacheObject.index + '</td>';
		html += '<td><textarea rows="2" cols="100"></textarea></td>';
		html += '<td><label id="lblAndDeg_' + cacheObject.index + '">0</label><input id="rgAndDeg_' + cacheObject.index + '" type="range" min="1" max="10" step="1" value="1" onchange="$.onRangeChange(\'rgAndDeg_'+cacheObject.index+'\',\'lblAndDeg_'+cacheObject.index+'\');"></td>';
		html += '<td><label>正确</label><input type="radio" name="and_result_' + cacheObject.index + '" value="R"><br><label>错误</label><input type="radio" name="and_result_' + cacheObject.index + '" value="W"></td>';
		html += '</tr>';
		$("#tblAnsList").append(html);
	},
	save: function(){
		if(confirm('试题编写完成，请确认试题内及答案无误后确认提交！')){
			var question = new Object();
			question.qt_question = $("#txtQuestion").val();
			question.qt_ans_type = $("input[name=rd_ans_type]:checked").val();
			question.qt_class = $("#sltClass").val();
			question.qt_deg_difficulty = $("#rgDegDifficulty").val();
			question.qt_content_type = $("input[name=rd_question_type]").val();
			//答案部分
			var ansList = new Array();
			$("#tblAnsList>tbody>tr").each(function(idx, tr){
				var answer = new Object();
				answer.ans_content = $(tr).find("textarea").val();
				answer.ans_proportion = $(tr).find("input[type=range]").val();
				answer.ans_result = $(tr).find("input[type=radio][name^=and_result]:checked").val();
				ansList.push(answer);
			});
			question.answer_list = ansList;
			var json = JSON.stringify(question);
			var url = "examJson/questionInputJson";
			var req = "&data=" + json;
			$.post(url,req,function(data, status){
				var res = jQuery.parseJSON(data);
				res = jQuery.parseJSON(res.output);
				cu.toast(res.msg);
			},"html").error(function() { alert("系统故障"); });
		}
	},
	saveFiles: function(){
		var question = new Object();
		question.qt_question = encodeURI(encodeURI($("#txtQuestion").val()));
		question.qt_ans_type = $("input[name=rd_ans_type]:checked").val();
		question.qt_class = $("#sltClass").val();
		question.qt_deg_difficulty = $("#rgDegDifficulty").val();
		question.qt_content_type = encodeURI(encodeURI($("input[name=rd_question_type]").val()));
		//答案部分
		var ids = new Array();
		var fileDescArr = new Array();
		$("#tdAttachmentFrame").find("input[name=uploads]").each(function(index, input){
			var _id = $(input).attr("id");
			ids.push(_id);
			
			var fileDesc = encodeURI(encodeURI($("#tt_" + _id).val()));
			fileDescArr.push(fileDesc);
		});
		question.fileDescArr = fileDescArr;
		var ansList = new Array();
		$("#tblAnsList>tbody>tr").each(function(idx, tr){
			var answer = new Object();
			answer.ans_content = encodeURI(encodeURI($(tr).find("textarea").val()));
			answer.ans_proportion = $(tr).find("input[type=range]").val();
			answer.ans_result = $(tr).find("input[type=radio][name^=and_result]:checked").val();
			ansList.push(answer);
		});
		question.answer_list = ansList;
		var json = JSON.stringify(question);
		var req = "data=" + json;
		$.ajaxFileUpload({
			url:'upload/uploadMult?' + req,
			secureuri:false,
			fileElementId:ids,
			dataType: 'json',
			data: json,
			success: function (data, status){
				var res = jQuery.parseJSON(data.output);
				if("1" == res.result){
					$.searchKnowlage();
				}
				BootstrapDialogUtil.close();
			},
			error: function (data, status, e){
				alert(e);
			}
		});
		return false;
	},
	fnAddAttachment: function(){
		cacheObject.index ++;
		var html = '<div class="qtAttachSelect"><input type="file" name="uploads" id="file_upload_' + cacheObject.index + '" /><br><textarea id="tt_file_upload_' + cacheObject.index + '" rows="1" cols="100" maxlength="100"></textarea></div>';
		$("#tdAttachmentFrame").append(html);
	}
});
$(function(){
	selectDictItem("#sltClass","knowlage","basic");
});
</script>
<style>
<!--
.qtAttachSelect
{
text-align: left; border-bottom: 1px solid #c6c7c2; margin-top: 5px;
}
.question_input
{
	width: 100%;
}
.question_input tr
{
	border-bottom: 1px solid #c6c7c2;
}
.question_input td
{
	color: #333;
	font-size: 1em;
	padding: 6px 10px;
	text-align: left;
	background: #fff;
	padding: 4px;
	border-right: 1px solid #c6c7c2;
}
-->
</style>
<div style="overflow-y:scroll; border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;">
	<div style="border-bottom: 1px solid #c6c7c2; margin: 5px 0 5px 0;">
		<div style="width: 100%; border-bottom: 1px solid #c6c7c2;">
			<font color="red" size="2">
				1、请选择相应的题目内容类型（文字、图文、视频等），题目分类（无线、有线、装备等），并输入题目内容（题干）；<br>
				2、选择/输入难度系数（难度系数用于系统自动生成试题时计算题目占分数比重），选择答案类型（单选、多选）；<br>
				3、当题目类型为图文、视频时，请对应下方附件窗口，选择对应的文件上传，上传格式为图片（jpg、png、gif）视频（.mp4），视频文件最大支持100M；<br>
				4、添加对应答案（点击新增答案按钮）并输入答案内容及答案分会占比重（多选时）以及结果后，点击保存试题即可。
			</font>
		</div>
	</div>
	<table class="question_input">
		<tbody>
			<tr>
				<td width="10%">题目类型</td>
				<td width="40%">
					<select class="select20" id="sltClass">
					</select>
				</td>
				<td width="10%">题目类型</td>
				<td  width="40%">
					文字<input type="radio" name="rd_question_type" value="Q_TXT">
					<!-- 图片<input type="radio" name="rd_question_type" value="Q_PIC">
					视频<input type="radio" name="rd_question_type" value="Q_MOV">
					音频<input type="radio" name="rd_question_type" value="Q_VIO"> -->
				</td>
			</tr>
			<tr>
				<td>题干</td>
				<td colspan="3">
					<textarea rows="5" id="txtQuestion" style="width: 100%;"></textarea>
				</td>
			</tr>
			<tr>
				<td>难度系数</td>
				<td>
					<label id="lblDegDifficulty">0</label>
					<input id="rgDegDifficulty" type="range" min="0" max="100" step="1" value="1" onchange="$.onRangeChange('rgDegDifficulty','lblDegDifficulty');">
				</td>
				<td>答案类型</td>
				<td>
					单选<input type="radio" name="rd_ans_type" value="ANS_S">
					多选<input type="radio" name="rd_ans_type" value="ANS_M">
				</td>
			</tr>
			<tr hidden="true">
				<td>
					附件
					<a onclick="$.fnAddAttachment()">添加附件</a>
				</td>
				<td id="tdAttachmentFrame">
					<div class="qtAttachSelect">
						<input type="file" name="uploads" id="file_upload_1" /><br>
						<textarea id="tt_file_upload_1" rows="1" cols="100" maxlength="100"></textarea>
					</div>
				</td>
				<td>
					<label style="color: red;">
						请严格按要求上传相应附件，方便考试时播放
					</label>
				</td>
				<td></td>
			</tr>
		</tbody>
	</table>
	<!-- 新增答案按钮 -->
	<div style="border-bottom: 1px solid #c6c7c2;">
		<input type="button" onclick="$.newAnswerItem();" class="button green" value="新增答案" style="width: 150px; margin: 10px 0 10px 20%;">
		<input type="button" onclick="$.save();" class="button red" value="保存试题" style="width: 100px; margin: 10px 10% 10px 30%;">
		<input type="button" onclick="$.saveFiles();" class="button red" value="保存试题" style="width: 100px; margin: 10px 10% 10px 30%;" hidden="true">
	</div>
	<!-- 答案 -->
	<table class="cu-table" style="width: 100%;" id="tblAnsList">
		<thead>
			<tr>
				<th width="10%">答案编号</th>
				<th width="40%">答案内容</th>
				<th width="20%">答案占比重</th>
				<th width="10%">结果</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>1</td>
				<td>
					<textarea rows="2" cols="100"></textarea>
				</td>
				<td>
					<label id="lblAndDeg_1">0</label>
					<input id="rgAndDeg_1" type="range" min="1" max="10" step="1" value="1" onchange="$.onRangeChange('rgAndDeg_1','lblAndDeg_1');">
				</td>
				<td>
					<label>正确</label>
					<input type="radio" name="and_result_1" value="R">
					<br>
					<label>错误</label>
					<input type="radio" name="and_result_1" value="W">
				</td>
			</tr>
		</tbody>
	</table>
	
</div> 