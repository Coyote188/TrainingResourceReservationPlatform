<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XXX部队-模拟仿真训练平台</title>
<style>
<!--
.leftnav {
	float: left;
	width: 580px;
	overflow: hidden;
}

.leftnav a {
	float: left;
	display: inline;
}

a {
	cursor: pointer;
}

#cndata {
	width: auto;
}
table.cu-table {
	color: #333;
}

table.cu-table th {
	border: 1px solid #AED0EA;
	color: #2779AA;
	font-size: 1em;
	padding: 6px 10px;
	text-align: center;
	background: #E5F0F8;
	padding: 4px;
}

table.cu-table td {
	border: 1px solid #AED0EA;
	color: #333;
	font-size: 1em;
	padding: 6px 10px;
	text-align: center;
	background: #fff;
	padding: 4px;
}
-->
</style>
	<link href="idx/style.css" rel="stylesheet" type="text/css">
	<link href="idx/common.css" rel="stylesheet" type="text/css">
	<link href="idx/css.css" rel="stylesheet" type="text/css">
	<script src="idx/jquery.js" language="javascript" type="text/javascript"></script>
	<script language="javascript">
		$(document).ready(function() {
			$("#tab13Page li").mouseover(function() {
				for (var i = 0; i < $("#tab13Page  li").length; i++) {
					$("#tab13Page  li")[i].className = "cimg";
				}
				$(this).removeClass("cimg").addClass('oimg');
			})
			$("#tab13Page  li").mouseout(function() {
			});
			$("#tab13Page  li:eq(0)").removeClass("cimg").addClass('oimg'); // 初始化
	
			if ($("#scrollDiv1 ul:first li").length > 1) {
				setInterval('AutoScroll("#scrollDiv1")', 3000);
			}
	
			if ($("#scrollDiv2 ul:first li").length > 1) {
				setInterval('AutoScroll("#scrollDiv2")', 3000);
			}
	
			if ($("#scrollDiv3 ul:first li").length > 1) {
				setInterval('AutoScroll("#scrollDiv3")', 3000);
			}
	
			if ($("#scrollDiv4 ul:first li").length > 1) {
				setInterval('AutoScroll("#scrollDiv4")', 3000);
			}
	
			if ($("#scrollDiv5 ul:first li").length > 1) {
				setInterval('AutoScroll("#scrollDiv5")', 3000);
			}
			{
				$.searchKnowlage('yx', 'basicKnowlageView','basic');
				$.searchKnowlage('dbdt', 'zbzsView','zbzs');
				$.searchKnowlage('wxtc', 'zbxxView','zbzs');
				$.searchKnowlage('all', 'ulMovies','zbzs');
				$.fnTopNavMain();
				$.fnGetHotResource();
			}
			
		});
		function AutoScroll(obj) {
			$(obj).find("ul:first").animate({
				marginTop : "-30px"
			}, 1000, function() {
				$(this).css({
					marginTop : "0px"
				}).find("li:first").appendTo(this);
			});
		}
		$.extend({
			searchKnowlage: function(knowlage, view, itemtype){
				var fileMgr = new Object();
				fileMgr.knowlage = knowlage;
				fileMgr.fileType = 'all';
				fileMgr.viewer = 'all';
				var json = JSON.stringify(fileMgr);
				var req = "&data=" + json;
				$.post("publicJson/fileList",req,function(data, status){
					var res = jQuery.parseJSON(data);
					res = jQuery.parseJSON(res.output);
					if(res.result =="1"){
						$("#" + view).empty();
						$.each(res.data,function(index, line){
							var html = null;
							if(itemtype == 'basic')
								html = '<li><a onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')" target="_blank">' + line[9] + '</a></li>';
							if(itemtype == 'zbzs')
								html = '<li><a onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')" target="_blank"><img src="js/video-js/video_list_ico.png" border="0" style="float: left;"><span>' + line[9] + '</span></a></li>';
							
							$("#" + view).append(html);
							if(index > 5)
								return false;
						});
					}
				},"html").error(function() { alert("系统故障"); });
			},
			fnSearchExamNearby: function(){
				var fileMgr = new Object();
				fileMgr.knowlage = knowlage;
				fileMgr.fileType = 'all';
				fileMgr.viewer = 'all';
				var json = JSON.stringify(fileMgr);
				var req = "&data=" + json;
				$.post("publicJson/fileList",req,function(data, status){
					var res = jQuery.parseJSON(data);
					res = jQuery.parseJSON(res.output);
					if(res.result =="1"){
						$("#" + view).empty();
						$.each(res.data,function(index, line){
							var html = '<li><a onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')" target="_blank"><img src="js/video-js/video_list_ico.png" border="0" style="float: left;"><span>' + line[9] + '</span></a></li>';
							
							$("#" + view).append(html);
						});
					}
				},"html").error(function() { alert("系统故障"); });
			},
			fnGetHotResource: function(){
				$.post("publicJson/hotResource",null,function(data, status){
					var res = jQuery.parseJSON(data);
					res = jQuery.parseJSON(res.output);
					if(res.result =="1"){
						$("#ulHotResource").empty();
						$.each(res.data,function(index, line){
							var html = '<li><a onclick="$.openFile(\'' + line[0] + '\',\'' + line[2] + '\')" target="_blank"><img src="js/video-js/video_list_ico.png" border="0" style="float: left;"><span>' + line[1] + '</span></a></li>';
							$("#ulHotResource").append(html);
						});
					}
				},"html").error(function() { alert("系统故障"); });
			},
			openFile: function(fileId, fileType){
				window.open("public/docViewer?file=" + fileId);
			},
			fnTopNavMain: function() {
		       $("#dvMainContentSrh").hide();
		       $("#dvMainContent").show();
		    },
			fnTopNav: function(kl, file){
				$("#dvMainContent").hide();
				$("#dvMainContentSrh").show();
				var knowlage = kl;
				var fileType =  file;
				var viewer = "all";
				var fileMgr = new Object();
				fileMgr.knowlage = knowlage;
				fileMgr.fileType = fileType;
				fileMgr.viewer = viewer;
				var json = JSON.stringify(fileMgr);
				var req = "&data=" + json;
				$.post("publicJson/fileList",req,function(data, status){
					var res = jQuery.parseJSON(data);
					res = jQuery.parseJSON(res.output);
					if(res.result =="1"){
						$("#tblQuesList").empty();
						$.each(res.data,function(index, line){
							var tr = '';
							tr += '<tr>';
							tr += '<th>' + (index + 1) + '</td>';
							tr += '<td>' + line[2] + '</td>';
							tr += '<td>' + line[1] + '</td >';
							tr += '<td>' + line[8] + '</td >';
							tr += '<td><input type="button" class="button red" style="width:60px; margin: 5px 0 5px 0" value="阅读" onclick="$.openFile(\'' + line[5] + '\',\'' + line[10] + '\')"></td>';
							tr += '</tr>';
							$("#tblQuesList").append(tr);
							index ++;
						});
					}
				},"html").error(function() { alert("系统故障,大叫一声"); });
			}
		});
	</script>
	<meta name="filetype" content="1">
	<meta name="publishedtype" content="1">
	<meta name="pagetype" content="2">
	<meta name="catalogs" content="S21_41888">
</head>
<body>
	<div class="wrap_z">
		<div class="subnav">
			<div class="leftnav">
				<span id="cndata" style="float: left;">2015年9月5日 星期六</span> 
			</div>
			<div style="float: right; width: 180px; text-align: right; margin-right: 10px;">
				<a href="login" target="_blank" style="margin: 1px 0 1px 10px;">登录</a>
			</div>
		</div>
		<div class="top"></div>
		<div class="nav">
			<div class="mnue">
				<a onclick="$.fnTopNavMain()" target="_blank">首页</a>
				<em>|</em> 
				<!-- <a href="../subsys/simulation.jsp" target="_blank">模拟仿真</a>
				<em>|</em> -->
				<a onclick="$.fnTopNav('wx|yx','all');" target="_blank">基础知识</a>
				<em>|</em>
				<a onclick="$.fnTopNav('cdbdt|dbdt|dzj|wxtc|ypzj','all');" target="_blank">装备知识</a>
				<em>|</em>
				<a onclick="$.fnTopNav('all','MOV');" target="_blank">视频</a>
				<!-- <em>|</em>
				<a onclick="$.fnTopNav('all','MAV');" target="_blank">音频</a> -->
				<em>|</em>
				<!-- <a onclick="$.fnTopNav('wx','all');" target="_blank">图片</a>
				<em>|</em> -->
				<a onclick="$.fnTopNav('all','TXT');" target="_blank">图文</a>
			</div>
			<div class="search">
				<div class="search_bot">
					<script src="idx/search.js"></script>
					<form name="searchform" action="/search" method="post" target="_blank">
						<input type="text" style="width: 150px;" name="s_keyword"> 
						<span> 
							<a href="#" onclick="chn_search()">
								<img src="idx/imgs/an3.gif" align="absmiddle">
							</a>
						</span>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap_z" id="dvMainContent">
		<div class="gfLeft_z fl_z">
			<div class="topnews">
				<h1>
					<a style="text-align: center; width: 100%; line-height: 38px;">模拟仿真器</a>
				</h1>
			</div>
			<div class="fl_z gfLeft_L_z">
				<div class="ywbd_z mt13_z ">
					<div class="video_body_z">
						<div class="vb_oz vb2_oz">
							<h2>
								<span>
									<img src="js/video-js/video_ico.png" border="0">
								</span>
							</h2>
							<ul>
								<li>
									<span></span>
								</li>
								<li>
									<font color="blue" size="5">资源推荐</font>
								</li>
							</ul>
						</div>
						<ul class="vb_sz" id="ulMovies">
							
						</ul>
					</div>
				</div>
				<div class="jsls_z mt13_z">
					<h2>
						<a onclick="$.fnTopNav('wx|yx','all');" class="more1_z" target="_blank">&gt;更多</a>
						<span>基础知识</span>
					</h2>
					<h3>
						<a onclick="$.searchKnowlage('yx', 'basicKnowlageView','basic')" target="_blank" >有线</a>
						<em>|</em>
						<a onclick="$.searchKnowlage('wx', 'basicKnowlageView','basic')" target="_blank">无线</a>
					</h3>
					<div class="video_body_z" >
						<ul class="vb_sz" id="basicKnowlageView">
						
						</ul>
					</div>
				</div>
			</div>
			<div class="fr_z gfLeft_R_z">
				<div class="zgbhf_z quanwei_z">
					<dl class="glRTitle_z">
						<dd class="glRT_pic_z fl_z">
							<img src="idx/imgs/pic0.jpg" alt="">
						</dd>
						<dt class="glRTC_z fl_z">
							<a onclick="$.fnTopNav('dbdt|cdbdt|ypzj','all');" class="more2_z" target="_blank">&gt;&gt;更多</a>
							<span>装备知识</span>
						</dt>
						<dd class="glRTS_z fl_z">
							<a onclick="$.searchKnowlage('dbdt', 'zbzsView','zbzs')" target="_blank">短波电台</a>
							<em>|</em>
							<a onclick="$.searchKnowlage('cdbdt', 'zbzsView','zbzs')" target="_blank">超短波电台</a>
							<em>|</em>
							<a onclick="$.searchKnowlage('ypzj', 'zbzsView','zbzs')" target="_blank">异频转接器</a>
						</dd>
					</dl>
					<!--begin 438865-41892-1-->
					<ul class="gfL_newsList2_z" id="zbzsView">
					</ul>
				</div>
				<div class="zgbhf_z jiefang_z">
					<dl class="glRTitle_z">
						<dd class="glRT_pic_z fl_z">
							<img src="idx/imgs//picj.jpg" alt="">
						</dd>
						<dt class="glRTC_z fl_z">
							<a onclick="$.fnTopNav('wxtc|dzj|satellite','all');" class="more2_z" target="_blank">&gt;&gt;更多</a>
							<span>装备信息</span>
						</dt>
						<dd class="glRTS_z fl_z">
							<a onclick="$.searchKnowlage('wxtc', 'zbxxView','zbzs')" target="_blank">无线图传</a>
							<em>|</em>
							<a onclick="$.searchKnowlage('dzj', 'zbxxView','zbzs')" target="_blank">动中通</a>
							<em>|</em>
							<a onclick="$.searchKnowlage('satellite', 'zbxxView','zbzs')" target="_blank">卫星</a>
						</dd>
					</dl>
					<!--begin 438866-41893-1-->
					<ul class="gfL_newsList2_z" id="zbxxView">
						
					</ul>
					<!--end 438866-41893-1-->
				</div>
			</div>
		</div>
		<div class="gfRight_z fr_z">
			<div class="gfRight_top_z"></div>
			<div class="gfRight_center_z">
				<!-- <div class="jwzb_z">
					<h2 class="rTBg01_z">
						<a href="#" class="more1_z" target="_blank">&gt;更多</a>
						<span>近期考试安排</span>
					</h2>
					<ul class="gfR_newsList_z">
						<li><font color="#AA7700" size="2">本周五考试，详情请点击...</font></li>
					</ul>
					end 438876-30219-1
				</div> -->
				<div class="fwgc_z mt10_z">
					<h2 class="rTBg01_z">
						<span>热门资源</span>
					</h2>
					<ul class="gfR_newsList_z" id="ulHotResource">
					</ul>
				</div>
				<div class="mtsd_z mt10_z">
					<h2 class="rTBg02_z">
						<a href="#" class="more1_z" target="_blank">&gt;更多</a>
						<span>专业竞赛排名</span>
					</h2>
					<ul class="gfR_newsList_z">
						<li><a href="#" target="_blank">第一名 ****</a></li>
					</ul>
					<!--end 438879-41904-1-->
				</div>
			</div>
			<div class="gfRight_bottom_z"></div>
		</div>
		<div class="footer_z cl_z">
			<iframe name="foundercms" src="idx/bottom.jsp" frameborder="0" width="950" height="100" scrolling="no"></iframe>
		</div>
	</div>
	<div class="wrap_z" id="dvMainContentSrh">
		<table class="cu-table" style="width: 100%;" cellpadding="0" cellspacing="0" >
		<thead>
			<tr>
				<th width="2%"></th>
				<th width="50%">内容摘要</th>
				<th width="10%">分类</th>
				<th width="10%">创建日期</th>
				<th width="5%">查看</th>
			</tr>
		</thead>
		<tbody id="tblQuesList">
		</tbody>
	</table>
	</div>
</body>
</html>