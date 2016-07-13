<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <div class="wrap-content-dialog">
		<form id="form-add">
			<table class="table table-hover table-condensed">
				<tr>
					<td class="td-col1">数据名称</td>
					<td>
					<input type="text" class="input30 require" label-name="数据名称" name="objBean.busiName" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">数据值</td>
					<td><input type="text" class="input30 require" label-name="数据值" name="objBean.busiValue" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">父级数据</td>
					<td>
					   <select class="select30" name="objBean.parentId" id="st-parent">
					    <option value="0">无</option>
					  </select>
					</td>
				</tr>
				<tr>
					<td class="td-col1">状态</td>
					<td><select class="select30" name="objBean.state">
							<option value="1">有效</option>
							<option value="0">无效</option>
					</select>
					</td>
				</tr>
				<tr>
					<td class="td-col1">序号</td>
					<td>
					   <input type="text" class="input30 require" label-name="序号" data-format="num" length="1,5" name="objBean.seqNum" value="${seqNum }" />
					</td>
				</tr>
			</table>
			<div class="h-dividing-line p-b-5" />
			<div class="clear right">
				<input class="ui-button" type="submit" value="确定" />
			</div>
		</form>
</div><!-- wrap-content-dialog -->
<script type="text/javascript">
setTimeout("loadJs()", 200);
function loadJs() {
cu.layout.formRequire();
cu.layout.formActive();
	$.post("admin/selectDict", function(json) {
		var output = $.parseJSON(json.output);
		if (output.result == '1') {
			$("#st-parent").treeSelect({
				values : output.data,
				selectValue : '${id}'
			});
		}
	});
	$("#form-add").submit(function() {
		if(checkForm("#form-add",'right')) {
		    var list = $("#form-add").serialize();
			cu.toast("提交中...", {
				type : "load"
			});
			var reqData ="&"+list;
			$.post("dict/add", reqData, function(json) {
				cu.toast.close();
				var output = $.parseJSON(json.output);
				cu.toast(output.msg);
				if(output.result == '1') {
					BootstrapDialogUtil.close();
					refreshGrid();
				}
			});
		}
		return false;
	});
}
</script>