<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="wrap-content">
	<table id="grid-list" class="jq-grid"></table>
	<div id="pager"></div>
	
	<div id="list-param">
		<div uri="showPage/role_add" title="添加角色" value="" dialog-width="700" class="add-param param" />
		<div uri="showPage/role_edit" title="修改角色信息" busi="role"  value="" dialog-width="700" class="edit-param param" />
		<div uri = "role/delRole" msg="删除该角色，将会同时删除与其对应的权限及人员配置数据，请谨慎操作，确定要删除吗？" busi="" value="" delAfter="refreshGrid()" class="del-param param" />
	</div>
</div>
<style>
.a_btn {
	width: 80px;
	height: 30px;
	text-align: center;
}
</style>
<script type="text/javascript">


    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-85;
    $("#grid-list").jqGrid({
		url : "crud/queryPage?bean=adPicList",
		datatype : 'json',
		mtype : 'POST',
		colNames : [ "信息ID", "标题","图片","发布人"],
		colModel : [ {name : 'id',index : 'id',key : true,hidden:true}, 
		             {name : 'title',width:'150px'}, 
		             {name : 'img',width:'220px'}, 
		             {name : 'creator'}
		            ],
		pager : '#pager',
		rowList : [ 10, 20, 30 ],
		rowNum : 20,
		viewrecords : true,
		gridview : true,
		caption : '轮播图列表',
		autowidth : true,
		height:jqGridH,
		multiselect : true,
		gridComplete : function() {
			$("#pager_center").css("width","40%");
			onGridComplete();
		},
		onSelectRow: function(id){   
			var ids = $("#grid-list").jqGrid('getGridParam', 'selarrrow');
			if(ids != '') {
				ids = ids.join(",");
			}
			$(".param").attr("value",ids);
		}
	});
	
	//setTimeout("aaa()", 1000);
	

	function onGridComplete() {
		var ids = $("#grid-list").jqGrid("getDataIDs");
		for ( var i = 0; i < ids.length; i++) {
			
			var rowData = $("#grid-list").getRowData(ids[i]);
			
			var id = rowData["id"];
			var imgUrl = rowData["img"];
			
			var baseUrl = "${pageContext.request.contextPath}";
			
			imgUrl = baseUrl+imgUrl;
			
			console.info(imgUrl);
			var html ='<img alt="" src='+imgUrl+' width="120px" height="80px">';
			
			$("#grid-list").jqGrid('setRowData', ids[i], {
				img:html
			});
		}
		$(".user-role-config").click(function(){
			var uri=$(this).attr("href");
			if(trim(uri) != '') {
				BootstrapDialogUtil.loadUriDialog("用户配置",uri,980,"#fff",true);
			}
			return false;
		});
		$(".permit-role-config").click(function(){
			
			var uri=$(this).attr("href");
			if(trim(uri) != '') {
				BootstrapDialogUtil.loadUriDialog("权限配置",uri,700,"#fff",true);
			}
			return false;
		});
		$(".role-info").click(function(){
			var uri=$(this).attr("href");
			if(trim(uri) != '') {
				BootstrapDialogUtil.loadUriDialog("角色详细信息",uri,600,"#fff",true);
			}
			return false;
		});
		
	};
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