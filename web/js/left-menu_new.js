/**
 * 
 */
$(document).ready(function(){
	leftMenuResize(".ui-layout-resizer", ".ui-layout-toggler");
	menuTreeListener();
});

function hideMenu(){
	$("#menu-nav,.menu-resizer").css({
		"display" : "none"
	});

	$(".menu-resizer-toggler").addClass("zoom-left");
	$("#main-content").css({
		"margin-left" : "0px"
	});
}

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
 * 初始化菜单高度
 */
function initMenuHeight() {
	var h = $(document).height();
	
	var nh = $("#header-ui-div").outerHeight(true);
	//var vh = $(".header-body-dividing").outerHeight(true);
	h = h - $(".wrap-footer").outerHeight(true)-nh;
	//h = h - $(".wrap-footer").outerHeight(true) - $(".header").outerHeight(true)-vh;
	$(".menu-resizer").css({"height" : h + "px"});
	$(".menu-resizer-toggler").css({"margin-top" : (h-50)/2+ "px"});
	$("#main-content").css({"height" : h + "px"});
	$("#menu-sub-nav").css({"height" : (h-$(".menu-title").outerHeight(true)) + "px"});
}

/**
 * 自动调整jqGrid插件的宽度
 */
function autoJqGridWidth() {
	$("#main-content .cnoj-jq-grid").each(function(){
		$(this).setGridWidth($("#main-content").width()-5);
	});
}
function getA(obj)
{
	if(obj.childNodes.length!=0){
		getA(obj);
	}
	if(obj.tagName.toLowerCase()==='a')
		alert(a.innerHTML);
}
/**
 * 监听左菜单点击事件
 * @returns
 */
function menuTreeListener() {
	alert($(".menu").find("a").size());
	$("#menu-sub-nav a").each(function(){
		url=$(this).attr('href'); 
		txt=$(this).html();
		    //url就是遍历出来的单个a标签网址，txt就是a之间的文本。  
		alert(url+","+txt);
		}); 
	cs = document.getElementById('menu-sub-nav').childNodes;
	for (i = 0; i < cs.length; i++) {
		/*if(cs[i].childNodes.length!=0){
			getA(obj);
		}*/
//		alert(cs[i].nodeName.toLowerCase());
	}
	
	$("#menu-sub-nav a").each(function (i) {
        
            //onhover是个a被选中的样式，具体你可以自己写
//            $(this).addClass("onhover");
        
    });
	$("#menu-sub-nav a").on('click',function(){
		/*var $this = $(this);
		var $parent = $this.parent();
		var classNames = $this.attr("class");
		var isOpenUri = false;
		$("#menu-sub-nav .active").removeClass("active");
		if(!isEmpty(classNames)){
			if(isContain(classNames, "expand")) {
				$this.removeClass("expand");
				$this.addClass("shrink");
				$parent.removeClass("active");
				$parent.removeClass("li-expand");
				$parent.addClass("li-shrink");
				$parent.find("ul:first").slideUp("slow");
				var $uiIcon = $this.find(".ui-icon");
				$uiIcon.removeClass("ui-icon-triangle-1-s");
				$uiIcon.addClass("ui-icon-triangle-1-e");
				
				isOpenUri = false;
			} else if(isContain(classNames, "shrink")) {
				$this.removeClass("shrink");
				$this.addClass("expand");
				$parent.addClass("active");
				$parent.removeClass("li-shrink");
				$parent.addClass("li-expand");
				$parent.find("ul:first").slideDown("slow");
				
				var $uiIcon = $this.find(".ui-icon");
				$uiIcon.removeClass("ui-icon-triangle-1-e");
				$uiIcon.addClass("ui-icon-triangle-1-s");
				isOpenUri = false;
			} else {
				isOpenUri = true;
			}
		} else {
			isOpenUri = true;
		}
		if(isOpenUri) {
			var uri = $this.data("uri");
			if(!isEmpty(uri) && trim(uri) != '#') {
				$("#menu-sub-nav .active").removeClass("active");
				$parent.addClass("active");
				if(uri.indexOf("mail")>=0) {
					openWin(uri, "邮箱管理");
				} else {
					loadUri("#main-content",uri);
				}
			}
		}*/
		alert("进入");
		var $this = $(this);
		var $parent = $this.parent();
		var classNames = $this.attr("class");
		$("#menu-sub-nav .active").removeClass("active");
		alert(classNames);
		
		if(!isEmpty(classNames) && (isEmpty($parent.attr("class")) || 
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
						if(!isEmpty(currentClassNames) && !isContain(currentClassNames, "active")) {
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
		} else if(!isEmpty($parent.attr("class")) && 
				isContain($parent.attr("class"), "no-parent")) {
			var uri = $this.data("uri");
			if(!isEmpty(uri) && trim(uri) != '#') {
				$("#menu-sub-nav .active").removeClass("active");
				$parent.addClass("active");
				if(uri.indexOf("mail")>=0)
					openWin(uri, "邮箱管理");
				else 
					loadLocation(uri);
			}
		 }
		return false;
	});
}

/**
 * 加载到当前页面
 * @param uri
 */
function loadLocation(uri) {
	loadUri("#main-content",uri,true);
}
