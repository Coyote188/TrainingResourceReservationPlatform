<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="wrap-content">
	<table id="grid-list" class="jq-grid"></table>
	<div id="pager"></div>
	<div id="list-param">
		<div uri="showPage/dict_add" title="添加数据字典" busi="dict" value="" dialog-width="500" class="add-param param" />
		<div uri="showPage/dict_edit" title="修改数据字典" busi="dict" value="" dialog-width="500" class="edit-param param" />
		<div uri = "dict/del" msg="数据字典可能被多表引用，删除可能导致系统无法运行，请慎重操作，您确定删除该数据吗？" busi="dict" value="" delAfter="refreshGrid()" class="del-param param" />
	</div>
</div>
<script type="text/javascript">
    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-85;
	$("#grid-list").jqGrid({
		url : "crud/queryTree?bean=dictList",
		datatype : 'json',
		mtype : 'POST',
		treeGrid : true,
		colNames : [ 'ID','数据名称','业务值','状态', '排序' ],
		colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
		             {name : 'name'}, 
		             {name:'dictId'},
		             {name : 'state'}, 
		             {name : 'seqNum'} 
		           ],
		ExpandColumn : 'name',
		ExpandColClick : true,
		treeGridModel : 'adjacency',
		pager : '#pager',
		sortorder : 'desc',
		viewrecords : true,
		gridview : true,
		caption : '数据字典列表',
		autowidth : true,
		height:jqGridH,
		onSelectRow: function(id){   
			$(".param").attr("value",id);
		}
	});
	$("#grid-list").jqGrid("navGrid", "#pager", {
		search : false,
		edit : false,
		add : false,
		del : false,
		refreshtext:'刷新'
	});
	$("#grid-list").navButtonAdd("#pager",{
	    caption:"删除",buttonicon:"ui-icon-trash list-btn-del",position:"first"
	}).navButtonAdd("#pager",{
	     caption:"修改",buttonicon:"ui-icon-pencil list-btn-edit",position:"first"
	}).navButtonAdd("#pager",{
	    caption:"添加",buttonicon:"ui-icon-plus list-btn-add",position:"first"
	});
	
	//
	function refreshGrid() {
		$("#grid-list").trigger("reloadGrid");
	} 
</script>