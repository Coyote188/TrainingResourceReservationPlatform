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
			<table class="table table-hover table-condensed" >
				<tr>
					<td class="td-col1">用户名</td>
					<td style="width:250px">
					<input type="text" class="input30 require" length="1,32" label-name="用户名" name="objBean.userName"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">姓名(中文)</td>
					<td>
					<input type="text" class="input30 require" length="1,6" label-name="用户名" data-format="chinese" name="objBean.callName" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">密码</td>
					<td><input id="pwd_id" type="password" class="input30 require" length="1,32"  label-name="密码" name="objBean.password" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">再次输入密码</td>
					<td><input type="password" class="input30 require" length="1,32"  label-name="两次密码" onblur="checkPwd(this);" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">单位</td>
					<td>
						<input id="orgSel" type="text" onclick="showMenu();" type="text" class="input30 require" style="width: 80%;" value="" readonly="">
						<input id="orgId" name= "objBean.orgId" value="" type="hidden" >					
					</td>
				</tr>
				<tr>
					<td class="td-col1">手机号码</td>
					<td>
					<input type="text" class="input30 " label-name="手机" data-format="phone" name="objBean.mobileNo" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">状态</td>
					<td>
						<select id="user_state_id" class="select30 require" label-name="状态" name="objBean.state">
						</select>
					</td>
				</tr>
				<tr>
					<td class="td-col1">备注</td>
					<td colspan="3">
						 <textarea type="text" id="input3" class="form-control " style="width: 90%;" label-name="备注"  length="1,100" name="objBean.remark" />
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<div id="pformArea" >
							<fieldset class="editor">
								<input  id="role_ids" type="hidden" name="roleIds">
								<legend ><input type="button" value="配置角色" onclick="showRole()" id="tet" /></legend>
								<table id="role_table" style="width:100%;">
									
								</table>
							</fieldset>
						</div>
					</td>
				</tr>
			</table>
			<div id="orgContent" class="orgContent" style="position: absolute; z-index:1000;  display: none;">
				<ul id="ztree_user_add" class="ztree myztree" style="margin-top:0; ">
				</ul>
			</div>
			<div id="orgContent_role" class="orgContent" style="position: absolute; z-index:1000;  display: none;">
				<div  class="bootstrap-dialog-close-button tree-close" style="display: block; margin-bottom: -100px;"></div>
				<ul id="ztree_user_role" class="ztree myztree" style="margin-top:0; ">
				</ul>
			</div>
			<div class="h-dividing-line p-b-5" />
			<div class="clear right">
				<input id="add_user_btn" class="ui-button" type="button" value="确定" />
			</div>
		</form>
		
		<td style="width: 24%;">
</div><!-- wrap-content-dialog -->
<script type="text/javascript">
	//var orgId
	var categoryName = "";
	var roleOrgId = "";//本部门的层级单位ID
	setTimeout("loadUserAddJs()", 200);
	function loadUserAddJs() {
		selectDictItem("#user_state_id","DATA_STATE","");
		selectDictItem("#post_id","POST_TYPE","");
		selectDictItem("#profe_id","PROFE_TYPE","");
		
		userAddinitZnodes();
		cu.layout.formRequire();
		cu.layout.formActive();
				
		$("#add_user_btn").click(function() {
			if(checkForm("#form-user-add",'right')) {
			    var list = $("#form-user-add").serialize();
			    if($("#role_ids").val()==""){cu.toast("请配置角色!");return;}
			    	
				cu.toast("提交中...", {
					type : "load"
				});
				var reqData ="&"+list;

				$.post("user/add",reqData, function(json) {
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
	
	function initRoleZTree(orgId){
		var reqData = "&orgId="+orgId;
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
			},
			callback: {
				onClick :userAddOnClick
			},
			myQuery:{
				enable :true,
				showHtml: '<input  onclick="tNameFocus(this);" id="categoryQ" type="text" value="   输入机构名称检索" class="input30" style=" margin-bottom: 5px;">'
				+'&nbsp;&nbsp;<a onclick="zTreeQuery()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png">查询</a>'
				+'&nbsp;<a onclick="zTreeRefresh()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png">刷新</a>'
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
			$.fn.zTree.init($("#ztree_user_add"), seeting_user_add, zNodes);
			initOrgName();
		});	
	}
	
	//点击触发
	function userAddOnClick(e, treeId, treeNode) {
		var names = [];
		var strName = "";
		names = getZtreeParentNames(names,treeNode,0);
		//alert(JSON.stringify(names));
		for(var i=names.length-1;i>=0;i--){
			strName +=names[i];//组合层级名称
			if(i!=0){
				strName +=">>";
			}
		}
		
		roleOrgId = getOrgParentId(treeNode);
		var orgObj = $("#orgSel");		
		orgObj.attr("value", strName);
		$("#orgId").val(treeNode.id);
		hideMenu("orgContent");
		initRoleZTree(roleOrgId);
	}


	function showMenu() {
		var orgObj = $("#orgSel");
		var cityOffset = $("#orgSel").offset();
		var formOffset =  $("#form-user-add").offset();
		$("#orgContent").slideDown("fast");
		$("#orgContent").css({left:cityOffset.left-formOffset.left+ 5 + "px", top:cityOffset.top -formOffset.top +5 + orgObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	
	function showRole() {
		if($("#orgId").val()==""){
			cu.toast("请先选择单位！");
			return;
		}
		var orgObj = $("#tet");
		var cityOffset = $("#tet").offset();
		var formOffset =  $("#form-user-add").offset();
		var conheight = $("#orgContent_role").height();
		$("#orgContent_role").slideDown("fast");
		$("#orgContent_role").css({left:cityOffset.left-formOffset.left+ 5 + "px", top:cityOffset.top -conheight-formOffset.top +5  + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
		$(".tree-close").click(function(){hideMenu("orgContent_role");});
	}
	
	
	function hideMenu(contentTreeId) {
		$("#"+contentTreeId).fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "orgSel" || event.target.id == "orgContent" || $(event.target).parents("#orgContent").length>0 || event.target.id == "orgContent_role" || $(event.target).parents("#orgContent_role").length>0)) {
			hideMenu("orgContent");
			hideMenu("orgContent_role");
		}
	}
	
	//按名字查询树
	function zTreeQuery(){
		if($("#categoryQ").val()==''||$("#categoryQ").val()=='   输入机构名称检索'){
			cu.toast("请输入查询的机构名称！");
			return;
		}else{
			categoryName = trim($("#categoryQ").val());
			$("#ztree_user_add").empty();
			userAddinitZnodes();
		}
	}
	
	//重置树
	function zTreeRefresh(){
		$("#ztree_user_add").empty();
			categoryName = "";
			userAddinitZnodes();
	}
	
	//初始化父节点名称 和 父节点值
	function initOrgName(){
		if($("#orgSel").val()==null||$("#orgSel").val()==""){
			if("${orgId}"!=0){
				var zTree = $.fn.zTree.getZTreeObj("ztree_user_add");
				var node = zTree.getNodeByParam("id","${orgId}",null);
				
				var pName = node.name;
				var pNode = node.getParentNode();
				if(pNode !=null){
					pName = pNode.name+">>"+pName;
				}
				$("#orgId").val("${orgId}");
				$("#orgSel").val(pName);
				
				roleOrgId = getOrgParentId(node);
				initRoleZTree(roleOrgId);			
			}
		}
	}
	//验证两次密码相同
	function checkPwd(v){
	var oPwd = $("#pwd_id").val();
	var tPwd = $(v).val();
		if(oPwd!= tPwd){
			cu.toast("两次密码不一致，请重输入！");
			$(v).val("");
		}
	}
	
		//获取角色 ids
	function getRoleIds(id){
		var obj = $("#"+id).find("input:checkbox:checked");
		var ids ="";
		obj.each(function(i){
			ids+=$(this).val()+",";
		});
		ids = ids.substring(0,ids.length-1);
		return ids;
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
					onCheck: function(event, treeId, treeNode){
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
					},
					beforeClick:function(treeId, treeNode){
						var zTree = $.fn.zTree.getZTreeObj(treeId);
						zTree.checkNode(treeNode, !treeNode.checked, true, true);
					}
				}
			},zNodes
		);
	
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


</script>