<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script type="text/javascript">
$.extend({
	pageInit: function(){
		$("#divDocReader").hide();
		$("#divVideoPlayer").hide();
		var fileLoad = new Object();
    	fileLoad.fileId = cacheObject.fileId ;
		var json = JSON.stringify(fileLoad);
		var url = "${pageContext.request.contextPath}/publicJson/loadAFile";
		var req = "&data=" + json;
    	$.post(url,req,function(data, status){
			var res = jQuery.parseJSON(data);
			var data = jQuery.parseJSON(res.output);
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
				
				//在这里加记录---学习记录
				if(typeof(userCache.timerInterval_learning) != "undefined"){
					clearInterval(userCache.timerInterval_learning);
				}
				console.log(userCache.timerInterval_learning);
				var timerInterval = setInterval(function(){
					console.log("learning recorder ! [" + knowlage.id + "]");
					var request = new Object();
					request.knowlage = knowlage.id ;
					var json = JSON.stringify(request);
					var url = "${pageContext.request.contextPath}/favorateJson/learningRec";
					var req = "&data=" + json;
			    	$.post(url,req);
				},1000*60);
				userCache.timerInterval_learning = timerInterval;
				if(file.type == 'TXT'){
					$("#sectionResourceList").hide();
					$("#divDocReader").show();
					$("#frmDocViewer").attr('src','${pageContext.request.contextPath}' + file.addr);
				}else if(file.type == 'MOV'){
					$("#sectionResourceList").hide();
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
	},
	fnLearningRec: function(knowlage){
		console.log("learning recorder ! [" + knowlage + "]");
		var request = new Object();
		request.knowlage = knowlage ;
		var json = JSON.stringify(request);
		var url = "${pageContext.request.contextPath}/favorateJson/learningRec";
		var req = "&data=" + json;
    	$.post(url,req);
	}
});
$(function(){
	$.pageInit();
});
</script>
<div style="margin-left: 10px; height: 100%; overflow-y: scroll;">
	<div style="margin-top: 15px;">
		<h2 id="h2Title">
			The Big Bang Theory - Best of Amy & Sheldon
		</h2>
	</div>
	<!-- 视频区 -->
	<div style="width: 100%; height: 60%;" align="center" id="divVideoPlayer">
	</div>
	<!-- 文档 区 -->
	<div style="width: 100%;" align="center" id="divDocReader">
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
		<div style="border-radius:5px; background-color: #FFDEAD; width: 100px; height:30px; line-height:30px; float: right; border:1px solid #c6c7c2;" id="dvFavorate">
			<img style="float: left;" alt="" src="js/video-js/faverate.png">
			<span style="float: left;">收藏</span>
			<span style="float: left; color: #B0C4DE; margin-left: 10px; margin-right: 5px;">-</span>
		</div>
	</div>
	<!-- 介绍 -->
	<div id="divKnowlageDesc">
		<p>
		</p>
	</div>
</div>