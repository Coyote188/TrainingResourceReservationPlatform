<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="wrap-content">
	<table id="roleCom-grid-list" class="jq-grid"></table>
	<div id="pager"></div>
	
	<div id="list-param">
		<div uri="showPage/roleCom_add" title="添加公共角色" value="" dialog-width="700"  class="add-param param" />
		<div uri="showPage/roleCom_edit" title="修改公共角色信息" busi="role"  value="" dialog-width="700" class="edit-param param" />
		<div uri = "role/delRoleCom" msg="删除该公共角色的同时也将删除普通角色与其的继承关系，确定删除吗？" busi="" value="" delAfter="refreshGrid()" class="del-param param" />
	</div>
</div>
<script type="text/javascript">
    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-85;
    $("#roleCom-grid-list").jqGrid({
		url : "crud/queryPage?bean=roleList&flag=false&orgId=${userInfo.orgId}",
		datatype : 'json',
		mtype : 'POST',
		colNames : [ "角色ID", "角色名称", "角色备注"],
		colModel : [ {name : 'roleId',index : 'id',key : true,hidden:true}, 
		             {name : 'roleName'}, 
		             {name : 'roleDes'}
		             
		            ],
		pager : '#pager',
		rowList : [ 10, 20, 30 ],
		rowNum : 20,
		viewrecords : true,
		gridview : true,
		caption : '公共角色列表',
		autowidth : true,
		height:jqGridH,
		multiselect : true,
		gridComplete : function() {
			onGridComplete1();
		},
		onSelectRow: function(id){   
			var ids = $("#roleCom-grid-list").jqGrid('getGridParam', 'selarrrow');
			if(ids != '') {
				ids = ids.join(",");
			}
			$(".param").attr("value",ids);
		}
	});
	
	function onGridComplete1() {
		var ids = $("#roleCom-grid-list").jqGrid("getDataIDs");
		for ( var i = 0; i < ids.length; i++) {
			var rowData = $("#roleCom-grid-list").getRowData(ids[i]);
			var id = rowData["roleId"];
			var name = rowData["roleName"];
			var url2 = "role/roleInfo?id=" + id;
			var newName = '<a href="' + url2 + '" class="in-table role-com-info">';
			newName += '<span class="left ui-icon ui-icon-newwin"></span>'+name+'</a>';

			$("#roleCom-grid-list").jqGrid('setRowData', ids[i], {
				roleName:newName
			});
		}
		$(".role-com-info").click(function(){
			var uri=$(this).attr("href");
			if(trim(uri) != '') {
				BootstrapDialogUtil.loadUriDialog("角色详细信息",uri,600,"#fff",true);
			}
			return false;
		});
		
	};
	
	$("#roleCom-grid-list").jqGrid("navGrid", "#pager", {
		search : false,
		edit : false,
		add : false,
		del : false
	}); 
	$("#roleCom-grid-list").navButtonAdd("#pager",{
	    caption:"删除",buttonicon:"ui-icon-trash list-btn-del",position:"first"
	}).navButtonAdd("#pager",{
	     caption:"修改",buttonicon:"ui-icon-pencil list-btn-edit",position:"first"
	}).navButtonAdd("#pager",{
	    caption:"添加",buttonicon:"ui-icon-plus list-btn-add",position:"first"
	}); 
	
	function refreshGrid() {
		$("#roleCom-grid-list").trigger("reloadGrid");
	} 
</script>