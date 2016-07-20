<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
String _userId = "";
if(null != request.getSession().getAttribute("edu_user_info")){
	cn.com.chinaccs.bean.UserInfo info = (cn.com.chinaccs.bean.UserInfo)request.getSession().getAttribute("edu_user_info");
	_userId = info.getId();
}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/idx/global.css"></link>
<script type="text/javascript" src="${pageContext.request.contextPath}/idx/jquery-1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/idx/order/css.css">
<script type="text/javascript">
$.extend({
	fnOnOrderManagerOpen: function(){
		$("#divManagerArea").load("${pageContext.request.contextPath}/idx/order_manager.jsp");
		$("#portalMgrAreaTitle").text("个人订单查询");
	}
});
</script>
</head>
<body>
<div id="MainArea">
<div id="MainAreaLeft">
	<div id="NavTitle"><a type="title" href="javascript:void(0);">个人管理</a></div>
	<div id="NavLink">
		<ul>
			<li class="level1">
				<a href="javascript:void(0);" onclick="$.fnOnOrderManagerOpen();">订单查询</a>
			</li>
			<li class="level1">
				<a href="javascript:void(0);">修改密码</a>
			</li>
			<li class="level1">
				<a href="javascript:void(0);">约车须知</a>
				<ul>
					<li class="level2"><a href="javascript:void(0);">预约流程</a></li>
					<li class="level2"><a href="javascript:void(0);">资费说明</a></li>
					<li class="level2"><a href="javascript:void(0);">考试科目</a></li>
				</ul>
			</li>
		</ul>
	</div>
</div>
<div class="AreaBreak">
</div>
<div id="MainAreaRight">
	<div class="SignUpTitle" id="portalMgrAreaTitle"></div>
	<div class="SignUpContent" style="width: 830px" id="divManagerArea">
	</div>
</div>
</div>

<div class="SignUpContent">
		

</div>
</body>
</html>