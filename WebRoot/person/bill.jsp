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

		<title>ä¸ªäººè´¦å</title>

		<link href="../AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="../AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">

		<link href="../css/personal.css" rel="stylesheet" type="text/css">
		<link href="../css/blstyle.css" rel="stylesheet" type="text/css">
		<script src="../AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
	</head>

	<body>
		<!--å¤´ -->
		<header>
			<article>
				<div class="mt-logo">
					<!--é¡¶é¨å¯¼èªæ¡ -->
					<div class="am-container header">
						<ul class="message-l">
							<div class="topMessage">
								<div class="menu-hd">
									<a href="#" target="_top" class="h">äº²ï¼è¯·ç»å½</a>
									<a href="#" target="_top">åè´¹æ³¨å</a>
								</div>
							</div>
						</ul>
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="#" target="_top" class="h">ååé¦é¡µ</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="#" target="_top"><i class="am-icon-user am-icon-fw"></i>ä¸ªäººä¸­å¿</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" href="#" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>è´­ç©è½¦</span><strong id="J_MiniCartNum" class="h">0</strong></a></div>
							</div>
							<div class="topMessage favorite">
								<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>æ¶èå¤¹</span></a></div>
						</ul>
						</div>

						<!--æ¬æµ®æç´¢æ¡-->

						<div class="nav white">
							<div class="logoBig">
								<li><img src="../images/logobig.png" /></li>
							</div>

							<div class="search-bar pr">
								<a name="index_none_header_sysc" href="#"></a>
								<form>
									<input id="searchInput" name="index_none_header_sysc" type="text" placeholder="æç´¢" autocomplete="off">
									<input id="ai-topsearch" class="submit am-btn" value="æç´¢" index="1" type="submit">
								</form>
							</div>
						</div>

						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>

            <div class="nav-table">
					   <div class="long-title"><span class="all-goods">å¨é¨åç±»</span></div>
					   <div class="nav-cont">
							<ul>
								<li class="index"><a href="#">é¦é¡µ</a></li>
                                <li class="qc"><a href="#">éªè´­</a></li>
                                <li class="qc"><a href="#">éæ¶æ¢</a></li>
                                <li class="qc"><a href="#">å¢è´­</a></li>
                                <li class="qc last"><a href="#">å¤§åè£</a></li>
							</ul>
						    <div class="nav-extra">
						    	<i class="am-icon-user-secret am-icon-md nav-user"></i><b></b>æçç¦å©
						    	<i class="am-icon-angle-right" style="padding-left: 10px;"></i>
						    </div>
						</div>
			</div>
			<b class="line"></b>

		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-bill">
						<!--æ é¢ -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">è´¦å</strong> / <small>Electronic&nbsp;bill</small></div>
						</div>
						<hr/>

						<div class="ebill-section">
							<div class="ebill-title-section">
								<h2 class="trade-title section-title">
                                                                                                                                     äº¤æ
                            <span class="desc">ï¼éé¢åä½ï¼åï¼</span>
                        </h2>

								<div class=" ng-scope">
									<div class="trade-circle-select  slidedown-">
										<a href="javascript:void(0);" class="current-circle ng-binding">2015/11/01 - 2015/11/30</a>

									</div>
									<span class="title-tag"><i class="num ng-binding">12</i>æ</span>
								</div>
							</div>

							<div class="module-income ng-scope">
								<div class="income-slider ">
									<div class="block-income block  fn-left">
										<h3 class="income-title block-title">
                                                                                                          æ¯åº
                                      <span class="num ng-binding">
                                              119.80
                                       </span>
                                    <span class="desc ng-binding">
                                           <a href="billlist.html">æ¥çæ¯åºæç»</a>
                                         </span>
                                             </h3>

										<div ng-class="shoppingChart" class="catatory-details  fn-hide shopping">
											<div class="catatory-chart fn-left fn-hide">
												<div class="title">ç±»å</div>
												<ul>


												</ul>
											</div>
											<div class="catatory-detail fn-left">
												<div class="title ng-binding">
													è´­ä¹°åå
												</div>
												<ul>
												
													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="å¢å­å¤§è¡£">
																<span class="emoji-span ng-binding">å¢å­å¤§è¡£</span>
																<span class="amount fn-right ng-binding">349.00</span>
															</a>
														</div>
													</li>

													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="éå£«é¡¿ç¾å¹´ééç16gUç">
																<span class="emoji-span ng-binding">éå£«é¡¿ç¾å¹´ééç16gUç</span>
																<span class="amount fn-right ng-binding">39.00</span>
															</a>
														</div>
													</li>

													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="å¢å­å¤§è¡£">
																<span class="emoji-span ng-binding">å¢å­å¤§è¡£</span>
																<span class="amount fn-right ng-binding">349.00</span>
															</a>
														</div>
													</li>

													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="éå£«é¡¿ç¾å¹´ééç16gUç">
																<span class="emoji-span ng-binding">éå£«é¡¿ç¾å¹´ééç16gUç</span>
																<span class="amount fn-right ng-binding">39.00</span>
															</a>
														</div>
													</li>

													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="å¢å­å¤§è¡£">
																<span class="emoji-span ng-binding">å¢å­å¤§è¡£</span>
																<span class="amount fn-right ng-binding">349.00</span>
															</a>
														</div>
													</li>

													<li class="ng-scope  delete-false">

														<div class="  ng-scope">
															<a href="#" class="text fn-left " title="ç¾æ¯æ¯¡åºéå«">
																<span class="emoji-span ng-binding">ç¾æ¯æ¯¡åºéå«</span>
																<span class="amount fn-right ng-binding">9.90</span>
															</a>
														</div>
													</li>

												</ul>
											</div>
										</div>
									</div>
									<div class="block-expense block  fn-left">
										<div class="slide-button right"></div>
									</div>
									<div class="clear"></div>

									<!--æ¶å¥-->
									<h3 class="expense income-title block-title">
                                                                                                                       æ¶å¥                                                              
                                      <span class="num ng-binding">
                                              0.00
                                       </span>
                                    <span class="desc ng-binding">
                                           <a href="billlist.html">æ¥çæ¶å¥æç»</a>
                                    </span>
                                </h3>
								</div>

								<!--æ¶è´¹èµ°å¿-->
								<div class="module-consumeTrend inner-module">
									<h3 class="module-title">æ¶è´¹èµ°å¿</h3>
									<div id="consumeTrend-chart" class="consumeTrend-chart">

									</div>
								</div>

								<!--é¶è¡å¡ä½¿ç¨æåµ-->

								<div class="module-card inner-module">
									<h3 class="module-title">é¶è¡å¡ä½¿ç¨æåµ</h3>
									<div class="card-chart valid">
										<div class="cards-carousel">
											<div class="mask">

												<div class="bac fn-left"></div>
												<div class="bank ng-binding" style="background-image: url(../images/combo.png);">ä¸­å½åä¸é¶è¡</div>
												<div class="details">
													<a>æ¥çè¯¦æ</a>
												</div>
											</div>
										</div>
										<div class="cards-details">
											<div class="bank-name">
												<div class="name fn-left" style="background-image: url(../images/combo.png);"></div>
												<span class="close fn-right"><a>X</a></span>
											</div>
											<div class="bank-detail">
												<div class="totalin fn-left">
													<span class="fn-left">æµå¥</span>
													<span class="amount fn-right">0.00</span>
												</div>
												<div class="totalout fn-left">
													<span class="fn-left">æµåº</span>
													<span class="amount fn-right">0.00</span>
												</div>
												<div class="expand fn-left">
													<span class="fn-left">æ¯åº</span>
													<span class="amount fn-right">0.00</span>
												</div>
												<div class="withdraw fn-left">
													<span class="fn-left">æç°</span>
													<span class="amount fn-right">
							                                0.00
                            						</span>
												</div>
												<div class="recharge fn-left">
													<span class="fn-left">åå¼</span>
													<span class="amount fn-right">
                                                            0.00
                            						</span>
												</div>

												<div class="refund fn-left">
													<span class="fn-left">é¶è¡å¡éæ¬¾</span>
													<span class="amount fn-right ">0.00</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<script>
									$(document).ready(function (ev) {
								
									    $('.cards-carousel .details').on('click', function (ev) {
								             $('.cards-details').css("display","block");
								             $('.cards-carousel').css("display","none");								 
									    });									   									    
								
									    $('.cards-details .close').on('click', function (ev) {
								             $('.cards-details').css("display","none");
								             $('.cards-carousel').css("display","block");								 
									    });									    
									    									   								    
									});
								</script>

							</div>

						</div>

					</div>
				</div>
				<!--åºé¨-->
				<div class="footer">
					<div class="footer-hd">
						<p>
							<a href="#">ææç§æ</a>
							<b>|</b>
							<a href="#">ååé¦é¡µ</a>
							<b>|</b>
							<a href="#">æ¯ä»å®</a>
							<b>|</b>
							<a href="#">ç©æµ</a>
						</p>
					</div>
					<div class="footer-bd">
						<p>
							<a href="#">å³äºææ</a>
							<a href="#">åä½ä¼ä¼´</a>
							<a href="#">èç³»æä»¬</a>
							<a href="#">ç½ç«å°å¾</a>
							<em>Â© 2015-2025 Hengwang.com çæææ. æ´å¤æ¨¡æ¿ <a href="http://www.cssmoban.com/" target="_blank" title="æ¨¡æ¿ä¹å®¶">æ¨¡æ¿ä¹å®¶</a> - Collect from <a href="http://www.cssmoban.com/" title="ç½é¡µæ¨¡æ¿" target="_blank">ç½é¡µæ¨¡æ¿</a></em>
						</p>
					</div>
				</div>

			</div>

			<aside class="menu">
				<ul>
					<li class="person">
						<a href="index.html">ä¸ªäººä¸­å¿</a>
					</li>
					<li class="person">
						<a href="#">ä¸ªäººèµæ</a>
						<ul>
							<li> <a href="information.html">ä¸ªäººä¿¡æ¯</a></li>
							<li> <a href="safety.html">å®å¨è®¾ç½®</a></li>
							<li> <a href="address.html">æ¶è´§å°å</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">æçäº¤æ</a>
						<ul>
							<li><a href="order.html">è®¢åç®¡ç</a></li>
							<li> <a href="change.html">éæ¬¾å®å</a></li>
						</ul>
					</li>
					<li class="person">
						<a href="#">æçèµäº§</a>
						<ul>
							<li> <a href="coupon.html">ä¼æ å¸ </a></li>
							<li> <a href="bonus.html">çº¢å</a></li>
							<li class="active"> <a href="bill.html">è´¦åæç»</a></li>
						</ul>
					</li>

					<li class="person">
						<a href="#">æçå°çª</a>
						<ul>
							<li> <a href="collection.html">æ¶è</a></li>
							<li> <a href="foot.html">è¶³è¿¹</a></li>
							<li> <a href="comment.html">è¯ä»·</a></li>
							<li> <a href="news.html">æ¶æ¯</a></li>
						</ul>
					</li>

				</ul>

			</aside>
		</div>

	</body>

</html>