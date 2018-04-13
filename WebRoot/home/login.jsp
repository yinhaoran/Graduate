<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head lang="en">
<meta charset="UTF-8">
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<meta name="format-detection" content="telephone=no">
<meta name="renderer" content="webkit">
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link rel="stylesheet" href="../AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="../css/dlstyle.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="login-boxtitle"><a href="home.html"><img
			alt="logo" src="../images/logobig.png" /> </a></div>
	<div class="login-banner">
		<div class="login-main">
			<div class="login-banner-bg"><span></span><img
				src="../images/big.jpg" /></div>
			<div class="login-box">
				<h3 class="title">登录商城</h3>
				<div class="clear"></div>
				<div class="login-form">
					<form
					action="${pageContext.request.contextPath}/UserLoginServlet?action=login"
					method="post">
						<div class="inp">
							<div class="user-name"><label for="user"><i
									class="am-icon-user"></i> </label> <input type="text" name="username"
								id="user" placeholder="邮箱/用户名"></div>
							<div class="user-pass"><label for="password"><i
									class="am-icon-lock"></i> </label> <input type="password"
								name="password" id="password" placeholder="请输入密码"></div>
					</div>
						<div class="login-links"><label for="remember-me"><input
								id="remember-me" type="checkbox">记住密码</label> <a href="#"
							class="am-fr">忘记密码</a> <a
							href="${pageContext.request.contextPath}/home/register.jsp"
							class="zcnext am-fr am-btn-default">注册</a> <br /></div>
						<div class="am-cf"><input type="submit" name="" value="登 录"
							class="am-btn am-btn-primary am-btn-sm"></div>
				</form>
			</div>
				<div class="partner"></div>
		</div>
	</div>
</div>


	<jsp:include page="/home/IndexElements/IndexFooter.jsp"></jsp:include>
</body>

</html>