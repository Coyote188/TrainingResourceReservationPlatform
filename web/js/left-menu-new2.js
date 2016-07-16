/**
 * 
 */
$(document).ready(function(){
	initMenuHeight();
	//hideMenu();
	$(".menu-resizer-toggler ").click(function() {
		var dis = $("#menu-nav").css("display");
		if (dis == 'none') {
			$("#menu-nav").css({
				"display" : "block"
			});
			$(this).removeClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "212px"
			});
		} else {
			$("#menu-nav").css({
				"display" : "none"
			});
			$(this).addClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "9px"
			});
		}
		autoJqGridWidth();
	});
	
	$(".menu-head-show").click(function() {
		var dis = $("#menu-nav").css("display");
		if (dis == 'none') {
			$("#menu-nav,.menu-resizer").css({
				"display" : "block"
			});
			$(this).removeClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "212px"
			});
		} else {
			$("#menu-nav,.menu-resizer").css({
				"display" : "none"
			});
			$(this).addClass("zoom-left");
			$("#cu-content").css({
				"margin-left" : "0px"
			});
		}
		autoJqGridWidth();
	});
	
	$(window).resize(function(){
		initMenuHeight();
	});
	menuTreeListener();
});

function hideMenu(){
	$("#menu-nav,.menu-resizer").css({
		"display" : "none"
	});

	$(".menu-resizer-toggler").addClass("zoom-left");
	$("#cu-content").css({
		"margin-left" : "0px"
	});
}

/**
 * 初始化菜单高度
 */
function initMenuHeight() {
	var h = $(document).height();
	
	var nh = $("#header-ui-div").outerHeight(true);
	var vh = $(".header-body-dividing").outerHeight(true);
	h = h - $(".wrap-footer").outerHeight(true)-nh;
	//h = h - $(".wrap-footer").outerHeight(true) - $(".header").outerHeight(true)-vh;
	
	var h = $(window).height();
	h = $(window).height() - $(".wrap-footer").height() - $(".header").height()-20;
	
	$(".menu-resizer").css({"height" : h + "px"});
	$(".menu-resizer-toggler").css({"margin-top" : (h-50)/2+ "px"});
	$("#cu-content").css({"height" : (h-20) + "px"});
	$("#menu-sub-nav").css({"height" : (h-$(".menu-title").outerHeight(true)) + "px"});
}

/**
 * 自动调整jqGrid插件的宽度
 */
function autoJqGridWidth() {
	$("#cu-content .cnoj-jq-grid").each(function(){
		$(this).setGridWidth($("#cu-content").width()-20);
	});
}
function mIsEmpty(value, allowEmptyString) {
    return (value === null) || (value === undefined)
            || (!allowEmptyString ? value === '' : false)
            || ($.isArray(value) && value.length === 0);
}
/**
 * 获取class中含有containValue指定字符串的class
 * @param value
 * @param containValue
 * @returns {String}
 */
function getClassContain(value,containValue) {
	var className = null;
	if(!mIsEmpty(value)) {
		var values = value.split(" ");
		if(values.length>0) {
			for ( var i = 0; i < values.length; i++) {
				if(isContain(values[i], containValue)) {
					className = trim(values[i]);
					break;
				}
			}
		}
	}
	return className;
}
/**
 * 监听左菜单点击事件
 * @returns
 */
function menuTreeListener() {
	$("#menu-sub-nav a").on('click',function(){
		
		
		var $this = $(this);
		var $parent = $this.parent();
		var classNames = $this.attr("class");
		$("#menu-sub-nav .active").removeClass("active");
		

		if(!mIsEmpty(classNames) && (mIsEmpty($parent.attr("class")) || 
				!isContain($parent.attr("class"), "no-parent"))){
				if(isContain(classNames, "expand")) {
					var $uiIcon = $this.find(".ui-icon");
					$uiIcon.removeClass("ui-icon-triangle-1-s");
					$uiIcon.addClass("ui-icon-triangle-1-e");
					$parent.find("ul:first").slideUp("normal",function(){
						$this.removeClass("expand");
						$this.addClass("shrink");
						$parent.removeClass("active");
						$parent.removeClass("li-expand");
						$parent.addClass("li-shrink");
					});
				} else if(isContain(classNames, "shrink")) {
					var $uiIcon = $this.find(".ui-icon");
					$uiIcon.removeClass("ui-icon-triangle-1-e");
					$uiIcon.addClass("ui-icon-triangle-1-s");
					$parent.addClass("active");
					//判断其他菜单是否展开状态，如果是，则缩回展开的菜单
					var className = $parent.attr("class")
					className = getClassContain(className, "layer");
					$parent.parent().find("."+className+".li-expand").each(function(){
						var currentClassNames = $(this).attr("class");
						if(!mIsEmpty(currentClassNames) && !isContain(currentClassNames, "active")) {
							var $a = $(this).find("a");
							var $uiIcon2 = $a.find(".ui-icon");
							$uiIcon2.removeClass("ui-icon-triangle-1-s");
							$uiIcon2.addClass("ui-icon-triangle-1-e");
							var $this2 = $(this);
							$(this).find("ul:first").slideUp("normal",function(){
								$a.removeClass("expand");
								$a.addClass("shrink");
								var $ul = $this2.find(".li-expand");
								$ul.removeClass("active");
								$ul.removeClass("li-expand");
								$ul.addClass("li-shrink");
								$this2.find("ul").hide();
							});
						}
					});
					$parent.addClass("li-expand");
					$parent.find("ul:first").slideDown("normal",function(){
						$this.removeClass("shrink");
						$this.addClass("expand");
						$parent.removeClass("li-shrink");
						
					});
				}
		} else if(!mIsEmpty($parent.attr("class")) && 
				isContain($parent.attr("class"), "no-parent")) {
			var uri = $this.data("uri");
			if(!mIsEmpty(uri) && trim(uri) != '#') {
				$("#menu-sub-nav .active").removeClass("active");
				$parent.addClass("active");
				
				if(uri.indexOf("mail")>=0)
					openWin(uri, "邮箱管理");
				else 
					loadLocation(uri);
			}else
				BootstrapDialogUtil.confirmDialog("暂无内容", null);
		 }
		return false;
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
 * 加载到当前页面
 * @param uri
 */
function loadLocation(uri) {
//	loadUri("#cu-content",uri,true);
	loadUri("#cu-content",uri);
}
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
