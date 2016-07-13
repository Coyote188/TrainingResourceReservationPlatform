<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="wrap-content-dialog">
	<form id="form-edit">
		<input type="hidden" name="objBean.id" value="${objBean.id}" />
		<input type="hidden" name="objBean.menuType" value="${objBean.menuType}" />
		<table class="table table-hover">
			<tr>
				<td class="td-col1">菜单名称</td>
				<td><input type="text" class="input30 require" label-name="菜单名称" name="objBean.menuName" value="${objBean.menuName}" />
				</td>
			</tr>
			<tr>
				<td class="td-col1">父菜单</td>
				<td>
				   <select class="select30" name="objBean.parentId" id="st-parent">
						<option value="0">无</option>
				  </select>
				</td>
			</tr>
			<tr>
				<td class="td-col1">菜单url</td>
				<td><input type="text" class="input30" name="objBean.uri" value="${objBean.uri}" /></td>
			</tr>
			<tr>
				<td class="td-col1">状态</td>
				<td><select class="select30" name="objBean.state" id="st-state">
						<option value="1">有效</option>
						<option value="0">无效</option>
				</select>
				</td>
			</tr>
			<tr>
				<td class="td-col1">排序</td>
				<td><input type="text" class="input30 require" label-name="序号" data-format="num" length="1,5" name="objBean.seqNum"
					value="${objBean.seqNum}" /></td>
			</tr>
		</table>
		<div class="h-dividing-line p-b-5" />
		<div class="clear text-right">
			<input class="ui-button" type="submit" value="确定" />
		</div>
	</form>
</div>
<script type="text/javascript">
	setTimeout("loadJs()", 200);
	function loadJs() {
	cu.layout.formRequire();
    cu.layout.formActive();
		$.post("admin/selectMenu", function(json) {
			var output = $.parseJSON(json.output);
			if (output.result == "1")
				$("#st-parent").treeSelect({
					values : output.data,
					selectValue : "${objBean.parentId}"
				});
		});

		$("#st-state").find("option").each(function() {
			var val = $(this).val();
			if (val == "${objBean.state}") {
				$(this).attr("selected", true);
			}
		});

		$("#form-edit").submit(function() {
		    if(checkForm("#form-edit",'right')) {
				var list = $("#form-edit").serialize();
				cu.toast("提交中...", {
					type : "load"
				});
				var reqData ="&"+list;
				$.post("menu/edit",reqData,function(json) {
					cu.toast.close();
					var output = $.parseJSON(json.output);
					cu.toast(output.msg);
					if (output.result == '1') {
						BootstrapDialogUtil.close();
						refreshGrid();
					}
				});
			}
			return false;
		});
	}
</script>