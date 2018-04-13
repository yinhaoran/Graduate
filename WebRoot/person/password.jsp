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

		<title>修改密码</title>

		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath%>css/stepstyle.css" rel="stylesheet" type="text/css">

		<script type="text/javascript" src="<%=basePath%>js/jquery-1.7.2.min.js"></script>
		<script src="<%=basePath%>AmazeUI-2.4.2/assets/js/amazeui.js"></script>
 
<!--  		<script type="text/javascript"> -->
<!--  		function checkPassword(){ -->
<!--  			 var url ="ModifyUserPasswordServlet?action=ajxspwd"; -->
<!--  	 		 var param = { -->
<!--  	 			user:$("#user-new-password").val() -->
<!--  	 		}; -->
<!--  	 		$.get(url,param,function(data){ -->
<!--  	 			if(data == "true"){ -->
<!--  	 			   $("#msg").css("color","red"); -->
<!--  	 			   $("#msg").html("密码错误"); -->
<!--  	 		    } else if(data == "false"){ -->
<!--  	 		       $("#msg").css("color","green"); -->
<!--  	 			   $("#msg").html("输入正确"); -->
<!--  	 		    } -->
<!--  	 		}); -->
<!--  		} -->
<!--  		</script> -->
	<script type="text/javascript">
	function checkPassword(){
		var x=document.getElementById("user-new-password").value
		 if(x != ${sessionScope.user.password}){
 	 			   $("#msg").css("color","red"); 
 	 			   $("#msg").html("密码输入有误"); 
 	 			  // alert("密码输入有误")
 	 		    } else {
 	 		       $("#msg").css("color","green");
 	 			   $("#msg").html("输入正确"); 
 	 			//  alert("输入正确")
 	 		    }	
	}
	</script>
	</head>

	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					
					<jsp:include page="/home/IndexElements/IndexTop.jsp"></jsp:include>
<!-- 						${sessionScope.user.nickname}  -->
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

					<div class="am-cf am-padding">
						<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">修改密码</strong> / <small>Password</small></div>
					</div>
					<hr/>
					<!--进度条-->
					<div class="m-progress">
						<div class="m-progress-list">
							<span class="step-1 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">1<em class="bg"></em></i>
                                <p class="stage-name">重置密码</p>
                            </span>
							<span class="step-2 step">
                                <em class="u-progress-stage-bg"></em>
                                <i class="u-stage-icon-inner">2<em class="bg"></em></i>
                                <p class="stage-name">完成</p>
                            </span>
							<span class="u-progress-placeholder"></span>
						</div>
						<div class="u-progress-bar total-steps-2">
							<div class="u-progress-bar-inner"></div>
						</div>
					</div>
					
					<form class="am-form am-form-horizontal" action="ModifyUserPasswordServlet?action=modifypwd" method="post">
						<div class="am-form-group">
							<label for="user-old-password" class="am-form-label">原密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" placeholder="请输入原登录密码" onblur="checkPassword()">
							<span id="msg"></span>
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-new-password" class="am-form-label">新密码</label>
							<div class="am-form-content">
								<input type="password" id="user-new-password" name="newpassword" placeholder="由数字、字母组合">
							</div>
						</div>
						<div class="am-form-group">
							<label for="user-confirm-password" class="am-form-label">确认密码</label>
							<div class="am-form-content">
								<input type="password" name="psssword" id="user-confirm-password" placeholder="请再次输入上面的密码">
							</div>
						</div>
						
						<input type="submit" value="保存修改" class="am-btn am-btn-danger">
					</form>

				</div>
				<!--底部-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">恒望科技</a>
							<b>|</b>
							<a href="#">商城首页</a>
							<b>|</b>
							<a href="#">支付宝</a>
							<b>|</b>
							<a href="#">物流</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">关于恒望</a>
							<a href="#">合作伙伴</a>
							<a href="#">联系我们</a>
							<a href="#">网站地图</a>
							<em>© 2015-2025 Hengwang.com 版权所有. 更多模板 <a href="http://www.cssmoban.com/" target="_blank" title="模板之家">模板之家</a> - Collect from <a href="http://www.cssmoban.com/" title="网页模板" target="_blank">网页模板</a></em>
						</p>
					</div>
				</div>
			</div>
	<!--引导 -->
	<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>
	
	</body>

</html>