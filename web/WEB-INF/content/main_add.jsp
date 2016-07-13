<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="include/menuMaintain" executeResult="true" />
<div class="wrap-content">
 <div class="wrap-content-dialog">
	<!-- 车辆基本信息 -->
	<table id="tblVehicleBasic" style="width: 70%; margin-left: 15%;">
		<tbody>
				<tr>
					<td class="td-col1">卡号</td>
					<td >
					<input type="text" disabled="disabled" class="input_mnt" style="background-color: #ffffff;" label-name="卡号" value="${vCardId}" name="veBean.id"/>
					</td>
					<td class="td-col1">车牌号</td>
					<td>
					<input type="text" disabled="disabled"  class="input_mnt" style="background-color: #ffffff;" label-name="车牌号" value="${veBean.licensePlate}" name="veBean.licensePlate"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">车架号</td>
					<td >
					<input type="text" disabled="disabled"  class="input_mnt" style="background-color: #ffffff;" label-name="车驾号" value="${veBean.frameNbr}" name="veBean.frameNbr"/>
					</td>
					<td class="td-col1">车主</td>
					<td >
					<input type="text" disabled="disabled"  class="input_mnt" style="background-color: #ffffff;" label-name="车主" value="${veBean.owner}" name="veBean.owner"/>
					</td>
				</tr>
				<tr>
					<td class="td-col1">联系人</td>
					<td >
					<input type="text" disabled="disabled"  class="input_mnt" style="background-color: #ffffff;" label-name="联系人" value="${veBean.contacts}" name="veBean.contacts"/>
					</td>
					<td class="td-col1">联系电话</td>
					<td >
					<input type="text" disabled="disabled" class="input_mnt" style="background-color: #ffffff;" label-name="联系电话" value="${veBean.contactNbr}" name="veBean.contactNbr"/>
					</td>
				</tr>
		</tbody>
	</table>
	<div id="dvAddNewVehicle" style="width: 90%;">
		<input id="btnAddNewVehicle" class="ui-button" type="button" value="新增车辆信息" />
	</div>
	<!-- 保养记录 -->
	<div id="cu-qr-content" style="margin-top: 10px;">
	
	</div>
	
</div><!-- wrap-content-dialog -->
<script type="text/javascript">
$.extend({
	maintainList: function(){
		$.loadUri("#cu-qr-content","maintanence/maintainList?orgId=${orgId}&vCardId=${vCardId}");
	},
	loadUri:function(id,uri) {
		waitLoading("数据加载中...");
		$.get("islogin",function(data){
			var output = $.parseJSON(data.output);
			if(output.result=='1') {
				$(id).load(uri, function() {
					var gridList = $(".jq-grid");
					if(typeof(gridList) !== 'undefined') {
						//grid高宽自适应
						cu.layout.gridAuto();
						$.contentAutoGrid();
					}
					cu.layout.formActive();
					cu.layout.listBtnListener();
					cu.layout.formRequire();
					colseWaitLoading();
				});
			} else {
				location.reload();
			}
		});
	},
	contentAutoGrid:function() {
		var gridList = $(".jq-grid");
		if(typeof(gridList) !== 'undefined') {
			var jqGridW = $("#cu-content").width()-10;
			$("#cu-content").css({"overflow":"hidden"});
			gridList.setGridWidth(jqGridW);
		}
		var jqGridLo = $(".jq-grid-lo");
		if(typeof(jqGridLo) !== 'undefined') {
			var jqGridW = $("#cu-org-content").width()-10;
			$("#cu-org-content").css({"overflow":"hidden"});
			jqGridLo.setGridWidth(jqGridW);
		}
	},
	newCardCheck: function(){
		if("${veBean}" == null || "${veBean}" == ""){
			$("#tblVehicleBasic").hide();
			$("#btnAddNewVehicle").click(function(){
				var uri = "vehicle/add4CardReader?orgId=${orgId}&vCardId=${vCardId}";
				BootstrapDialogUtil.loadUriDialog("添加新车辆信息",uri,"600","#fff");
			});
		}else{
			$("#dvAddNewVehicle").hide();
			$("#tblVehicleBasic").show();
		}
	}
});

$(
		$.maintainList(),
		$.newCardCheck()
		
);

</script>
</div>
<jsp:include page="include/footer.jsp" />

