<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8" />
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
button {
	color: #FAFAFA;
}
</style>

<body>
	<div style="background-color: red; height: 10px;"></div>
	<div class="row" style="background-color: red;">
		<div class="col-md-3"></div>
		<div class=" col-md-6 ">
			<form class="navbar-form" action="<%=basePath%>serachdata.do"
				method="post">
				<div class="row">
					<div class="col-md-6">
						<input type="text "  class="form-control" name="search"
							 placeholder="请输入关键字！ " style="width: 260px;">
					</div>
					<div class="col-md-4" style="margin: 0px 0px 0px -10px;">
						<div class="row">
							<div class="col-md-4">
								<button type="submit " class="btn btn-primary ">点击搜索</button>
							</div>
							<div style="margin: 0px 0px 0px 30px;" class="col-md-4">
								<button type="reset" class="btn btn-primary "
									style="width: 80px;">重置</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
		<div class="col-md-4"></div>
	</div>
	<div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>昵称</th>
						<th>文件名称</th>
						<th>文件类型</th>
						<th>上传时间</th>
						<th>上传方式</th>
						<th>下载次数</th>
						<th>点击下载</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.liS}" var="each" varStatus="st">
						<tr>
							<td>${st.index+1}</td>
							<td>${each.nicheng}</td>
							<td>${each.filename}</td>
							<td>${each.leixing}</td>
							<td>${each.uploadtime}</td>
							<td>${each.state}</td>
							<td>${each.downtimes}</td>
							<td><a
								href="<%=basePath%>downfilebyid.do?id=${each.fileid}&op=2&nicheng=${each.nicheng}">点击下载</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>