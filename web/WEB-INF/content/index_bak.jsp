<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<s:action name="include/menu" executeResult="true" />
<style>
<!--
.home_left {float: left; width: 49%; overflow-y: auto;}
.home_right { float: left; width: 49%;}
.about4{width:90%;margin:40px auto 0 auto;}
.about4_ch{font-size:18px;color:#d80017;margin-bottom:30px;}
.about4_main{position:relative;padding-left:20px;overflow:hidden;}
.line{width:1px;height:100%;background-color:#999;position:absolute;left:26px;z-index:-1;}
.about4_main ul li{padding-left:25px;font-size:14px;color:#333333;line-height:30px;margin-bottom:30px;background:url(images/about4_icon.png) left center no-repeat;border-bottom: 1px solid #D8D8D8;}
.about4_main ul li:last-child{margin-bottom:0px;}

.recommend-list {height:100%;margin:5px auto;position:relative;width:100%;}
.recommend-list .menu{height:32px;width:100%;background:url(images/qhbg2.jpg) no-repeat left center;background-size: 100%;}
.recommend-list .menu ul{margin:0px;padding:0px;height:26px;list-style:none;text-align:center;}
.recommend-list .menu li{display:block;float:left;height:26px;line-height:26px;margin-right:4px;margin-top:5px;width:40%;}
.recommend-list .menu li a{color:#000000;font-size:14px;text-decoration:none;display:block;background: url("images/hovbg2.jpg") no-repeat scroll left bottom / 100% auto;}
.recommend-list .menu li a.tabactive{color:#268bdd;font-weight:bold;height:27px;background:url(images/hovbg2.jpg) no-repeat left bottom / 100%;}
.recommend-list .tabdiv ul{list-style:none;}
.recommend-list .tabdiv ul li{height:24px;line-height:24px;overflow:hidden;background:url(images/linarr.jpg) no-repeat left center;text-indent:15px;}
.recommend-list .tabdiv ul li a{text-decoration:none;color:#000000;}
.recommend-list .tabdiv ul li a:hover{color:#ff0000;}
.recommend-list .tabfirstli{margin-left:8px;}
.recommend-list .tabdiv{font-size:12px;height:228px;padding:10px;position:absolute;text-align:left;top:32px;width:100%;border-top:none;overflow-y: auto;}	
.hiddendiv{display: none;}
-->
</style>
<script type="text/javascript">
<!--
var cacheObject = new Object();
$.extend({
	fnLoadLearnRec: function(){
		var url = "${pageContext.request.contextPath}/favorateJson/getRecorder";
    	$.post(url,null,function(data, status){
			var res = jQuery.parseJSON(data.output);
			console.log(res);
			if(res.result == '1'){
				var h = $(".about4_main ul li:first-child").height()/2;
				var h1 = $(".about4_main ul li:last-child").height()/2;
				$(".line").css("top",h);
				$(".line").height($(".about4_main").height()-h1-h);
				
				$.each(res.data, function(index, rec){
					var recoder = '';
					recoder += '<li>';
					recoder += '<span>' + rec.pauseTime_date + '</span>';
					recoder += '<h2>' + rec.resourceName + " by " + rec.owner + '</h2>';
					recoder += '<h4>';
					recoder += rec.resourceDesc;
					recoder += '</h4>';
					recoder += '<a class="button blue small" data-id="' + rec.fileId + '" onclick="$.fnOpenReader(\'' + rec.fileId + '\');">&nbsp;继续&nbsp;</a>';
					recoder += '</li>';
					$("#learnRecorderList").append(recoder);
				});
				
			}
    	});
	},
	fnRecommendList: function(dataType, container){
		var url = "${pageContext.request.contextPath}/favorateJson/recommendList";
		var recommend = new Object();
		recommend.dataType = dataType;
		var json = JSON.stringify(recommend);
		var req = "&data=" + json;
    	$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data.output);
			console.log(res);
			if(res.result == '1'){
				$.each(res.data, function(index, rec){
					var recommend = '<li><span style="float: right;">' + rec[1] + '</span><a onclick="$.fnOpenReader(\'' + rec[0] + '\');">' + rec[2] + '</a></li>';
					$("#" + container).append(recommend);
				});
				
			}
    	});
	},
	fnOpenReader: function(file){
		$(".wrap-content").hide();
		$("#dvFilePlayer").show();
		cacheObject.fileId = file;
		cacheObject.fileType = null;
		$("#dvFilePlayer").load("favorate/favoratePlayer?fileId="+ file +"&fileType=null");
	},
	hasClass:function (obj, cls) {
	    return obj.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'));
	},
	addClass:function(obj, cls) {
	    if (!this.hasClass(obj, cls)) obj.className += " " + cls;
	},
	removeClass:function(obj, cls) {
	    if ($.hasClass(obj, cls)) {
	        var reg = new RegExp('(\\s|^)' + cls + '(\\s|$)');
	        obj.className = obj.className.replace(reg, ' ');
	    }
	},
	showThis:function(number, divName, divID,aID) {
	    var tarArr = document.getElementsByTagName("div");
	    var count = 0;
	    for (var i = 0; i < tarArr.length; i++) {
	        if (tarArr[i].getAttribute("name") != null) {
	            if (tarArr[i].getAttribute("name") == divName) {
	                count++;
	            }
	        }
	    }
	    //将所有的name=divNumber的div都加上hiddendiv
	    for (var j = 1; j <= count; j++) {
	        var divEle = document.getElementById(divID + j);
	        if (!$.hasClass(divEle, "hiddendiv"))
	        { $.addClass(divEle, "hiddendiv"); }
			var tabA = document.getElementById(aID+j);
			if($.hasClass(tabA,"tabactive"))
			{$.removeClass(tabA,"tabactive");}
	    }
	    //给当前的div移除hiddendiv
	    var divThis = document.getElementById(divID + number);
	    $.removeClass(divThis, "hiddendiv");
		var AThis=document.getElementById(aID+number);
		$.addClass(AThis,"tabactive");
		if(number == '1'){
			$.fnRecommendList('upTime', 'ulRecommendList1');
		}else{
			$.fnRecommendList('favorites', 'ulRecommendList2');
		}
		
	}
});
$(
	$.fnLoadLearnRec(),$("#dvFilePlayer").hide()
);
$(function () {
	var url = "${pageContext.request.contextPath}/favorateJson/testHisCharts";
	$.post(url,null,function(data, status){
		var res = jQuery.parseJSON(data.output);
		if(res.result == '1'){
			var categories = res.data.categories;
			var data1 = res.data.data1, data2 = null;
			console.log(data1);
			
			$('#chartsTestHistory').highcharts({
		        title: {
		            text: '学习曲线展示',
		            x: -20 //center
		        },
		        subtitle: {
		            text: '考试及自由练习成绩曲线',
		            x: -20
		        },
		        xAxis: {
		            categories: categories
		        },
		        yAxis: {
		            title: {
		                text: '分数'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		        tooltip: {
		            valueSuffix: '分'
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: [{
		            name: '考试',
		            data: data1
		        }, {
		            name: '自由练习',
		            data: data2
		        }]
		    });
		}
	});
});
//-->
</script>
<div class="wrap-content">
	<div class="home_left">
		<div class="about4">
			<div class="about4_ch">学习历史</div>
			<div class="about4_main">
				<div style="top: 15px; height: 10px;" class="line"></div>
				<ul id="learnRecorderList" style="height: 70%; overflow-y: auto;">
				</ul>
			</div>
		</div>
	</div>
	<div class="home_right">
		<div id="chartsTestHistory" style="min-width: 310px; height: 400px; margin: 0 auto">
			
		</div>
		<div>
			<div class="recommend-list">
				<div class="menu">
					<ul>
						<li class="tabfirstli"><a id="tablinkh1" class="tabactive" onclick="$.showThis(1,'divNumberh','tabContenth','tablinkh');" href="javascript:void(0);">最近上传</a></li>
						<li><a id="tablinkh2" onclick="$.showThis(2,'divNumberh','tabContenth','tablinkh');" href="javascript:void(0);">最多收藏</a></li>
					</ul>
				</div>
				<div class="tabdiv" name="divNumberh" id="tabContenth1">
					<ul id="ulRecommendList1">
					</ul>
				</div>
				<div class="tabdiv hiddendiv" name="divNumberh" id="tabContenth2">
					<ul id="ulRecommendList2">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="dvFilePlayer" style="margin-left: 2px; overflow: auto; width: 99%;" hidden="hidden">

</div>
<script type="text/javascript">
<!--
$.showThis(1,'divNumberh','tabContenth','tablinkh');
//-->
</script>
<jsp:include page="include/footer.jsp" />