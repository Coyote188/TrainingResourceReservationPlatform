<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://www.yicjx.com/favicon.ico"></link>
<link rel="stylesheet" type="text/css" href="global.css"></link>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/popup/remodal-default-theme.css"></link>

<link rel='stylesheet' href='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/lib/cupertino/jquery-ui.min.css' />
<link href='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/fullcalendar.css' rel='stylesheet' />
<link href='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/fullcalendar.print.css' rel='stylesheet' media='print' />
<script src='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/lib/moment.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/lib/jquery.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/fullcalendar.min.js'></script>
<script src='${pageContext.request.contextPath}/js/fullcalendar-2.9.0/lang-all.js'></script>

<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/bootstrap/bootstrap-dialog-util.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/utils.js" type="text/javascript"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-dialog.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/bootstrap-rewrite.css" rel="stylesheet" />
<script>
var cache = new Object();
$(document).ready(function() {
	$('#calendar').fullCalendar({
		theme: true,
		header: {
			left: 'title',
			center: '',
			right: 'prev,next today'
		},
		defaultDate: '2016-06-12',
		lang:'zh-cn',
		eventLimit: true,
		selectable: true,
		selectHelper: true,
		height: 450,
		timeFormat: 'dd(:hh)t',
		/* select: function(start, end) {
			var title = prompt('Event Title:');
			var eventData;
			if (title) {
				eventData = {
					title: title,
					start: start,
					end: end
				};
				$('#calendar').fullCalendar('renderEvent', eventData, true); // stick? = true
			}
			$('#calendar').fullCalendar('unselect');
		}, */
		eventClick: function(calEvent, jsEvent, view) {
			var date = calEvent.start;
			cache.currentDate = date.format();
			BootstrapDialogUtil.loadUriDialog("选择时间","timeSelector.jsp","400px","#fff",true);
			//alert('Event: ' + calEvent.title + ' event_id: ' + calEvent.id + ' View: ' + view.name);
			//alert('弹出当前日期的可选时间，选择开始时间、时长');
		},
		dayClick: function(date, jsEvent, view) {
			alert('查询当前车辆选定日期的预约情况');
			$(this).css('background-color', 'red');
		},
		events: function(start, end, callback){
			alert(start);
			console.log(end);
			console.log(callback);
			$.ajax({
				url:'booking/timeList',
				dataType:'json',
				data:{
					start: Math.round(start.getTime()/1000),
					end: Math.round(end.getTime()/1000),
					vehicle: cache.getUrlParameter("vehicle"),
					query_time_list: 1
				},
				success: function(doc) {
					var events = [];
					$(doc).find('event').each(function() {
						event.push({
							title: $(this).attr('title'),
							start: $(this).attr('start')
						});
					});
					callback(events);
				}
			});
		}
	});
	
});
$.extend({
	fnOnOrderSave: function(){
		var license = getUrlParameter("license");
		var field = getUrlParameter("trainfield");
		var vehicle = getUrlParameter("vehicle");
		var trainDate = cache.currentDate;
		var trainStart = cache.timeStart;
		var trainEnd = cache.timeEnd;
		alert(vehicle);
	}
});
</script>
<style>
	body {
		margin: 20px 10px;
		padding: 0;
		font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
		font-size: 14px;
	}
	#calendar {
		max-width: 900px;
		margin: 0 auto;
	}

</style>
</head>
<body>
<div id="calendar" style="width: 100%;">
</div>
<div style="text-align: center; padding-top: 5px;">
	<!-- 
	<input type="button" value="保存订单" class="fc-today-button ui-button ui-state-default ui-corner-left ui-corner-right" style="height: 40px;">
	 -->
	<input type="button" value="保存订单" style="margin-top: 20px;" onclick="$.fnOnOrderSave();" disabled="disabled" id="btnOrderSave">
</div>
</body>
</html>