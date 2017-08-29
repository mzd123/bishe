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
<script type="text/javascript">
	function checkEmail() {
		var Email = $("#Email").val();
		var s_Email = document.getElementById("s_Email");
		if (Email == null || Email == "") {
			s_Email.innerHTML = "请输入邮箱！";
			return false;
		} else {
			s_Email.innerHTML = "";
			return true;
		}
	}

	function checkpassword() {
		var password = $("#password").val();
		var s_password = document.getElementById("s_password");
		if (password == null || password == "") {
			s_password.innerHTML = "请输入密码！";
			return false;
		} else {
			s_password.innerHTML = "";
			return true;
		}
	}

	function ifread() {
		//邮箱是否填了
		var ifcheckEmail = checkEmail();
		//密码是否填了
		var ifcheckpassword = checkpassword();
		if (!(ifcheckEmail && ifcheckpassword)) {
			return false;
		}
		return true;
	}
</script>
<style type="text/css">
span {
	color: #FF0000;
}
</style>
</head>

<body>
	<div class="container-fluid">
		<div class="row" style="height: 40px;"></div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<div id="blink">
					<h1>我&nbsp;的&nbsp;基&nbsp;本&nbsp;信&nbsp;息</h1>
				</div>
				<script language="javascript">
					function changeColor() {
						var color = "red|#FF6600|#FFCE02|#003300|#00CC00|aqua|#000099|#0000FF|#darkmagenta|#000000";
						color = color.split("|");
						document.getElementById("blink").style.color = color[parseInt(Math
								.random()
								* color.length)];
					}
					setInterval("changeColor()", 500);
				</script>
			</div>
			<div class="col-md-4"></div>
		</div>
		<div class="row" style="height: 20px;"></div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6" style="background-color:">
				<form role="form" action="<%=basePath%>modifymyself.do">
					<div class="form-group">
						<label class="col-md-2 control-label">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="nicheng"
								name="nicheng" value="${sessionScope.user.nicheng }"
								placeholder="请输入你的昵称！" readonly="readonly">
						</div>
					</div>
					<span id="s_nicheng"></span>
					<div class="form-group" style="height: 45px;"></div>
					<div class="form-group">
						<label class="col-md-2 control-label">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</label>
						<div class="col-md-7">
							<input type="email" class="form-control" id="Email" name="email"
								value="${sessionScope.user.email }" placeholder="请输入你的邮箱！"
								onkeyup="checkEmail()">
						</div>
					</div>
					<span id="s_Email"></span>
					<div class="form-group" style="height: 45px;"></div>
					<div class="form-group">
						<label class="col-md-2 control-label">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
						<div class="col-md-7">
							<input type="password" class="form-control" id="password"
								name="password" value="${sessionScope.user.password }"
								placeholder="请输入你的密码！" onkeyup="checkpassword()">
						</div>
					</div>
					<span id="s_password"></span>
					<div class="form-group" style="height: 45px;"></div>
					<div class="form-group">
						<label class="col-md-2 control-label">个&nbsp;&nbsp;性&nbsp;&nbsp;签&nbsp;&nbsp;名</label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="qianming"
								name="qianming" value="${sessionScope.user.qianming }"
								placeholder="请输入你的签名！">
						</div>
					</div>
					<div class="form-group " style="height: 50px;"></div>
					<div class="row ">
						<div class="col-md-1 "></div>
						<div class="col-md-4 ">
							<button type="submit " class="btn btn-primary "
								style="width: 100px;" onclick="return ifread() ">保存</button>
						</div>
						<div class="col-md-4 ">
							<button type="reset " class="btn btn-warning "
								style="width: 100px;">重置</button>
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