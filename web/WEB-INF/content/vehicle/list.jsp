<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <div class="wrap-content">
	<table id="grid-list" class="jq-grid-lo"></table>
	<div id="pager"></div>
	<div id="list-param">
		<div uri="vehicle/add?orgId=${orgId }" title="添加车辆信息" value="" dialog-width="700" class="add-param param" />
		<div uri="vehicle/edit" title="修改车辆信息" busi="user" value="" dialog-width="700" class="edit-param param" />
		<div uri = "vehicle/del" msg="确定要删除选中的车辆信息吗？" busi="user" value="" delAfter="refreshGrid()" class="del-param param mutil-select" />
	</div>
  </div><!-- wrap-content -->
<script type="text/javascript">
    var jqGridH = $("#cu-org-content").height()-95;

	$("#grid-list").jqGrid({
		url : "crud/queryPage?bean=vehicleList",
		datatype : 'json',
		mtype : 'POST',
		colNames : [ '卡号','车牌号码','车架号','车主','联系人','联系电话', '所属公司'],
		colModel : [ {name:'card_id',index:'id', width:80,key:true}, 
		             {name : 'license_place',width :'80px'}, 
		             {name:'frame_number',width :'130px'},
		             {name:'owner',width :'60px'},
		             {name : 'contacts',width :'60px'}, 
		             {name : 'contact_number',width :'80px'},
		             {name :'vehicle_company',width :'100px'}
		           ],
		pager : '#pager',
		rowList : [ 10, 20, 30 ],
		rowNum : 20,
		viewrecords : true,
		gridview : true,
		caption : '${orgSeqName}  车辆信息列表',
		autowidth : true,
		multiselect : true,
		height:jqGridH,
		//选一条
		onSelectRow: function(id,st){ 
		    var ids = $("#grid-list").jqGrid("getGridParam", "selarrrow");
		    if(ids != '') {
		       ids = ids.join(",");
		    }
		    $(".param").attr("value",ids);
		},
		//全选
		onSelectAll : function(ids,st) {
		   if(st) {
		      ids = ids.join(",");
		      $(".mutil-select").attr("value",ids);
		   } else {
		       $(".mutil-select").attr("value","");
		   }
		},
		gridComplete:function() {
		   $("#pager_center").css("width","40%");
		   $("#pager_left").css("width","42%");
		   onGridComplete2();
		}
	});
	
	
	function onGridComplete2() {
		var ids = $("#grid-list").jqGrid("getDataIDs");
		for ( var i = 0; i < ids.length; i++) {
			var rowData = $("#grid-list").getRowData(ids[i]);
			var id = rowData["id"];
			var name = rowData["userName"];
			var url = "vehicle/vehicleInfo?id=" + id;
			var newName = '<a href="' + url + '" class="in-table user-info">';
			newName += '<span class="left ui-icon ui-icon-newwin"></span>'+name+'</a>';

			$("#grid-list").jqGrid('setRowData', ids[i], {
				userName:newName
			});
		}
		$(".user-info").click(function(){
			var uri=$(this).attr("href");
			if(trim(uri) != '') {
				BootstrapDialogUtil.loadUriDialog("用户详细信息",uri,600,"#fff",true);
			}
			return false;
		});
		
	};
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