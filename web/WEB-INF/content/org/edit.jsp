<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <div class="wrap-content-dialog">
		<form id="form-edit" method="post" action="org/edit">
			<input type="hidden" value="${objBean.id}" name="objBean.id">
			<table  class="table table-hover table-condensed">
				<tr id="pName_tr">
					<td  class="td-col1">上级机构</td>
					<td>
						<input id="pName" type="text" class="input30"   disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">机构类型</td>
					<td>
						 <select class="input30" disabled="disabled" label-name="机构类型"  id="st-type" >
						 </select>
					</td>
				</tr>
				
				<tr id="code_tr" style="display: none;">
					<td class="td-col1">机构代码</td>
					<td><input id="code_input" type="text" class="input30 require" label-name="机构代码" length="1,15" value="${objBean.orgCode }"  name="objBean.orgCode" />
					(部门无需填写该栏)
					</td>
				</tr>
				
				<tr>
					<td class="td-col1">机构名称</td>
					<td><input type="text" class="input30 require" label-name="机构名称" length="1,15" value="${objBean.orgName }" name="objBean.orgName" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系人</td>
					<td>
					   <input type="text" length="1,15" label-name="联系人" class="input30" value="${objBean.orgContact }" name="objBean.orgContact" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系电话</td>
					<td>
					   <input type="text" data-format="num" label-name="联系电话" length="1,13" class="input30" value="${objBean.orgTel}" name="objBean.orgTel" />
					</td>
				</tr>
				
			</table>
			<div class="h-dividing-line p-b-5" />
			<div class="clear right">
				<input class="ui-button" type="submit" value="确定" />
			</div>
		</form>
</div><!-- wrap-content -->
<style>
.mytree {
	margin-top: 10px;
	border: 1px solid #617775;
	background: none repeat scroll 0% 0% #F0F6E4;
	width: 300px;
	height: 360px;
	overflow-y: scroll;
	overflow-x: auto;
}
</style>
<script type="text/javascript">

	var categoryName = "";
	setTimeout("loadJs()", 200);
	function loadJs() {
		selectDictItem("#st-type","ORG_TYPE","${objBean.type}");
		initShow_hidefun();
		initPName();
		cu.layout.formRequire();
		cu.layout.formActive();
				
		$("#form-edit").submit(function() {
		    if(checkForm("#form-edit",'right')) {
				var list = $("#form-edit").serialize();
				cu.toast("提交中...", {
					type : "load"
				});
				var uri = $(this).attr("action");
				$.post(uri, list, function(json) {
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


	//控制机构代码输入框
	
	function initShow_hidefun(){
		if("department"=="${objBean.type}"){
			$("#code_tr").slideUp("slow"); $("#code_input").removeClass("require");
		}else{
			$("#code_tr").slideDown("slow"); $("#code_input").addClass("require");
		}
	}
	
	function initPName(){
		if("${objBean.parentId }"==0){
			$("#pName_tr").hide();
		}
		var pName = "${objBean.orgSeqName }";
		var index = pName.indexOf(">>");
		if(index!=-1){
			$("#pName").val(pName.substring(0, index));
		}
	}
	

	



</script>