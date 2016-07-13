<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="wrap-content">
	<table id="grid-list" class="jq-grid"></table>
	<div id="pager"></div>
	
	<div id="list-param">
		<div uri="showPage/org_add" title="添加组织机构" busi="org" value="" dialog-width="500" class="add-param param" />
		<div uri="showPage/org_edit" title="修改组织机构" busi="org" value="" dialog-width="500" class="edit-param param" />
		<div uri = "org/del" msg="确定要删除该机构数据吗？" busi="org" value="" delAfter="refreshGrid()" class="del-param param" />
	</div>
</div>
<script type="text/javascript">
    //var jqGridH = ($("#cu-content").height()-35)*0.80;
    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-85;
	$("#grid-list").jqGrid({
		url : "crud/queryTree?bean=orgList",
		datatype : 'json',
		mtype : 'POST',
		treeGrid : true,
		colNames : [ '机构ID', '机构名称','类型','层级名称', '机构代码','联系人', '联系电话' ],
		colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
		             {name : 'orgName',width:'240px'}, 
		             {name : 'type',width:'50px'},
		             {name : 'orgSeqName',width:'220px'},  
		             {name:'orgCode'},
		             {name : 'contact',width:'100px'},
		             {name : 'tel'}
		           ],
		ExpandColumn : 'orgName',
		ExpandColClick : true,
		treeGridModel : 'adjacency',
		pager : '#pager',
		sortorder : 'desc',
		viewrecords : true,
		gridview : true,
		caption : '组织机构列表',
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
	
	function refreshGrid() {
		$("#grid-list").trigger("reloadGrid");
	} 
</script>