<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">

		<title>安全设置</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath%>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/infstyle.css" rel="stylesheet" type="text/css">
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
				</div>
			</article>
		</header>
            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">全部分类</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">首页</a></li>
                                <li class="qc"><a href="#">闪购</a></li>
                                <li class="qc"><a href="#">限时抢</a></li>
                                <li class="qc"><a href="#">团购</a></li>
                                <li class="qc last"><a href="#">大包装</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>我的福利
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<!--标题 -->
					<div class="user-safety">
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">账户安全</strong> / <small>Set&nbsp;up&nbsp;Safety</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">

							<div class="filePic">
								<img class="am-circle am-img-thumbnail" src="<%=basePath%>images/getAvatar.do.jpg" alt="" />
							</div>

							<p class="am-form-help">头像</p>

							<div class="info-m">
								<div><b>用户名：<i>小叮当</i></b></div>
								<div class="u-level">
									<span class="rank r2">
							             <s class="vip1"></s><a class="classes" href="#">铜牌会员</a>
						            </span>
								</div>
								<div class="u-safety">
									<a href="<%=basePath%>person/safety.jsp">
									 账户安全
									<span class="u-profile"><i class="bc_ee0000" style="width: 60px;" width="0">60分</i></span>
									</a>
								</div>
							</div>
						</div>

						<div class="check">
							<ul>
								<li>
									<i class="i-safety-lock"></i>
									<div class="m-left">
										<div class="fore1">登录密码</div>
										<div class="fore2"><small>为保证您购物安全，建议您定期更改密码以保护账户安全。</small></div>
									</div>
									<div class="fore3">
										<a href="<%=basePath%>person/password.jsp">
											<div class="am-btn am-btn-secondary">修改密码</div>
										</a>
									</div>
								</li>
								
								
							</ul>
						</div>

					</div>
				</div>
				<!--底部-->
				<jsp:include page="/person/personElements/personFooter.jsp"></jsp:include>
			</div>
		<!--引导 -->
		<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>
		
		</div>

	</body>

</html>