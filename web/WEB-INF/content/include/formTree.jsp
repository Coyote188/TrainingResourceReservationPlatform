<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/JQuery_zTree/orgzTree.js" type="text/javascript"></script>
<%--<script src="${pageContext.request.contextPath}/js/JQuery_zTree/js/jquery.ztree.excheck-3.5.js" type="text/javascript"></script> --%>

<script type="text/javascript">
	var dataUrl = "";
	var widgetId = "";
	var isMultiSelect;
	setTimeout("initTree()", 200);
	
	function showTree(url,id, flag){
		dataUrl = url;
		widgetId = id;
		isMultiSelect = flag;
		widgetTreeInitZnodes('',true);
	}
	
	function widgetTreeInitZnodes(categoryName, flag){
		var seeting_tree_add;
		if(isMultiSelect)
			seeting_tree_add = {
				data: {
					simpleData: {enable: true}
				},
				check: {
					enable: true,
					chkboxType: { "Y": "", "N": "" }
				}, 
				callback: {
					onCheck: treeOnCheck,
					beforeClick: treeBeforeClick
				},
				myQuery:{
					enable :true,
					showHtml: "<input onclick=\"tNameFocus(this);\" id=\"categoryQ_" + widgetId + "\" type=\"text\" value=\"   输入机构名称检索\" class=\"input30\" style=\"margin-bottom: 5px;\">"
						  	  +"&nbsp;&nbsp;<a onclick=\"zTreeQuery()\"><img alt=\"\" src=\"${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png\">查询</a>"
						  	  +"&nbsp;<a onclick=\"zTreeRefresh()\"><img alt=\"\" src=\"${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png\">刷新</a>"
				}
			};
		else
			var seeting_tree_add = {
				data: {
					simpleData: {enable: true}
				}, 
				callback: {
					onClick: treeOnClick
				},
				myQuery:{
					enable :true,
					showHtml: "<input  onclick=\"tNameFocus(this);\" id=\"categoryQ_" + widgetId + "\" type=\"text\" value=\"   输入机构名称检索\" class=\"input30\" style=\"margin-bottom: 5px;\">"
							  +"&nbsp;&nbsp;<a onclick=\"zTreeQuery()\"><img alt=\"\" src=\"${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png\">查询</a>"
							  +"&nbsp;<a onclick=\"zTreeRefresh()\"><img alt=\"\" src=\"${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png\">刷新</a>"
				}
			};
		
		var url = dataUrl;
		if(categoryName!=null && categoryName!="")
			url += "&queryOrgName="+categoryName;
		$.ajax({  
	    	type : "post",  
	    	url : url,  
	    	async : false,  
	    	success : function(json){  
	    		var res = jQuery.parseJSON(json.output);
				var zNodes ="";
				if(res.result =="1")
					zNodes = res.data;
				else
					cu.toast(res.msg);	
				
				if(isMultiSelect)
					zNodes = setDefaultZnodes(zNodes);
				$.fn.zTree.init($("#ztree_"+widgetId), seeting_tree_add, zNodes);
				
				if(flag != null && flag==false){
					initOrgName();
				}
				else{
					var objOffset = $("#"+widgetId+"Text").offset();
					var height = $("#"+widgetId+"Text").height();
					$("#"+widgetId+"Content").slideDown("fast");
					$("#"+widgetId+"Content").css({left:objOffset.left + "px", top:objOffset.top + height + "px"}).slideDown("fast");
					$("body").bind("mousedown", onBodyDown);
				}
	    	}  
		});
	}
	
	function treeOnClick(e,treeId,treeNode) {
		var names = [];
		var strName = "";
		names = getZtreeParentNames(names,treeNode,0);
		for(var i=names.length-1;i>=0;i--){
			strName +=names[i];//组合层级名称
			if(i!=0){
				strName +=">>";
			}
		}
		var obj = $("#"+widgetId+"Text");		
		obj.attr("value", strName);
		$("#"+widgetId).val(treeNode.id);
		hideMenu();
	}
	
	function treeOnCheck(event, treeId, treeNode){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		var nodes = zTree.getCheckedNodes(true); 
		var names = "";
		var ids = "";
		for (var i=0;i<nodes.length; i++) {
			ids += nodes[i].id + ",";
			var nodeNames = [];
			var strName = "";
			nodeNames = getZtreeParentNames(nodeNames,nodes[i],0);
			for(var j=nodeNames.length-1;j>=0;j--){
				strName +=nodeNames[j];//组合层级名称
				if(j!=0){
					strName +=">>";
				}
			}
			names += strName + "，";
		}
		if (ids.length > 0 ) 
			ids = ids.substring(0, ids.length-1);
		if (names.length > 0 ) 
			names = names.substring(0, names.length-1);
		$("#"+widgetId).val(ids);
		$("#"+widgetId+"Text").val(names);
	}
	
	function treeBeforeClick(treeId, treeNode){
		var zTree = $.fn.zTree.getZTreeObj(treeId);
		zTree.checkNode(treeNode, !treeNode.checked, true, true);
	}
	
	function getOrgParentId(treeNode){
		var node = treeNode;
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
	
	function hideMenu() {
		$("#"+widgetId+"Content").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	
	function onBodyDown(event){
		if (!(event.target.id == widgetId+"Text" || event.target.id == widgetId+"Content" || $(event.target).parents("#"+widgetId+"Content").length>0)){
			hideMenu(dataUrl,widgetId);
		}
	}
	
	function zTreeQuery(){
		if($("#categoryQ_"+widgetId).val()==''||$("#categoryQ_"+widgetId).val()=='   输入机构名称检索'){
			cu.toast("请输入查询的机构名称！");
			return;
		}else{
			var categoryName = trim($("#categoryQ_"+widgetId).val());
			$("#ztree_"+widgetId).empty(); 
			widgetTreeInitZnodes(categoryName,true);
		}
	}
	
	function zTreeRefresh(){
		$("#ztree_"+widgetId).empty();
		categoryName = "";
		widgetTreeInitZnodes();
	}
	
	function initOrgName(){
		if($("#"+widgetId+"Text").val()==null||$("#"+widgetId+"Text").val()==""){			
			if($("#"+widgetId).val()!=null && $("#"+widgetId).val()!=""){
				var zTree = $.fn.zTree.getZTreeObj("ztree_"+widgetId);
				var nodeIds = $("#"+widgetId).val().split(",");
				var nameStr = "";
				for(var i=0; i<nodeIds.length; i++){
					var node = zTree.getNodeByParam("id",nodeIds[i],null);					
					var pName = node.name;
					var pNode = node.getParentNode();
					if(pNode !=null){
						pName = pNode.name+">>"+pName;
					}
					nameStr += pName+"，";
				}
				$("#"+widgetId+"Text").val(nameStr.substring(0,nameStr.length-1));
			}
		}
	}
	
	function setDefaultZnodes(zNodes){
		var ids = $("#"+widgetId).val().split(",");
		for(var i=0; i<zNodes.length; i++){
			for(var j=0; j<ids.length; j++){
				if(zNodes[i].id == ids[j])
					zNodes[i].checked = true;
			}
		}
		return zNodes;
	}
	
	function initTree(){
		var objs = $("#element-list .ztree");
		for(var i=0; i<objs.length; i++){
			if($("#"+id.substring(6))!=null && $("#"+id.substring(6)).val()!=""){
				var id = $(objs[i]).attr("id");
				var clickHtml = $("#"+id.substring(6)+"Text").attr("onclick");
				var args = clickHtml.substring(9,clickHtml.length-1).split(",");
				dataUrl = args[0].replace(/\'+/g,"");
				widgetId = args[1].replace(/\'+/g,"");
				isMultiSelect = args[2];
				widgetTreeInitZnodes('',false);
			}
		}
	}
</script>