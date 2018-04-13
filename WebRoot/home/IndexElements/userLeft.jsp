<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'userLeft.jsp' starting page</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  </head>
  
  <body>
    <aside class="menu">
				<ul>
					<li class="person">
						<a href="<%=basePath%>person/index.jsp">个人中心</a>
					</li>
					<li class="person">
						<a href="#">个人资料</a>
						<ul>
							<li> <a href="<%=basePath%>person/information.jsp">个人信息</a></li>
							<li> <a href="<%=basePath%>person/safety.jsp">安全设置</a></li>
							<li> <a href="<%=basePath%>AddressServlet?action=show">收货地址</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="OrderServlet?action=show">我的交易</a>
						<ul>
							<li><a href="OrderServlet?action=show">订单管理</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">我的小窝</a>
						<ul>
							<li> <a href="PersonCommentServlet?action=loadCommentByperson">评价</a></li>
						</ul>
					</li>
				</ul>
		</aside>
  </body>
</html>
