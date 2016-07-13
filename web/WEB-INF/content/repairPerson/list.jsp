<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
  <div class="wrap-content">
	<table id="grid-list" class="jq-grid-lo"></table>
	<div id="pager"></div>
	<div id="list-param">
		<div uri="repairPerson/add?orgId=${orgId}" title="添加维修保养人" value="" dialog-width="700" class="add-param param" />
		<div uri="showPage/repairPerson_edit" title="修改维修保养人" busi="repairPerson"  value="" dialog-width="700" class="edit-param param" />
		<div uri = "repairPerson/del" msg="确定要删除选中的维修保养人吗？" busi="" value="" delAfter="refreshGrid()" class="del-param param mutil-select" />
	</div>
  </div><!-- wrap-content -->
<script type="text/javascript">
    var jqGridH = $("#cu-content").height() - $(".wrap-footer").height()-130;
    if("${flag}"=="")
    	var flag = "true";
   	else
   		flag = "${flag}";
    if($("#totCheck1").attr("checked")=="checked")
    	flag = "true";
    else
    	flag = "false";
    $("#grid-list").jqGrid({
   			url : "crud/queryPage?bean=repairPersonList&orgId=${orgId}&flag="+flag,
   			datatype : 'json',
   			mtype : 'POST',
   			colNames : [ 'ID','维修保养人名称','联系电话','状态'],
   			colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
   			             {name:'user_name',width :'90px'},
   			             {name:'mobile_no',width :'50px'},
   			             {name : 'state',width :'50px'}
   			           ],
   			        pager : '#pager',
   					rowList : [ 10, 20, 30 ],
   					rowNum : 20,
   					viewrecords : true,
   					gridview : true,
   					caption : '${orgSeqName}  维修保养人列表',
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
   					   //onGridComplete2();
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