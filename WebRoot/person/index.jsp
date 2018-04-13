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

		<title>个人中心</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/systyle.css" rel="stylesheet" type="text/css">

	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
				<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>

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
					<div class="wrap-left">
						<div class="wrap-list">
							<div class="m-user">
								<!--个人信息 -->
								<div class="m-bg"></div>
								<div class="m-userinfo">
									<div class="m-baseinfo">
										<a href="information.html">
											<img src="<%=basePath%>images/getAvatar.do.jpg">
										</a>
										<em class="s-name">${sessionScope.user.nickname}<span class="vip1"></em>
										<div class="s-prestige am-btn am-round">
											</span>会员福利</div>
									</div>
									<div class="m-right">
										<div class="m-new">
											<a href="<%=basePath%>person/news.jsp"><i class="am-icon-bell-o"></i>消息</a>
										</div>
										<div class="m-address">
											<a href="<%=basePath%>AddressServlet?action=show" class="i-trigger">我的收货地址</a>
										</div>
									</div>
								</div>

								<!--个人资产-->
								<div class="m-userproperty">
									<div class="s-bar">
										<i class="s-icon"></i>个人资产
									</div>
									<p class="m-bonus">
										<a href="<%=basePath%>person/bonus.jsp">
											<i><img src="<%=basePath%>images/bonus.png"/></i>
											<span class="m-title">红包</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-coupon">
										<a href="<%=basePath%>person/coupon.jsp">
											<i><img src="<%=basePath%>images/coupon.png"/></i>
											<span class="m-title">优惠券</span>
											<em class="m-num">2</em>
										</a>
									</p>
									<p class="m-bill">
										<a href="<%=basePath%>person/bill.jsp">
											<i><img src="<%=basePath%>images/wallet.png"/></i>
											<span class="m-title">钱包</span>
											<em class="m-num">2</em>
										</a>
									</p>								
								</div>
							</div>
							<div class="box-container-bottom"></div>

							<!--订单 -->
							<div class="m-order">
								<div class="s-bar">
									<i class="s-icon"></i>我的订单
									<a class="i-load-more-item-shadow" href="order.html">全部订单</a>
								</div>
								<ul>
									<li><a href="<%=basePath%>person/order.jsp"><i><img src="<%=basePath%>images/pay.png"/></i><span>待付款</span></a></li>
									<li><a href="<%=basePath%>person/order.jsp"><i><img src="<%=basePath%>images/send.png"/></i><span>待发货<em class="m-num">1</em></span></a></li>
									<li><a href="<%=basePath%>person/order.jsp"><i><img src="<%=basePath%>images/receive.png"/></i><span>待收货</span></a></li>
									<li><a href="<%=basePath%>person/order.jsp"><i><img src="<%=basePath%>images/comment.png"/></i><span>待评价<em class="m-num">3</em></span></a></li>
									<li><a href="<%=basePath%>person/change.jsp"><i><img src="<%=basePath%>images/refund.png"/></i><span>退换货</span></a></li>
								</ul>
							</div>
							<!--九宫格-->
							<div class="user-patternIcon">
								<div class="s-bar">
									<i class="s-icon"></i>我的常用
								</div>
								<ul>
									<a href="<%=basePath%>home/shopcart.html"><li class="am-u-sm-4"><i class="am-icon-shopping-basket am-icon-md"></i><img src="<%=basePath%>images/iconbig.png"/><p>购物车</p></li></a>
									<a href="collection.html"><li class="am-u-sm-4"><i class="am-icon-heart am-icon-md"></i><img src="<%=basePath%>images/iconsmall1.png"/><p>我的收藏</p></li></a>
									<a href="<%=basePath%>home/home.html"><li class="am-u-sm-4"><i class="am-icon-gift am-icon-md"></i><img src="<%=basePath%>images/iconsmall0.png"/><p>为你推荐</p></li></a>
									<a href="comment.html"><li class="am-u-sm-4"><i class="am-icon-pencil am-icon-md"></i><img src="<%=basePath%>images/iconsmall3.png"/><p>好评宝贝</p></li></a>
									<a href="foot.html"><li class="am-u-sm-4"><i class="am-icon-clock-o am-icon-md"></i><img src="<%=basePath%>images/iconsmall2.png"/><p>我的足迹</p></li></a>                                                                        
								</ul>
							</div>
							<!--物流 -->
							

							<!--收藏夹 -->
							
						</div>
					</div>
					<div class="wrap-right">

						<!-- 日历-->
						
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em>21</em>
									<span>星期一</span>
									<span>2015.12</span>
								</div>
							</div>
						</div>
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em>21</em>
									<span>星期一</span>
									<span>2015.12</span>
								</div>
							</div>
						</div>
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em>21</em>
									<span>星期一</span>
									<span>2015.12</span>
								</div>
							</div>
						</div>
						<div class="day-list">
							<div class="s-bar">
								<a class="i-history-trigger s-icon" href="#"></a>我的日历
								<a class="i-setting-trigger s-icon" href="#"></a>
							</div>
							<div class="s-care s-care-noweather">
								<div class="s-date">
									<em>21</em>
									<span>星期一</span>
									<span>2015.12</span>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--底部-->
				<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
	<!--引导 -->
			
		</div>
		<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>
		<!--引导 -->
		<div class="navCir">
			<li><a href="<%=basePath%>/home/home.jsp"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="<%=basePath%>home/sort.jsp"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="<%=basePath%>home/shopcart.jsp"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li class="active"><a href="index.jsp"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>