<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0 ,minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>结算页面</title>
		<link href="<%=basePath%>/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/basic/css/demo.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/cartstyle.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>/css/jsstyle.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=basePath%>/js/address.js"></script>
	</head>
	<body>
		<!--顶部导航条 -->
				<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>
			<!--悬浮搜索框-->
		 	<div class="nav white">
			<div class="logo"><img src="<%=basePath%>/images/logo.png" /></div>
			<div class="logoBig">
				<li><img src="<%=basePath%>/images/logobig.png" /></li>
			</div>
			<div class="search-bar pr">
				<a name="index_none_header_sysc" href="#"></a>
				<form>
					<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="搜索" autocomplete="off">
					<input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
				</form>
			</div>
		</div> 
	<form action="OrderPostServlet" method="post"> 
		<input type="hidden" name="action" value="orderPost"/>
			<div class="clear"></div>
			<div class="concent">
				<!--地址 -->
				<div class="paycont">
					<div class="address">
						<h3>确认收货地址 </h3>
						<div class="control">
							<div class="tc-btn createAddr theme-login am-btn am-btn-danger">使用新地址</div>
						</div>
						<div class="clear"></div>
						<ul>
							<div class="per-border"></div>
							
							<c:forEach items="${addList}" var="address" varStatus="status">
							<c:if test="${address.sign ==1}">
							<li class="user-addresslist defaultAddr" id="default${status.index}">

								<div class="address-left">
									<div class="user DefaultAddr">

										<span class="buy-address-detail">   

                   <span class="buy-user" id="name${status.index}">${address.receiverperson } </span>
										<span class="buy-phone" id="phone${status.index}">${address.shiptelephone }</span>


										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   		<span class="province" id="province${status.index}">${fn:substring(address.location,0,fn:indexOf(address.location," "))} </span>
										<span class="city" id="city${status.index}">${fn:substringAfter(address.location,fn:substring(address.location,0,fn:indexOf(address.location," ")))}</span>
										
										<span class="street" id="street${status.index}">${address.detailAddress}</span>
										</span>

										</span>
									</div>
									<ins id="deftip${status.index}" class="deftip">默认地址</ins>
								</div>
								<div class="address-right">
									<a href="<%=basePath%>/person/address.html">
										<span class="am-icon-angle-right am-icon-lg"></span></a>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a id="hi${status.index}" class="asd hidden" href="javascript:changeAdd(${status.index},${address.addressid})">设为默认</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:updateAdd(${status.index},${address.addressid})" class="theme-login">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:delClick(${address.addressid},${status.index})">删除</a>
								</div>
							</li>
							<div class="per-border"></div>
							
							</c:if>
							<c:if test="${address.sign==0 }">
							<li class="user-addresslist" id="default${status.index}">
								<div class="address-left">
									<div class="user DefaultAddr">
										<span class="buy-address-detail">   
                   <span class="buy-user" id="name${status.index}">${address.receiverperson }  </span>
										<span class="buy-phone" id="phone${status.index}">${address.shiptelephone }</span>
										</span>
									</div>
									<div class="default-address DefaultAddr">
										<span class="buy-line-title buy-line-title-type">收货地址：</span>
										<span class="buy--address-detail">
								   <span class="province" id="province${status.index}">${fn:substring(address.location,0,fn:indexOf(address.location," "))}</span>
										<span class="city" id="city${status.index}">${fn:substringAfter(address.location,fn:substring(address.location,0,fn:indexOf(address.location," ")))}</span>
										
										<span class="street" id="street${status.index}">${address.detailAddress}</span>
										</span>

										</span>
									</div>
									<ins id="deftip${status.index}" class="deftip hidden">默认地址</ins>
								</div>
								<div class="address-right">
									<span class="am-icon-angle-right am-icon-lg"></span>
								</div>
								<div class="clear"></div>

								<div class="new-addr-btn">
									<a href="javascript:changeAdd(${status.index},${address.addressid})" id="hi${status.index}" class="asd">设为默认</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:updateAdd(${status.index},${address.addressid},${status.index})" class="theme-login">编辑</a>
									<span class="new-addr-bar">|</span>
									<a href="javascript:delClick(${address.addressid},${status.index})">删除</a>
								</div>

							</li>
						</c:if>
						</c:forEach>
						</ul>

						<div class="clear"></div>
					</div>
					<div class="clear"></div>
					<div class="clear"></div>

					<!--订单 -->
					<div class="concent">
						<div id="payTable">
							<h3>确认订单信息</h3>
							<div class="cart-table-th">
								<div class="wp">
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
							</div>
					<div class="clear"></div>
					<c:forEach var="shopcartlist" items="${shopcartlist}">

						
							<tr class="item-list">
								<div class="bundle  bundle-last">

									<div class="bundle-main">
										<ul class="item-content clearfix">
											<div class="pay-phone">
												<li class="td td-item">
													<div class="item-pic">
														<a href="#" class="J_MakePoint">
															<img src="${shopcartlist.commodity.picture}" class="itempic J_ItemImg" style="width:82px"></a>
													</div>
													<div class="item-info">
														<div class="item-basic-info">
															<a href="#" class="item-title J_MakePoint" data-point="tbcart.8.11"> ${shopcartlist.commodity.comname }</a>
														</div>
													</div>
												</li>
												
												<li class="td td-price">
													<div class="item-price price-promo-promo">
														<div class="price-content">
															<em class="J_Price price-now ">${shopcartlist.commodity.price }</em>
														</div>
													</div>
												</li>
											</div>
											<li class="td td-amount">
												<div class="amount-wrapper ">
													<div class="item-amount ">
														<span class="phone-title">购买数量</span>
														<div class="sl">
															
															<label class="text_box" name="commoditycount" style="width:30px;" >
															${shopcartlist.comcount}</label>
														</div>
													</div>
												</div>
											</li>
											<li class="td td-sum">
												<div class="td-inner">
													<em tabindex="0" class="J_ItemSum number">${shopcartlist.comcount * shopcartlist.commodity.price}</em>
												</div>
											</li>
										</ul>
										<div class="clear"></div>
									</div>
							</tr>
							</c:forEach>
							
							<div class="clear"></div>
							</div>
							</div>
							<div class="clear"></div>
							<div class="pay-total">
						<!--留言-->
							<div class="order-extra">
								<div class="order-user-info">
									<div id="holyshit257" class="memo">
										<label>买家留言：</label>
										<input type="text" title="选填,对本次交易的说明（建议填写已经和卖家达成一致的说明）" placeholder="选填,建议填写和卖家达成一致的说明" class="memo-input J_MakePoint c2c-text-default memo-close" name="userwords">
										<div class="msg hidden J-msg">
											<p class="error">最多输入500个字符</p>
										</div>
									</div>
								</div>

							</div>
							<div class="clear"></div>
							</div>
							<!--含运费小计 -->
							<div class="buy-point-discharge ">
								<p class="price g_price ">
									合计（含运费） <span>¥</span><em class="pay-sum" id="pay-sum">0</em>
									<input type="hidden" value="" name="total" id="orderTotal" />
								</p>
							</div>
				
							<!--信息 -->
							<div class="order-go clearfix">
								<div class="pay-confirm clearfix">
									<div class="box">
										<div tabindex="0" id="holyshit267" class="realPay"><em class="t">实付款：</em>
											<span class="price g_price ">
                                    <span>¥</span> <em class="style-large-bold-red " id="J_ActualFee">0</em>
											</span>
										</div>

										<div id="holyshit268" class="pay-address">
											<c:forEach items="${addList}" var="address" varStatus="status">
											<c:if test="${address.sign ==1}">
											<p class="buy-footer-address">
												<span class="buy-line-title buy-line-title-type">寄送至：</span>
												<span class="buy--address-detail">
								  				<span class="province" id="Aprovince">${fn:substring(address.location,0,fn:indexOf(address.location," "))}</span>
												<span class="city" id="Acity">${fn:substringAfter(address.location,fn:substring(address.location,0,fn:indexOf(address.location," ")))}</span>
												<input id="addressid" name="addressid" value="${address.addressid}" type="hidden" />
												<span class="street" id="Astreet">${address.detailAddress}</span>
												</span>
												</span>
											</p>
											<p class="buy-footer-address">
												<span class="buy-line-title">收货人：</span>
												<span class="buy-address-detail">   
                                         <span class="buy-user" id="Aname">${address.receiverperson }</span>
												<span class="buy-phone" id="Aphone">${address.shiptelephone }</span>
												</span>
											</p>
											</c:if>
											</c:forEach>
										</div>
									</div>

									<div id="holyshit269" class="submitOrder">
										<div class="go-btn-wrap">
											<input type="submit" class="btn-go" tabindex="0" title="点击此按钮，提交订单" value="提交订单"/>
											<!-- <a id="J_Go" href="success.html" class="btn-go" tabindex="0" title="点击此按钮，提交订单">提交订单</a>
										 --></div>
									</div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
</form>
						<div class="clear"></div>
					</div>
				</div>
				<jsp:include page="/home/IndexElements/IndexFooter.jsp"></jsp:include>
			</div>
			<div class="theme-popover-mask"></div>
			<div class="theme-popover">

				<!--标题 -->
				<div class="am-cf am-padding">
					<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">新增地址</strong> / <small>Add address</small></div>
				</div>
				<hr/>

				<div class="am-u-md-12">
					<form class="am-form am-form-horizontal" method="post"
									action="<%=basePath%>OrderPostServlet?action=address" onsubmit="return checkAddress()">

						<div class="am-form-group">
							<label for="user-name" class="am-form-label">收货人</label>
							<div class="am-form-content">
								<input type="text" id="user-name" placeholder="收货人" name="receiverperson">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">手机号码</label>
							<div class="am-form-content">
								<input id="user-phone" placeholder="手机号必填" type="text" name="shiptelephone">
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-phone" class="am-form-label">所在地</label>
							<div class="am-form-content address">
								<jsp:include page="/person/myAddress.jsp"></jsp:include>
							</div>
						</div>

						<div class="am-form-group">
							<label for="user-intro" class="am-form-label">详细地址</label>
							<div class="am-form-content">
								<textarea class="" rows="3" id="user-intro" placeholder="输入详细地址" name="detailaddress"></textarea>
								<small>100字以内写出你的详细地址...</small>
								<input type="hidden" id="addressid" name="addressid" value=""/>
							</div>
						</div>

						<div class="am-form-group theme-poptit">
							<div class="am-u-sm-9 am-u-sm-push-3">
								<input value="保存 " type="submit" class="am-btn am-btn-danger"/>
								<div class="am-btn am-btn-danger close">取消</div>
							</div>
						</div>
					</form>
				</div>

			</div>

			<div class="clear"></div>
	</body>
<script>
	function changeAdd(index,id){
		var url = "<%=request.getContextPath()%>/OrderPostServlet?action=changeAddress";
		
		var param ={
			addressid:id
		};
		$.get(url,param,function(data){
			$(".deftip").removeClass("hidden");
			$(".deftip").addClass("hidden");
			$("#deftip"+index).removeClass("hidden");			
			$(".asd").removeClass("hidden");
			$("#hi"+index).addClass("hidden");
			$("#Aname").html($("#name"+index).text());
			$("#Aphone").html($("#phone"+index).text());
			$("#Aprovince").html($("#province"+index).text());
			$("#Acity").html($("#city"+index).text());
			$("#Astreet").html($("#street"+index).text());
			$("#addressid").html(id);
		})
	}
	function updateAdd(index,addressid){
		$("#user-name").val($("#name"+index).text());
		$("#user-phone").val($("#phone"+index).text());
		$("#province option").each(function(){							
							if($(this).val()==$("#province"+index).text()){							
								$(this).val($("#province"+index).text()).attr("selected","selected");
								//console.info(this.value);
								selectprovince(this);
								//
								$("#city option").each(function(){	
									//console.info($(this).val()+"---"+$("#city"+index).text());						
									if($(this).val()==$("#city"+index).text().trim()){							
										$(this).val($("#city"+index).text()).attr("selected","selected");								
									}	
								});	
							}	
						});
		$("#addressid").val(addressid);				
		$("#user-intro").val($("#street"+index).text());
	}

	function delClick(id,i){
		var url = "<%=request.getContextPath()%>/OrderPostServlet?action=deleteAddress";
		
		var param ={
			addressid:id
		};
		if(confirm('确认删除吗？')){
			
			$.get(url,param,function(data){
				if(data=="true"){
					alert("删除成功！");
					$("li#default"+i).remove();
					
					
				}else{
					alert("删除失败！");
					
				}
			})
		}
		
	}
	function checkAddress(){
						
						if($("#user-name").val()==""){
							alert("用户名不能为空");
							return false;
						}
						
					
					
						if($("#user-phone").val()==""){
							alert("手机号码不能为空");
							return false;
						}
						
						if($("#city").val()==""){
							alert("省市不能为空");
							return false;
						}
					
						if($("#user-intro").val()==""){
							alert("详细地址不能为空");
							return false;
						}
						return true;	
					}
			window.onload=function total(){
			 var total = 0;
			$(".J_ItemSum").each(function(){ 	
					
					total += parseInt($(this).text());					
			 });
			 $("#J_ActualFee").html(total);
			  $("#pay-sum").html(total);
			  $("#orderTotal").val(total);
		}
					
</script>
</html>