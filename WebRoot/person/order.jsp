<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

<title>订单管理</title>
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>css/personal.css" rel="stylesheet"
	type="text/css">
<link href="<%=basePath%>css/orstyle.css" rel="stylesheet"
	type="text/css">
<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	/* window.onload=function(){
		
		$(".order-status5").each(function(){
			var total = 0;
			$(this).find(".item-list").each(function(){
				total += parseInt($(this).find(".item-price").text())*parseInt($(this).find("#com-num").text());
		});
			$("#total").html(total);
			}
			
		
	} */
</script>
</head>



<body>
	<!--头 -->
	<header>
		<article>
			<div class="mt-logo">
				<!--顶部导航条 -->
				<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>
				<!--悬浮搜索框-->
				<div class="nav white">
					<div class="logoBig">
						<li>
							<img src="<%=basePath%>images/logobig.png" />
						</li>
					</div>
					<div class="search-bar pr">
						<a name="index_none_header_sysc" href="#"></a>
						<form><input id="searchInput" name="index_none_header_sysc"
								type="text" placeholder="搜索" autocomplete="off"> <input
								id="ai-topsearch" class="submit am-btn" value="搜索" index="1"
								type="submit"></form>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			</div>
	</article>
</header>
	<div class="nav-table">
		<div class="long-title">
			<span class="all-goods">全部分类</span>
		</div>
		<div class="nav-cont">
			<ul>
				<li class="index">
					<a href="#">首页</a>
				</li>
				<li class="qc">
					<a href="#">闪购</a>
				</li>
				<li class="qc">
					<a href="#">限时抢</a>
				</li>
				<li class="qc">
					<a href="#">团购</a>
				</li>
				<li class="qc last">
					<a href="#">大包装</a>
				</li>
			</ul>
			<div class="nav-extra">
				<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利 <i
					class="am-icon-angle-right" style="padding-left: 10px;"></i>
			</div>
		</div>
	</div>
	<b class="line"></b>
	<div class="center">
		<div class="col-main">
			<div class="main-wrap">

				<div class="user-order">

					<!--标题 -->
					<div class="am-cf am-padding">
						<div class="am-fl am-cf">
							<strong class="am-text-danger am-text-lg">订单管理</strong>
						</div>
					</div>
					<hr />

					<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

						<ul class="am-avg-sm-5 am-tabs-nav am-nav am-nav-tabs">
							<li class="am-active">
								<a href="#tab1">所有订单</a>
							</li>
						</ul>
						<div class="am-tabs-bd">
						<c:forEach items="${orderlist}" var="order">
						<c:if test="${order.orderstatus==1}">
							<div class="am-tab-panel am-fade am-in am-active" id="tab1">
							<div class="order-title">
													<div class="dd-num">订单编号：${order.orderid}</div>
													<span>成交时间：${order.transtime}</span>
							</div>
								<div class="order-top">
									<div class="th th-item">
										<td class="td-inner">商品</td>
									</div>
									<div class="th th-price">
										<td class="td-inner">单价</td>
									</div>
									<div class="th th-number">
										<td class="td-inner">数量</td>
									</div>

									<div class="th th-amount">
										<td class="td-inner">合计</td>
									</div>
								</div>
								<div class="order-main">
									<div class="order-list">
										<!--交易失败-->
										
											
												
												<div class="order-status5">
													<div class="order-content">
														<div class="order-left">
															<ul class="item-list">
																<li class="td td-item">
																	<div class="item-pic">
																		<a href="#" class="J_MakePoint">
																			<img src="${order.picture}" class="itempic J_ItemImg">
																		</a>
																	</div>
																	<div class="item-info">
																		<div class="item-basic-info">
																			<a
																				href="PersonCommentServlet?action=addComment&comid=${order.comid}">
																				<p>${order.comname}</p>
																			</a>
																		</div>
																	</div>
																</li>
																<li class="td td-price">
																	<div class="item-price" id="com-price">
																		${order.price}</div>
																</li>
																<li class="td td-number">
																	<div class="item-number">
																		<span>×</span><span id="com-num">${order.comcount}</span>
																	</div>
																</li>
																<li class="td td-operation">
																	<div class="item-operation">
																		<div class="item-amount">合计：${order.price * order.comcount}
																		</div>
																	</div>
																</li>
															</ul>
														</div>
														<div class="order-right">
															<li class="td td-amount">
																<%-- <div class="item-amount">
																合计：${order.price * order.comcount}
															</div> --%>
															</li>
															<div class="move-right">
																<li class="td td-status"></li>

															</div>
														</div>
													</div>
												</div>
											</c:if>
										</c:forEach>
									</div>

								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!--底部-->
			<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
		</div>
		<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>

	</div>

</body>

</html>