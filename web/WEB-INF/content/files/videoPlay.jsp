<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>MediaViewer</title>
<link href="${pageContext.request.contextPath}/idx/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/idx/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/button.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
$.extend({
	getUrlParam: function(name){
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
		var r = window.location.search.substr(1).match(reg); //匹配目标参数
		if (r != null)
			return unescape(r[2]);
		return null; //返回参数值
	},
	pageInit: function(){
		var fileId = $.getUrlParam("file");
		var reqData = "&file="+fileId;
		var fileData = null;
		$.post("../publicJson/loadAFile",reqData,function(json){
			var res = jQuery.parseJSON(json.output);
			if(res.result =="1"){
				fileData = res.data;
				if (null != fileData){
					var addr = "${pageContext.request.contextPath}" + fileData.addr + fileData.name;
					var video = '<video id="video_player" src="' + addr + '" type="video/mp4" class="video-js vjs-default-skin" controls preload="none" width="100%" height="400" poster="${pageContext.request.contextPath}/js/video-js/screen_post.png" data-setup="{}"></video>';
					$("#divVideoPlayer").html(video);
				}
			}
			else
				cu.toast(res.msg);	
		});
	},
	FnPlay: function(video_file,video_html5){
		var flashvars={
				f:'${pageContext.request.contextPath}/video/' + video_file,
				c:0,
				p:2,
				i:'${pageContext.request.contextPath}/js/video-js/screen_post.png'
				};
			var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
			var video=['${pageContext.request.contextPath}/video/' + video_html5];
			CKobject.embed('${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.swf','divVideoPlayer','ckplayer_a1','100%','100%',false,flashvars,video,params);
	}
});
</script>
</head>
<body onload="$.FnPlay('demo1.mp4','demo1.mp4->video/mp4');">
<div class="wrap_z">
	<div id="header_z">
		<iframe name="foundercms" src="${pageContext.request.contextPath}/idx/top.jsp" frameborder="0" width="950" height="170" scrolling="no"></iframe>
	</div>
	<div id="content_nav_bar">
		<ul>
			<li>基础知识>视频教学</li>
		</ul>
	</div>
	<!-- 视频区 -->
	<div style="width: 100%; height: 500px;" align="center" id="divVideoPlayer">
		
	</div>
	<!-- 操作功能区  -->
	<div style="margin-top: 15px;">
		<h2>
			The Big Bang Theory - Best of Amy & Sheldon
		</h2>
		<table style="border-left: 1px solid #c6c7c2; padding-left: 10px;margin-left: 2px;">
			<tbody>
				<tr>
					<td rowspan="2">
						<img src="${pageContext.request.contextPath}/idx/imgs//picj.jpg" alt="">
					</td>
					<td>
						<a>教员：李雷</a>
					</td>
				</tr>
				<tr>
					<td style="border:1px solid #c6c7c2; border-radius:5px; background-color: #FFDEAD;">
						<img style="float: left;" alt="" src="${pageContext.request.contextPath}/js/video-js/faverate.png">
						<span style="float: left;">收藏</span>
						<span style="float: left; color: #B0C4DE; margin-left: 10px; margin-right: 5px;">612</span>
					</td>
					<td>
						<span style="border:1px solid #c6c7c2; border-radius:5px; background-color: #B0E0E6; margin-left: 3px; padding: 6px 10px 5px 10px;">
							留言
						</span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- 介绍区  -->
	<div>
	<table>
		<tbody>
			<tr>
				<td>
					2015年9月10日发布
				</td>
			</tr>
			<tr/>
			<tr>
				<td>
					The Big Bang Theory - Best of Stuart from the Comic Store
				</td>
			</tr>
			<tr>
				<td>
					Seasons 2-8
				</td>
			</tr>
			<tr/>
			<tr>
				<td>
					I do not own any rights, this is fan made as a tribute to one of the funniest shows on TV.
				</td>
			</tr>
		</tbody>
	</table>
	</div>
	<!-- 评论区  -->
	<div style="border:1px solid #c6c7c2;">
		<!-- 评论 -->
		<div style="width: 100%; margin: 10px 0 0 5px;">
			<img style="float: left;" src="${pageContext.request.contextPath}/idx/imgs//picj.jpg" alt="">
			<textarea rows="5" cols="90" style="margin-left:10px; border-radius:5px; width: 90%;"></textarea>
			<input type="button" class="button gray" style="margin-left: 80%; margin-top: 10px;" value="取消">
			<input type="button" class="button blue" style="margin-left: 10px; margin-top: 10px;" value="发布">
		</div>
		<span style="width: 100%; margin: 10px 0 0 5px;">所有评论</span>
		<!-- 历史评论 -->
		<div style="width: 100%; margin: 10px 0 0 5px;">
		
		</div>
	</div>
	
</div>

</body>
</html>