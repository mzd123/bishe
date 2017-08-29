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
<script src="<%=basePath%>bootstrap/js/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row" style="height: 40px;"></div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<h1>${sessionScope.li.get(0).fnicheng}</h1>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="height: 20px;"></div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="background-color:">
				<div class="form-group">
					<label class="col-md-2 control-label">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
					<div class="col-md-7">${sessionScope.li.get(0).fnicheng}</div>
				</div>
				<div class="form-group" style="height: 45px;"></div>
				<div class="form-group">
					<label class="col-md-2 control-label">添&nbsp;&nbsp;加&nbsp;&nbsp;时&nbsp;&nbsp;间</label>
					<div class="col-md-7">${sessionScope.li.get(0).addtime}</div>
				</div>
				<div class="form-group" style="height: 45px;"></div>
				<div class="form-group">
					<label class="col-md-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
					<div class="col-md-7">${sessionScope.userF.email}</div>
				</div>
				<div class="form-group" style="height: 45px;"></div>
				<div class="form-group">
					<label class="col-md-2 control-label">个&nbsp;&nbsp;性&nbsp;&nbsp;签&nbsp;&nbsp;名</label>
					<div class="col-md-7">${sessionScope.userF.qianming}</div>
				</div>
				<div class="form-group " style="height: 45px;"></div>
				<div class="form-group">
					<label class="col-md-2 control-label">分&nbsp;&nbsp;享&nbsp;&nbsp;数&nbsp;&nbsp;目</label>
					<div class="col-md-7">${sessionScope.i}次</div>
				</div>
				<div class="form-group " style="height: 45px;"></div>
				<div class="form-group">
					<div class="col-md-4"></div>
					<div class="col-md-4">
						<button type="button" class="btn btn-primary"
							style="width: 155px;">
							<a
								href="<%=basePath%>addmyfriend.do?fnicheng=${sessionScope.li.get(0).fnicheng}"
								style="text-decoration: none;">点击添加</a>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-3 "></div>
	</div>
	</div>
</body>
</html>