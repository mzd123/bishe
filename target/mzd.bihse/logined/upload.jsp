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
<style type="text/css">
.file {
	position: relative;
	display: inline-block;
	background: #D0EEFF;
	border: 1px solid #99D3F5;
	border-radius: 4px;
	padding: 4px 12px;
	overflow: hidden;
	color: #1E88C7;
	text-decoration: none;
	text-indent: 0;
	line-height: 20px;
}

.file input {
	position: absolute;
	font-size: 100px;
	right: 0;
	top: 0;
	opacity: 0;
}

.file:hover {
	background: #AADFFD;
	border-color: #78C3F3;
	color: #004974;
	text-decoration: none;
}

span {
	color: #FF0000;
}
</style>
<script type="text/javascript">
	function doT2() {
		var c = document.getElementsByName("leixing");
		var s = document.getElementById("s_leixing");
		var isF = false;
		for (var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				isF = true;
				s.innerHTML = "";
				return isF;
			}
		}
		s.innerHTML = "类型不能为空！";
		return isF;
	}

	function doT4() {
		var c = document.getElementsByName("state");
		var s = document.getElementById("s_state");
		var isF = false;
		for (var i = 0; i < c.length; i++) {
			if (c[i].checked) {
				isF = true;
				s.innerHTML = "";
				return isF;
			}
		}
		s.innerHTML = "上传方式不能为空！";
		return isF;
	}

	function doT3() {
		var c = $("#file").val();
		var s = document.getElementById("s_file");
		if (c == null || c == "") {
			s.innerHTML = "文件不能为空！";
			return false;
		} else {
			s.innerHTML = "";
		}
		return true;
	}

	function doT() {
		var t2 = doT2();
		var t3 = doT3();
		var t4 = doT4();
		if (t2 && t3 && t4) {
			return true;
		} else {
			return false;
		}
	}
</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row" style="height: 100px;"></div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="background-color:">
				<form role="form" action="<%=basePath%>upload.do" method="post"
					enctype="multipart/form-data">
					<div class="form-group">
						<label class="col-md-3 control-label">文&nbsp;&nbsp;件&nbsp;&nbsp;类&nbsp;&nbsp;型</label>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="leixing1" name="leixing" value="文件"
										onclick="doT2()"></input>
								</div>
								<div class="col-md-8">文件</div>
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="leixing2" name="leixing" value="图片"
										onclick="doT2()"></input>
								</div>
								<div class="col-md-8">图片</div>
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="leixing3" name="leixing" value="音乐"
										onclick="doT2()"></input>
								</div>
								<div class="col-md-8">音乐</div>
							</div>
						</div>
					</div>
					<span id="s_leixing"></span>
					<div class="form-group" style="height: 65px;"></div>

					<div class="form-group">
						<label class="col-md-3 control-label">上&nbsp;&nbsp;传&nbsp;&nbsp;方&nbsp;&nbsp;式</label>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="state1" name="state" onclick="doT4()"
										value="私有"></input>
								</div>
								<div class="col-md-8">私有</div>
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="state2" name="state" onclick="doT4()"
										value="公开"></input>
								</div>
								<div class="col-md-8">公开</div>
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<div class="col-md-4" style="margin: 0px 0px 0px -20px;">
									<input type="radio" id="state3" name="state" onclick="doT4()"
										value="分享"></input>
								</div>
								<div class="col-md-8">分享</div>
							</div>
						</div>
					</div>
					<span id="s_state"></span>
					<div class="form-group" style="height: 65px;"></div>

					<div class="form-group">
						<label class="col-md-3 control-label">点&nbsp;&nbsp;击&nbsp;&nbsp;上&nbsp;&nbsp;传</label>
						<div class="col-md-7" style="margin: 0px 0px 0px -20px;">
							<a class="file">选择要上传的文件 <input type="file" name="file"
								id="file" onclick="doT3()">
							</a>
						</div>
					</div>
					<span id="s_file"></span>
					<div class="form-group " style="height: 70px;"></div>
					<div class="row ">
						<div class="col-md-1 "></div>
						<div class="col-md-4 ">
							<button type="submit " id="submit " class="btn btn-primary "
								style="width: 150px;" onclick="return doT()">上传</button>
						</div>
						<div class="col-md-4 ">
							<button type="reset " class="btn btn-warning "
								style="width: 150px;">重置</button>
						</div>
					</div>
			</div>
			</form>
		</div>
		<div class="col-md-3 "></div>
	</div>
	</div>
</body>

</html>