<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Free HTML5 Bootstrap Admin Template</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description"
	content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
<meta name="author" content="Muhammad Usman">

<!-- The styles -->
<link href="<%=basePath%>Manage/css/bootstrap-cerulean.css"
	rel="stylesheet">
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<%=basePath%>Manage/css/bootstrap-responsive.css"
	rel="stylesheet">
<link href="<%=basePath%>Manage/css/charisma-app.css" rel="stylesheet">
<link href="<%=basePath%>Manage/css/jquery-ui-1.8.21.custom.css"
	rel="stylesheet">
<link href='<%=basePath%>Manage/css/fullcalendar.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/fullcalendar.print.css'
	rel='stylesheet' media='print'>
<link href='<%=basePath%>Manage/css/chosen.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/uniform.default.css'
	rel='stylesheet'>
<link href='<%=basePath%>Manage/css/colorbox.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/jquery.cleditor.css'
	rel='stylesheet'>
<link href='<%=basePath%>Manage/css/jquery.noty.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/noty_theme_default.css'
	rel='stylesheet'>
<link href='<%=basePath%>Manage/css/elfinder.min.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/elfinder.theme.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/jquery.iphone.toggle.css'
	rel='stylesheet'>
<link href='<%=basePath%>Manage/css/opa-icons.css' rel='stylesheet'>
<link href='<%=basePath%>Manage/css/uploadify.css' rel='stylesheet'>
<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
<!-- The fav icon -->
<link rel="shortcut icon" href="<%=basePath%>Manage/img/favicon.ico">
</head>
<script type="text/javascript">
	
</script>
<body>
	<!-- topbar starts -->
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container-fluid">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
				</a>
				<!-- <a class="brand" href="index.html"> <img alt="Charisma Logo" src="img/logo20.png" /> <span>Charisma</span></a> -->
				<div class="btn-group pull-right">
					<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
						<i class="icon-user"></i><span class="hidden-phone"> 管理员</span> <span
						class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class="divider"></li>
						<li><a href="login.html">登录界面</a></li>
					</ul>
				</div>
				<!-- user dropdown ends -->
				<div class="top-nav nav-collapse">
					<ul class="nav">
						<li><a href="#">欢迎进入管理员管理界面</a></li>
						<li>
							<form class="navbar-search pull-left">
								<input placeholder="Search" class="search-query span2"
									name="query" type="text">
							</form>
						</li>
					</ul>
				</div>
				<!--/.nav-collapse -->
			</div>
		</div>
	</div>
	<!-- topbar ends -->
	<div class="container-fluid">
		<div class="row-fluid">
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>
						You need to have <a href="http://en.wikipedia.org/wiki/JavaScript"
							target="_blank">JavaScript</a> enabled to use this site.
					</p>
				</div>
			</noscript>
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2>
							<i class="icon-edit"></i>修改信息
						</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i
								class="icon-cog"></i></a> <a href="#"
								class="btn btn-minimize btn-round"><i
								class="icon-chevron-up"></i></a> <a href="#"
								class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" method="post"
							action="ManageUserServlet?action=doUpdate">
							<fieldset>
								<input type="hidden" name="userid" value="${user.userid }">
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">用户名:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="username"
											value="${user.nickname }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">密码:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="password"
											value="${user.password }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">真实姓名:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="realname"
											value="${user.realname }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">邮箱:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="email"
											value="${user.email }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">性别:</label>
									<div class="controls">
										<%-- <input type="text" id="inputSuccess" name="sex"
											value="${user.sex}"> --%>
										<c:if test="${user.sex==0}">
											<input type="text" id="inputSuccess" name="sex" value="男">
										</c:if>
										<c:if test="${user.sex==1}">
											<input type="text" id="inputSuccess" name="sex" value="女 ">
										</c:if>
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">电话号码:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="telephone"
											value="${user.telephone }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">出生日期:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="birthday"
											value="${user.birthday }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">身份证号:</label>
									<div class="controls">
										<input type="text" id="inputSuccess" name="idnumber"
											value="${user.idnumber }">
									</div>
								</div>
								<div class="control-group success">
									<label class="control-label" for="inputSuccess">身份:</label>
									<div class="controls">
										<c:if test="${user.sign==0}">
											<input type="text" id="inputSuccess" name="status"
												value="普通会员">
										</c:if>
										<c:if test="${user.sign==1}">
											<input type="text" id="inputSuccess" name="status"
												value="管理员">
										</c:if>
									</div>
								</div>
								<div class="form-actions">
									<button type="submit" class="btn btn-primary">修改</button>
									<button type="reset" class="btn">取消</button>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
				<!--/span-->
			</div>
			<!--/row-->
			<!-- content ends -->
		</div>
		<!--/#content.span10-->
	</div>
	<!--/fluid-row-->
	<hr>
	<div class="modal hide fade" id="myModal">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">×</button>
			<h3>Settings</h3>
		</div>
		<div class="modal-body">
			<p>Here settings can be configured...</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">Close</a> <a href="#"
				class="btn btn-primary">Save changes</a>
		</div>
	</div>
	<footer>
		<p class="pull-left">&copy; 2017年</p>
	</footer>
	</div>
	<!--/.fluid-container-->
	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="<%=basePath%>Manage/js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="<%=basePath%>Manage/js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="<%=basePath%>Manage/js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="<%=basePath%>Manage/js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="<%=basePath%>Manage/js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="<%=basePath%>Manage/js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="<%=basePath%>Manage/js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="<%=basePath%>Manage/js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="<%=basePath%>Manage/js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="<%=basePath%>Manage/js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="<%=basePath%>Manage/js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="<%=basePath%>Manage/js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="<%=basePath%>Manage/js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="<%=basePath%>Manage/js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="<%=basePath%>Manage/js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="<%=basePath%>Manage/js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='<%=basePath%>Manage/js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='<%=basePath%>Manage/js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="<%=basePath%>Manage/js/excanvas.js"></script>
	<script src="<%=basePath%>Manage/js/jquery.flot.min.js"></script>
	<script src="<%=basePath%>Manage/js/jquery.flot.pie.min.js"></script>
	<script src="<%=basePath%>Manage/js/jquery.flot.stack.js"></script>
	<script src="<%=basePath%>Manage/js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="<%=basePath%>Manage/js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="<%=basePath%>Manage/js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="<%=basePath%>Manage/js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="<%=basePath%>Manage/js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="<%=basePath%>Manage/js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="<%=basePath%>Manage/js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="<%=basePath%>Manage/js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="<%=basePath%>Manage/js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="<%=basePath%>Manage/js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="<%=basePath%>Manage/js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="<%=basePath%>Manage/js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="<%=basePath%>Manage/js/charisma.js"></script>


</body>
</html>
