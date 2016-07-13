<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Doc Viewer</title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script> 
<script type="text/javascript" src="js/gdocview/jquery.gdocsviewer.min.js"></script> 
<style type="text/css">
/* Style the second URL with a red border */
#test-gdocsviewer {
	border: 5px red solid;
	padding: 20px;
	width: 650px;
	background: #ccc;
	text-align: center;
}
/* Style all gdocsviewer containers */
.gdocsviewer {
	margin:10px;
}
</style>
<script type="text/javascript"> 
/*<![CDATA[*/
$(document).ready(function() {
	$('a.embed').gdocsViewer({width: 600, height: 750});
	$('#embedURL').gdocsViewer();
});
/*]]>*/
</script> 
</head>
<body style="background:#999; font-family:arial, helvetica, sans-serif; font-size:14px;">
<div style="background:#fff; width:960px; margin:0 auto; padding:20px;">
	<h1>gDocsViewer jQuery plugin v1.0 Demo</h1>
	<hr size="1" />
	<div>
		<h2>Examples</h2>
		<h3>URLs with class: embed</h3>
		<a href="Document/demo1.docx" class="embed">Doc File</a>
		<a href="Document/demo2.pdf" class="embed">pdf File</a>
		<a href="Document/demo3.pptx" class="embed">ppt File</a>
	</div>
</div>
</body>
</html>