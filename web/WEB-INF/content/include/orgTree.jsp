<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		var datas = '${output}';
		var datas = $.parseJSON(datas);
		if (datas.result == '1') {
			buildObjTree("#tree-org", datas.data, '0');
		}
		$("#cu-content").css({"overflow":"hidden"});
		var h = $("#cu-content").height();
		$("#cu-org-content").css({"height" : h + "px"});
		$("#tree-org").css({"height" : (h-40) + "px"});
		
		$(window).resize(function(){
		   h = $("#cu-content").height();
		   $("#cu-org-content").css({"height" : h + "px"});
		   $("#tree-org").css({"height" : (h-40) + "px"});
		});
	});
</script>
	<div id="cu_org" class="nav-left-org">
	    <h4 class="ui-widget-header ui-corner-top area_title">组织机构 
	    	<span style="float: right; margin-right: 10px;cursor: auto;"><input id="totCheck" type="checkbox" style="margin-bottom: 10px;"  value="1">&nbsp;<label for="totCheck">汇总查询</label></span>
	    </h4>
		<div id="tree-org" class="ui-widget-content"></div>
	</div>
	<div id="cu-org-content">