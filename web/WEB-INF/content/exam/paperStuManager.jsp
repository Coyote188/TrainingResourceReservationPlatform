<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
HttpSession s = request.getSession(); 
%>
<script type="text/javascript">
var cacheObject = new Object();
cacheObject.index = 1;

$.extend({
	fnStuConfig: function(roleId){
		cacheObject.roleId = roleId;
		var uri = "exam/paperStuManager?id=ROLE145009749723012955";
		BootstrapDialogUtil.loadUriDialog("考生管理", uri, "800", "#fff", true);
	},
	fnPopPaperConfigClose: function(){
		$.searchQuestions();
	},
	fnOrgLoad: function(){
		cacheObject.paper_id = "<%=s.getAttribute("paper_id") %>";
		$.post("examination/getOrgsList",null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<option value="' + line[0] + '">' + line[1] + '</option>';
					$("#sltOrgList").append(tr);
				});
				
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnSearchStu: function(){
		var request = new Object();
		request.orgId = $("#sltOrgList").val();
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("examination/getStuByOrg",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblSelectUsers").empty();
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td><input type="checkbox" value="' + line[0] + '" name="paperStuToBeSelect"></td>';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '</tr>';
					$("#tblSelectUsers").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnButtonAdd: function(){
		var stuArr = new Array();
		$("#tblSelectUsers").find("input:checkbox:checked").each(function(idx, cbx){
			stuArr.push($(cbx).val());
		});
		var request = new Object();
		request.stus = stuArr;
		request.paper_id = cacheObject.paper_id;
		request.op = "add";
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("examination/addStuToExam",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblAddedUsers").empty();
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td></td>';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '<td><input type="button" value="删除" onclick="$.fnAddStuRemove(\'' + line[3] + '\')"></td>';
					tr += '</tr>';
					$("#tblAddedUsers").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	},
	fnAddStuRemove: function(stuId) {
		var request = new Object();
		request.stus = stuId;
		request.paper_id = cacheObject.paper_id;
		request.op = "remove";
		var json = JSON.stringify(request);
		var req = "&data=" + json;
		$.post("examination/addStuToExam",req,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			$("#tblAddedUsers").empty();
			if(res.result =="1"){
				$.each(res.data,function(index, line){
					var tr = '';
					tr += '<tr>';
					tr += '<td></td>';
					tr += '<td>' + line[1] + '</td>';
					tr += '<td>' + line[2] + '</td >';
					tr += '<td><input type="button" value="删除" onclick="$.fnAddStuRemove(\'' + line[3] + '\')"></td>';
					tr += '</tr>';
					$("#tblAddedUsers").append(tr);
				});
			} else {
				cu.toast(res.msg);
			}
		},"html").error(function() { alert("系统故障"); });
	}
});
$(function(){
	setTimeout("$.fnOrgLoad();", 500);
	setTimeout("$.fnButtonAdd('');", 700);
});
</script>
<style>
</style>
<div style="border-bottom: 1px solid #c6c7c2;border-left: 1px solid #c6c7c2;border-right: 1px solid #c6c7c2; border-radius:5px; color:#428bca; margin-left: 10px;">
	<div style="width: 100%; height:60px; line-height: 60px;">
		<select class="select30" style="margin-top: 10px;" id="sltOrgList">
			<option></option>
		</select>
		<input type="button" class="button blue" width="100px" value="查询" style="margin-top: 10px;" onclick="$.fnSearchStu()">
	</div>
	<!-- 问题清单 -->
	<div>
		<div style="float: left;width: 45%; height: 500px;"class="ui-jqgrid-view">
			<div>
				<h4>用户列表</h4>
			</div>
			<table class="cu-table" style="width: 100%;" >
				<thead>
					<tr>
						<th width="2%"></th>
						<th width="20%">用户名</th>
						<th width="70%">部门</th>
					</tr>
				</thead>
				<tbody id="tblSelectUsers">
				</tbody>
			</table>
		</div>
		<div class="left op-btn-group">
			<button id="btn-add-user" class="btn btn-default" onclick="$.fnButtonAdd()">&gt;&gt;</button>
		</div>
		<div style="float: right;width: 45%; height: 500px;" class="ui-jqgrid-view">
			<div>
				<h4>已添加用户</h4>
			</div>
			<table class="cu-table" style="width:100%;">
				<thead>
					<tr>
						<th width="0%"></th>
						<th width="20%">用户名</th>
						<th width="60%">部门</th>
						<th width="20%">删除</th>
					</tr>
				</thead>
				<tbody id="tblAddedUsers">
				</tbody>
			</table>
		</div>
	</div>
</div> 