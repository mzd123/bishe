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
<script type="text/javascript">
	var fangshi = "";
	var time = "";
	var leixing = "";

	function iftext() {
		leixing = "文件";
		dospand();
	}

	function picture() {
		leixing = "图片";
		dospand();
	}

	function music() {
		leixing = "音乐";
		dospand();
	}

	function checktime1() {
		time = "今天";
		dospand();
	}

	function checktime2() {
		time = "昨天";
		dospand();
	}

	function checktime3() {
		time = "一周之内";
		dospand();
	}

	function checktime4() {
		time = "一月只内";
		dospand();
	}

	function checktime5() {
		time = "上传历史";
		dospand();
	}

	function checkleixing1() {
		fangshi = "公开的";
		dospand();
	}

	function checkleixing2() {
		fangshi = "私有的";
		dospand();
	}

	function checkleixing3() {
		fangshi = "分享的";
		dospand();
	}

	function dospand() {
		$("#xianshi").val(leixing + "," + time + "," + fangshi);
	}
</script>

<body>
	<div style="background-color: red; height: 10px;"></div>
	<div class="row" style="background-color: red;">
		<div class="col-md-1"></div>
		<div class="col-md-2">
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown"
					style="background-color: red; padding: 0px 0px 10px 0px;">
					<font size="5">文件类型</font>
				</button>
				<ul class="dropdown-menu">
					<li><a onclick="iftext()">文件</a></li>
					<li><a onclick="picture()">图片</a></li>
					<li><a onclick="music()">音乐</a></li>
				</ul>
			</div>
		</div>
		<div class="col-md-2">
			<div class="btn-group">
				<button type="button" class="btn" data-toggle="dropdown"
					style="background-color: red; padding: 0px 0px 10px 0px;">
					<font size="5">上传时间</font>
				</button>
				<ul class="dropdown-menu">
					<li><a onclick="checktime1()">今天</a></li>
					<li><a onclick="checktime2()">昨天</a></li>
					<li><a onclick="checktime3()">一周以内</a></li>
					<li><a onclick="checktime4()">一月以内</a></li>
					<li><a onclick="checktime5()">上传历史</a></li>
				</ul>
			</div>
		</div>
		<div class=" col-md-2 ">
			<div class="btn-group ">
				<button type="button" class="btn" data-toggle="dropdown"
					style="background-color: red; padding: 0px 0px 10px 0px;">
					<font size="5">存在形式</font>
				</button>
				<ul class="dropdown-menu ">
					<li><a onclick="checkleixing1()">公开的</a></li>
					<li><a onclick="checkleixing2()">私有的</a></li>
					<li><a onclick="checkleixing3()">分享的</a></li>
				</ul>
			</div>
		</div>
		<div class=" col-md-5 " style="margin: -8px 0px 0px 0px;">
			<form class="navbar-form " action="<%=basePath%>searchupload.do">
				<div class="form-group ">
					<input type="text " id="xianshi" name="xianshi"
						class="form-control " placeholder="请选择正确的类型！ "
						style="width: 300px;" readonly="readonly ">
				</div>
				<button type="submit " class="btn btn-primary ">点击搜索</button>
			</form>
		</div>
	</div>
	<div>
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<table class="table table-hover">
				<thead>
					<tr>
						<th>#</th>
						<th>文件名字</th>
						<th>文件类型</th>
						<th>上传时间</th>
						<th>存在形式</th>
						<th>下载次数</th>
						<th>点击删除</th>
						<th>点击下载</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${sessionScope.li }" var="each" varStatus="st">
						<tr>
							<td>${st.index+1}</td>
							<td>${each.filename }</td>
							<td>${each.leixing }</td>
							<td>${each.uploadtime }</td>
							<td>${each.state }</td>
							<td>${each.downtimes }</td>
							<td><a
								href="<%=basePath%>deletefilebyid.do?id=${each.fileid }">点击删除</a></td>
							<td><a
								href="<%=basePath%>downfilebyid.do?id=${each.fileid }&op=1">点击下载</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>

</html>