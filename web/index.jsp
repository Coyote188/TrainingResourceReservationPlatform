<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><!--[if lt IE 7 ]> <html lang="zh" class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="zh" class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="zh" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="zh" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<%
String callName = "";
if(null != request.getSession().getAttribute("edu_user_info")){
	cn.com.chinaccs.bean.UserInfo info = (cn.com.chinaccs.bean.UserInfo)request.getSession().getAttribute("edu_user_info");
	callName = info.getCallName();
}
%>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="http://www.yicjx.com/favicon.ico"></link>
<link rel="stylesheet" type="text/css" href="idx/global.css"></link>

<script type="text/javascript" src="idx/jquery-1.js"></script>
<script type="text/javascript" src="idx/swfobject.js"></script>

<title>丽江贵峰机动车驾驶人科目二训练考试服务有限公司 </title>
<style>
<!--
.window {
	width: 400px;
	background-color: #fff;
	position: absolute;
	padding: 2px;
	margin: 5px;
	display: none;
}
.content {
	height: 300px;
	background-color: #FFF;
	font-size: 14px;
	overflow: auto;
}
-->
</style>
<script type="text/javascript">
var $pageInfo = {
		publishmentSystemID : 1,
		channelID : 1,
		contentID : 0,
		siteUrl : "",
		homeUrl : "/center",
		currentUrl : "http://new.yicjx.com/",
		rootUrl : "http://new.yicjx.com"
};
$(document).ready(function() {
	$("#nav li").hover(function() {
		$(this).find("ul").slideDown("fast");
	}, function() {
		$(this).find("ul").slideUp("fast");
	});
	if("" != $("#MenuSpaceRight").find("label").text() && null != $("#MenuSpaceRight").find("label")){//
		$("#MenuSpaceRight").find("a").hide();
		$("#MenuSpaceRight").find("label").show();
		$("#MenuSpaceRight").find("label").text("欢迎您 <%=callName%>");
	}else{
		$("#MenuSpaceRight").find("label").hide();
		$("#MenuSpaceRight").find("a").show();
	}
});
$.extend({
	sltTab2 : function(tabName, no) {
		for ( var i = 1; i <= 7; i++) {
			var el = jQuery('#vehicle_type_tabContent_' + i);
			var li = $('#vehicle_type_tabHeader_' + i);
			if (i == no) {
				try {
					el.show();
				} catch (e) {
				}
				li.removeClass('TabOff');
				li.addClass('TabOn');
			} else {
				try {
					el.hide();
				} catch (e) {
				}
				li.removeClass('TabOn');
				li.addClass('TabOff');
			}
		}
	},
	stlTab4 : function(tabName, no) {
		for ( var i = 1; i <= 5; i++) {
			var el = jQuery('#服务查询_tabContent_' + i);
			var li = $('#服务查询_tabHeader_' + i);
			if (i == no) {
				try {
					el.show();
				} catch (e) {
				}
				li.removeClass('TabOff');
				li.addClass('TabOn');
			} else {
				try {
					el.hide();
				} catch (e) {
				}
				li.removeClass('TabOn');
				li.addClass('TabOff');
			}
		}
	},
	AddFavorite : function() {
		if (document.all) {
			window.external.addFavorite(window.location.href,
					document.title);
		} else if (window.sidebar) {
			window.sidebar.addPanel(document.title,
					window.location.href, "");
		}
	},
	stlTab6 : function(tabName, no) {
		for ( var i = 1; i <= 9; i++) {
			var el = jQuery('#资讯公告_tabContent_' + i);
			var li = $('#资讯公告_tabHeader_' + i);
			if (i == no) {
				try {
					el.show();
				} catch (e) {
				}
				li.removeClass('TabOff');
				li.addClass('TabOn');
			} else {
				try {
					el.hide();
				} catch (e) {
				}
				li.removeClass('TabOn');
				li.addClass('TabOff');
			}
		}
	},
	stlTab8 : function(tabName, no) {
		for ( var i = 1; i <= 7; i++) {
			var el = jQuery('#互动版块_tabContent_' + i);
			var li = $('#互动版块_tabHeader_' + i);
			if (i == no) {
				try {
					el.show();
				} catch (e) {
				}
				li.removeClass('TabOff');
				li.addClass('TabOn');
			} else {
				try {
					el.hide();
				} catch (e) {
				}
				li.removeClass('TabOn');
				li.addClass('TabOff');
			}
		}
	},
	SetHomepage : function() {
		if (document.all) {
			document.body.style.behavior = 'url(#default#homepage)';
			document.body.setHomePage("/");
		} else if (window.sidebar) {
			if (window.netscape) {
				try {
					netscape.security.PrivilegeManager
							.enablePrivilege("UniversalXPConnect");
				} catch (e) {
					alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true");
				}
			}
			var prefs = Components.classes['@mozilla.org/preferences-service;1']
					.getService(Components.interfaces.nsIPrefBranch);
			prefs.setCharPref('browser.startup.homepage', "/");
		}
	},
	fnRegist : function() {
		$("#Row1Area").hide();
		$("#Row2Area").hide();

		$("#Row3Area").show();
		$("#Row3Area").find("iframe").attr("src", "idx/regist.jsp");
	},
	fnBooking : function() {
		$("#Row1Area").hide();
		$("#Row2Area").hide();

		$("#Row3Area").show();
		$("#Row3Area").find("iframe").attr("src", "idx/resource_booking.jsp");
	},
	fnOpenLoginForm: function(event) {
		
		$.popRightWindow(event.pageX, event.pageY);
	},
	fnOpenLogout: function(){
		
	},
	closeWindow:function() {
		$("#popupWindow4LoginForm").hide("slow");
	},
	popRightWindow:function(x, y) {
		//计算弹出窗口的左上角Y的偏移量 
		//var popY = $(window).height() - $(".window").height();
		//var popX = $(window).width() - $(".window").width();
		var popY = y + 50;
		var popX = x - 30;
		//设定窗口的位置 
		$("#popupWindow4LoginForm").css("top", popY - 50).css("left", popX - 50).slideToggle("slow");
		//$.closeWindow();
		$("#popContentLoginForm").load("portal");
	}
});
</script>
</head>
<body>
	<div id="page">
		<h1>丽江贵峰机动车驾驶人科目二训练考试服务有限公司 - 首页</h1>
		<div id="Header">
			<div id="MenuSpace">
				<div id="MenuSpaceLogo"></div>
				<div id="MenuSpaceCenter">
					<div id="MenuSpaceNav">
						<ul id="nav">
							<li class="mainlevel">
								<a href="index">首页</a>
							</li>
							<li class="mainlevel">
								<a href="idx/list.html">走进贵峰</a>
							</li>
							<li class="mainlevel">
								<a href="">贵峰动态</a>
								<ul>
									<li>
										<a href="javascript:void(0)" target="_blank">贵峰新闻</a>
									</li>
									<li>
										<a href="javascript:void(0)" target="_blank">贵峰专稿</a>
									</li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
				<div id="MenuSpaceRight">
					<a href="javascript:void(0);" onclick="$.fnOpenLoginForm(event);">登录</a>
					<label><%=callName%></label>
				</div>
			</div>
		</div>
		<div id="ADArea">
			<div id="ADFocusImages" style="overflow: hidden;">
				<iframe id="frmSlider" src="idx/logo.html" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" scrolling="no" style="overflow: hidden;" frameborder="0" height="100%" width="100%">
				</iframe>
			</div>
		</div>
		<div id="Nav2Area">
			<div id="Nav2Title"></div>
			<div id="Nav2Link">
				<div id="Nav2LinkText">
					<ul>
						<li>
							<a href="#" onclick="$.fnRegist();">
								<img src="idx/images/nav2-user.png">
								<br>
								<font style="color: #ec008c;">注册会员</font>
							</a>
						</li>
						<li>
							<a href="#" onclick="$.fnBooking();">
								<img src="idx/images/nav2-search.png">
								<br>
								学车预约
							</a>
						</li>
						<li>
							<a href="#">
								<img src="idx/images/nav2-vehicle.png">
								<br>
								教练介绍
							</a>
						</li>
						<li>
							<a href="#">
								<img src="idx/images/nav2-lines.png">
								<br>
								车型介绍
							</a>
						</li>
						<li>
							<a href="#">
								<img src="idx/images/nav2-test.png">
								<br>
								场地介绍
							</a>
						</li>
						<li id="FansNum" style="width:200px;">
							<img src="idx/images/nav2-users.png">
							<br>
							已有
							<font style="color: #ec008c;">126143</font>
							人预约训练
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="SpaceBar">
			<img src="idx/spacer.html" height="0" border="0" width="0">
		</div>

		<div id="ProcessArea">
			<div id="ProcessTitle"></div>
			<div id="ProcessLink">
				<div id="ProcessLinkText">
					<ul>
						<li>注册会员</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>选择场地</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>选择车辆</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>确认教练</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>保存订单</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>缴费</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>确认订单信息</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>提交</li>
						<li>&nbsp;&nbsp;→&nbsp;&nbsp;</li>
						<li>到驾校练车喽！</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="SpaceBar">
			<img src="idx/spacer.html" height="0" border="0" width="0">
		</div>
		<div id="Row1Area">
			<div id="Row1Col1">
				<div class="Tab">
					<ul>
						<li class="TabOn" id="vehicle_type_tabHeader_1" onmouseover="$.sltTab2('vehicle_type', 1);">
							<a href="#" groupcontent="租用车辆">租用车辆</a>
						</li>
						<li class="TabOff" id="vehicle_type_tabHeader_2" onmouseover="$.sltTab2('vehicle_type', 2);">
							<a href="#" groupcontent="驾校自带车辆">驾校自带车辆</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" id="vehicle_type_tabContent_1">
					<ul>
						<!-- 小型车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/117144176.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">C1/C2 驾照</a>
							</div>
							<div class="ClassPrice">价格：210元/小时</div>
							<div class="ClassVehicle">车型：捷达/桑塔纳</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型货车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/1171723862.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">B2</a>
							</div>
							<div class="ClassPrice">价格：290元/小时</div>
							<div class="ClassVehicle">车型：东风</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型客车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/117175735.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">A1/A3驾照</a>
							</div>
							<div class="ClassPrice">价格：260元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 中型客车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/1171741272.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">B1 驾照</a>
							</div>
							<div class="ClassPrice">价格：260元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" style="display: none" id="vehicle_type_tabContent_2">
					<ul>
						<!-- 小型车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/117144176.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">C1/C2 驾照</a>
							</div>
							<div class="ClassPrice">价格：110元/小时</div>
							<div class="ClassVehicle">车型：捷达/桑塔纳</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型货车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/1171723862.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">B2</a>
							</div>
							<div class="ClassPrice">价格：130元/小时</div>
							<div class="ClassVehicle">车型：东风</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型客车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/117175735.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">A1/A3驾照</a>
							</div>
							<div class="ClassPrice">价格：130元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 中型客车 -->
						<li>
							<div class="ClassImage">
								<a href="#"><img src="picture/vehicle/1171741272.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="#">B1 驾照</a>
							</div>
							<div class="ClassPrice">价格：130元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="AreaBreak"></div>
			<div id="Row1Col2">
				<div class="Tab">
					<ul>
						<li class="TabOn" id="服务查询_tabHeader_1" >
							<a href="#">报名网点</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" id="服务查询_tabContent_1">
					<ul>
						<li>
							<div class="ClassTitle">
								<a href="javascript:void(0)">驾校地址</a>
							</div>
							<div class="ClassContent">
								丽江市古城区金山乡贵峰村委会
							</div>
						</li>
						<li style="display: none;">
							<div class="ClassTitle">
								<a href="javascript:void(0);">一乘驾校(白塔路店)</a>
							</div>
							<div class="ClassContent">
								昆明市白塔路152号附1号（昆十中斜对面）<br>营业：周一至周日 9:30-21:00 缴费方式：刷卡 
							</div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="SpaceBar">
			<img src="idx/spacer.html" height="0" border="0" width="0">
		</div>
		<div id="Row2Area">
			<div id="Row2Col1">
				<div class="Tab">
					<ul>
						<li class="TabOff" id="资讯公告_tabHeader_1" onmouseover="$.stlTab6('资讯公告', 1);">
							<a href="javascript:void(0);">贵峰新闻</a>
						</li>
						<li class="TabOff" id="资讯公告_tabHeader_2" onmouseover="$.stlTab6('资讯公告', 2);">
							<a href="javascript:void(0);">贵峰专稿</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" style="" id="资讯公告_tabContent_1">
					<a href="javascript:void(0);">
						<img src="idx/20155749866.jpg">
					</a>
					<ul>
						<li>&gt; <a href="javascript:void(0);">贵峰，敢于担当社会责任的企业</a></li>
						<li>&gt; <a href="javascript:void(0);">贵峰“学员卡”全面升级</a></li>
						<li>&gt; <a href="javascript:void(0);">省发改委贺晓龙处长领导一行莅临公司调研指导</a></li>
					</ul>
				</div>
				<div class="TabOnDiv" style="display: none" id="资讯公告_tabContent_2">
					<a href="javascript:void(0);">
						<img src="idx/2919421913.jpg">
					</a>
					<ul>
						<li>&gt; <a href="javascript:void(0);">贵峰开启驾培“新模式”引领驾培行业转型发展</a></li>
						<li>&gt; <a href="javascript:void(0);">贵峰驾校上市啦！贵峰驾校上市啦！贵峰驾校上市啦！</a></li>
						<li>&gt; <a href="javascript:void(0);">【特稿】驾驶培训行业的改革之痛（地）</a></li>
					</ul>
				</div>
			</div>
			<div class="AreaBreak"></div>
			<div id="Row2Col2">
				<div class="Tab">
					<ul>
						<li class="TabOn" id="互动版块_tabHeader_1" onmouseover="$.stlTab8('互动版块', 1);">
							<a href="javascript:void(0);">通知公告</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" style="" id="互动版块_tabContent_1">
					<iframe scrolling="no" src="" frameborder="0"  height="348" width="341"></iframe>
				</div>
			</div>
		</div>
		<!-- 注册区 -->
		<div id="Row3Area" style="display: none; ">
			<iframe scrolling="no" src="" frameborder="0"  height="610px" width="990px">
			</iframe>
		</div>
		
		
		<div class="SpaceBar">
			<img src="idx/spacer.html" height="0" border="0" width="0">
		</div>
			<div id="BottomAd">
				<div class="Text">
为进一步加强道路交通安全源头管理，促进机动车驾驶人考试工作的规范、公开、公正、高效，按照公安部、公安厅关于进一步加强社会管理创新的要求，在市人民政府的高度重视下，在相关部门的大力支持配合下，丽江贵峰机动车驾驶人科目二考试服务有限公司于2011年2月18日破土动工，于2011年6月16日开始试运行。
公司位于丽江市古城区金山乡贵峰行政村大来下村，总占地201亩。公司共有员工44人，设有行政办公室、引车部、门禁大厅、机电部、车辆维修组、预约收费处、保安部等部门。
考场分为A区、B区和A1、B1、B2新增考试项目区。A1考试车1辆，B1考试车1辆，B2考试车11辆，C1考试车22辆，C2考试车2辆，共计37辆，每天可同时容纳300—400人进行考试。2014年度A1、B1、B2类考生达到了60%的合格率，C1类考生达到了80%的合格率。
公司采用南京多伦科技有限公司提供的考试评判计算机系统和设备，在考试过程实行全程电脑监控，计算机系统自动评判、采集、上传考生成绩，真正做到了考试工作的公平、公正，收到了良好的社会效果。
				</div>
			</div>
			<div id="BottomArea">
				<div class="Link">
					<a href="javascript:void(0);" onclick="$.SetHomepage();">设为首页</a>
					<a href="javascript:void(0);" onclick="$.AddFavorite();">加入收藏</a>
					<a href="javascript:void(0);">联系我们</a>
				</div>
				<div class="CopyRight">
					Copyright © 2012- 2043 All Rights Reserved. 丽江贵峰机动车驾驶人科目二训练考试服务有限公司
				</div>
				<div class="Contact">
					地址：云南省丽江市古城区金山乡贵峰村委会 邮编：674100 电话： 08885170175 邮件：249381603@qq.com
				</div>
			</div>
	</div>
	<script src="idx/tracker.js" type="text/javascript"></script>
	<script type="text/javascript">
		AddTrackerCount('/sitefiles/services/cms/PageService.aspx?type=AddTrackerCount&publishmentSystemID=1&channelID=1&contentID=0',1);
	</script>
	<script type="text/javascript">
		$.getJSON("/webapi/json/InData_Student.json", function(data) {
			$("#FansNumLayout").html(data.bynum);
			$("#FansNum").html(
					"<img src='/images/nav2-users.png'><br>已毕业<font style='color:#ec008c;'>" + data.bynum + "</font>人");
			var num = 100;
			var count = data.student.length;
			var NameStr = "";
			if (count >= num) {
				c = count - num;
			} else {
				c = 0;
			}
			for (var i = c; i < count; i++) {
				NameStr += data.student[i].Name + " ";
			}
			//判断浏览器开始
			var browser = {
				versions : function() {
					var u = navigator.userAgent, app = navigator.appVersion;
					return {//移动终端浏览器版本信息
						trident : u.indexOf('Trident') > -1, //IE内核
						presto : u.indexOf('Presto') > -1, //opera内核
						webKit : u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
						gecko : u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
						mobile : !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
						ios : !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
						android : u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或者uc浏览器
						iPhone : u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
						iPad : u.indexOf('iPad') > -1, //是否iPad
						webApp : u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
					};
				}(),
				language : (navigator.browserLanguage || navigator.language).toLowerCase()
			}
			if (browser.versions.mobile || browser.versions.ios || browser.versions.android || browser.versions.iPhone || browser.versions.iPad) {
				$("#StudentName").html('');
			} else {
				$("#StudentName").html(NameStr);
			};
		});
	</script>
<div class="window" id="popupWindow4LoginForm"> 
	<div class="content" id="popContentLoginForm"></div> 
</div>
</body>
</html>