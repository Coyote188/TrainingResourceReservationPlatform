<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div>
	<div style="width: 100%;border-bottom-style: solid;border-bottom-width: 1px;border-bottom-color: #000000; ">
		<table>
			<tbody>
				<tr>
					<td class="td-col1">例保时间:</td>
					<td >
					<input type="text" id="ipt_maintime" class="input30 require" length="1,32" label-name="例保时间"/>
					</td>
					<td class="td-col1">车牌号码;</td>
					<td >
					<input type="text" id="ipt_licene" class="input30 require" length="1,32" label-name="车牌号码"/>
					</td>
					<td class="td-col1">保养维修人:</td>
					<td >
					<input type="text" id="ipt_peo" class="input30 require" length="1,32" label-name="维护人"/>
					</td>
					<td>
					<input id="btnListQr" class="margin5" type="button" value="查询" />
					</td>
				</tr>
			</tbody>
		</table>
  	</div>
  	<div id="cu-qr-content" style="overflow: hidden;">
  	
  	</div>
</div>
<script type="text/javascript">
cu.include({// 加载jquery.ui日期中文组件
	commPath : "${pageContext.request.contextPath}/js/",
	jsFiles : [ "jquery.ui.datepicker-zh-CN.js" ]
});
$("#btnListQr").bind("click",function(){
	$.listQr_loadUrl();
});
$.extend({
	listQr_loadUrl:function(){
		var maintime = $.trim($("#ipt_maintime").val());
		var li = $.trim($("#ipt_licene").val());
		var peo = $.trim($("#ipt_peo").val());
		var args = "";
		if(null != li && typeof(li) != "undefined"){
			args += "&l=" + li;
		}
		if(null != peo && typeof(peo) != "undefined"){
			args += "&p=" + peo;
		}
		if(null != maintime && typeof(maintime) != "undefined"){
			args += "&m=" + maintime;
		}
		loadUri("#cu-qr-content","maintanence/list?orgId=${orgId}&con=1" + args);
	}
})
$(
	loadUri("#cu-qr-content","maintanence/list?orgId=${orgId}&con=0"),
	$("#ipt_maintime").datepicker({ dateFormat: 'yy-mm-dd' })
);

</script>