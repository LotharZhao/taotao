<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8">
	<meta http-equiv="x-ua-compatible" content="ie=edge">
	<meta name="Description" content="">
	<meta name="Author" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>taotao</title>

	<!-- css -->
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/elegant-font.css">
	<link rel="stylesheet" href="css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="css/meanmenu.min.css">
	<link rel="stylesheet" href="css/animate.css">
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/animate-heading.css">
	<link rel="stylesheet" href="css/owl.carousel.min.css">
	<link rel="stylesheet" href="css/owl.theme.default.min.css">
	<link rel="stylesheet" href="css/shortcode/shortcodes.css">
	<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/responsive.css">

	<script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!-- 头部start -->
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
	
	<!-- 头部滑动start -->
	<div class="slider-area">
		<div class="bend niceties preview">
			<div id="ensign-nivoslider" class="slides"> 
				<!-- 滑动图片 -->
				<img src="img/slider/1.jpg" alt="" title="#slider-direction-1" />
				<img src="img/slider/2.jpg" alt="" title="#slider-direction-1" />
			</div>
			<div id="slider-direction-1" class="slider-direction">
				<div class="slider-content text-center s-tb slider-1">
					<div class="title-container s-tb-c title-compress">
						<!-- 小标题 -->
						<h2 class="title2"><span class="icon-left" data-icon="&#x7b;"></span>
						taotao
						<span class="icon-right" data-icon="&#x7b;"></span></h2>
						<!-- 大标题 -->
						<h1 class="title1">涛涛水族用品</h1>
						<!-- 链接商品详情按钮 -->
						<div class="slider-btn text-uppercase">
							<a href="${pageContext.request.contextPath}/product_findAll.action?page=1">开始购物 <span class="icon-left" data-icon="&#x24;"></span></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 头部滑动end --> 
</header>
<!-- 头部end --> 

<!-- 网页内容start -->
<div class="page-content-wrapper">
	<!-- 分类链接start -->
	<section class="category-banner pb-65 pt-40">
		<div class="container">
			<div class="row"> 
				<!-- 分类链接 -->
				<s:iterator var="c" value="#session.cList">
				<div class="col-md-2 col-sm-4 col-xs-12 res-mb-25">
					<div class="cate-bnr-sngle">
						<img src="${pageContext.request.contextPath }/<s:property value="#c.img"/>" alt="" />
						<div class="cate-content text-center">
							<h6><s:property value="#c.cname"/></h6><br><br><br><br>
							<a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1">点击进入</a>
						</div>
					</div>
				</div>
				</s:iterator>
			</div>
		</div>
	</section>
	<!-- 分类链接end --> 
	
	<!-- 广告start -->
	<section class="adds-area">
		<div class="container-fluid">
			<div class="row">
				<!-- 大广告左 -->
				<div class="col-md-4 col-sm-6 col-xs-12 res-mb-25">
					<div class="adds-left">
						<div class="single-adds f-left">
							<!-- 大广告左图片 -->
							<img src="${pageContext.request.contextPath }/<s:property value="dig1Abvert.img"/>" alt="" />
							<div class="adds-content text-uppercase">
								<h2><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="dig1Abvert.pid"/>"><s:property value="dig1Abvert.adname"/></a></h2>
								<h3>￥<s:property value="dig1Abvert.adprice"/></h3>
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="dig1Abvert.pid"/>">查看详情 <span class="icon-left" data-icon="&#x24;"></span></a>
								<div class="text-center">
									<div class="offer-box">
										<h3>80%</h3>
										<span>sale</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- 小广告 -->
				<div class="col-md-4 hidden-sm hidden-xs">
					<div class="adds-middle">
						<s:iterator var="sm" value="smList">
						<div class="middle-single lr-25 mb-30 fix">
							<!-- 小广告上图片 -->
							<img src="${pageContext.request.contextPath }/<s:property value="#sm.img"/>" alt="" />
							<div class="middle-content">
								<h2><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#sm.pid"/>"><s:property value="#sm.adname"/></a></h2>
								<h3>￥<s:property value="#sm.adprice"/></h3>
							</div>
						</div>
						</s:iterator>
						<%-- <div class="middle-single">
							<!-- 小广告下图片 -->
							<img src="img/adds/3.jpg" alt="" />
							<div class="middle-content">
								<h2><a href="single-product.html">小广告下</a></h2>
								<h3>20RMB</h3>
							</div>
						</div>--%>
					</div>
				</div>
				<!-- 大广告右 -->
				<div class="col-md-4 col-sm-6 col-xs-12">
					<div class="adds-right">
						<div class="single-adds">
							<!-- 大广告右图片 -->
							<img src="${pageContext.request.contextPath }/<s:property value="dig2Abvert.img"/>" alt="" />
							<div class="adds-content text-uppercase">
								<h2><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="dig2Abvert.pid"/>"><s:property value="dig2Abvert.adname"/></a></h2>
								<h3>￥<s:property value="dig2Abvert.adprice"/></h3>
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="dig2Abvert.pid"/>">查看详情 <span class="icon-left" data-icon="&#x24;"></span></a>
								<div class="text-center">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 广告end --> 
	
	<!-- 热门单品start -->
	<!-- 至少5个有滑动 -->
	<section class="top-sale-month-area ptb-50"> 
		<!-- 小标题 -->
		<div class="section-titel style-two text-center mb-115 text-uppercase">
			<h3>热&nbsp;&nbsp;&nbsp;&nbsp;门&nbsp;&nbsp;&nbsp;&nbsp;单&nbsp;&nbsp;&nbsp;&nbsp;品</h3>
		</div>
		<div class="container">
			<div class="row">
				<div class="product-gallery owl-carousel owl-theme"> 
					<!-- 热门单品 -->
					<s:iterator var="p" value="hList">
					<div class="col-md-12 item">
						<div class="single-product">
							<div class="single-img">
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
								<img src="${pageContext.request.contextPath }/<s:property value="#p.img1"/>" alt="" /></a> 
							</div>
							<div class="product-details mt-20">
								<h4>
									<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#p.pid"/>">
										<s:property value="#p.pname"/></a>
									<span class="new-price">￥<s:property value="#p.nowprice"/></span>
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
									<i class="fa fa-star"></i>
									</s:if>
								</div>
							</div>
						</div>
					</div>
					</s:iterator>
				</div>
			</div>
		</div>
	</section>
	<!-- 热门单品end -->
	
	<!-- 限时抢购start -->
	<section class="deal-month-area ptb-50 dark-gray-bg"> 
		<!-- 小标题 -->
		<div class="section-titel text-center mb-85 text-uppercase">
			<h3>限&nbsp;&nbsp;&nbsp;&nbsp;时&nbsp;&nbsp;&nbsp;&nbsp;抢&nbsp;&nbsp;&nbsp;&nbsp;购</h3>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-sm-6 col-xs-12 res-mb-25">
					<div class="deal-month-left">
						<!-- 限时抢购图片 -->
						<img src="${pageContext.request.contextPath }/<s:property value="flashSale.img"/>" alt="" />
					</div>
				</div>
				<div class="col-md-6 col-sm-6 col-xs-12">
					<div class="deal-month-right white-bg p-20">
						<span class="titel">数量有限</span>
						<div class="main-content">
							<h2><a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="flashSale.pid"/>"><s:property value="flashSale.adname"/></a></h2>
							<h4>RMB <s:property value="flashSale.adprice"/></h4>
							<p><s:property value="flashSale.desc"/></p>
							<div class="count-down-area">
								<div class="timer default-bg">
									<div data-countdown='<s:property value="flashSale.adtime"/>'></div><!-- 截至时间 --> 
								</div>
							</div>
							<div class="deal-btn mt-40">
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="flashSale.pid"/>">查看详情</a><span class="titel f-right">
								<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="flashSale.pid"/>">查看详情...</a></span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 限时抢购end --> 
</div>
<!-- 网页内容end -->

<!-- Support Area Start -->
<section class="service-area default-bg ptb-20">
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="single-service mt-50"> <span class="icon_lock_alt"></span>
					<h4>正品行货</h4>
					<p>涛涛水族用品所售商品均经过精挑细选，承诺100%正品；给予用户的不仅是优良商品，更是品质生活。</p>
				</div>
			</div>
			<div class="col-md-4 hidden-sm hidden-xs">
				<div class="single-service middle-border mt-50"> <span class="icon_gift"></span>
					<h4>全国包邮速达</h4>
					<p>涛涛水族用品物流覆盖全国600多个城市，接近45000个乡镇区域，拥有354个仓储，数万经验丰富的物流配送人员，全国绝大部分城市实现次日达，确保做到快速配送。</p>
				</div>
			</div>
			<div class="col-md-4 col-sm-6 col-xs-12">
				<div class="single-service mt-50"> <span class="icon_refresh"></span>
					<h4>七天无理由退换货</h4>
					<p>在签收货物后7天内，若因买家主观原因不愿完成本次交易，涛涛水族用品向买家提供退换货服务。</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Support Area End --> 

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
