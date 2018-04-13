<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>首页</title>
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/hmstyle.css" rel="stylesheet" type="text/css" />
		<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>
	</head>
	<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
	<body>
		<div class="hmtop">
			<!--顶部导航条 -->
					<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>
				<!--悬浮搜索框-->
				<div class="nav white">
					<div class="logo"><img src="<%=basePath%>images/logo.png" /></div>
					<div class="logoBig">
						<li><img src="<%=basePath%>images/logobig.png" /></li>
					</div>

					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form>
							<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
							
							<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
						
						</form>
					</div>
				</div>
				
				<div class="clear"></div>
			</div>
			
			
			<div class="banner">
                      <!--轮播 -->
						<div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
							<ul class="am-slides">
								<li class="banner1"><a href="introduction.html"><img src="<%=basePath%>images/ad1.jpg" /></a></li>
								<li class="banner2"><a><img src="<%=basePath%>images/ad2.jpg" /></a></li>
								<li class="banner3"><a><img src="<%=basePath%>images/ad3.jpg" /></a></li>
								<li class="banner4"><a><img src="<%=basePath%>images/ad4.jpg" /></a></li>

							</ul>
						</div>
						<div class="clear"></div>	
			</div>						
			
			<div class="shopNav">
				<div class="slideall">
			        
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="CommodityListServlet">首页</a></li>
                                <li class="qc"><a href="CommodityListServlet">闪购</a></li>
                                <li class="qc"><a href="CommodityListServlet">限时抢</a></li>
                                <li class="qc"><a href="CommodityListServlet">团购</a></li>
                                <li class="qc last"><a href="CommodityListServlet">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			
		        				
						<!--侧边导航 -->
						<div id="nav" class="navfull">
							<div class="area clearfix">
								<div class="category-content" id="guide_2">
									
									<div class="category">
										<ul class="category-list" id="js_climit_li">
										
											<!-- 遍历分类 -->
											<c:forEach var="sort" items="${sortsList}">
											<li class="appliance js_toggle relative first">
												<div class="category-info">
													<h3 class="category-name b-category-name">
														<i>
															<img src="<%=basePath%>images/cake.png">
														</i><a class="ml-22" title="${sort.sortname}" href="CommodityBySortServlet?action=findcommBysort&sortid=${sort.sortid}">${sort.sortname}</a></h3>
													<em>&gt;</em>
												</div>	
											<b class="arrow"></b>	
											</li>
											</c:forEach>
											<!-- 遍历分类 -->
										</ul>
									</div>
								</div>

							</div>
						</div>
						<!--轮播 -->
						<script type="text/javascript">
							(function() {
								$('.am-slider').flexslider();
							});
							$(document).ready(function() {
								$("li").hover(function() {
									$(".category-content .category-list li.first .menu-in").css("display", "none");
									$(".category-content .category-list li.first").removeClass("hover");
									$(this).addClass("hover");
									$(this).children("div.menu-in").css("display", "block")
								}, function() {
									$(this).removeClass("hover")
									$(this).children("div.menu-in").css("display", "none")
								});
							})
						</script>
					<!--小导航 -->
					<div class="am-g am-g-fixed smallnav">
						<div class="am-u-sm-3">
							<a href="sort.html"><img src="<%=basePath%>images/navsmall.jpg" />
								<div class="title">商品分类</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="<%=basePath%>images/huismall.jpg" />
								<div class="title">大聚惠</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="<%=basePath%>images/mansmall.jpg" />
								<div class="title">个人中心</div>
							</a>
						</div>
						<div class="am-u-sm-3">
							<a href="#"><img src="<%=basePath%>images/moneysmall.jpg" />
								<div class="title">投资理财</div>
							</a>
						</div>
					</div>

					<!--走马灯 -->
				</div>
				<script type="text/javascript">
					if ($(window).width() < 640) {
						function autoScroll(obj) {
							$(obj).find("ul").animate({
								marginTop: "-39px"
							}, 500, function() {
								$(this).css({
									marginTop: "0px"
								}).find("li:first").appendTo(this);
							})
						}
						$(function() {
							setInterval('autoScroll(".demo")', 3000);
						})
					}
				</script>
			</div>
			<div class="shopMainbg">
				<div class="shopMain" id="shopmain">
					<!--今日推荐 -->
					<div class="am-g am-g-fixed recommendation">
						<div class="clock am-u-sm-3" ">
							<img src="<%=basePath%>images/2016.png "></img>
							<p>今日<br>推荐</p>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>真的有鱼</h3>
								<h4>开年福利篇</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath%>images/tj.png "></img>
							</div>
						</div>						
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>囤货过冬</h3>
								<h4>让爱早回家</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath%>images/tj1.png "></img>
							</div>
						</div>
						<div class="am-u-sm-4 am-u-lg-3 ">
							<div class="info ">
								<h3>浪漫情人节</h3>
								<h4>甜甜蜜蜜</h4>
							</div>
							<div class="recommendationMain ">
								<img src="<%=basePath%>images/tj2.png "></img>
							</div>
						</div>

					</div>
					<div class="clear "></div>
					<!--热门活动 -->

					<div class="am-container activity ">
						<div class="shopTitle ">
							<h4>活动</h4>
							<h3>每期活动 优惠享不停 </h3>
							<span class="more ">
                              <a class="more-link " href="# ">全部活动</a>
                            </span>
						</div>
					
					  <div class="am-g am-g-fixed ">
						<div class="am-u-sm-3 ">
							<div class="icon-sale one "></div>	
								<h4>秒杀</h4>							
							<div class="activityMain ">
								<img src="<%=basePath%>images/activity1.jpg "></img>
								
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>														
						</div>
						
						<div class="am-u-sm-3 ">
						  <div class="icon-sale two "></div>	
							<h4>特惠</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>images/activity2.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>								
							</div>							
						</div>						
						
						<div class="am-u-sm-3 ">
							<div class="icon-sale three "></div>
							<h4>团购</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>images/activity3.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>							
						</div>						

						<div class="am-u-sm-3 last ">
							<div class="icon-sale "></div>
							<h4>超值</h4>
							<div class="activityMain ">
								<img src="<%=basePath%>images/activity.jpg "></img>
							</div>
							<div class="info ">
								<h3>春节送礼优选</h3>
							</div>													
						</div>

					  </div>
                   </div>
					<div class="clear "></div>
		<%-- <div class="am-container ">
						<div class="shopTitle ">
							<h4>二手书</h4>
							<h3>二手教材优惠大促销</h3>
							<div class="today-brands ">
							</div>
							<span class="more ">
                    <a class="more-link " href="# ">更多</a>
                        </span>
						</div>
		</div>
		<div class="am-g am-g-fixed flood method3 ">
				<ul class="am-thumbnails ">
					<!-- 遍历商品 -->
					<c:forEach var="commodity" items="${coffeelist}">
						<li>

							<div class="list "><a
								href="<%=basePath%>CommodityDetailServlet?comid=${commodity.comid}">
									<img src="${commodity.picture}" />
									<div class="pro-title "><label>商品名称：${commodity.comname}</label>
								</div> <span class="e-price ">价格：${commodity.price}</span> 库存:<span>${commodity.inventory}</span>
							</a></div>

						</li>
					</c:forEach>
					<!-- 遍历商品 -->
			</ul>
		</div> --%>
		
		
		<c:forEach var="sort" items="${sortsList}">
			<div class="am-container ">
				<div class="shopTitle ">
					<h4>${sort.sortname}</h4>
					<!-- <h3>多锻炼才有好身体</h3>  -->
					<span class="more "> <a class="more-link "
						href="# ">更多</a>
				</span>
			</div>
				<div class="am-g am-g-fixed flood method3 ">
					<ul class="am-thumbnails ">
						<!-- 遍历商品 -->
						<c:forEach var="commodity" items="${sort.commodityList}">
							<li>
								<div class="list"><a
									href="<%=basePath%>CommodityDetailServlet?comid=${commodity.comid}">
										<img src="${commodity.picture }" />
										<div class="pro-title "><label>商品名称:${commodity.comname}</label>
									</div> <span class="e-price ">价格:${commodity.price}</span> 库存:<span>${commodity.inventory}</span>
								</a></div>
							</li>
						</c:forEach>
						<!-- 遍历商品 -->
				</ul>
			</div>
		</div> 
		</c:forEach>
		
		
		
		<jsp:include page="/home/IndexElements/IndexFooter.jsp"></jsp:include>
				</div>
			</div>
		</div>
		</div>
		<!--引导 -->

		<div class="navCir">
			<li class="active"><a href="home3.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li><a href="ShopcartServlet?action=loadShopCart"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="<%=basePath%>person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
		<!--菜单 -->
			<jsp:include page="/home/IndexElements/tip.jsp"></jsp:include> 
		<script>
			window.jQuery || document.write('<script src="basic/js/jquery.min.js "><\/script>');
		</script>		
		<script type="text/javascript " src="<%=basePath%>basic/js/quick_links.js "></script>
		<jsp:include page="/home/IndexElements/IndexSearch.jsp"></jsp:include>	
	</body>

</html>