<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

		<title>购物车页面</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/optstyle.css" rel="stylesheet" type="text/css" />

		<script type="text/javascript" src="<%=basePath%>js/jquery-1.8.3.js"></script>
		<script type="text/javascript">
			function checkMyBox(){
			var ch =document.getElementsByName("check");
			var flag = false;
			for(var i=0;i<ch.length;i++){
				if(ch[i].checked==true){
					flag = true;
					break;
				} 
			}
			if(!flag){
				alert("请选择要删除的商品!");
				return flag;
			}
			return window.confirm("确认删除？");
		}
		</script>
	</head>

	<script>
		
		function total(){
			 var total = 0;
			$("input[name=items]:checked").each(function(){ 	
					
					total += parseInt($(this).val());					
			 });
			 $("#J_Total").html(total);
		}
	</script>
	<body>

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
	<form action="ShopcartCheckServlet" method="post" >
			<!--购物车 -->
			<input type="hidden" name="action" value="checkout"/>
			<div class="concent">
				<div id="cartTable">
					<div class="cart-table-th">
						<div class="wp">
							<div class="th th-chk">
								<div id="J_SelectAll1" class="select-all J_SelectAll">

								</div>
							</div>
							<div class="th th-item">
								<div class="td-inner">商品信息</div>
							</div>
							<div class="th th-price">
								<div class="td-inner">单价</div>
							</div>
							<div class="th th-amount">
								<div class="td-inner">数量</div>
							</div>
							<div class="th th-sum">
								<div class="td-inner">金额</div>
							</div>
							<div class="th th-op">
								<div class="td-inner">操作</div>
							</div>
						</div>
					</div>
					<div class="clear"></div>

					<tr class="item-list">
						<div class="bundle  bundle-last ">
							<div class="bundle-main">
							<c:forEach var="item" items="${shopcartlist}">
								<ul class="item-content clearfix">
									
									<li class="td td-chk">
										<div class="cart-checkbox ">
											<input class="check" id="J_CheckBox_170037950254" name="items" value="${item.commodity.price * item.comcount}" type="checkbox" onclick="total()">

											<label for="J_CheckBox_170037950254"></label>
										</div>
									</li>
									<li class="td td-item">
										<div class="item-pic">
											<a href="#" target="_blank" data-title="${item.commodity.describe}" class="J_MakePoint" data-point="tbcart.8.12">
												<img src="${item.commodity.picture}" class="itempic J_ItemImg" style="width:82px"></a>
										</div>
										<div class="item-info">
											<div class="item-basic-info">
												<a href="#" target="_blank" title="${item.commodity.describe}" class="item-title J_MakePoint" data-point="tbcart.8.11">${item.commodity.comname}</a>
											</div>
										</div>
									</li>
									<li class="td td-info">
										<div style="height:100px;width:200px;" >
											
										</div>
									</li>
									<li class="td td-price">
										<div class="item-price price-promo-promo">
											<div class="price-content">
												<div class="price-line">
													<em class="price-original">${item.commodity.price}</em>
												</div>
												<div class="price-line">
													<em class="J_Price price-now" tabindex="0">${item.commodity.price}</em>
												</div>
											</div>
										</div>
									</li>
									<li class="td td-amount">
										<div class="amount-wrapper ">
											<div class="item-amount ">
												<div class="sl">
													<input class="text_box" name="comcount" type="text" value="${item.comcount}" style="width:30px;" />
												</div>
											</div>
										</div>
									</li>
									<li class="td td-sum">
										<div class="td-inner">
											<em tabindex="0" class="J_ItemSum number">${item.commodity.price * item.comcount}</em>
										</div>
									</li>
									<li class="td td-op">
										<div class="td-inner">
											<a title="移入收藏夹" class="btn-fav" href="#">
                  								移入收藏夹</a>
											<a href="ShopcartServlet?action=deleteByCartId&shopcartid=${item.shopcartid}" data-point-url="#" class="delete">
                 								 删除</a>
										</div>
									</li>
								</ul>
							</c:forEach>
							</div>
						</div>
					</tr>
				</div>
				<div class="clear"></div>

				<div class="float-bar-wrapper">
					<!-- <div id="J_SelectAll2" class="select-all J_SelectAll">
						<div class="cart-checkbox">
							<input class="check-all check" id="J_SelectAllCbx2" name="select-all" value="true" type="checkbox">
							<label for="J_SelectAllCbx2"></label>
						</div>
						<span>全选</span>
					</div> -->
					<!-- <div class="operations">
						<a href="ShopcartServlet?action=deleteall&check=" hidefocus="true" class="deleteAll" onclick="return checkMyBox()">删除</a>
						<a href="#" hidefocus="true" class="J_BatchFav">移入收藏夹</a>
					</div> -->
					<div class="float-bar-right">
						<div class="amount-sum">
							<span class="txt">已选商品</span>
							<!-- <em id="J_SelectedItemsCount">0</em><span class="txt">件</span> -->
							<div class="arrow-box">
								<span class="selected-items-arrow"></span>
								<span class="arrow"></span>
							</div>
						</div>
						<div class="price-sum">
							<span class="txt">合计:</span>
							<strong class="price">¥<em id="J_Total">0.00</em></strong>
						</div>
						<div class="btn-area">
							<input type="submit" id="J_Go" value="结&nbsp;算" style="font-size:20px;color: white;border: 1px solid grey;"   class="btn-area">
						</div>
					</div>

				</div>

				<jsp:include page="/home/IndexElements/IndexFooter.jsp"></jsp:include>

			</div>
	</form>
			<!--操作页面-->
		<!--引导 -->
		<div class="navCir">
			<li><a href="home2.html"><i class="am-icon-home "></i>首页</a></li>
			<li><a href="sort.html"><i class="am-icon-list"></i>分类</a></li>
			<li class="active"><a href="shopcart.html"><i class="am-icon-shopping-basket"></i>购物车</a></li>	
			<li><a href="<%=basePath%>person/index.html"><i class="am-icon-user"></i>我的</a></li>					
		</div>
	</body>

</html>