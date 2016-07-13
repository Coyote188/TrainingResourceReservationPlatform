/**
 * 左菜单缩进条
 * @param tag1
 * @param tag2
 */
function leftMenuResize(tag1, tag2) {
	var h = $(window).height();
	h = $(window).height() - $(".wrap-footer").height() - $(".header").height()-13;
	$(tag1).css({"height" : h + "px"});
	$(tag2).css({"margin-top" : (h - 50) / 2 + "px"});
	$("#cu-content").css({"height" : h + "px"});
	$(tag1).mouseover(function() {
		$(this).addClass("active");
	}).mouseout(function() {
		$(this).removeClass("active");
	});
	$(tag1).click(function() {
		var dis = $("#cu_nav").css("display");
		if (dis == 'none') {
			$("#cu_nav").css({
				"display" : "block"
			});
			$(tag2).removeClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "198px"
			});
		} else {
			$("#cu_nav").css({
				"display" : "none"
			});
			$(tag2).addClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "9px"
			});
		}
		contentAutoGrid();
	});
	$(window).resize(function(){
		var h = $(window).height();
		h = $(window).height() - $(".wrap-footer").height() - $(".header").height()-13;
		$(tag1).css({"height" : h + "px"});
		$(tag2).css({"margin-top" : (h - 50) / 2 + "px"});
		$("#cu-content").css({"height" : h + "px"});
	});
}

function contentAutoGrid() {
	var gridList = $(".jq-grid");
	if(typeof(gridList) !== 'undefined') {
		var jqGridW = $("#cu-content").width()-10;
		$("#cu-content").css({"overflow":"hidden"});
		gridList.setGridWidth(jqGridW);
	}
	var jqGridLo = $(".jq-grid-lo");
	if(typeof(jqGridLo) !== 'undefined') {
		var jqGridW = $("#cu-org-content").width()-10;
		$("#cu-org-content").css({"overflow":"hidden"});
		jqGridLo.setGridWidth(jqGridW);
	}
}


/**
 * 监听左菜单点击事件
 * @returns
 */
function treeMenuLinkListener() {
	$("#tree-menu a").on('click',function() {
		var uri = $(this).attr("href");
		$("#tree-menu a").each(function(e) {
			$(this).removeClass("active");
		});
		$(this).addClass("active");
		
		if(trim(uri) != '' && trim(uri) != '#') {
			loadUri("#cu-content",uri);
		}
		if(trim(uri) == '#'){
	//	alert("暂无内容");
			BootstrapDialogUtil.confirmDialog("暂无内容", null);
		}
		return false;
	});
}
function treeMenuLinkListenerV2() {
	$("#ul_menu a").on('click',function() {
		var uri = $(this).attr("href");
		$("#ul_menu a").each(function(e) {
			$(this).removeClass("active");
		});
		$(this).addClass("active");
		if(trim(uri) != '') {
			loadUri("#cu-content",uri);
		}
		return false;
	});
}

/**
 * 加载到当前页面
 * @param uri
 */
function loadLocation(uri) {
	loadUri("#cu-content",uri);
}

/**
 * 
 * @param uri
 */
function loadUri(id,uri) {
	waitLoading("数据加载中...");
	$.get("islogin",function(data){
		var output = $.parseJSON(data.output);
		if(output.result=='1') {
			$(id).load(uri, function() {
				var gridList = $(".jq-grid");
				if(typeof(gridList) !== 'undefined') {
					//grid高宽自适应
					cu.layout.gridAuto();
					contentAutoGrid();
				}
				cu.layout.formActive();
				cu.layout.listBtnListener();
				cu.layout.formRequire();
				colseWaitLoading();
			});
		} else {
			location.reload();
		}
	});
}