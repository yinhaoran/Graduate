<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>My JSP 'top.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
  <script>
  	$(function(){
  		$(".menu-hd a").hover(function(){
  			$(this).css("color","red");
  		},function(){
  			$(this).css("color","black");
  		})
  		//购物车数量提示
  		var url="<%=basePath%>TipServlet";
   				 var param={
   					userid:${sessionScope.user.userid}
   				}; 
   				 $.get(url,param,function(result){
   				 
   					if(result!=null){
   						$("#J_MiniCartNum").html(result);
   					}else{
   						$("#J_MiniCartNum").html(0);
   					}
   				})  
  	})
  	
  	
  
  </script>
  <body>
    <div class="am-container header">
    			<c:if test="${sessionScope.user==null }">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<a href="<%=basePath%>home/login.jsp" target="_top" class="h">亲，请登录</a>
							<a href="<%=basePath%>home/register.jsp" target="_top">免费注册</a>
						</div>
					</div>
				</ul>
				</c:if>
				<c:if test="${sessionScope.user!=null }">
				<ul class="message-l">
					<div class="topMessage">
						<div class="menu-hd">
							<p class="h">欢迎你,${sessionScope.user.nickname} <a href="UserLoginServlet?action=logout">退出</a></p>
							
						</div>
					</div>
				</ul>
				</c:if>
				<ul class="message-r">
					<div class="topMessage home">

						<div class="menu-hd"><a href="CommodityListServlet" target="_top" class="h">商城首页</a></div>
					</div>
					<div class="topMessage my-shangcheng">
						<div class="menu-hd MyShangcheng"><a href="<%=basePath%>UserIndexServlet?action=loadPerson" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
					</div>
					<div class="topMessage mini-cart">
						<div class="menu-hd"><a id="mc-menu-hd" href="<%=basePath %>ShopcartServlet?action=loadShopCart" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
					</div>
					<div class="topMessage favorite">
						<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
				</ul>
				</div>

  </body>
</html>
