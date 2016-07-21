<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7 ]> <html lang="zh" class="ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="zh" class="ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="zh" class="ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="zh" class="ie9"> <![endif]-->
<!--[if !IE]><!-->
<html lang="zh">
<!--<![endif]-->
<head>
<script type="text/javascript" src="jquery-1.js"></script>
<link rel="stylesheet" type="text/css" href="global.css"></link>
<link rel="stylesheet" href="logo/slider.css"></link>
<link rel="stylesheet" href="logo/reset.css"></link>
<script src="logo/touch.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$.fnQuerySlider();
});
var $pageInfo = {
	publishmentSystemID : 1,
	channelID : 44,
	contentID : 0,
	siteUrl : "",
	homeUrl : "/center",
	currentUrl : "http://new.yicjx.com/channels/44.html",
	rootUrl : "http://new.yicjx.com"
}
$.extend({
	fnQuerySlider: function(){
		$.ajax({
			url:'${pageContext.request.contextPath}/portals_json/slider',
			dataType:'json',
			type:"post",
			success: function(doc) {
				$($.parseJSON(eval(doc).output).data).each(function() {
					var liImg = "";
					liImg += '<li style="width: 999px;">';
					liImg += '<a href="" target="_blank">';
					liImg += '<img src="${pageContext.request.contextPath}' + $(this).attr("imgUri") + '">';
					liImg += '</a>';
					liImg += '</li>';
					$("#carouselPics").append(liImg);
					$("#carouselBtns").append('<li class=""></li>');
				});
				jQuery.getScript("logo/slider.js");
			}
		});
	}
});
</script>
</head>
<body id="container" onload="">
<!-- slider -->
<section style="overflow: hidden;" class="ap oh carouselBox" id="carouselBox" >
	<ul style="width: 500%; position: relative; left: -3587px;" class="oh ab carouselPics" id="carouselPics">
	</ul>
	<ul class="ab tc carouselBtns" id="carouselBtns">
	</ul>
	<div class="ab carouselBtnsBg"></div>
</section>
<!--carouselBox end-->
<!-- slider JS -->
</body>
</html>