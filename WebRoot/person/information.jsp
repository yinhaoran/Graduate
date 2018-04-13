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

		<title>个人资料</title>

		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="<%=basePath %>css/personal.css" rel="stylesheet" type="text/css">
		<link href="<%=basePath %>css/infstyle.css" rel="stylesheet" type="text/css">
		<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
		<script src="<%=basePath %>AmazeUI-2.4.2/assets/js/amazeui.js" type="text/javascript"></script>
			
	</head>
	<%-- <script src="<%=basePath %>/Manage/js/jquery-ui-1.8.21.custom.min.js"></script>
	<script type="text/javascript" src="/js/jquery-1.8.3.js"></script> --%>
	
	<script src="<%=basePath%>js/showdate.js"></script>
	<script type="text/javascript">
		
		
 
	
	</script>
	
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
								<li><img src="<%=basePath %>images/logobig.png" /></li>
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

					<div class="user-info">
						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">个人资料</strong> / <small>Personal&nbsp;information</small></div>
						</div>
						<hr/>

						<!--头像 -->
						<div class="user-infoPic">
							<div class="filePic">
								<input type="file" class="inputPic" allowexts="gif,jpeg,jpg,png,bmp" accept="image/*">
								<img class="am-circle am-img-thumbnail" src="<%=basePath %>images/getAvatar.do.jpg" alt="" />
							</div>
							<p class="am-form-help">头像</p>
							<div class="info-m">
								<div><b>账号: <i>${user.email}</i></b></div>
							</div>
						</div>
						<form class="am-form am-form-horizontal" action="InformationServlet?action=savePerson" method="post">
						<!--个人信息 -->
						<c:if test="${user.nickname!=null}">
						<div class="info-main">
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" name="nickname" id="user-name2" placeholder="nickname" value="${user.nickname}">
						
									</div>
								</div>
						</c:if>
						<c:if test="${sessionScope.user.nickname==null}">
						<div class="info-main">
								<div class="am-form-group">
									<label for="user-name2" class="am-form-label">昵称</label>
									<div class="am-form-content">
										<input type="text" name="nickname" id="user-name2" placeholder="nickname">
						
									</div>
								</div>
						</c:if>		
						<c:if test="${user.realname!=null}">
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" name="realname" id="user-name2" placeholder="name" value="${user.realname }">

									</div>
								</div>
						</c:if>
						<c:if test="${user.realname==null}">
								<div class="am-form-group">
									<label for="user-name" class="am-form-label">姓名</label>
									<div class="am-form-content">
										<input type="text" name="realname" id="user-name2" placeholder="name">

									</div>
								</div>
						</c:if>
						
						<c:if test="${user.sex==null}">	
								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="0" data-am-ucheck> 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="1" data-am-ucheck> 女
										</label>
									</div>
								</div>
						</c:if>
						<c:if test="${user.sex!=null}">	
								<div class="am-form-group">
									<label class="am-form-label">性别</label>
									<div class="am-form-content sex">
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="0" data-am-ucheck <c:if test="${user.sex=='0'}">checked</c:if> > 男
										</label>
										<label class="am-radio-inline">
											<input type="radio" name="radio10" value="1" data-am-ucheck  <c:if test="${user.sex=='1'}">checked</c:if>> 女
										</label>
									</div>
								</div>
						</c:if>
						<c:if test="${user.birthday==null}">	
								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<div style="width:520px;margin:0 auto" >
											<input type="text" id="time" name="birthday" value="选择时间" readonly="readonly" onclick="return Calendar('time');" class="text_time" style=" margin-left: -45px;cursor:pointer">
										</div>
									</div>
								</div>	
						</c:if>	
						
						<c:if test="${user.birthday!=null}">	
								<div class="am-form-group">
									<label for="user-birth" class="am-form-label">生日</label>
									<div class="am-form-content birth">
										<div style="width:520px;margin:0 auto" >
											<input type="text" id="time"  name="birthday" value="${user.birthday}" readonly="readonly" onclick="return Calendar('time');" class="text_time" style=" margin-left: -45px;cursor:pointer">
										</div>
									</div>
						
								</div>
						</c:if>		
						
						<c:if test="${user.telephone!=null}">	
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="telephone" placeholder="telephonenumber" type="tel" value="${user.telephone }">

									</div>
								</div>
						</c:if>
						<c:if test="${user.telephone==null}">	
								<div class="am-form-group">
									<label for="user-phone" class="am-form-label">电话</label>
									<div class="am-form-content">
										<input id="user-phone" name="telephone" placeholder="telephonenumber" type="tel" >

									</div>
								</div>
						</c:if>				
								
						<c:if test="${user.email==null}">
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email"  name="email" placeholder="Email" type="email">

									</div>
								</div>
						</c:if>
						<c:if test="${user.email!=null}">
								<div class="am-form-group">
									<label for="user-email" class="am-form-label">电子邮件</label>
									<div class="am-form-content">
										<input id="user-email" name="email" placeholder="Email" type="email" value="${user.email }">

									</div>
								</div>
						</c:if>
								
								<div class="info-btn">
									<button class="am-btn am-btn-danger" on>保存修改</button>
								</div>

					</form>
						</div>

					</div>

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

			<jsp:include page="/home/IndexElements/userLeft.jsp"></jsp:include>
		</div>
	
 
 
	</body>

</html>