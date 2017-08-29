<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath();
	// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
	pageContext.setAttribute("basePath", basePath);
%>
<title></title>
</head>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/docs.min.css" rel="stylesheet">
<script src="<%=basePath%>bootstrap/js/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<style type="text/css">
body {
	background-image: url(<%=basePath%>bootstrap/img/2017-04-18_141541.png);
	background-repeat: no-repeat;
	width: 1160px;
	height: 530px;
}
</style>
<body>
	<div class="row" style="height: 20px;"></div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<h1 style="color: white;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;我&nbsp;&nbsp;&nbsp;&nbsp;的&nbsp;&nbsp;&nbsp;&nbsp;建&nbsp;&nbsp;&nbsp;&nbsp;议</h1>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div class="row" style="height: 20px;"></div>
	<form action="<%=basePath%>addadvice.do" method="post">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<textarea  name="advice"
					style="background-color: white; width: 595px; height: 300px; border-radius: 30px; font-size: xx-large; color: red; text-indent: 2em;"></textarea>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="height: 20px;"></div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-3">
				<button type="submit " class="btn btn-primary ">保存</button>
			</div>
			<div class="col-md-3">
				<button type="reset" class="btn btn-warning">重置</button>
			</div>
			<div class="col-md-3"></div>
		</div>
	</form>
</body>
</html>