<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		<div class="col-md-1"></div>
		<div class=" col-md-6 ">
			<form class="navbar-form "
				action="<%=basePath%>selectmyfriendbynicheng.do?op=1" method="post">
				<div class="row">
					<label class="col-md-2 control-label"
						style="margin: 8px 0px 0px 0px;">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
					<div class="col-md-6">
						<input type="text " id="xianshi" name="fnicheng"
							class="form-control " placeholder="请输入好友昵称！ "
							style="width: 260px;">
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
		<div class="col-md-4">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-3" style="margin: 15px 0px 0px 0px;">
					<font size="3" style="color: white;">增加好友</font>
				</div>
				<div class="col-md-6" style="margin: 10px 0px 0px -25px;">
					<a href="<%=basePath%>logined/addmyfriend.jsp"><img
						src="<%=basePath%>bootstrap/img/f705f3d3572c11dffb7db159652762d0f603c27c.jpg" /></a>
				</div>
			</div>
		</div>
	</div>
	<div>
		<div class="col-lg-1"></div>
		<div class="col-lg-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>昵称</th>
						<th>点击查看</th>
						<th>删除好友</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.li }" var="each" varStatus="st">
						<tr>
							<td>${st.index+1 }</td>
							<td>${each.nicheng }</td>
							<td><a
								href="<%=basePath%>selectmyfriendbynicheng.do?op=2&fnicheng=${each.nicheng }">点击查看</a></td>
							<td><a
								href="<%=basePath%>deletetmyfriendbynicheng.do?fnicheng=${each.nicheng }">点击查看</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>