<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:action name="include/header" executeResult="true" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/left-menu-new2.js"></script>
<script
	src="${pageContext.request.contextPath}/js/jquery.mcustomscrollbar.concat.min.js"></script>
<script src="${pageContext.request.contextPath}/js/easySlider1.5.js"></script>
<script
	src="${pageContext.request.contextPath}/js/perfect-scrollbar-0.4.10.with-mousewheel.min.js"></script>
<link href="${pageContext.request.contextPath}/css/menu.css"
	rel="stylesheet" />
<style>

.menu-resizer {
    float: left;
    width: 12px;
    background:#48C5F1;
    cursor: pointer;
}

.menu-resizer-toggler {
    background: transparent url("${pageContext.request.contextPath}/images/s-5.jpg") no-repeat scroll center center;
    margin-top: 200px;
    height: 50px;
    width: 100%;
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
		//		leftMenuResize(".ui-layout-resizer", ".ui-layout-toggler");
				var datas = '${output}';
				var datas = $.parseJSON(datas);

				if (datas.result == '1') {
					//			buildObjTree("#tree-menu", datas.data, '${menu.id}',false);
		//			treeMenuLinkListener();
				}
				$(window).load(
						function() {

							$("a[rel='load-content']").click(
									function(e) {
										e.preventDefault();
										var url = $(this).attr("href");
										$.get(url, function(data) {
											$(".content .mCSB_container")
													.append(data); //load new content inside .mCSB_container
											//scroll-to appended content 
											$(".content").mCustomScrollbar(
													"scrollTo", "h2:last");
											$(".nav-left-menu").append(data); //load new content inside .mCSB_container
											//scroll-to appended content 
											$(".nav-left-menu")
													.mCustomScrollbar(
															"scrollTo",
															"h2:last");
										});
									});

							$(".content").delegate(
									"a[href='top']",
									"click",
									function(e) {
										e.preventDefault();
										$(".content").mCustomScrollbar(
												"scrollTo",
												$(this).attr("href"));
										$(".nav-left-menu").mCustomScrollbar(
												"scrollTo",
												$(this).attr("href"));
									});
							$("#tree-menu").mCustomScrollbar();
							//		$("#tree-menu").easySlider();
							//		$("#tree-menu").perfectScrollbar('update');
						});
			});
</script>
<link href="${pageContext.request.contextPath}/css/v2/style.css"
	rel="stylesheet" />

<div id="menu-nav" class="menu">
	<h5 class="menu-title">
		<i class="glyphicon glyphicon-th-large"></i> 功能菜单
	</h5>
	<div id="menu-sub-nav">
		${menuTreeHtml }
	</div>

</div>

<div class="menu-resizer">
	<div class="menu-resizer-toggler"></div>
</div>
<div id="cu-content" class="ui-layout-center">