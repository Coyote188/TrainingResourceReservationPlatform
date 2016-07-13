<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE9"/>
<title>XXX部队模拟仿真平台</title>
<link rel="stylesheet" type="text/css" href="js/topo/base.css">
<link href="js/topo/jquery.snippet.min.css" rel="stylesheet">
<link href="css/topo/style.css" rel="stylesheet">
<link href="css/topo/topo_nav.css" rel="stylesheet">
<script src="js/topo/jquery.js"></script>
<script type="text/javascript" src="js/topo/jquery.snippet.min.js"></script>
<script type="text/javascript" src="js/topo/jtopo-0.4.8-min.js"></script>
<script type="text/javascript" src="js/topo/toolbar.js"></script>
<script type="text/javascript" src="js/ToolsObject.js"></script>
<link href="css/bootstrap.css" rel="stylesheet">
<style>
<!--
body{
	background: url("images/bd.gif") repeat scroll 0 0 #fff;
}
.deviceInfomation{
	width: 500px; 
	height: 300px; 
	margin: auto;
	top: 0;
	left: 0;
	right:0;
	bottom:0;
	background-color: #F5FFFA;
	border: 1px solid #aaa;
	border-bottom: 0;
	position: fixed;
	list-style: none;
	padding: 0;
	z-index: 99999;
	display: none;
}
.deviceInfomation table{
	width: 96%;
	height: 80%;
	margin: 2% 2%;
}
.deviceInfomation div{
	height: 60px;
	width: 100%;
}
.deviceInfomation button{
	float: right;
	margin-right: 10px;
}
.contextmenu {
	border: 1px solid #aaa;
	border-bottom: 0;
	background: #eee;
	position: absolute;
	list-style: none;
	margin: 0;
	padding: 0;
	display: none;
}
																		   
.contextmenu li a {
	display: block;
	padding: 10px;
	border-bottom: 1px solid #aaa;
	cursor: pointer;
}
																		   
.contextmenu li a:hover {
	background: #fff;
}
.device_btn
{
	width: 40px;
	height: 100px;
	margin: 10px 5px 10px 2px;
	font-size: 12px;
	word-wrap: break-word;
	letter-spacing: 10px;
}
.deviceConfiguration{
	width: 820px; 
	height: 380px; 
	margin: auto;
	top: 0;
	left: 0;
	right:0;
	bottom:0;
	background-color: #F5FFFA;
	border: 1px solid #aaa;
	border-bottom: 0;
	position: fixed;
	list-style: none;
	padding: 0;
	z-index: 99999;
	display: none;
}
.deviceConfiguration button{
	width: 55px;
	height: 55px;
	margin: 2px 20px 2px 0;
	-moz-border-radius: 15px;      /* Gecko browsers */
    -webkit-border-radius: 15px;   /* Webkit browsers */
    border-radius:15px;
}

.device-args-list {
	width:320px;
	margin:0 auto;
}
.device-args-list ul {
	background:url(css/images/row_bg.gif);
}
.device-args-list li {
	height:25px;
	line-height:25px;
	text-align:left;
	padding-left:10px;
	color: #39c;
}
.device-args-list a:link, a:visited {
	text-decoration:none;
	color:#000;
}
.device-args-list a:hover {
	text-decoration:underline;
	color:#39c;
}
.device-args-list img {
	border:0;
}
.device-args-list select {
	border:0;
}
.device-args-list ul, li {
	list-style:none;
}

-->
</style>
<script type="text/javascript">
<!--
var scene;
var stage;
var cache = new Object();
var currentNode = null;
var mapCache = new Map();
var desktopUUID = null;
var NetworkSetting = null;
var deviceNetSettingList = new Array();
$.extend({
	jTopoNode:function(x,y,img, devName){
		var node = new JTopo.Node(devName);
		node.setImage('js/img/statistics/' + img, true);
		node.setLocation(x, y);
		scene.add(node);
		return node;
	},
	jTopoLinkNode:function(nodeA, nodeZ, f) {
		var link;
		if (f) {
			link = new JTopo.FoldLink(nodeA, nodeZ);
		} else {
			link = new JTopo.Link(nodeA, nodeZ);
		}
		link.direction = 'vertical';
		//link.dashedPattern = 'Arrow';
		scene.add(link);
		return link;
	},
	jTopoDottedNode:function(nodeA, nodeZ, text,dashedPattern) {
		var link = new JTopo.Link(nodeA, nodeZ, text);        
        link.lineWidth = 3; // 线宽
        console.log("new dotted line a[" + nodeA.toJson() + "] -- b[" + nodeZ.toJson() + "]");
        //link.bundleOffset = 60; // 折线拐角处的长度
        link.bundleGap = 20; // 线条之间的间隔
        link.textOffsetY = 3; // 文本偏移量（向下3个像素）
        link.strokeColor = JTopo.util.randomColor(); // 线条颜色随机
        link.dashedPattern = dashedPattern; 
        scene.add(link);
        return link;
	},
	jTopoHostLink:function(nodeA, nodeZ) {
		var link = new JTopo.FlexionalLink(nodeA, nodeZ);
		link.shadow = false;
		link.offsetGap = 44;
		scene.add(link);
		return link;
	},
    jTopoAlart: function(node){
    	setInterval(function() {
    		if (node.alarm == '二级告警') {
    			node.alarm = null;
    		} else {
    			node.alarm = '二级告警';
    		}
    	}, 600);
    },
    jTopoAddNewNode: function(x, y, img, devName){
    	var newNode = $.jTopoNode(x, y, img, devName);
    	//console.log(newNode.toJson());
    	$.jTopoContextMenu(newNode,"contextmenu_device");
    	$.jTopoLeftClick(newNode);
    },
    jTopoNodeFind: function(text){
    	console.log("topo node find -- " + text);
    	var node = null;
    	var nodes = stage.find('node[text="'+text+'"]');
    	if(nodes.length > 0){
    		node = nodes[0];
    	}
    	//console.log(node);
    	return node;
    },
    jTopoLeftClick: function(element){
    	element.addEventListener('click', function(event){
    		var clickedDev = $(this).attr("text");
    		var _tmpDevice = mapCache.get(clickedDev);
    		if(_tmpDevice.devDesc == 'station'){
				$("#ulNetList").empty();
				var li = '<a href="#" class="list-group-item active">设备名称</a>';
				li += '<a href="#" class="list-group-item">' + clickedDev + '</a>';
				li += '<a href="#" class="list-group-item active">频率范围</a>';
				li += '<a href="#" class="list-group-item">' + _tmpDevice.frequencyRange + '</a>';
				li += '<a href="#" class="list-group-item active">通信距离:</a>';
				li += '<a href="#" class="list-group-item">' + _tmpDevice.distance + '</a>';
				li += '<a href="#" class="list-group-item active">信道容量:</a>';
				li += '<a href="#" class="list-group-item">' + _tmpDevice.channel + '</a>';
				$("#ulNetList").append(li);
			}
    		
    		$.each(deviceNetSettingList, function(i, dev){
    			if(dev.dev_name == clickedDev){
    				$("#ulConfigList").empty();
    				var li = '<a href="#" class="list-group-item active">网络名称</a>';
    				li += '<a href="#" class="list-group-item">' + dev.name + '</a>';
    				li += '<a href="#" class="list-group-item active">接收频率</a>';
    				li += '<a href="#" class="list-group-item">' + dev.recv_freq + '</a>';
    				li += '<a href="#" class="list-group-item active">发射频率</a>';
    				li += '<a href="#" class="list-group-item">' + dev.trans_freq + '</a>';
    				li += '<a href="#" class="list-group-item active">通信模式</a>';
    				li += '<a href="#" class="list-group-item">' + dev.mode1 + '</a>';
    				if(null != dev.mode2){li += '<a href="#" class="list-group-item">' + dev.mode2 + '</a>';}
    				if(null != dev.mode3){li += '<a href="#" class="list-group-item">' + dev.mode3 + '</a>';}
    				$("#ulConfigList").append(li);
    			}
    		});
    		
        });
    },
    jTopoContextMenu:function(ele, contextMenu){
    	console.log("context menu add to [" + ele.toJson() + "] type[" + contextMenu + "]" );
    	var x = 0, y = 0;
    	//console.log($("#" + contextMenu));
    	ele.addEventListener('mouseup', function(event){
            ele = this;
            currentNode = this;
            handler(event);
        });
    	function handler(event){
            if(event.button == 2){// 右键
				$("#" + contextMenu).css({
					top: event.pageY,
                    left: event.pageX
                }).show();
            	x = event.pageX;
            	y = event.pageY;
            }
        }
    	stage.click(function(event){
            if(event.button == 0){// 右键
                $("#" + contextMenu).hide();
            	$("#ulContextNetworkList").hide();
            }
        });
    	//console.log($("#" + contextMenu + " a"));
    	$("#" + contextMenu + " a").click(function(event){
    		var name = $(this).attr("name");
    		//console.log("context menu clicked [" + name + "]");
    		if(name == 'infomation'){
    			//console.log(currentNode);
    			//console.log(ele.id);
    			var currentDevice = mapCache.get(currentNode.attr("text"));
    			$("#infoDevName").text(currentDevice.devType);
    			$("#infoDevModel").text(currentDevice.devModel);
    			var networkInfomation = "";
    			if(currentDevice.wirelessAccessAsClient == "yes"){
    				networkInfomation += "[无线网络接入]";
    			}
    			if(currentDevice.wiredAccessAsClient == "yes"){
    				networkInfomation += "[有线网络接入]";
    			}
    			if(currentDevice.wirelessAccessAsServer == "yes"){
    				networkInfomation += "[无线输出]";
    			}
    			if(currentDevice.wiredAccessAsServer == "yes"){
    				networkInfomation += "[有线输出]";
    			}
    			$("#infoDevNetwork").text(networkInfomation);
    			$("#infoDevFrequency").text(currentDevice.frequencyRange);
    			$("#infoDevDistance").text(currentDevice.distance);
    			$("#infoDevChannel").text(currentDevice.channel);
    			$("#divDeviceInfomation").show();
    		}
    		if(name == 'configuration'){
    			var currentDevice = mapCache.get(currentNode.attr("text"));
    			//console.log(currentDevice);
    			$.fnOpenConfigruationPage(currentNode.attr("text"));
    		}
    		if(name == 'delete'){
    			scene.remove(currentNode);
    			var currentNetwork = currentNode.attr("text");
    			/* $("#ulNetList>li").each(function(index, li){
    				if($(li).find("a").text() == currentNetwork){
    					//console.log(li);
    					$(li).remove();
    				}
    			}); */
    			currentNode = null;
    		}
    		
    		/*if(name == 'undo'){
    			currentNode.restore();
    		} else{
    			currentNode.save();
    		} */
    		
    		if(name == 'connectTo'){
    			//连线--设备间连线
    			//显示网络列表框
    			$.fnNetworkList(ele,event);
    		}else if(name == 'zoomIn'){
    			currentNode.scaleX += 0.2;
    			currentNode.scaleY += 0.2;
    		}else if(name == 'zoomOut'){
    			currentNode.scaleX -= 0.2;
    			currentNode.scaleY -= 0.2;
    		}
    		$("#" + contextMenu).hide();
    	});
    },
    fnLoadDeviceModels: function(){
		var url = "${pageContext.request.contextPath}/device_json/loadDevice";
		$.post(url,null,function(data, status){
			var res = jQuery.parseJSON(data);
			res = jQuery.parseJSON(res.output);
			//console.log(res);
			cache.devIndex = 0;
			cache.netIndex = 0;
			$.each(res.data, function(index, device){
				var _deviceIcon = '<li><a href="#" id="btnAddServer_' + index + '"><img src="js/img/statistics/' + device.devIcon+ '"></a></li>';//
				//var _deviceIcon = '<button id="btnAddServer_' + index + '"  class="device_btn">' + device.devType + '</button>';
				$("#ulDeviceContainer").append(_deviceIcon);
				$("#btnAddServer_" + index).click(function(){
					cache.devIndex ++;
					var devName = device.devType + "-" + device.devModel + "["  + cache.devIndex + "]";
					//
					mapCache.put(devName, device);
					$.jTopoAddNewNode((100 * (1+cache.devIndex)), (20 * (cache.devIndex+1)), device.devIcon, devName);
					//有网络的
					
					if(device.devDesc == 'station'){
						cache.netIndex ++;
						$("#ulNetList").empty();
						var li = '<a href="#" class="list-group-item active">设备名称</a>';
						li += '<a href="#" class="list-group-item">' + devName + '</a>';
						li += '<a href="#" class="list-group-item active">频率范围</a>';
						li += '<a href="#" class="list-group-item">' + device.frequencyRange + '</a>';
						li += '<a href="#" class="list-group-item active">通信距离:</a>';
						li += '<a href="#" class="list-group-item">' + device.distance + '</a>';
						li += '<a href="#" class="list-group-item active">信道容量:</a>';
						li += '<a href="#" class="list-group-item">' + device.channel + '</a>';
						$("#ulNetList").append(li);
						
						//play sound
						$.fnPlaySound('radio.wav',devName);
					}
					
				});
			});
			$("#ulDeviceContainer").append('<li><a id="btnAddServer_4" href="#"><img src="js/img/statistics/auto_station.png"></a></li>');
			$("#ulDeviceContainer").append('<li><a id="btnAddServer_5" href="#"><img src="js/img/statistics/icon_test_demo1.png"></a></li>');
			$("#ulDeviceContainer").append('<li><a id="btnAddServer_6" href="#"><img src="js/img/statistics/server.png"></a></li>');
			$("#btnAddServer_4").click(function(){alert("设备暂无法使用");});
			$("#btnAddServer_5").click(function(){alert("设备暂无法使用");});
			$("#btnAddServer_6").click(function(){alert("设备暂无法使用");});
			
		},"html").error(function() { alert("系统故障"); });
    },
    fnNetworkList: function(ele,clickEvent){
    	$("#ulContextNetworkList").empty();
    	$("#ulNetList>li").find("a").each(function(index, a){
    		var wireless = $(a).parent().attr("wireless");
    		var icon = "js/img/wireless.png";
    		if(wireless == "false"){
    			icon = "js/img/wired.png";
    		}
    		var li = '<li><img alt="" src="' + icon + '" width="13px" height="13px"><a wireless="' + wireless + '">' + $(a).text() + '</a></li>';
    		$("#ulContextNetworkList").append(li);
    	});
    	$("#ulContextNetworkList").css({
			top: clickEvent.pageY,
            left: clickEvent.pageX
        }).show();
    	$("#ulContextNetworkList a").click(function(){
    		var text = $(this).text();
    		var currentNodeText = currentNode.attr("text");
    		//connect 
    		var _devModel = $.jTopoNodeFind(text);
    		//console.log("ele : " + ele.toJson());
    		//console.log(clickEvent);
    		//console.log("net : " + _devModel.toJson());
    		var deviceObject = mapCache.get(currentNodeText);
    		//console.log(deviceObject);
    		//console.log("current node is [" + deviceObject.devType + "(" + deviceObject.devModel + ")" + "] and it's network as client is wireless [" + deviceObject.wirelessAccessAsClient + "]");
    		var _wireless = $(this).attr("wireless");
    		if(_wireless == "true" && deviceObject.wirelessAccessAsClient == 'yes'){
    			$.jTopoDottedNode(currentNode, _devModel, "无线", 5);
    		}else if(_wireless == "false" && deviceObject.wirelessAccessAsClient == 'no'){
    			$.jTopoLinkNode(currentNode, _devModel, false);
    		}else{
    			alert("网络错误，请确认网络配置");
    		}
    		
    		$("#ulContextNetworkList").hide();
    	});
    },
    fnExportPng: function(){
    	stage.saveImageInfo();
    },
    fnInformationHide: function(){
    	$("#divDeviceInfomation").hide();
    },
    fnWindowResize: function(){
    	var width = document.body.clientWidth - 100 - 200 ;
    	var height = document.documentElement.clientHeight;
    	$("#canvas").attr("width",width + "px");
    	$("#canvas").attr("height",height + "px");
    	$("#divUlDeviceBasicInfo").css("height",height + "px");
    },
    fnSimulator: function(){
    	$("#divScreen").load();
    },
    fnOpenConfigruationPage: function(deviceName){
    	cache.deviceConfiguration_name = deviceName;
    	$("#outDivDeviceConfig").show();
    	$("#divScreen").load("simulator_screen/screen.jsp");
    	{
    		NetworkSetting = new Object();
    		NetworkSetting.name = null;
    		NetworkSetting.recv_freq = null;
    		NetworkSetting.trans_freq = null;
    		NetworkSetting.mode1 = null;
    		NetworkSetting.mode2 = null;
    		NetworkSetting.mode3 = null;
    	}
    },
    fnConfigurationOpen: function(){
    	$("#outDivDeviceConfig").hide();
    },
    fnLongSingleClickEvent: function(obj){
		timeout = setTimeout(function() {  
			//console.log(obj);
			$(obj).unbind("click");
			$(obj).bind("click",function(){
				//console.log("clicked");
				$("#divScreen").load("simulator_screen/main-menu.jsp");
			});
		}, 2000);
		return timeout;
    },
    fnNextProcess: function(type){
    	//TODO 用于子页面继承
    },
    fnLoadScreen: function(uri){
    	$("#divScreen").load("simulator_screen/" + uri);
    },
    fnOkButtonClicked: function(){
    	$.fnNextProcess('1');
    },
    fnOkCancelClicked: function(){
    	$.fnNextProcess('2');
    },
    fnCreateDevicesLinks: function(newDevice){
    	if(deviceNetSettingList.length > 0){
    		$.each(deviceNetSettingList, function(i, dev){
    			console.log(dev);
    			
        		var deviceNode = $.jTopoNodeFind(dev.dev_name);
        		var _deviceNode = $.jTopoNodeFind(newDevice.dev_name);
        		console.log("recv a " + dev.recv_freq + "recv b" +  newDevice.recv_freq  + "tr a" +   dev.trans_freq + "tr b" + newDevice.trans_freq);
        		if(dev.recv_freq == newDevice.recv_freq && dev.trans_freq == newDevice.trans_freq){
        			if( dev.mode1 == newDevice.mode1 ||
        				dev.mode1 == newDevice.mode2 ||
        				dev.mode1 == newDevice.mode3 ||
        				dev.mode2 == newDevice.mode1 ||
        				dev.mode2 == newDevice.mode2 ||
        				dev.mode2 == newDevice.mode3 ||
        				dev.mode3 == newDevice.mode1 ||
        				dev.mode3 == newDevice.mode2 ||
        				dev.mode3 == newDevice.mode3){
        				$.jTopoDottedNode(_deviceNode, deviceNode, "无线", 5);
        				//
        				$.fnConnectedPlay();
        				var bg_sound = document.getElementById(newDevice.dev_name);
        				bg_sound.pause();
        				bg_sound = document.getElementById(dev.dev_name);
        				bg_sound.pause();
        			}
        		}
        	});
    	}
    },
    fnPlaySound: function(wav, id){
    	var bg_sound = document.createElement("audio");
    	bg_sound.style="display:none";
    	bg_sound.autoplay = "autoplay";
        bg_sound.id = id;
        bg_sound.loop = 1000;
        document.body.appendChild(bg_sound);
    	bg_sound.src="${pageContext.request.contextPath}/simulator_screen/" + wav;
    },
    fnConnectedPlay: function(){
    	var bg_sound = document.getElementById("audioConnected");
    	if('undefined' != typeof(bg_sound) && null != bg_sound){
    		bg_sound.play();
    	}else{
    		console.log("play new sound");
    		bg_sound = document.createElement("audio");
    		bg_sound.style="display:none";
    		bg_sound.autoplay = "autoplay";
        	bg_sound.id = "audioConnected";
        	document.body.appendChild(bg_sound);
        	bg_sound.src="${pageContext.request.contextPath}/simulator_screen/ch_connect.wav";
    	}
    },
    fnStopSound: function(){
    	$.each($("audio"),function(idx, bg_sound){
    		console.log(bg_sound);
    		if(bg_sound.paused){
    			bg_sound.play();
    			$("#a_sound_controller").text("静音");
    		}else{
    			bg_sound.pause();
    			$("#a_sound_controller").text("播放");
    		}
    		
    	});
    	
    }
});
$(document).ready(function() {
	var canvas = document.getElementById('canvas');
	stage = new JTopo.Stage(canvas);
	scene = new JTopo.Scene();
	scene.background = 'js/img/bg.jpg';
	stage.mode = "select";
	desktopUUID = new UUID().randomUUID();
	
	stage.add(scene);
	$.fnLoadDeviceModels();
	$.fnWindowResize();
	$("#divSimulatorButtons").find("#simuBtnSr").each(function(event){
		$(this).click(function(){
			console.log("clicked");
		});
		var longClickEventHandler = null;
		$(this).mousedown(function() {
			longClickEventHandler = $.fnLongSingleClickEvent($(this));
    	});
		$(this).mouseup(function() {  
		    clearTimeout(longClickEventHandler);  
		});
		$(this).mouseout(function() {  
		    clearTimeout(longClickEventHandler);  
		});
	});
	$("#divSimulatorButtons").find("#simuBtnOk").click(function(){
		$.fnOkButtonClicked();
	});
	$("#divSimulatorButtons").find("#simuBtnCn").click(function(){
		$.fnOkCancelClicked();
	});
});
window.onresize = function(){
	$.fnWindowResize();
}
//-->
</script>
</head>
<body style="width: 100%; height: 100%;">
<div >
	<div style="width:90px; height: 100%; float: left; margin: 0;"><!-- class="container" -->
		<ul class="menu">
			<li>
				<ul class="submenu" id="ulDeviceContainer">
				</ul>
			</li>
			<li><a href="#" onclick="$.fnExportPng();">导出图片</a></li>
			<li><a href="${pageContext.request.contextPath}/navV2/nav.jsp" >返回导航</a></li>
			<li><a id="a_sound_controller" href="#" onclick="$.fnStopSound();">静音</a></li>
		</ul>
	</div>
	<!-- <div style="margin: 0 auto; width: 1200px;" id="divDeviceContainer">
	</div> -->
	<div id="content" style="float: left; position: absolute; margin: 0 0 0 100px;">
		<canvas id="canvas"></canvas>	
	</div>
	
	<div style=" width: 200px; position: relative; float: right; background-color: #fff; " class="device-args-list" id="divUlDeviceBasicInfo">
		<div class="list-group" id="ulNetList">
		
		</div>
		<div class="list-group" id="ulConfigList">
		
		</div>

	</div>
</div>
<!-- 线上菜单 -->
<ul id="contextmenu_line" class="contextmenu" style="display:none;">
	<li><a name="">顺时针旋转</a></li>
	<li><a>逆时针旋转</a></li>
	<li><a>更改颜色</a></li>
</ul>
<!-- 桌面菜单 -->
<ul id="contextmenu_desktop" class="contextmenu" style="display:none;">
	<li><a name="">刷新</a></li>
</ul>
<!-- 设备菜单 -->
<ul id="contextmenu_device" class="contextmenu" style="display:none;">
	<li><a name="infomation">属性</a></li>
	<li><a name="configuration">配置</a></li>
	<li><a name="connectTo">连接到...</a></li>
	<li><a name="zoomIn">放大</a></li>
	<li><a name="zoomOut">缩小</a></li>
	<li><a name="delete">删除该节点</a></li>
</ul>
<ul id="ulContextNetworkList" class="contextmenu" style="display:none;">
	
</ul>
<div id="divDeviceInfomation" class="deviceInfomation">
	<table>
		<tbody>
			<tr>
				<td>设备名称</td>
				<td id="infoDevName"></td>
				<td>设备型号</td>
				<td id="infoDevModel"></td>
			</tr>
			<tr>
				<td>网络类型</td>
				<td id="infoDevNetwork"></td>
				<td>无线频率</td>
				<td id="infoDevFrequency"></td>
			</tr>
			<tr>
				<td>通信距离</td>
				<td id="infoDevDistance"></td>
				<td>信道</td>
				<td id="infoDevChannel"></td>
			</tr>
		</tbody>
	</table>
	<div>
		<button onclick="$.fnInformationHide();">确认</button>
	</div>
</div>

<div id="outDivDeviceConfig" class="deviceConfiguration">
<div id="divDeviceConfig">
	<div style="width: 800px; height: 350px; background: url('images/simulator/bfdt.png');">
		<!-- 显示 -->
		<div id="divScreen" style="width: 250px; height: 150px; top: 35px; left:80px; position: relative;">
			
		</div>
		
		<!-- 按钮 -->
		<div style="width: 240px; height: 120px; top: 80px; left:90px; position: relative;" id="divSimulatorButtons">
			<div style="width: 100%; height: 60px;">
				<button id="simuBtnF1">F1</button>
				<button id="simuBtnF2">F2</button>
				<button id="simuBtnF3">F3</button>
			</div>
			<div style="width: 100%; height: 50px;">
				<button id="simuBtnOk">OK</button>
				<button id="simuBtnCn">CN</button>
				<button id="simuBtnSr">SR</button>
			</div>
		</div>
	</div>
</div>
<div>
	<input type="button" onclick="$.fnConfigurationOpen(2);" value="关闭">
</div>
</div>
</body>
</html>