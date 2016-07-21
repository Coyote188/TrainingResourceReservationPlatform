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
<script src="${pageContext.request.contextPath}/js/layer/layer.js" type="text/javascript"></script>

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
		$("#liRegistorButton").find("font").text($("#MenuSpaceRight").find("label").text());
		$("#liRegistorButton").find("a").unbind("click");
		$("#liRegistorButton").find("a").attr("onclick","$.fnOnOpenUserManager();");
	}else{
		$("#MenuSpaceRight").find("label").hide();
		$("#MenuSpaceRight").find("a").show();
	}
});
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
								<a href="javascript:void(0);">首页</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="SpaceBar">
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
		</div>
		<div id="Row3Area">
			<div id="MainArea">
	<div id="MainAreaLeft">
			
				<div id="NavTitle"><a type="title" href="/channels/94.html">一乘动态</a></div>
				<div id="NavLink">
				<ul>
				
					<li class="level1"><a href="/channels/94.html">一乘新闻</a>
						
					</li>
				
					<li class="level1"><a href="/channels/38.html">一乘专稿</a>
						
					</li>
				
					<li class="level1"><a href="/channels/59.html">一乘视觉</a>
						
					</li>
				
					<li class="level1"><a href="/channels/174.html">活动公告</a>
						
					</li>
				
					<li class="level1"><a href="/channels/227.html">学员读物</a>
						
					</li>
				
					<li class="level1"><a href="/contents/60/384.html">期刊投稿</a>
						
					</li>
				
					<li class="level1"><a href="/channels/39.html">行业资讯</a>
						
					</li>
				
				</ul>
				</div>
			
<!-- 		<div class="SpaceBar"><img src="/images/spacer.png" width="0" height="0" border="0"></div>
		<div class="NavTitle">广告位</div>
		<div class="NavLink">
        <ul>        
			<li><a href="/contents/25/257.html" type="title">学车报名</a></li>
        </ul>
		</div> -->

	</div>
	<div class="AreaBreak"><img width="0" height="0" border="0" src="/images/spacer.png"></div>
	<div id="MainAreaRight">
		<div class="Location">
			当前位置：<a href="/">首页</a> &gt; <a href="/channels/94.html">一乘动态</a> &gt; <a href="/channels/94.html">一乘新闻</a>
		</div>
		<div id="RightList">
			<ul>
			
				<li>
				<a title="公司与云南省交通职业技术学院联合办学洽谈会" href="/contents/94/10766.html">
				公司与云南省交通职业技术学院联合办学洽谈会
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2016-07-13)</span></li>
			
				<li>
				<a title="调研领导小组莅临公司指导工作" href="/contents/94/10765.html">
				调研领导小组莅临公司指导工作
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2016-07-08)</span></li>
			
				<li>
				<a title="云南一乘驾驶培训股份有限公司与云南城投置业股份有限公司举行篮球联谊赛" href="/contents/94/9806.html">
				云南一乘驾驶培训股份有限公司与云南城投置业股份...
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2016-05-27)</span></li>
			
				<li>
				<a title="一乘驾校敲响中国驾培”第一股”钟声" href="/contents/94/3924.html">
				<span class="SpanGray">[图]</span>一乘驾校敲响中国驾培”第一股”钟声
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2015-12-11)</span></li>
			
				<li>
				<a title="一乘驾校春节放假安排" href="/contents/94/6456.html">
				一乘驾校春节放假安排
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2016-02-04)</span></li>
			
				<li>
				<a title="一乘，敢于担当社会责任的企业" href="/contents/94/6416.html">
				<span class="SpanGray">[图]</span>一乘，敢于担当社会责任的企业
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2016-01-20)</span></li>
			
				<li>
				<a title="一乘驾校2016年元旦放假安排" href="/contents/94/5199.html">
				一乘驾校2016年元旦放假安排
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2015-12-30)</span></li>
			
				<li>
				<a title="昆明求实小学60名少年交警参观昆明市道路交通安全宣传警示教育基地" href="/contents/94/3952.html">
				昆明求实小学60名少年交警参观昆明市道路交通安全...
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2015-12-07)</span></li>
			
				<li>
				<a title="一乘驾校上市啦！一乘驾校上市啦！一乘驾校上市啦！" href="/contents/94/3906.html">
				<span class="SpanGray">[图]</span>一乘驾校上市啦！一乘驾校上市啦！一乘驾校上市...
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2015-12-10)</span></li>
			
				<li>
				<a title="省政府研究室领导莅临公司调研指导工作" href="/contents/94/2441.html">
				<span class="SpanGray">[图]</span>省政府研究室领导莅临公司调研指导工作
				</a>
				<span class="SpanGray">[<a href="/channels/94.html">一乘新闻</a>](2015-10-13)</span></li>
			
			</ul>
			<div class="Pager">
				<div class="page_wrap">
					<div class="paginator">
					<span class="page-start"><b>〈</b>上一页</span>
					<span class="page-this">1</span><a href="/channels/94_2.html">2</a><a href="/channels/94_3.html">3</a><a href="/channels/94_4.html">4</a><a href="/channels/94_5.html">5</a><a href="/channels/94_6.html">6</a><a href="/channels/94_7.html">7</a><a href="/channels/94_8.html">8</a><a href="/channels/94_9.html">9</a>
					<a href="/channels/94_2.html" class="page-next">下一页<b>〉</b></a>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
		</div>
		<div class="SpaceBar">
			<img src="${pageContext.request.contextPath}/idx/spacer.html" height="0" border="0" width="0">
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
</body>
</html>