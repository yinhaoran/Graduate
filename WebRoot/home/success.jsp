<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>付款成功页面</title>

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" />
<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css"
	rel="stylesheet" type="text/css">
<link href="<%=basePath%>basic/css/demo.css" rel="stylesheet"
	type="text/css" />
<link href="<%=basePath%>css/sustyle.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript"
	src="<%=basePath%>basic/js/jquery-1.7.min.js"></script>
</head>
<body>
	<!--顶部导航条 -->
	<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>
	<!--悬浮搜索框-->
	<div class="nav white">
		<div class="logo"><img src="<%=basePath%>images/logo.png" /></div>
		<div class="logoBig">
			<li><img src="<%=basePath%>images/logobig.png" /></li>
	</div>

		<div class="search-bar pr"><a name="index_none_header_sysc"
			href="#"></a>
			<form><input id="searchInput" name="index_none_header_sysc"
				type="text" placeholder="搜索" autocomplete="off"> <input
				id="ai-topsearch" class="submit" value="搜索" index="1" type="submit"></form>
	</div>
</div>
	<div class="clear"></div>
	<div class="take-delivery">
		<div class="status">
			<h2>您已成功付款</h2>
			<div class="successInfo">
				<ul>
					<li>付款金额<em>¥${order.total}</em></li>
					<div class="user-info">
						<p>收货人：${address.receiverperson}</p>
						<p>联系电话：${address.shiptelephone }</p>
						<p>收货地址：${address.location } ${address.detailAddress }</p>
				</div> 请认真核对您的收货信息，如有错误请联系客服
			</ul> <%-- <div class="option">
       <span class="info">您可以</span>
        <a href="<%=basePath%>person/order.html" class="J_MakePoint">查看<span>已买到的宝贝</span></a>
        <a href="<%=basePath%>person/orderinfo.html" class="J_MakePoint">查看<span>交易详情</span></a>
     </div> --%>
		</div>
	</div>
</div>
	<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
</body>
</html>
