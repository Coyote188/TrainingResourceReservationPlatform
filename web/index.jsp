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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/idx/global.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/idx/jquery-1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/idx/swfobject.js"></script>
<script src="${pageContext.request.contextPath}/js/layer/layer.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/ToolsObject.js" type="text/javascript"></script>
<style type="text/css">
    html,body{margin:0;padding:0;}
    .iw_poi_title {color:#CC5522;font-size:14px;font-weight:bold;overflow:hidden;padding-right:13px;white-space:nowrap}
    .iw_poi_content {font:12px arial,sans-serif;overflow:visible;padding-top:4px;white-space:-moz-pre-wrap;word-wrap:break-word}
</style>
<script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
<title>丽江贵峰机动车驾驶人科目二训练考试服务有限公司 </title>
<script type="text/javascript">
$(document).ready(function() {
	if("" != $("#MenuSpaceRight").find("label").text() && null != $("#MenuSpaceRight").find("label")){//
		$("#MenuSpaceRight").find("a").hide();
		$("#MenuSpaceRight").find("label").show();
		$("#MenuSpaceRight").find("label").text("欢迎您 <%=callName%>");
		$("#liRegistorButton").find("font").text($("#MenuSpaceRight").find("label").text());
		$("#liRegistorButton").find("a").unbind("click");
		$("#liRegistorButton").find("a").attr("onclick","$.fnOnOpenUserManager();");
	}else{
		$("#MenuSpaceRight").find("label").hide();
		$("#MenuSpaceRight").find("a").show();
	}
	$.fnQueryInfor('NEWS', $("#news_tabContent_1"));
	$.fnQueryInfor('NOTICE', $("#news_tabContent_2"));
	$.fnQueryInfor('AGREEMENT', null);
});
var inforCache = new Map();
$.extend({
	fnOnOpenUserManager: function(){
		$("#Row1Area").hide();
		$("#Row2Area").hide();

		$("#Row3Area").show();
		$("#Row3Area").load("idx/portal_manager.jsp");
	},
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
			var el = jQuery('#news_tabContent_' + i);
			var li = $('#news_tabHeader_' + i);
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
			var el = jQuery('#notice_tabContent_' + i);
			var li = $('#notice_tabHeader_' + i);
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
		$("#Row3Area").load("idx/regist.jsp");
		//$("#Row3Area").find("iframe").attr("src", "idx/regist.jsp");
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
	popRightWindow:function(x, y) {
		$("#popContentLoginForm").load("portal");
		layer.open({
			title: '  登录  ',
			closeBtn:'2',
			type: 1,
			skin: 'layui-layer-rim', //加上边框
			area: ['420px', '340px'], //宽高
			content: $("#popContentLoginForm")
		});
	},
	onOpenFullScreenFrame: function(type, html, title){
		if(type == 1){
			html = inforCache.get(html);
		}
		var index = layer.open({
			type: type,
			title:title,
			content: html,
			area: ['320px', '195px'],
			maxmin: true
		});
		layer.full(index);
	},
	fnFillNewsBox: function(res, box){
		$.each(res, function(idx, news){
			var liIndexNewsItem = '<li data="' + news.infoId + '">&gt; <a href="javascript:void(0);" id="a_' + news.infoId + '">' + news.title + '</a><span style="float: right;">'+news.time+'</span></li>';
			$(box).find("ul").append(liIndexNewsItem);
			inforCache.put(news.infoId, news.infor);
			$("#a_" + news.infoId).bind("click", function(){
				$.onOpenFullScreenFrame(1, news.infoId,'贵峰新闻');
			});
		});
	},
	fnQueryInfor: function(inforType, frame){
		$.ajax({
			url:'${pageContext.request.contextPath}/portals_json/infoQuery',
			dataType:'json',
			type:"post",
			data:{
				infoType: inforType,
				limit: 0,
				len: 3
			},
			success: function(doc) {
				if(inforType == 'AGREEMENT'){
					$.fnFillBooksBox($.parseJSON(eval(doc).output).data);
				}else
					$.fnFillNewsBox($.parseJSON(eval(doc).output).data, frame);
			}
		});
	},
	fnFillBooksBox: function(books){
		var frame = null;
		$.each(books, function(idx, book){
			var td = '';
			td += '<td valign="top" align="left">';
			td += '<li class="eBook tc"><a target="_blank" title="' + book.title + '" href="/contents/227/9157.html">';
			td += '<div>';
			if(book.imgUri == ''){
				td += '<img width="75" height="100" src="${pageContext.request.contextPath}/picture/other/default_book.jpg">';
			}else{
				td += '<img width="75" height="100" src="${pageContext.request.contextPath}' + book.imgUri + '">';
			}
			td += '</div>';
			td += '<div class="lineH30">' + book.title + '</div> </a>';
			td += '</li>';
			td += '</td>';
			if(idx%2 == 0){
				var tr = '<tr id="sc_reading_books_' + idx + '"><td>';
				frame = $("#tbodyScReadingFiles").append(tr);
				$(frame).append(td);
			}else{
				$(frame).append(td);
			}
		});
		
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
								<a href="javascript:void(0);">首页</a>
							</li>
							<li class="mainlevel">
								<a href="javascript:void(0);">走进贵峰</a>
							</li>
							<li class="mainlevel">
								<a href="javascript:void(0);">贵峰动态</a>
								<!-- 
								<ul style="display: none;">
									<li>
										<a href="javascript:void(0)" target="_blank">贵峰新闻</a>
									</li>
									<li>
										<a href="javascript:void(0)" target="_blank">贵峰专稿</a>
									</li>
								</ul>
								 -->
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
				<iframe id="frmSlider" src="${pageContext.request.contextPath}/idx/logo.jsp" border="0" vspace="0" hspace="0" marginwidth="0" marginheight="0" framespacing="0" scrolling="no" style="overflow: hidden;" frameborder="0" height="100%" width="100%">
				</iframe>
			</div>
		</div>
		<div id="Nav2Area">
			<div id="Nav2Title"></div>
			<div id="Nav2Link">
				<div id="Nav2LinkText">
					<ul>
						<li id="liRegistorButton">
							<a href="javascript:void(0);" onclick="$.fnRegist();">
								<img src="${pageContext.request.contextPath}/idx/images/nav2-user.png">
								<br>
								<font style="color: #ec008c;">注册会员</font>
							</a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="$.fnBooking();">
								<img src="${pageContext.request.contextPath}/idx/images/nav2-search.png">
								<br>
								学车预约
							</a>
						</li>
						<li>
							<a href="javascript:void(0);" onclick="$.onOpenFullScreenFrame(2,'url');">
								<img src="${pageContext.request.contextPath}/idx/images/nav2-vehicle.png">
								<br>
								教练介绍
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<img src="${pageContext.request.contextPath}/idx/images/nav2-lines.png">
								<br>
								车型介绍
							</a>
						</li>
						<li>
							<a href="javascript:void(0);">
								<img src="${pageContext.request.contextPath}/idx/images/nav2-test.png">
								<br>
								场地介绍
							</a>
						</li>
						<li id="FansNum" style="width:200px;">
							<img src="${pageContext.request.contextPath}/idx/images/nav2-users.png">
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
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
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
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
		</div>
		<div id="Row1Area">
			<div id="Row1Col1">
				<div class="Tab">
					<ul>
						<li class="TabOn" id="vehicle_type_tabHeader_1" onmouseover="$.sltTab2('vehicle_type', 1);">
							<a href="javascript:void(0);" groupcontent="租用车辆">租用车辆</a>
						</li>
						<li class="TabOff" id="vehicle_type_tabHeader_2" onmouseover="$.sltTab2('vehicle_type', 2);">
							<a href="javascript:void(0);" groupcontent="驾校自带车辆">驾校自带车辆</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" id="vehicle_type_tabContent_1">
					<ul>
						<!-- 小型车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/C1_C2.jpg"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">C1/C2 驾照</a>
							</div>
							<div class="ClassPrice">价格：210元/小时</div>
							<div class="ClassVehicle">车型：捷达/桑塔纳</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型货车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/B2.jpg"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">B2</a>
							</div>
							<div class="ClassPrice">价格：290元/小时</div>
							<div class="ClassVehicle">车型：东风</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型客车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/A1_A3.jpg"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">A1/A3驾照</a>
							</div>
							<div class="ClassPrice">价格：260元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 中型客车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/B1.jpg"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">B1 驾照</a>
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
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/117144176.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">C1/C2 驾照</a>
							</div>
							<div class="ClassPrice">价格：110元/小时</div>
							<div class="ClassVehicle">车型：捷达/桑塔纳</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型货车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/1171723862.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">B2</a>
							</div>
							<div class="ClassPrice">价格：130元/小时</div>
							<div class="ClassVehicle">车型：东风</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 大型客车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/117175735.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">A1/A3驾照</a>
							</div>
							<div class="ClassPrice">价格：130元/小时</div>
							<div class="ClassVehicle">车型：金龙</div>
							<div class="ClassFeature">训练时间：全周7:00--21:00</div>
						</li>
						<!-- 中型客车 -->
						<li>
							<div class="ClassImage">
								<a href="javascript:void(0);"><img src="${pageContext.request.contextPath}/picture/vehicle/1171741272.JPG"></a>
							</div>
							<div class="ClassTitle">
								<a href="javascript:void(0);">B1 驾照</a>
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
						<li class="TabOn">
							<a href="javascript:void(0);">报名网点</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv">
					<ul>
						<li>
							<div class="ClassTitle">
								<a href="javascript:void(0)">驾校地址</a>
							</div>
							<div class="ClassContent">
								丽江市古城区金山乡贵峰村委会
							</div>
						</li>
						<li>
								<div style="width:160px;height:200px;border:#ccc solid 1px;" id="dituContent"></div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="SpaceBar">
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
		</div>
		<div id="Row2Area">
			<div id="Row2Col1">
				<div class="Tab">
					<ul>
						<li class="TabOff" id="news_tabHeader_1" onmouseover="$.stlTab6('news', 1);">
							<a href="javascript:void(0);">贵峰新闻</a>
						</li>
						<li class="TabOff" id="news_tabHeader_2" onmouseover="$.stlTab6('news', 2);">
							<a href="javascript:void(0);">贵峰专稿</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" style="" id="news_tabContent_1">
					<a href="javascript:void(0);">
						<img src="${pageContext.request.contextPath}/picture/ad/02.jpg">
					</a>
					<ul>
					</ul>
				</div>
				<div class="TabOnDiv" style="display: none" id="news_tabContent_2">
					<a href="javascript:void(0);">
						<img src="${pageContext.request.contextPath}/picture/ad/04.jpg">
					</a>
					<ul>
					</ul>
				</div>
			</div>
			<div class="AreaBreak"></div>
			<div id="Row2Col2">
				<div class="Tab">
					<ul>
						<li class="TabOn" id="notice_tabHeader_1" onmouseover="$.stlTab8('互动版块', 1);">
							<a href="javascript:void(0);">驾考读物</a>
						</li>
					</ul>
				</div>
				<div class="TabOnDiv" style="" id="notice_tabContent_1">
					<table cellspacing="0" style="width: 100%; border-collapse: collapse;">
						<tbody id="tbodyScReadingFiles">
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- 注册区 -->
		<div id="Row3Area" style="display: none; ">
			<iframe scrolling="no" src="" frameborder="0"  height="610px" width="990px">
			</iframe>
		</div>
		
		
		<div class="SpaceBar">
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
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
	<div class="content" style="display: none;" id="popContentLoginForm"></div> 
</body>
<script type="text/javascript">
//创建和初始化地图函数：
function initMap(){
    createMap();//创建地图
    setMapEvent();//设置地图事件
    addMapControl();//向地图添加控件
    addMarker();//向地图中添加marker
}
//创建地图函数：
function createMap(){
    var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
    var point = new BMap.Point(100.300194,26.798603);//定义一个中心点坐标
    map.centerAndZoom(point,17);//设定地图的中心点和坐标并将地图显示在地图容器中
    window.map = map;//将map变量存储在全局
}
//地图事件设置函数：
function setMapEvent(){
	map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
	map.enableScrollWheelZoom();//启用地图滚轮放大缩小
	map.enableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
	map.enableKeyboard();//启用键盘上下左右键移动地图
}
//地图控件添加函数：
function addMapControl(){
	//向地图中添加缩放控件
	var ctrl_nav = new BMap.NavigationControl({anchor:BMAP_ANCHOR_TOP_LEFT,type:BMAP_NAVIGATION_CONTROL_PAN});
	map.addControl(ctrl_nav);
	//向地图中添加缩略图控件
	var ctrl_ove = new BMap.OverviewMapControl({anchor:BMAP_ANCHOR_BOTTOM_RIGHT,isOpen:0});
	map.addControl(ctrl_ove);
}
//标注点数组
var markerArr = [{title:"丽江市古城区金山乡贵峰村委会",content:"丽江贵峰机动车驾驶人科目二训练考试服务有限公司",point:"100.299754|26.798603",isOpen:0,icon:{w:21,h:21,l:46,t:46,x:1,lb:10}}];
//创建marker
function addMarker(){
    for(var i=0;i<markerArr.length;i++){
        var json = markerArr[i];
        var p0 = json.point.split("|")[0];
        var p1 = json.point.split("|")[1];
        var point = new BMap.Point(p0,p1);
		var iconImg = createIcon(json.icon);
        var marker = new BMap.Marker(point,{icon:iconImg});
		var iw = createInfoWindow(i);
		var label = new BMap.Label(json.title,{"offset":new BMap.Size(json.icon.lb-json.icon.x+10,-20)});
		marker.setLabel(label);
        map.addOverlay(marker);
        label.setStyle({
                    borderColor:"#808080",
                    color:"#333",
                    cursor:"pointer"
        });
		(function(){
			var index = i;
			var _iw = createInfoWindow(i);
			var _marker = marker;
			_marker.addEventListener("click",function(){
			    this.openInfoWindow(_iw);
		    });
		    _iw.addEventListener("open",function(){
			    _marker.getLabel().hide();
		    })
		    _iw.addEventListener("close",function(){
			    _marker.getLabel().show();
		    })
			label.addEventListener("click",function(){
			    _marker.openInfoWindow(_iw);
		    })
			if(!!json.isOpen){
				label.hide();
				_marker.openInfoWindow(_iw);
			}
		})()
    }
}
//创建InfoWindow
function createInfoWindow(i){
    var json = markerArr[i];
    var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>"+json.content+"</div>");
    return iw;
}
//创建一个Icon
function createIcon(json){
    var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w,json.h),{imageOffset: new BMap.Size(-json.l,-json.t),infoWindowOffset:new BMap.Size(json.lb+5,1),offset:new BMap.Size(json.x,json.h)})
    return icon;
}
initMap();//创建和初始化地图
</script>
</html>