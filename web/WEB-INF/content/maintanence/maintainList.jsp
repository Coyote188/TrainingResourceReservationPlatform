<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <div class="wrap-content">
	<table id="grid-list" class="jq-grid-lo"></table>
	<div id="pager"></div>
	<div id="list-param">
		<div uri="maintanence/add?orgId=${orgId }&vCardId=${vCardId }" title="添加用户" value="" dialog-width="700" class="add-param param" />
	</div>
  </div><!-- wrap-content -->
<script type="text/javascript">
    var jqGridH = $("#cu-org-content").height()-170;
   	$(
   		 listQr()
   	);
   	
   	function listQr(){
   		$("#grid-list").jqGrid({ //a.m_id,, a.maintenance, a.inspector, a.mtn_time, a.org_id
   			url : "crud/queryPage?bean=maintainQr&orgId=${orgId}&vCardId=${vCardId}",
   			datatype : 'json',
   			mtype : 'POST',
   			colNames : [ 'ID','例保记录','例保检测人','例保时间'],
   			colModel : [ {name:'m_id',index:'m_id', width:1,hidden:true,key:true},
   						{name:'maintenance'},
   						{name:'inspector'}, 
   						{name:'mtn_time'}
   						],
   			        pager : '#pager',
   					rowList : [ 10, 20, 30 ],
   					rowNum : 20,
   					viewrecords : true,
   					gridview : true,
   					caption : '${orgSeqName}  用户列表',
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
	    caption:"添加",buttonicon:"ui-icon-plus list-btn-add",position:"first"
	});
	
	//
	function refreshGrid() {
		$("#grid-list").trigger("reloadGrid");
	}
</script>