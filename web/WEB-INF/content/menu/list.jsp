<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="wrap-content">
	<table id="grid-list" class="jq-grid"></table>
	<div id="pager"></div>
	<div id="list-param">
			<div uri="showPage/menu_add" title="添加菜单" busi="menu" value="" dialog-width="500" class="add-param param" />
			<div uri="showPage/menu_edit" title="修改菜单" busi="menu" value="" dialog-width="500" class="edit-param param" />
			<div uri = "menu/del" msg="确定要删除该菜单数据吗？" busi="menu" value="" delAfter="refreshGrid()" class="del-param param" />
	</div>
</div>
<script type="text/javascript">
    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-85;
	$("#grid-list").jqGrid({
		url : "crud/queryTree?bean=menuList&flag=b_menu",
		datatype : 'json',
		mtype : 'POST',
		treeGrid : true,
		colNames : [ '菜单ID', '菜单名称', '菜单url','状态', '排序' ],
		colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
		             {name : 'name'}, 
		             {name:'url'},
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
		caption : '菜单列表',
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
		del : false
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