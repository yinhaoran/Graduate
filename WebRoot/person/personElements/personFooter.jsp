<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'personFooter.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   		<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">理工</a>
							<b>|</b>
							<a href="#">学院</a>
							<b>|</b>
							<a href="#">城市</a>
							<b>|</b>
							<a href="#">学院</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">xxxxxxx</a>
							<a href="#">xxxxxxx</a>
							<a href="#">xxxxxxx</a>
							<a href="#">xxxxxxx</a>
							<em>© 2015-2025  xxxxxxxxxxxxxxxxxxxxxxxxxx</em>
						</p>
					</div>
	</div>
				
  </body>
</html>
