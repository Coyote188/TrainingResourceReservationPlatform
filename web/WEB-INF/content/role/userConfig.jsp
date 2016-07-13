<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script src="${pageContext.request.contextPath}/js/JQuery_zTree/orgzTree.js" type="text/javascript"></script>
	<div class="auth-config">
	    <div class="desc"></div>
	    <div class="user-list left">
		    <div class="user-config-org-tree left">
		       <h4 class="ui-widget-header ui-corner-top area_title" style="margin-top: 0">组织机构
		       		    	<span style="margin-left:20px; margin-right: 5px;cursor: auto;"></span>
		       </h4>
			   <div id="user-org-tree" class="ui-widget-content">
			  	 	<ul id="configUser_org_ztree" class="ztree mytree" style="margin-top:0; ">
					</ul>
			   </div>
		    </div>
		    <div class="grid-user-list">
			    <table id="grid_org_user"></table>
			    <div id="pager_org_user"></div>
		    </div>
		</div>
		<div class="left op-btn-group">
			<button class="btn btn-default" id="btn-add-user">&gt;&gt;</button>
			<button class="btn btn-default" id="btn-del-user">&lt;&lt;</button>
		</div>
		<div class="select-user-list">
		   <table id="grid_select_user"></table>
		   <div id="pager_select_user"></div>
		</div>
	</div>
<script type="text/javascript">

 var roleId = '${objBean.id}';
 var roPid = '${roPid}';
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
				if($("#totCheck").attr("checked")=="checked")
					flag = "true";
				if(!treeNode.nocheck){
					if(treeNode.getParentNode()!=null){
						name = treeNode.getParentNode().name+">>"+name;
					}
				}
				if(flag == "true")
					name = name+"(合)";
				OrgUserReload(id,name);	
				//$("#grid_org_user").trigger("reloadGrid");
			}
		}
};

  setTimeout("loadJs4()", 500);
  function loadJs4() {

 	 $(".bootstrap-dialog-title").append("(  角色:  ${objBean.roleName })");	
  	  var ztreeObj = $("#configUser_org_ztree");//树结构对象 必须设置
	  var datas = '${output}';
	  var datas = $.parseJSON(datas);
	  if (datas.result == '1') {
		  $.fn.zTree.init(ztreeObj, include_setting, datas.data);
	  }
	 	gridOrgUser(roPid,"未配置用户");
	 	gridSelectUser();

	  $("#btn-add-user").click(function() {
			var gr = $("#grid_org_user").jqGrid('getGridParam', 'selarrrow');
			if (gr == null || gr == '') {
				cu.toast("请选择数据!", {type : "alert"});
			} else {
				$.post("role/roleUser",{id:gr.join(","),op:"save",roleId: roleId}, function(json) {
					var output = $.parseJSON(json.output);
					if(output.result == '1') {
						$("#grid_org_user").trigger("reloadGrid");
						$("#grid_select_user").trigger("reloadGrid");
					} else {
						cu.toast(output.msg);
					}
				});
			}
		});

		$("#btn-del-user").click(function() {
			var gr = $("#grid_select_user").jqGrid('getGridParam', 'selarrrow');
			if (gr == null || gr == '') {
				cu.toast("请选择数据!", {type : "alert"});
			} else {
				$.post("role/roleUser", {id:gr.join(","),op:"del",roleId:roleId},function(json) {
					var output = $.parseJSON(json.output);
					if(output.result == '1') {
						$("#grid_org_user").trigger("reloadGrid");
						$("#grid_select_user").trigger("reloadGrid");
					} else {
						cu.toast(output.msg);
					}
				});
			}
		});
	  
  }
  
  function gridOrgUser(orgId,name) {
  	  var flag = "true";
		
	  var url = "crud/queryPage?bean=roleUserList&oi=out&flag="+flag+"&roleId="+roleId+"&orgId="+orgId;
	  $("#grid_org_user").jqGrid({
			url : url,
			datatype : 'json',
			mtype : 'POST',
			colNames : [ 'ID','用户名','组织机构'],
			colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
			             {name : 'username',width:'75px'}, 
			             {name:'orgName'}
			           ],
			pager : '#pager_org_user',
			viewrecords : true,
			gridview : true,
			caption : name,
			width : 352,
			pginput:false,
			multiselect : true,
			height:300,
			gridComplete : function() {
				$("#pager_org_user_left").remove();
			}
	  });
	  $("#grid_org_user").jqGrid("navGrid", "#pager_org_user", {
			search : false,
			edit : false,
			add : false,
			del : false,
			refresh:true
	});
  }
  
   function OrgUserReload(orgId,titName){
  	  var flag = "false";
	  if($("#totCheck").attr("checked")=="checked")
		  flag = "true";
  	$("#grid_org_user").jqGrid('setGridParam', {
			url : "crud/queryPage?bean=roleUserList&oi=out&flag="+flag+"&roleId="+roleId+"&orgId="+orgId
		}).trigger("reloadGrid");
  }
  

  
  
  function gridSelectUser() {
	  var url = "crud/queryPage?bean=roleUserList&oi=in&roleId="+roleId;
	  $("#grid_select_user").jqGrid({
			url : url,
			datatype : 'json',
			mtype : 'POST',
			colNames : [ 'ID','用户名','组织机构'],
			colModel : [ {name:'id',index:'id', width:1,hidden:true,key:true}, 
			             {name : 'username',width:'75px'}, 
			             {name:'orgName'}
			           ],
			pager : '#pager_select_user',
			viewrecords : true,
			gridview : true,
			caption : '已配置用户',
			width : 335,
			pginput:false,
			multiselect : true,
			height:310,
			gridComplete : function() {
				$("#pager_select_user_left").remove();
			}
	  });
	  $("#grid_select_user").jqGrid("navGrid", "#pager_select_user", {
			search : false,
			edit : false,
			add : false,
			del : false,
			refresh:false
	});
  }
</script>