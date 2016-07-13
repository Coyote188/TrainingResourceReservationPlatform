<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <div class="wrap-content">
	<table id="grid-list" class="jq-grid-lo"></table>
	<div id="pager"></div>
	<div id="list-param">
		<div uri="maintanence/add?orgId=${orgId }" title="添加维修保养信息" value="" dialog-width="700" class="add-param param" />
		<div uri="maintanence/user_edit" title="修改维修保养信息" busi="user" value="" dialog-width="700" class="edit-param param" />
		<div uri = "maintanence/del" msg="确定要删除选中的维修保养信息吗？" busi="user" value="" delAfter="refreshGrid()" class="del-param param mutil-select" />
	</div>
  </div><!-- wrap-content -->
<script type="text/javascript">
    var jqGridH = $("#cu-org-content").height()-170;
   	$(
   		 listQr()
   	);
   	
   	function listQr(){
   		var _args = "";
   		if("" != "${l}" && null != "${l}" && typeof("${l}") != "undefined"){
   			_args += "&l=" + "${l}";
   		}
   		if("" != "${p}" && null != "${p}" && typeof("${p}") != "undefined"){
   			_args += "&p=" + "${p}";
   		}
   		if("" != "${m}" && null != "${m}" && typeof("${m}") != "undefined"){
   			_args += "&m=" + "${m}";
   		}
   		$("#grid-list").jqGrid({
   			url : "crud/queryPage?bean=maintenanceList&orgId=${orgId}&con=${con}" + _args,
   			datatype : 'json',
   			mtype : 'POST',
   			colNames : [ 'ID','卡号','车牌号','车架号','所有人','联系人','联系电话','所属公司','维修点','例保记录','例保检测人','例保时间'],
   			colModel : [ {name:'m_id',index:'id', width:1,hidden:true,key:true}, 
   			             {name : 'vehicle_id'}, 
   			          	 {name : 'license_place'},
   			             {name : 'frame_number'},
	   			         {name : 'owner'},
		   			     {name : 'contacts'},
			   			 {name : 'contact_number'},
			   			 {name : 'vehicle_company'},
   			             {name:'place'},
   			             {name:'maintenance'},
   			             {name : 'inspector'}, 
   			             {name : 'mtn_time'}
   			           ],
   			        pager : '#pager',
   					rowList : [ 10, 20, 30 ],
   					rowNum : 20,
   					viewrecords : true,
   					gridview : true,
   					caption : '${orgSeqName}  维修保养信息列表',
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
   		
   		
   	}
   	function onGridComplete2() {
		var ids = $("#grid-list").jqGrid("getDataIDs");
		for ( var i = 0; i < ids.length; i++) {
			var rowData = $("#grid-list").getRowData(ids[i]);
			var id = rowData["id"];
			var name = rowData["userName"];
			var url = "user/userInfo?id=" + id;
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
	    caption:"添加",buttonicon:"ui-icon-plus list-btn-add",position:"first"
	});
	
	//
	function refreshGrid() {
		$("#grid-list").trigger("reloadGrid");
	}
</script>