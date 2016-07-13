<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<link href="/static/css/example.css" rel="stylesheet" type="text/css">
<style type="text/css">
#a1 {
	height: 400px;
	width: 600px;
}
#nowTime {
	line-height: 35px;
	background-color: #EBEBEB;
	height: 35px;
}
</style>
</head>
<body>
<div id="a1"></div>
<div id="nowTime">观看时间：0</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.js"></script>
<script type="text/javascript">
$.extend({
	FnPlay: function(video_file,video_html5){
		var flashvars={
				f:'${pageContext.request.contextPath}/video/' + video_file,
				c:0,
				p:2,
				i:'${pageContext.request.contextPath}/js/video-js/screen_post.png'
				};
			var params={bgcolor:'#FFF',allowFullScreen:true,allowScriptAccess:'always',wmode:'transparent'};
			var video=['${pageContext.request.contextPath}/video/' + video_html5];
			CKobject.embed('${pageContext.request.contextPath}/js/ckplayer/ckplayer/ckplayer.swf','a1','ckplayer_a1','100%','100%',false,flashvars,video,params);
	}
});
$(function(){
	$.FnPlay('demo1.mp4','demo1.mp4->video/mp4');
})
</script>
<div class="content">
</div>
</body>
</html>