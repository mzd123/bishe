<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%
	String path = request.getContextPath();
	// 获得本项目的地址(例如: http://localhost:8080/MyApp/)赋值给basePath变量 
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	// 将 "项目路径basePath" 放入pageContext中，待以后用EL表达式读出。 
	pageContext.setAttribute("basePath", basePath);
%>
<title>Insert title here</title>
</head>
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/docs.min.css" rel="stylesheet">
<script src="<%=basePath%>bootstrap/js/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
button {
	color: #FAFAFA;
}
</style>
<body>
<div class="row" style="height: 40px"></div>
	<div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>昵称</th>
						<th>时间</th>
						<th>内容</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.lia}" var="each" varStatus="st">
						<tr>
							<td>${st.index+1}</td>
							<td style="width: 80px">${each.nicheng}</td>
							<td style="width: 180px">${each.time}</td>
							<td>${each.content}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>