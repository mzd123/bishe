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
<style type="text/css">
body {
	height: 400px;
	width: 600px;
	font-family: KaiTi;
	color: #FF0000;
}

.style1 {
	width: 600px;
	height: 400px;
	FILTER: progid: DXImageTransform.Microsoft.Gradient(gradientType=0,
		startColorStr=##39D7FE, endColorStr=#D1F2FA);
	/*IE*/
	background: -moz-linear-gradient(top, #39D7FE, #D1F2FA);
	/*火狐*/
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#39D7FE),
		to(#D1F2FA));
	/*谷歌*/
	background-image: -webkit-gradient(linear, left bottom, left top, color-start(0, #39D7FE),
		color-stop(1, #D1F2FA));
	/* Safari & Chrome*/
	filter: progid: DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr='#39D7FE', endColorstr='#D1F2FA');
	/*IE6 & IE7*/
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#39D7FE', endColorstr='#D1F2FA')";
	/* IE8 */
	background-color:;
}
</style>
<body>
	<div class="style1">
		<div style="height: 15px;"></div>
		<div>
			<font size="6">&nbsp;&nbsp;&nbsp;For important things often
				can't find and feel annoyed? Why don't you try to join the memory ?</font>
		</div>
		<div style="height: 15px;"></div>
		<div>
			<font size="6" style="text-decoration: blink">&nbsp;&nbsp;&nbsp;还在为重要的东西经常会找不到而感到恼火吗？为什么不加入memory试试呢？</font>
		</div>
		<div style="height: 30px;"></div>
		<div>
			<div style="padding: 0px 30px 0px 100px;">
				<button type="button" class="btn btn-primary" style="height: 55px;">
					<font size="5"><a
						style="color: white; text-decoration: none"
						href="<%=basePath%>zhuce.jsp" target="_parent">立即加入memory</a></font>
				</button>
				<button type="button" class="btn btn-warning" style="height: 60px;">
					<font size="5"><a
						style="color: white; text-decoration: none"
						href="<%=basePath%>login.jsp" target="_parent">已有账号？登入</a></font>
				</button>
			</div>
		</div>
	</div>
</body>

</html>