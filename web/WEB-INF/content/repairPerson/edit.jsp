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
					<td class="td-col1">维修点</td>
					<td>
						<input id="orgSel" type="text" onclick="showMenu();" type="text" class="input30 require"  value="" readonly="">
						<input id="orgId" name= "objBean.orgId" value="${objBean.orgId}" type="hidden" >					
					</td>
				</tr>
				<tr>				
					<td class="td-col1">维修保养人名称</td>
					<td >
					<input type="text" class="input30 require" length="1,32" label-name="维修保养人名称" name="objBean.userName"  value="${objBean.userName}"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系电话</td>
					<td >
					<input type="text" class="input30 " length="1,32" label-name="联系电话" name="objBean.mobileNo" value="${objBean.mobileNo}"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">状态</td>
					<td >
					<select class="select30 " label-name="状态" name="objBean.state" id="v_state_id" >
					</td>
				</tr>
			</table>
			<div id="orgContent" class="orgContent" style="position: absolute; z-index:1000;  display: none;">
				<ul id="ztree_user_edit" class="ztree myztree" style="margin-top:0; ">
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
		selectDictItem("#v_state_id","DATA_STATE","${objBean.state}");
		userAddinitZnodes();
		cu.layout.formRequire();
		cu.layout.formActive();
				
		$("#add_user_btn").click(function() {
			if(checkForm("#form-user-add",'right')) {
			    var list = $("#form-user-add").serialize();
				cu.toast("提交中...", {
					type : "load"
				});
				var reqData ="&"+list;

				$.post("repairPerson/edit",reqData, function(json) {
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
			$.fn.zTree.init($("#ztree_user_edit"), seeting_user_add, zNodes);
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
			$("#ztree_user_edit").empty();
			userAddinitZnodes();
		}
	}
	
	//重置树
	function zTreeRefresh(){
		$("#ztree_user_edit").empty();
			categoryName = "";
			userAddinitZnodes();
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
</script>