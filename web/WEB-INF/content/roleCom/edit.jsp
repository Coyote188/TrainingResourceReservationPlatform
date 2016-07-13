<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <div class="wrap-content-dialog">
      <form id="role-form-edit">
     	 <input type="hidden"  name="objBean.id" value="${objBean.id}">
         <table class="table table-hover table-condensed">
			<tr>
				<td class="td-col1">角色名称</td>
				<td >
				<input type="text" class="input30 require" length="1,32" label-name="角色名称" value="${objBean.roleName}" name="objBean.roleName"/>
				</td>
				<td class="td-col1">角色描述</td>
				<td>
					<input type="text" class="input30 " length="1,100" label-name="角色描述" value="${objBean.roleDes}" name="objBean.roleDes"/>
				</td>
				<td>
					<input id="edit_roleCom_btn" type="button" class="button" value="保存"/>
				</td>
			</tr>
		 </table>
      </form>
	 
	 <div class="user-list left" style="width: 100%;">
		 <div class="user-config-org-tree left" style="width: 100%; height: 470px;  margin-right: 5px;">
	       <h4 class="ui-widget-header ui-corner-top area_title">权限选择</h4>
		   <div id="user-org-tree" class="ui-widget-content" style="height:93%;overflow: auto;">
		   		<ul id="ztree_permit" class="ztree" style="margin-top:0; ">
				</ul>
		   </div>
	   	</div>
   	</div>
	
 
</div><!-- wrap-content -->

<script type="text/javascript">

setTimeout("loadJs()", 200);
function loadJs() {
getPermitZnodes();
cu.layout.formRequire();
cu.layout.formActive();
	var bodyHeight = $("body").height();
	$(".user-config-org-tree").css("height",(bodyHeight/4)*3);
	$("#edit_roleCom_btn").click(function() {
	    if(checkForm("#role-form-edit",'top')) {
			var list = $("#role-form-edit").serialize();
			var menuIds = "";
			var permitIds = "";
			$("#ztree_permit").find(".operates").each(function(i){
				if($(this).attr("checked")=="checked"){
					permitIds +=$(this).attr("value")+",";
				}
			});
			if (permitIds.length > 0 )
			    permitIds = permitIds.substring(0, permitIds.length-1);
			menuIds = getzTreeCheckedIds("ztree_permit");
			if(menuIds==""){
				cu.toast("请选择相应的操作权限！");
				return;
			}
				
			
			cu.toast("提交中...", {
				type : "load"
			});
			var reqData = "&permitIds="+permitIds+"&menuIds="+menuIds+"&"+list;
			$.post("role/editRoleCom",reqData, function(json) {
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



	function getPermitZnodes(){
		var reqData = "&op=tree2&roleId=${objBean.id}";
		$.post("role/permitZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			permitZtree(zNodes);
			
		});	
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
						//alert(treeNode.tId);
							var op = treeNode.operates[i];
							var checked = "";
							if(op.checked=="true")
								checked = "checked=''";
							html.push(" <label class='childCheckbox'><input ptid='"+treeNode.tId+"' class=\"operates\" type=\"checkbox\" name=\"operates\" "+checked+"  value=\""+op.menuId+";"+op.val+"\">&nbsp;"+op.name+"&nbsp;</label>");
						}
						//alert(html);
						aObj.after(html.join(""));
					}
				},
				callback : {
					onCheck: function(event, treeId, treeNode){//取消父节点时  取消全部附属节点
						var obj = $("#"+treeNode.tId);
						if(!treeNode.checked){//父节点取消时触发
							obj.find(":checkbox").attr("checked",false);
						}
					},
					beforeClick:function(treeId, treeNode){
						var zTree = $.fn.zTree.getZTreeObj("ztree_permit");
						zTree.checkNode(treeNode, !treeNode.checked, true, true);
					}
				}
			},zNodes
		);
		myCheckBoxonClik("ztree_permit");
	}
	
	//勾选附属节点时，联动主节点勾选
	function myCheckBoxonClik(ztreeName){
		$("#ztree_permit").find(":checkbox").css("cursor","pointer");
		$("#ztree_permit").find(".chk").css("cursor","pointer");
		$(".operates").die().bind("click",function(){
			var tid = $(this).attr("ptid");
			var ztreeObj =  $.fn.zTree.getZTreeObj(ztreeName);
			var node = ztreeObj.getNodeByTId(tid);
			ztreeObj.checkNode(node,true, true,true);//本节点，勾选时触发，联动父级节点，触发onCheck 事件	
		})
	}
	
	//获取zTree树中被选中ids
	function getzTreeCheckedIds(ztreeName){
			var checkedIds = "";
			var treeObj = $.fn.zTree.getZTreeObj(ztreeName);
			var nodeArr = treeObj.getCheckedNodes(true);
			$.each(nodeArr,function(i,n){
				checkedIds +=n.id+","
			});
			if (checkedIds.length > 0 ) 
				checkedIds = checkedIds.substring(0, checkedIds.length-1);
			return checkedIds;
	}

</script>

