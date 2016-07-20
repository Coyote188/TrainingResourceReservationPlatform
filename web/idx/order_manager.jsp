<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String _userId = "";
if(null != request.getSession().getAttribute("edu_user_info")){
	cn.com.chinaccs.bean.UserInfo info = (cn.com.chinaccs.bean.UserInfo)request.getSession().getAttribute("edu_user_info");
	_userId = info.getId();
}
%>
<html>
<head>
<script type="text/javascript">
$.extend({
	fnOnOrderListQuery: function(){
		var userId = '<%=_userId%>';
		var req = {
				"userId": userId
		};
		$.ajax({
			url:'${pageContext.request.contextPath}/booking/orderListQuery',
			dataType:'json',
			type:"post",
			data: req,
			success: function(doc) {
				var list = $.parseJSON(eval(doc).output).data;
				$.each(list, function(idx, order){
					var tr = "";
					tr += '<tr>';
					tr += '	<td>';
					tr += '		<a>';
					tr += order.serial;
					tr += '		</a>';
					tr += '	</td>';
					tr += '	<td>';
					tr += '		<a><img src="${pageContext.request.contextPath}' + order.vehiche_pic + '"></a>';
					tr += '	</td>';
					tr += '	<td>';
					tr += order.area;
					tr += '	</td>';
					tr += '	<td>';
					tr += '		<div class="">';
					tr += '			<span id="">驾考类型</span>：<span>';
					tr += order.lv;
					tr += '			</span>';
					tr += '		</div>';
					tr += '		<div class="">';
					tr += '			<span id="">预约车辆</span>：<span>';
					tr += order.vehicle_bands + " - " + order.vehicle_model;
					tr += '			</span>';
					tr += '		</div>';
					tr += '	</td>';
					tr += '	<td>';
					tr += '		<span>';
					tr += order.order_money;
					tr += '		</span>';
					tr += '	</td>';
					tr += '	<td>';
					tr += order.training_st;
					tr += '	</td>';
					tr += '	<td>';
					tr += order.duration;
					tr += '	</td>';
					tr += '	<td>';
					if(order.state == "001"){
						//订单已保存
						tr += '<button class="btn_r" style="background-color: green;" onclick="$.onPaymentClicked(this);" data="' + order.order_id + '">付款</button>';
						tr += '<button class="btn_r" onclick="$.onclick_remove(this);" data="' + order.order_id + '">取消</button>';
					}else if(order.state == "002"){
						//订单已取消
						tr += '<button class="btn_r" onclick="$.onclick_remove(this);" data="' + order.order_id + '" disabled="disabled">已取消</button>';
					}else if(order.state == "005"){
						//已付款
						tr += '<button class="btn_r" onclick="$.onclick_remove(this);" data="' + order.order_id + '" disabled="disabled">已付款</button>';
					}else{
						tr += '<button class="btn_r" style="background-color: green;" onclick="$.onPaymentClicked(this);" data="' + order.order_id + '">付款</button>';
						tr += '<button class="btn_r" onclick="$.onclick_remove(this);" data="' + order.order_id + '">取消</button>';
					}
					tr += '	</td>';
					tr += '</tr>';
					$("#tblOrderListForm").append(tr);
				});
			}
		});
	},
	onclick_remove: function(r) {
		layer.prompt({
			title: '请输入密码，并确认',
			formType: 1
		}, function(pass){
			var req = {
					orderId: $(r).attr("data"),
					Password: pass
			};
			$.ajax({
				url:'${pageContext.request.contextPath}/booking/cancelOrder',
				dataType:'json',
				type:"post",
				data: req,
				success: function(doc) {
					if($.parseJSON(eval(doc).output).result == "1"){
						$(r).parent().parent().remove();
						layer.msg($.parseJSON(eval(doc).output).msg);
					}else
						layer.msg($.parseJSON(eval(doc).output).msg);
				}
			});
		});
	}
});
$(function(){
	$.fnOnOrderListQuery();
});
</script>
</head>
<body>
<div class="shopping_content">
			<div class="shopping_table">
				<table id="tblOrderListForm" style="width: 100%; text-align: center;" border="1" bordercolor="#cccccc" cellpadding="0" cellspacing="0">
					<tbody>
						<tr>
						<th>订单编号</th>
						<th>车辆图片</th>
						<th>场地</th>
						<th>车型</th>
						<th>费用</th>
						<th>预约时间</th>
						<th>练习时长</th>
						<th>订单状态</th>
					</tr>
				</tbody>
			</table>
			</div>
		</div>
</body>
</html>