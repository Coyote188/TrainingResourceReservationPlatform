<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
 .editor{ 
 	padding:5px 0 15px 10px;
	border: 1px solid #aaa;
	border-radius:5px;
	width: 99%;
	}
</style>
 <div class="wrap-content-dialog">
		<form id="form-user-add" >
			<input name="objBean.id" value ="${objBean.id}" type="hidden"/>
			<table class="table table-hover table-condensed" >
				<tr>
					<td class="td-col1">用户名</td>
					<td >
					<input type="text" class="input30 " length="1,32" label-name="用户名" value="${objBean.userName}" readonly="readonly"/>
					</td>
					<td class="td-col1">姓名</td>
					<td>
					<input type="text" class="input30 " length="1,15" label-name="用户名" data-format="chinese" value="${objBean.callName}" readonly="readonly" />
					</td>
				</tr>
	
				<tr>
					<td class="td-col1">状态</td>
					<td>
						<select id="user_state_id" class="select30" label-name="状态" disabled="disabled" >
						</select>
					</td>
					<td class="td-col1">单位</td>
					<td>
						<input id="orgSel" type="text"  type="text" class="input30 " style="width: 80%;" value="" readonly="">
						<input id="orgId" value="${objBean.orgId}"  value="" type="hidden" >					
					</td>
				</tr>
				<tr>
					<td class="td-col1">岗位</td>
					<td>
					  <select class="select30 " label-name="岗位" value="${objBean.postName }" id="post_id" disabled="disabled">
					  </select>
					</td>
					<td class="td-col1">职称</td>
					<td>
					  <select class="select30 " label-name="职称" value="${objBean.profeName }"  id="profe_id"  disabled="disabled">
					  </select>
					</td>
				</tr>
				<tr>
					<td class="td-col1">手机号码</td>
					<td>
					<input type="text" class="input30 " label-name="手机" data-format="phone" value="${objBean.mobileNo }" readonly="readonly" />
					</td>
					<td class="td-col1">固定电话</td>
					<td>
					<input type="text" class="input30 " length="1,20" label-name="固定电话" value="${objBean.telephone }"  readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">QQ</td>
					<td>
					<input type="text" class="input30 " label-name="QQ" length="1,15" value="${objBean.qqNo }"  readonly="readonly"/>
					</td>
					<td class="td-col1">邮箱</td>
					<td>
					<input type="text" class="input30 " length="1,30" data-format="email" label-name="邮箱" value="${objBean.email }" readonly="readonly" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">备注</td>
					<td colspan="3">
						 <textarea type="text" id="input3" class="form-control " style="width: 90%;" label-name="备注"  length="1,100" value="${objBean.remark }"  readonly="readonly"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div id="pformArea" >
							<fieldset class="editor">
								<legend >角色</legend>
								<table id="role_table" style="width:100%;">
									
								</table>
							</fieldset>
						</div>
					</td>
				</tr>
			</table>
			<div id="orgContent" class="orgContent" style="position: absolute; z-index:1000;  display: none;">
				<ul id="ztree_user_edit" class="ztree myztree" style="margin-top:0; ">
				</ul>
			</div>
			<div id="orgContent_role" class="orgContent" style="position: absolute; z-index:1000;  display: none;">
				<div  class="bootstrap-dialog-close-button tree-close" style="display: block; margin-bottom: -100px;"></div>
				<ul id="ztree_user_role" class="ztree myztree" style="margin-top:0; ">
				</ul>
			</div>
			<div class="h-dividing-line p-b-5" />

		</form>
		
		<td style="width: 24%;">
</div><!-- wrap-content-dialog -->
<script type="text/javascript">
	//var orgId
	var categoryName = "";
	var roleOrgId = "";//本部门的层级单位ID
	setTimeout("loadUserAddJs()", 200);
	function loadUserAddJs() {
		selectDictItem("#user_state_id","DATA_STATE","${objBean.state}");
		selectDictItem("#post_id","POST_TYPE","${objBean.postName }");
		selectDictItem("#profe_id","PROFE_TYPE","${objBean.profeName }");
		
		userAddinitZnodes();
	}
	
	function initRoleZTree(orgId,userId){
		var reqData = "&orgId="+orgId+"&userId="+userId;
		$.post("roleUser/rolezTree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var role ="";
			$("#ztree_user_role").empty();
			$("#role_table").empty();
			$("#role_ids").val("");			
			if(res.result =="1"){
				var zNodes1 = res.data;
				rolezTree(zNodes1);
			}else{
				cu.toast(res.msg);		
			}
		});	
	}

//树配置文件
	var seeting_user_add = {
			data: {
				simpleData: {
					enable: true
				}
			}
		};
	
	//生成树
	function userAddinitZnodes(){
		var reqData = "&queryOrgName="+categoryName+"&flag=normalQuery";
		$.post("org/orgZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			$.fn.zTree.init($("#ztree_user_edit"), seeting_user_add, zNodes);
			initOrgName();
		});	
	}
	
	//初始化父节点名称 和 父节点值
	function initOrgName(){
		if($("#orgSel").val()==null||$("#orgSel").val()==""){
			if("${objBean.orgId}"!=0){
				var zTree = $.fn.zTree.getZTreeObj("ztree_user_edit");
				var node = zTree.getNodeByParam("id","${objBean.orgId}",null);
				
				var pName = node.name;
				var pNode = node.getParentNode();
				if(pNode !=null){
					pName = pNode.name+">>"+pName;
				}
				$("#orgId").val("${objBean.orgId}");
				$("#orgSel").val(pName);
				
				roleOrgId = getOrgParentId(node);
				userId = "${objBean.id}";
				initRoleZTree(roleOrgId,userId);			
			}
		}
	}

	
	
	function rolezTree(zNodes){
		$.fn.zTree.init($("#ztree_user_role"),{
				data : {
					simpleData : {
						enable : true
					}
				},
				check: {
					enable: true
				}, 
				callback : {
					onCheck: userEditOncheck,
					beforeClick:function(treeId, treeNode){
						var zTree = $.fn.zTree.getZTreeObj(treeId);
						zTree.checkNode(treeNode, !treeNode.checked, true, true);
					}
				}
			},zNodes
		);	
		userEditOncheck("","ztree_user_role","");
		
	
	}
	
	//获取机构所属上级单位
	function getOrgParentId(treeNode){
		var node = treeNode;//变量
		var id= "";
		for(var j=1 ;j>0;j++){
			if(node.isParent){
				id = node.id;
				break;
			}
			node = node.getParentNode();
		}
		return id;
	}
	
	//绘制 角色表格
	function createRoleTable(tabId,arr){
		$("#"+tabId).empty();
		var td = "";var str = ""; var count = 1; 
		for(var i=0;i<arr.length;i++){
			td +=arr[i];
			if(count%5==0){
				str +='<tr>'+td+'</tr>'
				td = "";
			}else if(i==arr.length-1){
				str +='<tr>'+td+'</tr>'
				td = "";
			}
			count++;
		}
		//alert(arr.length);
		
		$("#"+tabId).append(str);
	
	}
	
		//初始化机构名称 和 机构值
	function initPName(){
		if($("#orgSel").val()==null||$("#orgSel").val()==""){
			if("${objBean.orgId}"!=0){
				var zTree = $.fn.zTree.getZTreeObj("ztree_user_edit");
				var node = zTree.getNodeByParam("id","${objBean.orgId}",null);
	
				var pName = node.name;
				var pNode = node.getParentNode();
				if(pNode !=null){
					pName = pNode.name+">>"+pName;
				}
				$("#orgSel").val(pName);
	
			}
		}
	}
	
	 function userEditOncheck(event, treeId, treeNode){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		var nodes = zTree.getCheckedNodes(true);
		var arr = new Array(); 
		var roleIds = "";
		for (var i=0;i<nodes.length; i++) {
			roleIds += nodes[i].id + ",";
			arr.push('<td style="width: 21%;"><label class="m-b-0" >'+nodes[i].name+'</label></td>');
		}
		if (roleIds.length > 0 ) roleIds = roleIds.substring(0, roleIds.length-1);
		$("#role_ids").val(roleIds);
		createRoleTable("role_table",arr);
	}



</script>