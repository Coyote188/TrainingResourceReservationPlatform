<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8"/>
<title>MediaViewer</title>
<link href="${pageContext.request.contextPath}/idx/style.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/idx/common.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/css/button.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.js" type="text/javascript"></script>
<script type="text/javascript">
$.extend({
	fnGetArgs: function(name){
		var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
		var r = window.location.search.substr(1).match(reg);
		if(r!=null)
			return unescape(r[2]);
		return null;
	},
	pageInit: function(){
		$("#divDocReader").hide();
		$("#divVideoPlayer").hide();
		var fileLoad = new Object();
    	fileLoad.fileId = $.fnGetArgs("file");
		var json = JSON.stringify(fileLoad);
		var url = "${pageContext.request.contextPath}/publicJson/loadAFile";
		var req = "&data=" + json;
    	$.post(url,req,function(resp, status){
			var data = jQuery.parseJSON(resp);
			data = jQuery.parseJSON(data.output);
			if(data.result == '1'){
				var file = data.data.file;
				var knowlage = data.data.knowlage;
				
				$("#h2Title").html(knowlage.knowlageName);
				$("#aResourceOwner").html(knowlage.owner);
				$("#dvFavorate").click(function(){
					$.fnFavorate(knowlage.id);
				});
				$("#tmUploadTime").html(knowlage.upload_date);
				$("#divKnowlageDesc").append(knowlage.knowlageDesc);
				if(file.type == 'TXT'){
					$("#divDocReader").show();
					$("#frmDocViewer").attr('src','${pageContext.request.contextPath}' + file.addr);
				}else if(file.type == 'MOV'){
					$("#divVideoPlayer").show();
					var filePath = '${pageContext.request.contextPath}' + file.addr;
					var fileEx = file.extension;
					$.fnVideoPlay(filePath,filePath + '->' + fileEx);
				}
				
			}
    	});
	},
	fnVideoPlay: function(video_file,video_html5){
		var flashvars={
				f: video_file,
				c:0,
				p:2,
				i:'${pageContext.request.contextPath}/js/video-js/screen_post.png'
				};
			var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
			var video=[video_html5];
			CKobject.embed('${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.swf','divVideoPlayer','ckplayer_a1','100%','100%',false,flashvars,video,params);
	},
	fnFavorate: function(knowlage){
		var request = new Object();
		request.knowlage = knowlage ;
		var json = JSON.stringify(request);
		var url = "${pageContext.request.contextPath}/favorateJson/favorate";
		var req = "&data=" + json;
    	$.post(url,req,function(data, status){
    		var res = jQuery.parseJSON(data.output);
			cu.toast(res.msg);
    	});
	}
});
$(function(){
	$.pageInit();
});
</script>
</head>
<body>
<div class="wrap_z">
	<div id="header_z">
		<iframe name="foundercms" src="${pageContext.request.contextPath}/idx/top.jsp" frameborder="0" width="950" height="170" scrolling="no"></iframe>
	</div>
	<div style="color:#428bca; margin-left: 10px; height: 100%;">
		<div style="margin-top: 15px;">
			<h2 id="h2Title">
				The Big Bang Theory - Best of Amy & Sheldon
			</h2>
		</div>
		<!-- 视频区 -->
		<div style="width: 100%; height: 500px;" align="center" id="divVideoPlayer">
		</div>
		<!-- 文档 区 -->
		<div style="width: 100%; height: 600px; overflow: hidden; background-color: #fff;" align="center" id="divDocReader">
			<iframe src="" id="frmDocViewer" width="100%" height="100%"></iframe>
		</div>
		<!-- 操作功能区  -->
		<div style=" margin-top: 15px; height: 50px; line-height: 50px;">
			<div style="width: 150px;float: left;">
				<label>上传者：</label>
				<a id="aResourceOwner"></a>
			</div>
			<div style="width: 150px;float: left;">
				<label>上传时间：</label>
				<time id="tmUploadTime"></time>
			</div>
		</div>
		<!-- 介绍 -->
		<div id="divKnowlageDesc">
			<p>
			</p>
		</div>
	</div>
	<div class="footer_z cl_z" style="margin-top: 10px; border-top: 1px solid #c6c7c2;">
		<iframe name="foundercms" src="${pageContext.request.contextPath}/idx/bottom.jsp" frameborder="0" width="950" height="100" scrolling="no"></iframe>
	</div>
</div>
</body>
</html>