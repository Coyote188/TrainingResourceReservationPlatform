<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
</div>
<style>
<!--
._ul_favorate{border-bottom: 1px solid #c6c7c2;border: 1px solid #c6c7c2; margin-top:2px; border-radius:5px; color:#428bca; margin-right:7px; padding-left:5px;}
#ulFavorateList li:hover{color:red; cursor:pointer;}
-->
</style>
<div id="cu_org" class="nav-left-org" style="height: 100%; border-right: 5px solid #dbeaf9;">
	<h4 class="ui-widget-header _ui-corner-top area_title" style="margin-top:1px;">
		<img alt="" src="${pageContext.request.contextPath}/images/folder_favorites.png" width="15px" height="15px">
		收藏列表
	</h4>
	<div id="tree-org" class="_ui-widget-content" style="margin-top:5px;">
		<ul id="ulFavorateList">
		</ul>
	</div>
</div>
<div id="cu-org-content">
	<div style="text-align: center; font-size: 50px; line-height: 400px;">
		<img alt="" src="${pageContext.request.contextPath}/images/folder_favorites.png">
		收藏夹
	</div>
</div>
<script type="text/javascript">
var cacheObject = new Object();
$.extend({
	favorateListInit: function(){
		$.post("favorateJson/favorateList",null,function(json){
			var res = jQuery.parseJSON(json.output);
			if(res.result =="1"){
				favorateList = res.data;
				if (null != favorateList){
					$.each(favorateList, function(idx, favorate){
						var favorateFile = favorate.favorate_source_name;
						var htmlFavorateItem = '<li class="_ul_favorate" onclick="$.onFilePlay(\''+favorate.favorate_source_id+'\');">' + favorateFile + '</li>';
						$("#ulFavorateList").append(htmlFavorateItem);
						
					});
				}
			}
			else
				cu.toast(res.msg);	
		});
	},
	onFilePlay: function(fileId){
		$("#cu-org-content").load("favorate/favoratePlayer?file="+fileId,function(){
			cacheObject.fileId = fileId;
			$.pageInit(fileId);
		});
	}
});
$(function(){
	$.favorateListInit();
});
</script>