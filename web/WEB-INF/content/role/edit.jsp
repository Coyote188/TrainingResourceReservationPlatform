<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
 <div class="wrap-content-dialog">
      <form id="role-form-edit" >
      	<input type="hidden" name= "objBean.id" value="${objBean.id}">
         <table class="table table-hover table-condensed">
		<tr>
			<td class="td-col1">角色名称</td>
			<td >
			<input type="text" class="input30 require" length="1,32" label-name="角色名称" value="${objBean.roleName}" name="objBean.roleName"/>
			</td>
			<td class="td-col1">单位</td>
				<td>
					<input id="orgSel" type="text" onclick="showMenu();" type="text" class="input30 require" style="width: 80%;" value="" readonly="">
					<input id="orgId" name= "objBean.orgId" value="${objBean.orgId}" type="hidden" >					
			</td>
		</tr>
		<tr>
			<td class="td-col1">角色描述</td>
			<td colspan="2">
				<input type="text" class="input30 " style="width: 80%;" length="1,100" label-name="角色描述" value="${objBean.roleDes}" name="objBean.roleDes"/>
			</td>
			<td class="text-center">
				<input id="role-edit_btn" type="button" class="button" value="保存"/>
			</td>
		</tr>
	 </table>
      </form>
      <div class="left" style="width: 30%;">	   		
	     <div class="user-config-org-tree left" >
	       <h4 class="ui-widget-header ui-corner-top area_title">公共角色</h4>
		   <div id="user-org-tree" class="ui-widget-content" style="height:91%;">
		   		<table class="table table-hover table-condensed " id="roleCom_table">
		   				<tr><td id="ts1"><span class="msg-body">数据加载中...</span></td></tr>			   				
		   		</table>
		   </div>
	    </div>
	   <div id="user-org-ztree2" class="hidden " >
	   		<label id="ts2">角色权限</label>
	   		<ul id="ztree_permit_3"  class="ztree" style="margin-top:0; ">
			</ul>
	   </div>
		    
	 </div>
	 <div class=" left" style="width: 70%;">
		 <div id ="cc" class="user-config-org-tree left" style="width: 100%;height:400px;  margin-right: 5px;">
	       <h4 class="ui-widget-header ui-corner-top area_title">自定义配置权限</h4>
		   <div id="user-org-tree3" class="ui-widget-content" style="height:91%;overflow: auto;">
		   		<ul id="ztree_permit_4" class="ztree" style="margin-top:0; " >
				</ul>
		   </div>
	   	</div>
   	</div>
	
    <div id="orgContent" class="orgContent" style="position: absolute;  display: none;">
			<ul id="ztree_role_edit" class="ztree myztree" style="margin-top:0; ">
			</ul>
	</div>
</div><!-- wrap-content -->

<script type="text/javascript">

	var categoryName = "";

setTimeout("loadJs()", 200);
function loadJs() {
initRoleCom();//公共角色列表
roleAddinitZnodes();//组织机构树
cu.layout.formRequire();
cu.layout.formActive();
	var bodyHeight = $("body").height();
	$(".user-config-org-tree").css("height",(bodyHeight/3)*2);
	$("#role-edit_btn").click(function() {
	    if(checkForm("#role-form-edit",'top')) {
			
			var list = $("#role-form-edit").serialize();
			var menuIds = "";
			var permitIds = "";
			var pIds="";
			$("#ztree_permit_4").find(".operates").each(function(i){
				if(($(this).attr("checked")=="checked")&&($(this).attr("disabled")!="disabled")){//只获取可编辑的部分(即除去公共角色内容)
					permitIds +=$(this).attr("value")+",";
				}
			});
			menuIds = getzTreeCheckedIds("ztree_permit_4");
			pIds = getParentRoleIds();
			permitIds = permitIds.substring(0, permitIds.length-1);
			if(menuIds==""&&pIds==""){
				cu.toast("请选择相应的操作权限！");
				return;
			}
			
			cu.toast("提交中...", {
				type : "load"
			});
			var reqData = "&panertRoleIds="+pIds+"&permitIds="+permitIds+"&menuIds="+menuIds+"&"+list;
			$.post("role/editRole",reqData, function(json) {
				cu.toast.close();
				var output = $.parseJSON(json.output);
				cu.toast(output.msg);
				if(output.result == '1') {
					BootstrapDialogUtil.close();
					refreshGrid();
				}
			});
		}
		return false;
	});
}

function initRoleCom(){
	var reqData = "&roleId=${objBean.id}";
	$.post("role/getRoleComList",reqData,function(json){
		var res = jQuery.parseJSON(json.output);
		var roleCom ="";
		if(res.result =="1"){
			roleCom = res.data;
			$("#roleCom_table").empty();
			var str = "";
			for(var i=0;i<roleCom.length;i++){
				var checked = "";
				if((roleCom[i][2])!=null&&(roleCom[i][2])!=""){
					 checked = "checked = 'checked'";
				}
				str+='<tr><td><input class="roleComCheck" type="checkbox" onclick=getPermitZnodes_4(); value="'+roleCom[i][0]+'" '+checked+' style="cursor:pointer;" ></td><td><label style="cursor:pointer; color:#2392F7;"  class="m-b-0 roleCom_text" r_name="'+roleCom[i][1]+'" r_id="'+roleCom[i][0]+'"  >'+roleCom[i][1]+'</label></td></tr>';
			}
			$("#roleCom_table").append(str);
			setTimeout("getPermitZnodes_4()", 200);//自定义权限树
			
			$(".roleCom_text").on('click',function(){
				$(".popover").remove();
				$(this).css("cursor","progress");
				var roleCom_name = $(this).attr("r_name");
				var roleCom_id = $(this).attr("r_id");
				getPermitZnodes_3(roleCom_id,roleCom_name,this)
					
			}).on('mouseleave',function(){
					$(".popover").remove();
			});;
			
		}else{
			cu.toast(res.msg);	
			$("#ts1").html("加载失败");
		}
	});
}


function getPermitZnodes_4(){
		var pIds = getParentRoleIds();
		
		reqData = "&op=tree4&panertRoleIds="+pIds+"&roleId=${objBean.id}";
		$.post("role/permitZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			permitZtree_4(zNodes);			
		});	
	}	
	
	
	function permitZtree_4(zNodes){
	
		var operates = [];
		$.fn.zTree.init($("#ztree_permit_4"),{
				data : {
					simpleData : {
						enable : true
					}
				},
				check: {
					enable: true,
					chkboxType: { "Y": "p", "N": "s" }//勾选关联父级  取消关联父级
				}, 
				view: {
					addDiyDom: function(treeId, treeNode) {
						var aObj = $("#" + treeNode.tId + "_a");
						var html = [];
						for(var i=0;i<treeNode.operates.length;i++) {
							var op = treeNode.operates[i];
							var checked = "";
							var disabled = "";
							if(op.checked=="true")
								checked = "checked=''";
							if(op.disabled =="false")
								disabled ="disabled='disabled'"
							html.push(" <label class='childCheckbox'><input ptid='"+treeNode.tId+"' class=\"operates\" type=\"checkbox\" name=\"operates\" "+checked+" "+disabled+ "   value=\""+op.menuId+";"+op.val+"\">&nbsp;"+op.name+"&nbsp;</label>");
						}
						aObj.after(html.join(""));
					}
				},
				callback : {
					onCheck: function(event, treeId, treeNode){//取消父节点时  取消全部附属节点
						var obj = $("#"+treeNode.tId);
						if(!treeNode.checked){//父节点取消时触发
							obj.find(":checkbox").attr("checked",false);
						}
					},
					beforeClick:function(treeId, treeNode){
						var zTree = $.fn.zTree.getZTreeObj("ztree_permit_4");
						zTree.checkNode(treeNode, !treeNode.checked, true, true);
					},
					beforeCheck :function(treeId, treeNode){
						if(treeNode.doCheck=="false"){
							return false;
						}else{
							return true;
						}
					}
				}
			},zNodes
		);
		myCheckBoxonClik("ztree_permit_4");
	}
	
	
	function getPermitZnodes_3(roleComId,roleComName,event){
			var reqData = "&op=tree3&roleId="+roleComId;
			$.post("role/permitZtree",reqData,function(json){
				var res = jQuery.parseJSON(json.output);
				var zNodes ="";
				if(res.result =="1"){
					zNodes = res.data;
				}else{
					cu.toast(res.msg);	
				}
				$("#ztree_permit_3").empty();
				permitZtree_3(zNodes,event);//生成树
				
			});	
	}	

	
	function permitZtree_3(zNodes,event){
		var operates = [];
		$.fn.zTree.init($("#ztree_permit_3"),{
				data : {
					simpleData : {
						enable : true
					}
				},
				check: {
					enable: true,
					chkboxType: { "Y": "p", "N": "s" }//勾选关联父级  取消关联父级
				}, 
				view: {
					addDiyDom: function(treeId, treeNode) {
						var aObj = $("#" + treeNode.tId + "_a");
						var html = [];
						for(var i=0;i<treeNode.operates.length;i++) {
						//alert(treeNode.tId);
							var op = treeNode.operates[i];
							var checked = "";
							if(op.checked=="true")
								checked = "checked=''";
							html.push(" <label class='childCheckbox'><input ptid='"+treeNode.tId+"' class=\"operates\" type=\"checkbox\" name=\"operates\" "+checked+"  value=\""+op.menuId+";"+op.val+"\">&nbsp;"+op.name+"&nbsp;</label>");
						}
						//alert(html);
						aObj.after(html.join(""));
					}
				}
			},zNodes
		);
		setTimeout(_popShow("user-org-ztree2",event),500);
	}
	
	function _popShow(treeId,event){
		return function(){
			popShow(treeId,event);
		}
	}

	//显示气泡组件
	function popShow(treeId,event){
		var str = $("#"+treeId).html();
		$(event).css("cursor","pointer");
		$(event).popover({placement:"right",//映射到气泡中
					html: 'true', 
					content:str,
					width : '100%',
					trigger:'manual'});
		$(event).popover('show');		
	}
	
	//勾选附属节点时，联动主节点勾选
	function myCheckBoxonClik(id){
		$("#"+id).find(":checkbox").css("cursor","pointer");
		$("#"+id).find(".chk").css("cursor","pointer");
		$(".operates").die().bind("click",function(){
			var tid = $(this).attr("ptid");
			var ztreeObj =  $.fn.zTree.getZTreeObj(id);
			var node = ztreeObj.getNodeByTId(tid);
			ztreeObj.checkNode(node,true, true,true);//本节点，勾选时触发，联动父级节点，触发onCheck 事件	
		})
	}
	
	//获取公共角色 ids
	function getParentRoleIds(){
		var obj = $("#roleCom_table").find("input:checkbox:checked");
		var ids ="";
		obj.each(function(i){
			if($(this).attr("class")!="operates")
				ids+=$(this).val()+",";
		});
		ids = ids.substring(0,ids.length-1);
		return ids;
	}



//组织机构树配置文件
	var seeting_user_add = {
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick :userAddOnClick
			},
			myQuery:{
				enable :true,
				showHtml: '<input  onclick="tNameFocus(this);" id="categoryQ" type="text" value="   输入机构名称检索" class="input30" style=" margin-bottom: 5px;">'
				+'&nbsp;&nbsp;<a onclick="zTreeQuery()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/query.png">查询</a>'
				+'&nbsp;<a onclick="zTreeRefresh()"><img alt="" src="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/img/refresh.png">刷新</a>'
			}
		};

	
	//生成树
	function roleAddinitZnodes(){
		var reqData = "&queryOrgName="+categoryName+"&flag=normalQuery";
		$.post("org/orgZtree",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			var zNodes ="";
			if(res.result =="1")
				zNodes = res.data;
			else
				cu.toast(res.msg);	
			
			$.fn.zTree.init($("#ztree_role_edit"), seeting_user_add, zNodes);
			initPName();	
		});	
	}
	
	//点击触发
	function userAddOnClick(e, treeId, treeNode) {
		var names = [];
		var strName = "";
		names = getZtreeParentNames(names,treeNode,0);
		//alert(JSON.stringify(names));
		for(var i=names.length-1;i>=0;i--){
			strName +=names[i];//组合层级名称
			if(i!=0){
				strName +=">>";
			}
		}
		var orgObj = $("#orgSel");		
		orgObj.attr("value", strName);
		$("#orgId").val(treeNode.id);
		hideMenu();
	}



	function showMenu() {
		var orgObj = $("#orgSel");
		var cityOffset = $("#orgSel").offset();
		var formOffset =  $("#role-form-edit").offset();
		$("#orgContent").slideDown("fast");
		$("#orgContent").css({left:cityOffset.left-formOffset.left+ 5 + "px", top:cityOffset.top -formOffset.top +5 + orgObj.outerHeight() + "px"}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#orgContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "orgSel" || event.target.id == "orgContent" || $(event.target).parents("#orgContent").length>0)) {
			hideMenu();
		}
	}
	
	//按名字查询树
	function zTreeQuery(){
		if($("#categoryQ").val()==''||$("#categoryQ").val()=='   输入机构名称检索'){
			cu.toast("请输入查询的机构名称！");
			return;
		}else{
			categoryName = trim($("#categoryQ").val());
			$("#ztree_role_edit").empty();
			roleAddinitZnodes();
		}
	}
	
	//重置树
	function zTreeRefresh(){
		$("#ztree_role_edit").empty();
			categoryName = "";
			roleAddinitZnodes();
	}
	
	//初始化机构名称 和 机构值
	function initPName(){
		if($("#orgSel").val()==null||$("#orgSel").val()==""){
			if("${objBean.orgId}"!=0){
				var zTree = $.fn.zTree.getZTreeObj("ztree_role_edit");
				var node = zTree.getNodeByParam("id","${objBean.orgId}",null);
	
				var pName = node.name;
				var pNode = node.getParentNode();
				if(pNode !=null){
					pName = pNode.name+">>"+pName;
				}
				$("#orgSel").val(pName);
	
			}
		}
	}
	
	function getzTreeCheckedIds(ztreeName){
			var checkedIds = "";
			var treeObj = $.fn.zTree.getZTreeObj(ztreeName);
			var nodeArr = treeObj.getCheckedNodes(true);
			$.each(nodeArr,function(i,n){
				if(n.doCheck!="false") //只获取可编辑(即除去公共角色内容)
					checkedIds +=n.id+","
			});
			if (checkedIds.length > 0 ) 
				checkedIds = checkedIds.substring(0, checkedIds.length-1);
			return checkedIds;
	}
	
	
	
</script>

