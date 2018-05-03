<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html class="no-js" lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="Description" content="">
	<meta name="Author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>taotao-list</title>

	<!-- css -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/elegant-font.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/meanmenu.min.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/animate-heading.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/jquery-ui.css">
	<link rel="stylesheet" href="css/shortcode/shortcodes.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">

	<script src="js/vendor/modernizr-2.8.3.min.js"></script>
	<script type="text/javascript">
		function blockUl(obj) {
			document.getElementById(obj.id+1).style.display="block";
		}
		function noneUl(obj) {
			document.getElementById(obj.id+1).style.display="none";
		}
	</script>
</head>
 
<body class="other-page">
<header>
	<s:if test="#session.existUser.email!=null && (#session.existUser.realname==null || #session.existUser.realname=='')">
		<script type="text/javascript">
			alert("第一次登录，请前往个人中心完善个人信息！");
			window.location.href = "${pageContext.request.contextPath}/user_info.action";
		</script>
	</s:if>
	<!-- 头部列表start -->
	<%@ include file="headerMenu.jsp" %>
	<!-- 头部列表end -->
	
	<!-- 图片start -->
	<div class="banner-area pb-90 pt-160 bg-2">
		<div class="container">
			<div class="row">
				<div class="banner-content text-center text-white">
					<h2>商品列表</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>product list</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页内容start -->
<section class="page-content-wrapper">
	<div class="container">
		<div class="row">
			<div class="content-full pt-50 pb-55 fix">
				<div class="col-md-12">
					<!--NAV PILL-->
					<div class="shop-tab-pill">
						<div class="nav-menu-grid">
							<ul class="nav nav-pills">
								<li class="active">
									<a data-toggle="pill" href="#grid"><i class="icon_grid-2x2"></i></a>
								</li>
								<li>
									<!-- <a data-toggle="pill" href="#list"><i class="icon_menu"></i></a> -->
								</li>
							</ul>
						</div>
						<div class="show-more text-center">
							<h6>商品数量：<s:property value="productNum"/></h6>
						</div>
					</div>
					<!-- NAV PILL -->
				</div>
				<!-- 左边栏start -->
				<div class="col-md-3">
					<div class="right-area pt-35">
						<!-- 所有商品start -->
						<div class="product-filter">
						<h6><a href="${pageContext.request.contextPath}/product_findAll.action?page=1">所有商品</a></h6>
							<!-- 商品分类start -->
							<div class="category mt-50">
								<h5>商品分类</h5>
								<div class="category-list mt-20">
									<ul>
										<s:iterator var="c" value="#session.cList">
										<li onmouseover="blockUl(this)" onmouseout="noneUl(this)" id="<s:property value="#c.cid"/>">
											<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1">
												<i class="zmdi zmdi-chevron-right"> </i> <s:property value="#c.cname"/><span>20</span></a>
											<ul style="display: none;" id="<s:property value="#c.cid"/>1">
												<s:iterator var="cs" value="#c.categorySeconds">
												<li><a href="${pageContext.request.contextPath}/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1" style="font-size: 8px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														<s:property value="#cs.csname"/></a></li>
												</s:iterator>
											</ul>
										</li>
										</s:iterator>
									</ul>
								</div>
							</div>
							<!-- 商品分类end -->
							<!-- 价格区间start -->
							<div class="category mt-50">
								<h5>价格范围 ￥</h5>
								<div class="price-range mt-30">
									<div class="price-filter">
										<div id="slider-range"></div>
										<div class="price-slider-amount">
											<input type="text" id="amount" name="price" placeholder="Add Your Price" />
											<input type="submit" value="确定">
										</div>
									</div>
								</div>
							</div>
							<!-- 价格区间end -->
						</div>
						<!-- 所有商品end -->
						<!-- 最新商品start -->
						<div class="product-filter mt-50">
							<h6>最新商品</h6>
							<div class="new-arrival-area"><br><br>
								<!-- 商品 -->
								<s:iterator var="p" value="nList">
								<div class="new-arrival-single mb-10">
									<div class="arrival-thumbnail">
										<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
											<img src="${pageContext.request.contextPath }/<s:property value="#p.img1"/>" alt="" /></a>
									</div>
									<div class="arrival-content">
										<h6>
											<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
												<s:property value="#p.pname"/></a>
										</h6>
										<div class="price-box">
											<span class="new-price">￥<s:property value="#p.nowprice"/></span>
										</div>
									</div>
								</div>
								</s:iterator>
							</div>
						</div>
						<!-- 最新商品end -->
					</div>
				</div>
				<!-- 左边栏end -->

				<!-- 右区域start -->
				<div class="col-md-9">
					<div class="tab-content">
						<!-- 块状区start -->
						<div id="grid" class="shop-left pt-35 tab-pane fade in active">
							<div class="shop-tab-area">
								<div class="row">
									<s:iterator var="p" value="pageBean.list">
									<!-- 商品 -->
									<div class="col-md-4 col-sm-6">
										<div class="single-product style-two mb-50">
											<div class="single-img">
												<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
												<img width="270px" height="270px" src="<s:property value="#p.img1"/>" alt="" /></a>
												<s:if test="#p.ishot==1">
												<span class="pro-level">热销</span>
												</s:if>
											</div>
											<div class="product-details mt-20" style="width: 250px">
												<h4>
													<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>"><s:property value="#p.pname"/></a>
													<span>taotao自营</span>
												</h4>
												<div class="rating-box">
													<!-- 星级 -->
													<s:if test="#p.star==5">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													</s:if>
													<s:if test="#p.star==4">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													</s:if>
													<s:if test="#p.star==3">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													<i class="fa fa-star"></i>
													</s:if>
													<s:if test="#p.star==2">
													<i class="fa fa-star"></i> <i class="fa fa-star"></i>
													</s:if>
													<s:if test="#p.star==1">
													&nbsp;
													<i class="fa fa-star"></i>
													</s:if>
												</div>
												<div class="price-box">
													<span class="new-price">￥<s:property value="#p.nowprice"/></span>
												</div>
											</div>
										</div>
									</div>
									<!-- 商品end -->
									</s:iterator>
								</div>
							</div>
						</div>
						<!-- 块状区end -->

						<%-- <!-- 列表区start -->
						<div id="list" class="shop-right pt-35 tab-pane fade">
							<div class="row">
								<!-- 商品4 -->
								<s:iterator var="p" value="pageBean.list">
								<div class="col-md-12">
									<div class="blog-single mb-50">
										<div class="blog-img">
											<img src="<s:property value="#p.img1"/>" alt="" />
											<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>" class="icon_link"></a>
											<span class="pro-level">最新</span>
										</div>
										<div class="product-contnt">
											<div class="product-info">
												<div class="pro-titel">
													<span>23957人付款!!</span>
													<h4>
														<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>"><s:property value="#p.pname"/></a>
													</h4>
												</div>
												<div class="pro-rate text-right">
													<div class="rating-box">
														<!-- 星级 -->
														<s:if test="#p.star==5">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														</s:if>
														<s:if test="#p.star==4">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														</s:if>
														<s:if test="#p.star==3">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														<i class="fa fa-star"></i>
														</s:if>
														<s:if test="#p.star==2">
														<i class="fa fa-star"></i> <i class="fa fa-star"></i>
														</s:if>
														<s:if test="#p.star==1">
														<i class="fa fa-star"></i>
														</s:if>
													</div>
													<div class="price-box">
														<span class="new-price">￥<s:property value="#p.nowprice"/></span>
													</div>
												</div>
											</div>
											<div class="pro-text">
												<p><s:property value="#p.desc"/></p>
											</div>
											<div class="pro-social-cart">
												<div class="pro-cart">
													<a href="#">
														添加到购物车 <span class="icon-left" data-icon="&#x24;"></span>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
								</s:iterator>
								<!-- 商品end -->
							</div>
						</div>
						<!-- 列表区end --> --%>
					</div>
				</div>
				<!-- 右区域end -->
				<!-- 页码start -->
				<div class="col-md-12">
					<div class="page-pagination text-center pt-50 sm-p-0">
						<ul>
							<li>
								<font size="4px">第&nbsp;<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;</font>
							</li>
							<!-- 一级分类的分页 -->
							<s:if test="cid != null">
							<li class="active">
								<s:if test="pageBean.page != 1">
								<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page-1"/>">上一页</a>
								</s:if>
								<s:else>
								<font size="4px">上一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							<s:iterator var="i" begin="1" end="pageBean.totalPage">
							<li class="active">
								<s:if test="pageBean.page != #i">
								<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="#i"/>"><s:property value="#i"/></a>
								</s:if>
								<s:else>
								<font size="4px"><s:property value="#i"/>&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:iterator>
							<li class="active">
								<s:if test="pageBean.page != pageBean.totalPage">
								<a href="${pageContext.request.contextPath }/product_findByCid.action?cid=<s:property value="cid" />&page=<s:property value="pageBean.page+1"/>">下一页</a>
								</s:if>
								<s:else>
								<font size="4px">下一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:if>
							<!-- 二级分类的分页 -->
							<s:if test="csid != null">
							<li class="active">
								<s:if test="pageBean.page != 1">
								<a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="pageBean.page-1"/>">上一页</a>
								</s:if>
								<s:else>
								<font size="4px">上一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							<s:iterator var="i" begin="1" end="pageBean.totalPage">
							<li class="active">
								<s:if test="pageBean.page != #i">
								<a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="#i"/>"><s:property value="#i"/></a>
								</s:if>
								<s:else>
								<font size="4px"><s:property value="#i"/>&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:iterator>
							<li class="active">
								<s:if test="pageBean.page != pageBean.totalPage">
								<a href="${pageContext.request.contextPath }/product_findByCsid.action?csid=<s:property value="csid" />&page=<s:property value="pageBean.page+1"/>">下一页</a>
								</s:if>
								<s:else>
								<font size="4px">下一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:if>
							<!-- 所有商品的分页 -->
							<s:if test="csid == null && cid == null">
							<li class="active">
								<s:if test="pageBean.page != 1">
								<a href="${pageContext.request.contextPath }/product_findAll.action?page=<s:property value="pageBean.page-1"/>">上一页</a>
								</s:if>
								<s:else>
								<font size="4px">上一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							<s:iterator var="i" begin="1" end="pageBean.totalPage">
							<li class="active">
								<s:if test="pageBean.page != #i">
								<a href="${pageContext.request.contextPath }/product_findAll.action?page=<s:property value="#i"/>"><s:property value="#i"/></a>
								</s:if>
								<s:else>
								<font size="4px"><s:property value="#i"/>&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:iterator>
							<li class="active">
								<s:if test="pageBean.page != pageBean.totalPage">
								<a href="${pageContext.request.contextPath }/product_findAll.action?page=<s:property value="pageBean.page+1"/>">下一页</a>
								</s:if>
								<s:else>
								<font size="4px">下一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
								</s:else>
							</li>
							</s:if>
						</ul>
					</div>
				</div>
				<!-- 页码end -->
			</div>
		</div>
	</div>
</section>
<!-- 网页内容end -->

<!-- 网站信息start -->
<footer> 
	<%@ include file="footer.jsp" %>
</footer>
<!-- 网站信息end --> 

<!-- all js here -->
<script src="js/vendor/jquery-1.12.4.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/isotope.pkgd.min.js"></script>
<script src="js/jquery.nivo.slider.js"></script>
<script src="js/jquery.simpleLens.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/animated-heading.js"></script>
<script src="js/price-slider.js"></script>
<script src="js/jquery.ajaxchimp.min.js"></script>
<script src="js/jquery.countdown.js"></script>
<script src="js/jquery.meanmenu.js"></script>
<script src="js/plugins.js"></script>
<script src="js/main.js"></script>
</body>
</html>

