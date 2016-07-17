<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
<!--
$.extend({
	fnDialogClose: function(){
		BootstrapDialogUtil.close();
	},
	fnTimerInit: function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/booking/timeList',
			dataType:'json',
			type:"post",
			data:{
				"time": cache.title,
				"vehicle": getUrlParameter("vehicle"),
				"query_time_list": "2",
				"start": cache.currentDate.substr(0, cache.currentDate.indexOf("T"))
			},
			success: function(doc) {
				var data = $.parseJSON(eval(doc).output).data;
				cache.timeLeft = data;
				var text = " - ";
				$.each(cache.timeLeft, function(idx, ele){
					text += ele + "时；";
					$("#sltTimeStart").append("<option value='" + ele + "'>" + ele + "时</option>");
				});
				$("#timeLeft4Select").text(text);
				console.log(data);
			}
		});
		
		
		
	},
	fnOnSelectorChange: function(slt){
		var timeStSelect = $(slt).val();
		if(timeStSelect > 0){
			$.each(cache.timeLeft, function(idx, ele){
				if(ele >= timeStSelect){
					$("#sltTimeEnd").append("<option value='" + ele + "'>" + ele + "时</option>");
				}
			});
		}
	},
	fnOnTimeHourSelected: function(slt){
		var timeEndSelected = parseInt($(slt).val());
		var timeStSelected = parseInt($("#sltTimeStart").val());
		var bol = true;
		if(timeEndSelected >= timeStSelected){
			for(var i = timeStSelected; i <= timeEndSelected; i++){
				var bol1 = false;
				$.each(cache.timeLeft, function(idx, ele){
					if(ele == i){
						bol1 = true;
					}
				});
				bol &= bol1;
			}
		}
		if(!bol){
			$("#timeHourSelected").text("*请选择连续时间。");
			$("#timeHourSelected").css("color",'red');
		}else{
			$("#timeHourSelected").css("color",'#000');
			$("#timeHourSelected").text((timeEndSelected - timeStSelected + 1) + " 小时 ");
		}
	},fnTimeHourSelected: function(){
		var timeEndSelected = parseInt($("#sltTimeEnd").val());
		var timeStSelected = parseInt($("#sltTimeStart").val());
		var date = cache.currentDate;
		cache.timeStart = timeStSelected;
		cache.timeEnd = timeStSelected;
		if(timeStSelected == timeEndSelected){
			window.parent.fnOnTimeSelectedToShow(date + " " + timeStSelected + "时");
		}else{
			window.parent.fnOnTimeSelectedToShow(date + " " + timeStSelected + "时至" + timeEndSelected + "时");
		}
		$("#btnOrderSave").removeAttr("disabled");
		$.fnDialogClose();
	}
});
$(
	setTimeout($.fnTimerInit(), 500)
);
//-->
</script>
<div class="remodal" id="modelPopupTimerSlt" style="display:block">
	<div>
		<h2 id="modal1Title">训练时间选择</h2>
		<p id="opRoleDesc">
			请选择训练开始时间以及训练时长，选择后请确认操作<br>
			当前可选时间（整时）
			<span id="timeLeft4Select"></span>
		</p>
		<div style="width: 300px; height: 35px; margin: 5px auto;">
			<div class="div-selector" >
				<select onchange="$.fnOnSelectorChange(this);" id="sltTimeStart">
					<option value="-1">选择</option>
				</select>
			</div>
			<span style="width: 50px; float: left;">至</span>
			<div class="div-selector">
				<select onchange="$.fnOnTimeHourSelected(this);" id="sltTimeEnd">
					<option value="-1">选择</option>
				</select>
			</div>
		</div>
		<span id="timeHourSelected" style="display: block;"></span>
	</div>
	<br>
	<button class="remodal-confirm" onclick="$.fnTimeHourSelected();">确认</button>
	<button class="remodal-cancel" onclick="$.fnDialogClose();">取消</button>
</div>