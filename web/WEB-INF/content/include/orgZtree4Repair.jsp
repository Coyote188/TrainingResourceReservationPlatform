<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<script type="text/javascript">
//树配置文件
var include_setting = {
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			onClick : function (e, treeId, treeNode) {
				var id = treeNode.id;
				var name = treeNode.name;
				var flag = "false";
				if($("#totCheck1").attr("checked")=="checked")
					flag = "true";
				if(!treeNode.nocheck){
					if(treeNode.getParentNode()!=null){
						name = treeNode.getParentNode().name+">>"+name;
					}
				}
				if(flag == "true")
					name =name+"(合)";
				loadUri("#cu-org-content","exam/list?orgId="+id+"&flag="+flag);
			}
		},
		myQuery:{
			enable :true,
			showHtml: '<input  onclick="tNameFocus(this);" id="categoryQ" type="text" value="   输入机构名称检索" class="input30" style="width:150px;font-size:12px; margin-bottom: 5px;">'
			+'&nbsp;&nbsp;<a onclick="include_zTreeQuery()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png"></a>'
			+'&nbsp;<a onclick="include_zTreeRefresh()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png"></a>'
		}
};
var ztreeObj = $("#include_ztree");
$(document).ready(function() {
	var datas = '${output}';
	var datas = $.parseJSON(datas);
	if (datas.result == '1') {
		 $.fn.zTree.init(ztreeObj, include_setting, datas.data);	
	}
	$("#cu-content").css({"overflow":"hidden"});
	var h = $("#cu-content").height();
	$("#cu-org-content").css({"height" : h + "px"});
	$("#tree-org").css({"height" : (h-40) + "px"});
	
	$(window).resize(function(){
	   h = $("#cu-content").height();
	   $("#cu-org-content").css({"height" : h + "px"});
	   $("#tree-org").css({"height" : (h-40) + "px"});
	});
});
	

</script>
	<div id="cu_org" class="nav-left-org">
	    <h4 class="ui-widget-header ui-corner-top area_title">组织机构 
	    	<span style="margin-left:80px; cursor: auto;"><input id="totCheck1" type="checkbox" style="margin-bottom: 5px;"  value="0">&nbsp;<label for="totCheck1">涵盖查询</label></span>
	    </h4>
		<div id="tree-org" class="ui-widget-content">
			<ul id="include_ztree" class="ztree mytree" style="margin-top:0; ">
			</ul>
		</div>
	</div>
	<div id="cu-org-content">