<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>发表评论</title>

		<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath%>/css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>/css/appstyle.css" rel="stylesheet" type="text/css">
		<script type="text/javascript" src="<%=basePath%>/js/jquery-1.7.2.min.js"></script>
		<script type="text/javascript">
						$(document).ready(function() {
							$(".comment-list .item-opinion li").click(function() {	
								$(this).prevAll().children('i').removeClass("active");
								$(this).nextAll().children('i').removeClass("active");
								$(this).children('i').addClass("active");
								
							});
				     })
		</script>									
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<jsp:include page="/person/personElements/personTop.jsp"></jsp:include>	
						<!--悬浮搜索框-->
						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            <!-- 菜单栏 -->
					<jsp:include page="/person/personElements/personTable.jsp"></jsp:include>	
						
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-comment">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">发表评论</strong> / <small>Make&nbsp;Comments</small></div>
						</div>
						<hr/>

						<form method="post" action="PersonCommentServlet?action=doAddComment">
							<input type="hidden" name="comid" value="${commodity.comid}"/>
							<div class="comment-main">
							<div class="comment-list">
								<div class="item-pic">
									<a href="#" class="J_MakePoint">
										<img src="${commodity.picture}" class="itempic">
									</a>
								</div>

								<div class="item-title">
									<div class="item-name">
										<a href="#">
											<p class="item-basic-info">${commodity.comname}</p>
										</a>
									</div>
									<div class="item-info">
										<div class="item-price">
											价格：<strong>${commodity.price}</strong>
										</div>										
									</div>
								</div>
								<div class="clear"></div>
								<div class="item-comment">
									<textarea placeholder="请写下对宝贝的感受吧，对他人帮助很大哦！" name="content"></textarea>
								</div>
							</div>
							
							<!--多个商品评论-->						
								
								<!-- <div class="info-btn">
									<div class="am-btn am-btn-danger">发表评论</div>
								</div>	 -->
								<input type="submit" class="am-btn am-btn-danger" value="发表评论"/>
						</div>
						
							
						</form>

					</div>

				</div>
				<!--底部-->
				<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
				
			</div>
				<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>
				
			
		</div>

	</body>

</html>