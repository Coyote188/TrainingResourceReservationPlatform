<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
  SimpleDateFormat dateFormater = new SimpleDateFormat("yyyy");
  String year = dateFormater.format(new Date());
%>
    <div class="wrap-footer">
		  <div class="footer">
		    <div class="text-center">
		         <!-- <p class="p-b-0">CopyRight © 2010-<%=year %>  版权所有</p>  --> 
		     </div>
		  </div>
    </div>
  </body>
</html>
