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
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/docs.min.css" rel="stylesheet">
</head>
<body>
	<%-- <div class="row">
		<img src="<%=basePath%>bootstrap/img/2017-04-04_130638.png" /> <img
			src="<%=basePath%>bootstrap/img/u=1391530073,307426460&fm=23&gp=0.jpg" />
		<img
			src="<%=basePath%>bootstrap/img/u=1247136483,825991693&fm=23&gp=0.jpg" />
	</div> --%>
</body>

</html>