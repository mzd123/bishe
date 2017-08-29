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
<link title="lvse" href="<%=basePath%>bootstrap/css/lvse.css"
	rel="stylesheet">
<link title="huangse" href="<%=basePath%>bootstrap/css/huangse.css"
	rel="stylesheet" disabled="disabled">
<link title="lanse" href="<%=basePath%>bootstrap/css/lanse.css"
	rel="stylesheet" disabled="disabled">
<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/docs.min.css" rel="stylesheet">
<script src="<%=basePath%>bootstrap/js/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-3.1.1.js"></script>
<script type="text/javascript"
	src="<%=basePath%>bootstrap/js/jquery-3.1.1.min.js"></script>
<script src="<%=basePath%>bootstrap/js/jquery.cookie.js"></script>
<script type="text/javascript">
	$(function() {
		var i = $.cookie("mystyle");
		if (i != null) {
			console.info(i)
			if (i == 1) {
				$("link[title='lvse']").removeAttr("disabled");
				;
				$("link[title='huangse']").attr("disabled", "disabled")
				$("link[title='lanse']").attr("disabled", "disabled");
			} else if (i == 2) {
				$("link[title='lvse']").attr("disabled", "disabled");
				$("link[title='huangse']").removeAttr("disabled");
				$("link[title='lanse']").attr("disabled", "disabled");
			} else if (i == 3) {
				$("link[title='lvse']").attr("disabled", "disabled");
				$("link[title='huangse']").attr("disabled", "disabled");
				$("link[title='lanse']").removeAttr("disabled");
			}
		} else {
			var i = 1;
			$.cookie("mystyle", i, {
				expires : 30
			});
		}
	})

	function goback() {
		$("iframe").attr("src", "logined/blank.jsp");
	}

	function searchupload() {
		$("iframe").attr("src", "logined/searchupload.jsp");
	}

	function myfriends() {
		$("iframe").attr("src", "logined/myfriends.jsp");
	}

	function searchdata() {
		$("iframe").attr("src", "logined/searchdata.jsp");
	}

	function myadvice() {
		$("iframe").attr("src", "myadvice.html");
	}

	function personal() {
		$("iframe").attr("src", "logined/personal.jsp");
	}

	function upload() {
		$("iframe").attr("src", "logined/upload.jsp");
	}

	function dochange(i) {
		if (i == 3) {
			i = 1;
		} else {
			i++;
		}
		return i;
	}

	function changecolor() {
		var i = $.cookie("mystyle");
		console.info("aaaa" + i);
		ii = dochange(i);
		if (ii == 1) {
			$("link[title='lvse']").removeAttr("disabled");
			;
			$("link[title='huangse']").attr("disabled", "disabled")
			$("link[title='lanse']").attr("disabled", "disabled");
		} else if (ii == 2) {
			$("link[title='lvse']").attr("disabled", "disabled");
			$("link[title='huangse']").removeAttr("disabled");
			$("link[title='lanse']").attr("disabled", "disabled");
		} else if (ii == 3) {
			$("link[title='lvse']").attr("disabled", "disabled");
			$("link[title='huangse']").attr("disabled", "disabled");
			$("link[title='lanse']").removeAttr("disabled");
		}
		$.cookie("mystyle", ii, {
			expires : 30
		});
	}
</script>
</head>

<body>
	<div class="row" style="height: 20px; background-color: #57060A;"></div>
	<div class="row style1"
		style="background-color: #57060A; height: 60px; border-bottom-style: groove;">
		<div class="col-md-2">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-2">
					<img src="<%=basePath%>bootstrap/img/timg.jpg" />
				</div>
				<div class="col-md-8">
					<font size="6" onclick="goback()">Memory</font>
				</div>
			</div>
		</div>
		<div class="col-md-1"></div>
		<div class="col-md-3">
			<a style="text-decoration: none;"> <font size="6"
				onclick="personal()">我的信息</font>
			</a>
		</div>
		<div class="col-md-3">
			<a style="text-decoration: none;"> <font size="6"
				onclick="changecolor()">我的颜色</font>
			</a>
		</div>
		<div class="col-md-2">
			<a style="text-decoration: none;"> <font size="6"
				onclick="myfriends()">我的好友</font>
			</a>
		</div>
		<div class="col-md-1">
			<div style="margin: 30px 0px 0px 0px;">
				<a style="text-decoration: none;" href="index.jsp"> <font>
						退出登入 </font>
				</a>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-2 style1"
			style="background-color: #57060A; border-right-style: groove;">
			<div class="row" style="height: 50px;"></div>
			<div class="row">
				<div style="padding: 0px 0px 0px 50px;">
					<button type="submit" class="btn btn-success "
						style="width: 120px;" onclick="searchupload()">我的上传</button>
				</div>
			</div>
			<div class="row" style="height: 100px;"></div>
			<div class="row">
				<div style="padding: 0px 0px 0px 50px;">
					<button type="button" class="btn btn-success "
						style="width: 120px;" onclick="upload()">我要上传</button>
				</div>
			</div>
			<div class="row" style="height: 101px;"></div>
			<div class="row">
				<div style="padding: 0px 0px 0px 50px;">
					<button type="submit" class="btn btn-success "
						style="width: 120px;" onclick="searchdata()">搜索资料</button>
				</div>
			</div>
			<div class="row" style="height: 101px;"></div>
			<div class="row">
				<div style="padding: 0px 0px 0px 50px;">
					<button type="submit" class="btn btn-success "
						style="width: 120px;" onclick="myadvice()">我的评价</button>
				</div>
			</div>
			<div class="row" style="height: 65px;"></div>
		</div>
		<div class="col-md-9">
			<div class="row">
				<marquee scrollAmount=4 direction="left">
					<font>欢迎用户：${sessionScope.user.nicheng}登入memory，希望memory能帮到您！</font>
				</marquee>
			</div>
			<iframe class="style2"
				style="width: 1160px; height: 530px; margin: 0px 0px 0px -15px;"
				src=${sessionScope.src }>
		</div>
	</div>
</body>

</html>