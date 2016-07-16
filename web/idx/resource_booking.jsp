<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://www.yicjx.com/favicon.ico"></link>
<link rel="stylesheet" type="text/css" href="global.css"></link>
<script type="text/javascript" src="jquery-1.js"></script>
<style type="text/css">
.is_nessesary {
	color: #ff0000;
	font-weight: bold;
}

.is_text {
	border: #cfd8e1 1px solid;
	background-color: #fff;
	width: 320px;
	height: 18px;
	line-height: 18px;
	vertical-align: middle
}

.is_upload {
	border: #cfd8e1 1px solid;
	width: 388px;
}

.is_textarea {
	border: #cfd8e1 1px solid;
	background-color: #fff;
	width: 320px;
	height: 90px
}

.is_btn {
	line-height: 16px
}

.is_success {
	margin: 0 auto;
	font: 14px Arial, Helvetica, sans-serif;
	color: #090 !important;
	padding: 10px 10px 10px 45px;
	width: 90%;
	background: url(/sitefiles/services/cms/images/success.gif) no-repeat
		left center;
	text-align: left;
	line-height: 160%;
	font-weight: bold;
}

.is_failure {
	margin: 0 auto;
	font: 14px Arial, Helvetica, sans-serif;
	color: #CC0000 !important;
	padding: 10px 10px 10px 45px;
	width: 90%;
	background: url(/sitefiles/services/cms/images/failure.gif) no-repeat
		left center;
	text-align: left;
	line-height: 160%;
	font-weight: bold;
}
.ul_vehicle_list{
	margin: 10px auto;
	overflow-y: auto;
	height: 100%;
}
.ul_vehicle_list li{
	padding: 10px !important;
	border-bottom: 1px solid #696969;
}
.ul_vehicle_list li input{
	float: left !important;
	margin-left: 10px;
	margin-top: 30px;
}
.ul_vehicle_list li img{
	float: left !important;
	margin-left: 15px;
}
</style>
<script type="text/javascript">
$.extend({
	fnNextStepShowCalendar: function(){
		$("#frmBookingInformation").hide();
		$("#iframeCalendar").attr("src","calendar.jsp?license=" 
				+ $("#sltLicenseType").find("option:selected").val() + "&trainfield=" 
				+ $("#sltTrainField").find("option:selected").val() + "&vehicle=" 
				+ $("input[type='radio'][name='vehicle']:checked").val());
		$("#dvCalendarForm").show();
		$.fnOnNextButtonClicked();
	},
	fnOnNextButtonClicked: function(){
		var lecenseType = $("#sltLicenseType").find("option:selected").text();
		var trainField = $("#sltTrainField").find("option:selected").text();
		var vehicle = $("input[type='radio'][name='vehicle']:checked").parent().find("td[name=vehicleModel]").html();
		$("#licenseTypeShow").text("<" + lecenseType + "> ");
		$("#trainFieldShow").text("<" + trainField + "> ");
		$("#vehicleTypeShow").text("<" + vehicle + "> ");
	}
});
function fnOnTimeSelectedToShow(time){
	$("#timeBookShow").text("<" + time + "> ");
}
</script>
</head>
<body>
	<div id="MainArea">
		<div id="MainAreaRight" style="width: 100%;">
			<div class="SignUpTitle">预约 
			（
			<span id="licenseTypeShow"></span>
			<span id="trainFieldShow"></span>
			<span id="vehicleTypeShow"></span>
			<span id="timeBookShow"></span>
			）
			</div>
			<div class="SignUpContent" style="margin-left: 0; width: 990px;">
				<form target="loadContent_2" accept-charset="utf-8" action="" enctype="multipart/form-data" method="post" id="frmContent_2">
				<div style="display: none;" id="dvCalendarForm">
					<iframe style="width: 970px; height:540px;" id="iframeCalendar" src=""></iframe>
				</div>
				<table id="frmBookingInformation" width="98%" cellspacing="2" cellpadding="4" border="0">
					<tbody>
						<tr>
							<td width="70" valign="top"><nobr>驾考类型:</nobr></td>
							<td>
								<select errormessage="" regexp="" validatetype="None" maxnum="0" minnum="0" isrequire="true" displayname="驾考类型"  isvalidate="true" class="select" name="Title" id="sltLicenseType">
									<option value="C1">C1小型汽车</option>
									<option value="C2">C2小型自动档汽车</option>
									<option value="B1">B1中型客车</option>
									<option value="B2">B2大型货车</option>
									<option value="A1">A1大型客车</option>
									<option value="A2">A2大型牵引车</option>
								</select>&nbsp;
								<span class="is_nessesary">*</span>
							</td>
						</tr>
						<tr>
							<td width="70" valign="top"><nobr>场地选择:</nobr></td>
							<td>
								<select errormessage="" regexp="" validatetype="None" maxnum="0" minnum="0" isrequire="true" displayname="场地"  isvalidate="true" class="select" name="Title" id="sltTrainField">
									<option value="A">A区</option>
									<option value="B">B区</option>
								</select>&nbsp;
								<span class="is_nessesary">*</span>
							</td>
						</tr>
						<tr>
							<td width="70" valign="top"><nobr>车辆选择:</nobr></td>
							<td style="height: 390px">
								<ul class="ul_vehicle_list" id="ulVehicleList">
									<li>
										<input type="radio" name="vehicle" value="car123456">
										<img alt="" src="../picture/vehicle/117144176.JPG" width="100px" height="80px">
										<table>
											<tbody>
												<tr>
													<td>车型：</td>
													<td name="vehicleModel">桑塔纳2000</td>
												</tr>
												<tr>
													<td>单价：</td>
													<td>210元/小时</td>
												</tr>
												<tr>
													<td>车辆简介：</td>
													<td>桑塔纳   20 0 0</td>
												</tr>
											</tbody>
										</table>
									</li>
									
									<li>
										<input type="radio" name="vehicle">
										<img alt="" src="../picture/vehicle/117144176.JPG" width="100px" height="80px">
										<table>
											<tbody>
												<tr>
													<td>车型：</td>
													<td>桑塔纳2000</td>
												</tr>
												<tr>
													<td>单价：</td>
													<td>210元/小时</td>
												</tr>
												<tr>
													<td>车辆简介：</td>
													<td>桑塔纳   20 0 0</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<input type="radio" name="vehicle">
										<img alt="" src="../picture/vehicle/117144176.JPG" width="100px" height="80px">
										<table>
											<tbody>
												<tr>
													<td>车型：</td>
													<td>桑塔纳2000</td>
												</tr>
												<tr>
													<td>单价：</td>
													<td>210元/小时</td>
												</tr>
												<tr>
													<td>车辆简介：</td>
													<td>桑塔纳   20 0 0</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<input type="radio" name="vehicle">
										<img alt="" src="../picture/vehicle/117144176.JPG" width="100px" height="80px">
										<table>
											<tbody>
												<tr>
													<td>车型：</td>
													<td>桑塔纳2000</td>
												</tr>
												<tr>
													<td>单价：</td>
													<td>210元/小时</td>
												</tr>
												<tr>
													<td>车辆简介：</td>
													<td>桑塔纳   20 0 0</td>
												</tr>
											</tbody>
										</table>
									</li>
									<li>
										<input type="radio" name="vehicle">
										<img alt="" src="../picture/vehicle/117144176.JPG" width="100px" height="80px">
										<table>
											<tbody>
												<tr>
													<td>车型：</td>
													<td>桑塔纳2000</td>
												</tr>
												<tr>
													<td>单价：</td>
													<td>210元/小时</td>
												</tr>
												<tr>
													<td>车辆简介：</td>
													<td>桑塔纳   20 0 0</td>
												</tr>
											</tbody>
										</table>
									</li>
								</ul>
							</td>
						</tr>
						<tr>
							<td colspan="2" style="text-align: center;">
								<input type="button" value="下一步" onclick="$.fnNextStepShowCalendar();" class="">
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
				</form>
			</div>
		</div>
	</div>
</body>
</html>