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
			$(function() {
				$("input").bind("input change", function() {
					var ifchecknicheng = panduan($("#nicheng"));
					//邮箱是否填了
					var ifcheckEmail = panduan($("#niEmail"));
					//密码是否填了
					var ifcheckpassword = panduan($("#password"));
					if(ifchecknicheng && ifcheckEmail && ifcheckpassword) {
						$("#submit").removeAttr("disabled");
					} else {
						$("#submit").attr("disabled", "disabled")
					}
				})
				$('[data-toggle="popover"]').popover();
				
				$("#nicheng").change(function(){
					$.ajax({
						url:"<%=basePath%>beforelogin_ishavenicheng.do",
						type:"post",
						async:true,
						cache:false,
						dateType:"json",
						data:{
							"nicheng":$("#nicheng").val()
						},
						success:function(json1){
							if(json1!=null&&json1.nicheng!=null){
								var s_nicheng = document.getElementById("s_nicheng");
								s_nicheng.innerHTML = "该昵称已经被人使用，请重新换一个！";
							}
						},
						error:function(){
							alert("出错了！");
						}
					});
				})
				
				
			})

			
			
			function panduan(kongjian) {
				if(kongjian.val() != "") {
					return true;
				} else {
					return false;
				}
			}

			function checknicheng() {
				var nicheng = $("#nicheng").val();
				var s_nicheng = document.getElementById("s_nicheng");
				if(nicheng == null || nicheng == "") {
					s_nicheng.innerHTML = "请输入昵称！";
					return false;
				} else {
					s_nicheng.innerHTML = "";
					return true;
				}
			}

			function checkEmail() {
				var Email = $("#Email").val();
				var s_Email = document.getElementById("s_Email");
				if(Email == null || Email == "") {
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
				if(password == null || password == "") {
					s_password.innerHTML = "请输入密码！";
					return false;
				} else {
					s_password.innerHTML = "";
					return true;
				}
			}
			var code;

			function createCode() {
				code = "";
				var codeLength = 6; //验证码的长度  
				var checkCode = document.getElementById("checkCode");
				var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
					'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
					'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的  
				for(var i = 0; i < codeLength; i++) {
					//Math.floor求一个最接近它的整数，但是没有四舍五入原则
					var charNum = Math.floor(Math.random() * 52);
					code += codeChars[charNum];
				}
				if(checkCode) {
					checkCode.className = "code";
					checkCode.innerHTML = code;
				}
			}

			function validateCode() {
				var inputCode = $("#inputCode").val();
				var s_inputCode = document.getElementById("s_inputCode");
				if(inputCode == null || inputCode == "") {
					s_inputCode.innerHTML = "请输入验证码！";
					return false;
				} else if(inputCode.toUpperCase() != code.toUpperCase()) {
					s_inputCode.innerHTML = "请输入正确的验证码";
					return false;
				} else {
					s_inputCode.innerHTML = "";
					return true;
				}
			}

			function ifread() {
				//昵称是否填了
				var ifchecknicheng = checknicheng();
				//邮箱是否填了
				var ifcheckEmail = checkEmail();
				//密码是否填了
				var ifcheckpassword = checkpassword();
				var ifinputcode = validateCode();
				//是否已阅读并同意
				var ifcheck1 = document.getElementsByName("check1");
				validateCode();
				console.info("ifcheck1[0].checked");
				console.info(ifcheck1[0].checked);
				if(!(ifchecknicheng && ifcheckEmail && ifcheckpassword && ifinputcode)) {
					return false;
				} else if(!(ifcheck1[0].checked)) {
					alert("请认真阅读使用条款，并在左侧打上勾！");
					return false;
				}
				return true;
			}
		</script>
<style type="text/css">
a:hover {
	text-decoration: underline;
}

.code {
	background: url(code_bg.jpg);
	font-family: Arial;
	font-style: italic;
	color: blue;
	font-size: 25px;
	border: 0;
	padding: 0px 3px;
	letter-spacing: 3px;
	font-weight: bolder;
	float: left;
	cursor: pointer;
	width: 150px;
	height: 35px;
	text-align: center;
	vertical-align: middle;
}

span {
	color: #FF0000;
}
</style>
</head>

<body onload="createCode()" style="background-color: #00CC00">
	<div class="container-fluid">
		<div class="row" style="height: 40px;"></div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-6" style="margin: 0px 0px 0px 50px;">
				<div id="blink">
					<h1>欢迎加入memory！</h1>
				</div>
				<script language="javascript">
						function changeColor() {
							var color = "red|#FF6600|#FFCE02|#003300|#00CC00|aqua|#000099|#0000FF|#darkmagenta|#000000";
							color = color.split("|");
							document.getElementById("blink").style.color = color[parseInt(Math.random() * color.length)];
						}
						setInterval("changeColor()", 500);
					</script>
			</div>
			<div class="col-md-3"></div>
		</div>
		<div class="row" style="height: 30px;"></div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-2">
				<!-- <marquee scrollAmount=4 direction="up">
					<font size="5" style="color: red;">慕<br />师<br />恩<br />春<br />华<br />秋<br />实<br />众<br />星<br />北<br />拱<br />，
					</font>
				</marquee> -->
			</div>
			<div class="col-md-6"
				style="background-color: #000000; border-radius: 20px;">
				<div class="row" style="height: 40px;"></div>
				<form role="form" action="<%=basePath%>beforelogin_register.do" method="post">
					<div class="form-group" style="margin: 0px 0px 0px 50px;">
						<label class="col-md-2 control-label"><font
							style="color: white;">昵&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称</font></label>
						<div class="col-md-7">
							<input type="text" class="form-control" id="nicheng"
								name="nicheng" placeholder="请输入你的昵称！" onkeyup="checknicheng()">

						</div>
					</div>
					<span id="s_nicheng"></span>
					<div class="form-group" style="height: 40px;"></div>
					<div class="form-group" style="margin: 0px 0px 0px 50px;">
						<label class="col-md-2 control-label"><font
							style="color: white;">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱</font></label>
						<div class="col-md-7">
							<input type="email" class="form-control" id="Email" name="email"
								placeholder="请输入你的邮箱！" onkeyup="checkEmail()">
						</div>
					</div>
					<span id="s_Email"></span>
					<div class="form-group" style="height: 40px;"></div>
					<div class="form-group" style="margin: 0px 0px 0px 50px;">
						<label class="col-md-2 control-label"><font
							style="color: white;">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</font></label>
						<div class="col-md-7">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入你的密码！" onkeyup=checkpassword()>
						</div>
					</div>
					<span id="s_password"></span>
					<div class="form-group" style="height: 40px;"></div>
					<div class="form-group" style="margin: 0px 0px 0px 50px;">
						<label class="col-md-2 control-label"><font
							style="color: white;">验&nbsp;&nbsp;&nbsp;&nbsp;证&nbsp;&nbsp;&nbsp;&nbsp;码</font></label>
						<div class="col-md-4">
							<input type="text" class="form-control" id="inputCode"
								placeholder="请输入准确的验证码！" onkeyup=validateCode()>
						</div>
						<div class="col-md-3">
							<div class="code" id="checkCode" onclick="createCode()"></div>
						</div>
						<div class="col-md-3"></div>
					</div>
					<span id="s_inputCode"></span>
					<div class="form-group" style="height: 40px;"></div>
					<div class="row">
						<div class="col-md-4"></div>
						<div class="col-md-8">
							<div class="checkbox">
								<label><input type="checkbox" id="check1" name="check1" />
									<font size="2" style="color: white">已阅读并同意</font></label> <a
									data-toggle="popover" data-placement="right"
									data-content="1.如果上传的是公开的类型，所有人都能访问下载，如果有版权问题，建议不要选择公开，一旦被盗取，概不负责！2.如果上传的是私有的类型，只有自己可见！3.如果是分享类型，只有自己和好友能访问下载，同样，一旦被盗取，概不负责！">使用条款</a>
							</div>
						</div>
						<span id="s_check"></span>
					</div>
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-4" style="margin: 0px 0px 0px 50px;">
							<button type="submit" id="submit" class="btn btn-primary"
								style="width: 155px;" onclick="return ifread()"
								disabled="disabled">注册</button>
						</div>
						<div class="col-md-4">
							<button type="reset" class="btn btn-warning"
								style="width: 155px;">重置</button>
						</div>
					</div>
					<div class="row" style="height: 50px;"></div>
				</form>
			</div>
			<div class="col-md-2"></div>
			<div class="col-md-1" style="margin: 0px 0px 0px -50px;">
				<!-- <marquee scrollAmount=4 direction="up">
					<font size="5" style="color: red;">瞻<br />学<br />谊<br />西<br />彦<br />东<br />俊<br />群<br />翼<br />南<br />飞<br />。
					</font>
				</marquee> -->
			</div>
		</div>
		<div class="col-md-3"></div>
	</div>
	</div>
</body>

</html>