<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<jsp:include page="./common-header.jsp" />
<link href="${pageContext.request.contextPath}/css/jquery.treeview.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/js/jqGrid/ui.jqgrid.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/tree.select.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" />

<script src="${pageContext.request.contextPath}/js/jquery.treeview.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jqGrid/grid.locale-cn.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/jqGrid/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/tree.select.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/js/tree-util.js" type="text/javascript"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/js/JQuery_zTree/css/zTreeStyle/zTreeStyle.css" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JQuery_zTree/js/jquery.ztree.core-3.5.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/JQuery_zTree/js/jquery.ztree.excheck-3.5.js"></script>
<script src="${pageContext.request.contextPath}/js/JQuery_zTree/js/jquery.ztree.exedit-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/JQuery_zTree/js/jquery.ztree.exhide-3.5.js" type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/js/JQuery_zTree/orgzTree.js" type="text/javascript"></script>


<body>
   <div class="header" style="height:122px;background-image:url(${pageContext.request.contextPath}/resource/examV2/images/goutai-left1.png);">
      <div class="navbar-brand p-l-15" style="width:100%;">
        <div class="p-t-5"><a href="index"><img style="margin:0 5px 6px 0;" src="${pageContext.request.contextPath}/resource/examV2/images/index_logo_white2.png"/></a></div>
      </div>
      <div class="navbar-nav p-l-20" >
          <ul class="navbar-menu" id="header-menu">
              <s:iterator id="menuTmp" value="menus" status="st">
                 <s:if test="currentUri == #menuTmp.uri">
		            <li class="active"><a href="${menuTmp.uri }">${menuTmp.menuName }</a></li>
		         </s:if>
		         <s:else>
		             <li><a href="${menuTmp.uri }">${menuTmp.menuName }</a></li>
		         </s:else>
		      </s:iterator>
          </ul>
      </div>
     

      <div class="navbar-nar-right p-r-0" id="user-menu-dropdwon" style="font-size:16px">
          <div class="navbar-info"><a href="javascript:void(0)"><span class="icon icon-home"></span>${userInfo.callName } <span class="caret"></span></a></div>
          <div class="navbar-down-menu">
             <ul>
			     <li><a href="user/changePwd" id="change-pwd" ><span class="icon icon-settings"></span>修改密码</a></li>
			     <li><a href="logout"><i class="icon icon-logout"></i>安全退出</a></li>
             </ul>
          </div>
      </div>
   </div>
   
   
   <!-- top ddf-status 开始 -->
<%-- <div class="ddf-status">
  <div class="ddf-wrapper">   
   
    <div class="ddf-status_user"> 
                <strong>当前用户：</strong>
        <span><a href="#">${userInfo.callName }</a></span>    
        <a href="user/changePwd" id="change-pwd" ><span class="icon icon-settings"></span>修改密码</a>
        <a href="logout"><i class="icon icon-logout"></i>安全退出</a>
            </div>
  </div>
</div>
<!--  top ddf-status 结束 -->
   <!-- header -->
	<div class="ddf-header">
		<div class="ddf-wrapper">
			<a class="ddf-header_logo" href=""> <img
				src="${pageContext.request.contextPath}/resource/examV2/images/ic_logo_white.png">
				<h1 class="ddf-header_logo_outWords">${projectName }</h1>
			</a>
			<ul class="ddf-header_nav">
				<s:iterator id="menuTmp" value="menus" status="st">
                 <s:if test="currentUri == #menuTmp.uri">
		            <li class="ddf-header_nav_sub_sel"><a href="${menuTmp.uri }">${menuTmp.menuName }</a></li>
		         </s:if>
		         <s:else>
		             <li class = "ddf-header_nav_sub"><a href="${menuTmp.uri }">${menuTmp.menuName }</a></li>
		         </s:else>
		      </s:iterator>
			</ul>

		</div>
	</div> --%>

	<div class="clear"></div>
  <div class="wrap-main">
 <script type="text/javascript">
   var isActive = false;
   $(document).ready(function(){
	   $("#header-menu a").each(function(e){
		   var activeName = $(this).parent().attr("class");
		   if(activeName != undefined && isContain(activeName,"active")) {
			   isActive = true;
			   return false;
		   }
	   });
	   if(!isActive) {
		   $("#header-menu a").first().parent().addClass("active");
	   }
	   $("#user-menu-dropdwon").mouseover(function(){
	      $(".navbar-info").addClass("active");
	      $(".navbar-down-menu").show();
	   }).mouseout(function(){
	       $(".navbar-info").removeClass("active");
	      $(".navbar-down-menu").hide();
	   });
	   
	   $("#change-pwd").click(function(){
	       var uri = $(this).attr("href");
	       if(trim(uri) != '') {
	          BootstrapDialogUtil.loadUriDialog("修改密码",uri,"600","#fff");
	       }
	       return false;
	   });
   });
</script>