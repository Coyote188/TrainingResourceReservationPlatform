<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
 <div class="wrap-content-dialog">
      <form id="role-form-add">
         <table class="table table-hover table-condensed">
			<tr>
				<td class="td-col1">角色名称</td>
				<td >
				<input type="text" class="input30 require" length="1,32" label-name="" value="${objBean.roleName}" readonly="readonly"/>
				</td>
				<s:if test="objBean.orgId!=''">
				<td class="td-col1">部门</td>
				<td>
					<input type="text" class="input30 " style="width: 220px;" length="1,100" label-name="" value="${objBean.orgId}" readonly="readonly"/>
				</td>
				</s:if>
			</tr>
			<tr>
				<td class="td-col1">角色描述</td>
				<s:if test="objBean.orgId!=''">
					<td colspan="3">
				</s:if>
				<s:else>
					<td>
				</s:else>
					<input type="text" class="input30 " style="width: 300px;" length="1,100" label-name="角色描述" value="${objBean.roleDes}" readonly="readonly"/>
				</td>
			</tr>
		 </table>
      </form>
	 
 	<input type="hidden" value="" id = "menu_ids" > 
	 <div class="user-list left" style="width: 100%;">
		 <div class="user-config-org-tree left" style="width: 100%;  margin-right: 5px;">
	       <h4 class="ui-widget-header ui-corner-top area_title">拥有权限</h4>
		   <div id="user-org-tree" class="ui-widget-content" style="height:60%;">
		   		<ul id="ztree_permit" class="ztree" style="margin-top:0; ">
				</ul>
		   </div>
	   	</div>
   	</div>
</div><!-- wrap-content -->

<script type="text/javascript">

setTimeout("loadJs()", 200);
function loadJs() {
 	var datas = '${output}';
	var datas = $.parseJSON(datas);
	permitZtree(datas.data);	
}




	
	function permitZtree(zNodes){
		var operates = [];
		$.fn.zTree.init($("#ztree_permit"),{
				data : {
					simpleData : {
						enable : true
					}
				},
				check: {
					enable: true,
					chkboxType: { "Y": "p", "N": "s" }//勾选关联父级  取消关联父级
				}, 
				view: {
					addDiyDom: function(treeId, treeNode) {
						var aObj = $("#" + treeNode.tId + "_a");
						var html = [];
						for(var i=0;i<treeNode.operates.length;i++) {
							var op = treeNode.operates[i];
							var checked = "";
							var disabled = "";
							if(op.checked=="true")
								checked = "checked=''";
							if(op.disabled =="false")
								disabled ="disabled='disabled'"
							html.push(" <label class='childCheckbox'><input ptid='"+treeNode.tId+"' class=\"operates\" type=\"checkbox\" name=\"operates\" "+checked+" "+disabled+ "   value=\""+op.menuId+";"+op.val+"\">&nbsp;"+op.name+"&nbsp;</label>");
						}
						aObj.after(html.join(""));
					}
				},
				callback : {
					beforeCheck :function(treeId, treeNode){
						if(treeNode.doCheck=="false"){
							return false;
						}else{
							return true;
						}
					}
				}
			},zNodes
		);
		myCheckBoxonClik("ztree_permit");
	}
	
	//勾选附属节点时，联动主节点勾选
	function myCheckBoxonClik(id){
		$("#"+id).find(":checkbox").css("cursor","pointer");
		$("#"+id).find(".chk").css("cursor","pointer");
		$(".operates").die().bind("click",function(){
			var tid = $(this).attr("ptid");
			var ztreeObj =  $.fn.zTree.getZTreeObj(id);
			var node = ztreeObj.getNodeByTId(tid);
			ztreeObj.checkNode(node,true, true,true);//本节点，勾选时触发，联动父级节点，触发onCheck 事件	
		})
	}

</script>

