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
   <div class="header">
      <div class="navbar-brand p-l-15">
        <div class="p-t-5"><a href="index"><img style="margin:0 5px 6px 0;" src="images/logo_head.png"/>${projectName }</a></div>
      </div>
      <div class="navbar-nar-right p-r-0" id="user-menu-dropdwon">
          <div class="navbar-info"><a href="javascript:void(0)"><span class="icon icon-home"></span>${userInfo.callName } </a></div>
      </div>
   </div><!-- header -->
   <div class="clear"></div>
