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
				//图片处理
				var files = res.data.file;
				$.each(files, function(index, _image){
					var file_dir = _image[0];
					var file_name = _image[3];
					
					$("#pop_pic_preview li img").attr("src", "${pageContext.request.contextPath}" + file_dir);
					$("#btnPopImgPreviewer").text(file_name);
					return false;
				});
				
				
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
			_answer.ansContent = $(line).find("textarea[data-name=ansContent]").val();
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
	},
	fnPicPreview: function(option){
		if(option == 1)
			$("#pop_pic_preview").show();
		else
			$("#pop_pic_preview").hide();
	}
});
$(function(){
	 setTimeout("$.fnQuestionEditPageInit();", 500);
});
</script>
<style>
.file-modify-upload {
    position: relative;
    display: inline-block;
    background: #D0EEFF;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file-modify-upload input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file-modify-upload:hover {
    background: #AADFFD;
    border-color: #78C3F3;
    color: #004974;
    text-decoration: none;
}
.file-image-view {
    position: relative;
    display: inline-block;
    background: #EEFFBB;
    border: 1px solid #DDFF77;
    border-radius: 20px;
    padding: 4px 10px;
    overflow: hidden;
    color: #1E88C7;
    text-decoration: none;
    text-indent: 0;
    line-height: 18px;
}
.ban{ width:960px; height:800px; position:relative; overflow:hidden;margin:40px auto 0 auto;}
.ban2{ width:500px; height:500px; position:relative; overflow:hidden;}
.ban2 ul{ position:absolute; left:0; top:0;}
.ban2 ul li{ width:500px; height:500px;}
.prev{ float:left; cursor:pointer;}
.num{ height:82px;overflow:hidden; width:430px; position:relative;float:left;}
.min_pic{ padding-top:10px; width:500px;}
.num ul{ position:absolute; left:0; top:0;}
.num ul li{ width:80px; height:80px; margin-right:5px; padding:1px;}
.num ul li.on{ border:1px solid red; padding:0;}
.prev_btn1{ width:16px; text-align:center; height:18px; margin-top:40px; margin-right:20px; cursor:pointer; float:left;}
.next_btn1{  width:16px; text-align:center; height:18px; margin-top:40px;cursor:pointer;float:right;}
.prev1{ position:absolute; top:220px; left:20px; width:28px; height:51px;z-index:9;cursor:pointer;}
.next1{ position:absolute; top:220px; right:20px; width:28px; height:51px;z-index:9;cursor:pointer;}
.mhc{ background:#000; width:100%;opacity:0.5;-moz-opacity:0.5;filter:alpha(Opacity=50); position:absolute; left:0; top:0; display:none;}
.pop_up{ width:500px; height:500px; padding:10px; background:#fff; position:fixed; -position:absolute; left:50%; top:50%; margin-left:-255px; margin-top:-255px; display:none; z-index:99;}
.pop_up_xx{ width:40px; height:40px; position:absolute; top:-40px; right:0; cursor:pointer;}
.pop_up2{ width:500px; height:500px; position:relative; overflow:hidden;}
.pop_up2{ width:500px; height:500px; position:relative; overflow:hidden; float:left;}
.pop_up2 ul{ position:absolute; left:0; top:0;}
.pop_up2 ul li{ width:500px; height:500px; float:left;}
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
					<a href="javascript:;" class="file-image-view" onclick="$.fnPicPreview(1);" id="btnPopImgPreviewer"></a>
					<a href="javascript:;" class="file-modify-upload">修改
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

<div class="pop_up" id="pop_pic_preview" style="display: none;">
	<div class="pop_up_xx">
		<img src="images/chacha3.png" width="40" height="40" alt="" onclick="$.fnPicPreview(2);">
	</div>
	<div class="pop_up2" id="ban_pic2">
		<ul style="width: 5000px; left: 0px;">
			<li><a href="javascript:;"><img src="" width="500" height="500" alt=""></a></li>
		</ul>
	</div>
</div>
