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

		<title>评价管理</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath%>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/cmstyle.css" rel="stylesheet" type="text/css">

		<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.js"></script>

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
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">评价管理</strong> / <small>Manage&nbsp;Comment</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-2 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active"><a href="#tab1">所有评价</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">

									<div class="comment-main">
										<c:forEach var="commlist" items="${commentlist}">
										<div class="comment-list">
											<ul class="item-list">

												
												<div class="comment-top">
													<div class="th th-price">
														<td class="td-inner">评价</td>
													</div>
													<div class="th th-item">
														<td class="td-inner">商品</td>
													</div>													
												</div>
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="${commlist.commodity.picture}" class="itempic">
														</a>
													</div>
												</li>

												<li class="td td-comment">
													<div class="item-title">
														<div class="item-opinion">好评</div>
														<div class="item-name">
															<a href="CommodityDetailServlet?comid=${commlist.commodity.comid}">
																<p class="item-basic-info">${commlist.commodity.comname}</p>
															</a>
														</div>
													</div>
													<div class="item-comment">
														${commlist.content}	
													</div>

													<div class="item-info">
														<div>
															<p class="info-time">${commlist.createdate}</p>

														</div>
													</div>
												</li>

											</ul>

										</div>
									</c:forEach>
									</div>

								</div>

							</div>
						</div>

					</div>

				</div>
				<!--底部-->
			<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
				
			</div>

			<jsp:include page="/person/personElements/personaSide.jsp"></jsp:include>
				
		</div>

	</body>

</html>