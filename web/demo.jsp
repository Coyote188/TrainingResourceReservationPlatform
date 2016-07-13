<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>XXX部队-模拟仿真训练平台</title>
<meta name="filetype" content="1">
<meta name="publishedtype" content="1">
<meta name="pagetype" content="2">
<meta name="catalogs" content="S21_41888">
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript">
</script>
<style type="text/css">
/* page styles */
body {
	font-family:"Segoe UI", Frutiger,Tahoma,Helvetica,"Helvetica Neue", Arial, sans-serif;
	font-size:62.5%;
}
table {
	border-collapse:collapse;
}
td, th {
	text-align:center;
	border:1px solid #ddd;
	padding:2px 5px;
}
caption {
	margin:0 0 .5em;
	font-weight:bold;
}
/*demo styles*/
	table {
	width:500px;
	height:200px;
	margin-left:30px;
}
td, th {
	font-size:1.2em;
	padding:2px;
	width:13%;
}
th {
	background-color:#f4f4f4;
}
caption {
	font-size:1.5em;
}
table {
	float:left;
	margin:40px 40px 0 0;
}
.demo {
	width:500px;
	margin:0 auto;
}
td.hover {
	background:#eee;
}
</style>
</head>
<body>
	
<div class="demo">
	<table>
		<caption>2009年员工产品销售走势图</caption>
		<tbody>
			<tr>
				<th scope="row">答案类型</th>
				<td>
					<select>
						<option value="ANS_S">单选</option>
						<option value="ANS_M">多选</option>
						<option value="ANS_F">填空</option>
					</select>
				</td>
				<th>适用学员</th>
				<td>
					<select>
						<option>下士</option>
						<option>士官</option>
					</select>
				</td>
			</tr>
			<tr>
				<th scope="row">问题归属</th>
				<td>
					<select>
						<option>动中继</option>
						<option>士官</option>
					</select>
				</td>
				<th>难度系数</th>
				<td>
					<input type="text" onkeyup="this.value=this.value.replace(/\D/g, '')" >
				</td>
			</tr>
			<tr>
				<th scope="row">问题类型</th>
				<td>
					<select>
						<option>文本</option>
						<option>图文</option>
					</select>
				</td>
				<th>
					文件
				</th>
				<td>
					<input type="file" >
				</td>
			</tr>
		</tbody>
	</table>	
</div>
	
</body>
</html>