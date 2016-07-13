<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

 <div class="wrap-content-dialog">
		<form id="form-add" method="post" action="org/add">
			<table  class="table table-hover table-condensed">
				<tr>
					<td  class="td-col1">上级机构</td>
					<td>
						<input id="orgSel" type="text" onclick="showMenu();" type="text" class="input30 require" style="width: 80%;" value="" readonly="">
						<input id="orgPId" name= "objBean.parentId" value="" type="hidden" >
					</td>
				</tr>
				<tr>
					<td class="td-col1">机构类型</td>
					<td>
					   <select class="select30 require" label-name="机构类型" name="objBean.type" id="st-type" onchange="show_hidefun(this);">
					  </select>
					</td>
				</tr>
				
				<tr id="code_tr">
					<td class="td-col1">机构代码</td>
					<td><input id="code_input" type="text" class="input30 require" label-name="机构代码" length="1,15"  name="objBean.orgCode" />
					</td>
				</tr>
				
				<tr>
					<td class="td-col1">机构名称</td>
					<td><input type="text" class="input30 require" label-name="机构名称" length="1,15"  name="objBean.orgName" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系人</td>
					<td>
					   <input type="text" length="1,15" label-name="联系人" class="input30" name="objBean.orgContact" />
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系电话</td>
					<td>
					   <input type="text" data-format="num" label-name="联系电话" length="1,13" class="input30" name="objBean.orgTel" />
					</td>
				</tr>
				
			</table>
			<div class="h-dividing-line p-b-5" />
			<div class="clear right">
				<input class="ui-button" type="submit" value="确定" />
			</div>
		</form>
		<div id="orgContent" class="orgContent" style="position: absolute;  display: none;">
			<ul id="ztree_org_add" class="ztree myztree" style="margin-top:0; ">
			</ul>
		</div>
</div><!-- wrap-content -->

<script type="text/javascript">

	var categoryName = "";
	setTimeout("loadJs()", 200);
	function loadJs() {
		selectDictItem("#st-type","ORG_TYPE","");
		initZnodes();
		//initOrgPName();
		cu.layout.formRequire();
		cu.layout.formActive();
				
		$("#form-add").submit(function() {
		    if(checkForm("#form-add",'right')) {
				var list = $("#form-add").serialize();
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

//树配置文件
	var setting = {
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick :onClick
			},
			myQuery:{
				enable :true,
				showHtml: '<input  onclick="tNameFocus();" id="categoryQ" type="text" value="   输入机构名称检索" class="input30" style=" margin-bottom: 5px;">'
				+'&nbsp;&nbsp;<a onclick="zTreeQuery()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png">查询</a>'
				+'&nbsp;<a onclick="zTreeRefresh()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png">刷新</a>'
			}
		};
	
	//生成树
	function initZnodes(){
		var reqData = "&queryOrgName="+categoryName+"&flag=normalQuery";
		$.post("org/orgZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			$.fn.zTree.init($("#ztree_org_add"), setting, zNodes);	
			initOrgPName();
		});	
	}
	
	//点击触发
	function onClick(e, treeId, treeNode) {
		if(!treeNode.nocheck){
			cu.toast("部门不能再添加子节点，请选择单位节点！");	
			return;
		}
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
		var orgObj = $("#orgSel");		
		orgObj.attr("value", strName);
		$("#orgPId").val(treeNode.id);
		hideMenu();
	}


	function showMenu() {
		var orgObj = $("#orgSel");
		var cityOffset = $("#orgSel").offset();
		var formOffset =  $("#form-add").offset();
		$("#orgContent").slideDown("fast");
		$("#orgContent").css({left:cityOffset.left-formOffset.left+ 5 + "px", top:cityOffset.top -formOffset.top +5 + orgObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#orgContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "orgSel" || event.target.id == "orgContent" || $(event.target).parents("#orgContent").length>0)) {
			hideMenu();
		}
	}
	
	//按名字查询树
	function zTreeQuery(){
		if($("#categoryQ").val()==''||$("#categoryQ").val()=='   输入机构名称检索'){
			cu.toast("请输入查询的机构名称！");
			return;
		}else{
			categoryName = trim($("#categoryQ").val());
			$("#ztree_org_add").empty();
			initZnodes();
		}
	}
	
	//重置树
	function zTreeRefresh(){
		$("#ztree_org_add").empty();
			categoryName = "";
			initZnodes();
	}
	//清空查询框提示
	function tNameFocus(){
		$("#categoryQ").val("");
		$("#categoryQ").css("color","black");
	}
	//控制机构代码输入框
	function show_hidefun(ev){
		if("department"==$(ev).val()){
			$("#code_tr").hide(); $("#code_input").removeClass("require");
		}else{
			$("#code_tr").show(); $("#code_input").addClass("require");
		}
	}
	//初始化父节点名称 和 父节点值
	function initOrgPName(){
		if($("#orgSel").val()==null||$("#orgSel").val()==""){
			if("${id}"!=0){
				var zTree = $.fn.zTree.getZTreeObj("ztree_org_add");
				var node = zTree.getNodeByParam("id","${id}",null);
				if(node.nocheck){
					var pName = node.name;
					var pNode = node.getParentNode();
					if(pNode !=null){//部门不能添加
						pName = pNode.name+">>"+pName;
					}
					$("#orgPId").val("${id}");
					$("#orgSel").val(pName);
				}
			}
		}
	}
	



</script>