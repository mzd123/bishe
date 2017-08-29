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
<style type="text/css">
.style1 {
	width: 100%;
	height: 640px;
	FILTER: progid: DXImageTransform.Microsoft.Gradient(gradientType=0,
		startColorStr=##00CCFF, endColorStr=#fafafa);
	/*IE*/
	background: -moz-linear-gradient(top, #00CCFF, #fafafa);
	/*火狐*/
	background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#00CCFF),
		to(#fafafa));
	/*谷歌*/
	background-image: -webkit-gradient(linear, left bottom, left top, color-start(0, #00CCFF),
		color-stop(1, #fafafa));
	/* Safari & Chrome*/
	filter: progid: DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr='#00CCFF', endColorstr='#fafafa');
	/*IE6 & IE7*/
	-ms-filter:
		"progid:DXImageTransform.Microsoft.gradient(GradientType=0,startColorstr='#00CCFF', endColorstr='#fafafa')";
	/* IE8 */
	background-color:;
}

#yi {
	font-family: KaiTi;
	background-color: #424242;
	border-radius: 55px;
}
</style>


<link href="<%=basePath%>bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=basePath%>bootstrap/css/docs.min.css" rel="stylesheet">
<script src="<%=basePath%>bootstrap/js/jquery.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
/* 	$(function() {
		if (window.history && window.history.pushState) {
			$(window).on('popstate', function() {
				// 当点击浏览器的 后退和前进按钮 时才会被触发， 
				window.history.pushState('forward', null, '');
				window.history.forward(1);
			});
		}
	}) */
	
	jQuery(document).ready(function ($) {
                    if (window.history && window.history.pushState) {
                        $(window).on('popstate', function () {
                            var hashLocation = location.hash;
                            var hashSplit = hashLocation.split("#!/");
                            var hashName = hashSplit[1];
                            if (hashName !== '') {
                                var hash = window.location.hash;
                                if (hash === '') {
                                    alert("Back button isn't supported. You are leaving this application on next clicking the back button");
                                }
                            }
                        window.history.pushState('forward', null, './#forward');
                            window.history.forward(1);
                        });
                    }
                });

	function help() {
		$("iframe").attr("src", "help.jsp");
	}
	</script>
<body>
	<div class="style1">
		<div class="row" style="height: 30px;"></div>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-8" id="yi">
					<div class="col-md-1"></div>
					<div class="col-md-4">
						<a href="first.jsp"><img
							src="<%=basePath%>bootstrap/img/timg4.jpg" /></a>
					</div>
					<div class="col-md-2">
						<div style="height: 30px;"></div>
						<a href="first.jsp" style="text-decoration: none;"> <font
							size="5" style="color: #FFFFFF;">主页</font>
						</a>
					</div>
					<div class="col-md-2">
						<div style="height: 30px;"></div>
						<a onclick="help()" style="text-decoration: none;"> <font
							size="5" style="color: #FFFFFF;">背景</font>
						</a>
					</div>
					<div class="col-md-2">
						<div style="height: 30px;"></div>
						<a href="<%=basePath%>selectalladvice_beforelogin.do" style="text-decoration: none;"> <font
							size="5" style="color: #FFFFFF;">建议</font>
						</a>
					</div>
				</div>
				<div class="col-md-1"></div>
			</div>
		</div>
		<div class="row" style="height: 15px;"></div>
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6">
				<iframe src="memory.jsp"
					style="width: 600px; height: 400px; border: 0px; border-radius: 15px;">
				</iframe>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>
</html>