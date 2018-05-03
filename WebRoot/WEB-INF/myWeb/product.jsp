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
	<title>taotao-product</title>

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
		function saveCart() {
			document.getElementById("cartForm").submit();
		}
	</script>
</head>
 
<body class="other-page">
<header>
	<!-- 头部列表start -->
	<%@ include file="headerMenu.jsp" %>
	<!-- 头部列表end -->
	
	<!-- 图片start -->
	<div class="banner-area pb-90 pt-160 bg-2">
		<div class="container">
			<div class="row">
				<div class="banner-content text-center text-white">
					<h2>查看商品</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>product</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页内容start -->
<section class="page-content-wrapper ptb-100">
	<!-- 商品信息start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="breadcrumbs mb-40">
					<ul>
						<li class="home"><a href="index">首页</a>
							<span class="arrow_carrot-right"></span></li>
						<li class="home"><a href="#" onclick="history.go(-1)">商品列表</a>
							<span class="arrow_carrot-right"></span></li>
						<li class="category3"><span>商品</span></li>
					</ul>
				</div>
			</div>
			<div class="col-md-6">
				<div class="singlepro-left">
					<div class="pro-img-tab-content tab-content">
						<!-- 图片1 -->
						<div class="tab-pane active" id="image-1">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img1"/>" href="${pageContext.request.contextPath }/<s:property value="model.img1"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<!-- 图片2 -->
						<div class="tab-pane" id="image-2">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img2"/>" href="${pageContext.request.contextPath }/<s:property value="model.img2"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<!-- 图片3 -->
						<div class="tab-pane" id="image-3">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img1"/>" href="${pageContext.request.contextPath }/<s:property value="model.img1"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<!-- 图片4 -->
						<div class="tab-pane" id="image-4">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img2"/>" href="${pageContext.request.contextPath }/<s:property value="model.img2"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<!-- 图片5 -->
						<div class="tab-pane" id="image-5">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img1"/>" href="${pageContext.request.contextPath }/<s:property value="model.img1"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
						<!-- 图片6 -->
						<div class="tab-pane" id="image-6">
							<div class="simpleLens-big-image-container">
								<a class="simpleLens-lens-image" data-lightbox="roadtrip" data-lens-image="${pageContext.request.contextPath }/<s:property value="model.img2"/>" href="${pageContext.request.contextPath }/<s:property value="model.img2"/>">
								<img width="550px" height="550px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" class="simpleLens-big-image">
								</a>
							</div>
						</div>
					</div>
					<div class="pro-img-tab-slider indicator-style2 owl-carousel owl-theme">
						<!-- 图片最少4张 -->
						<div class="item">
							<a href="#image-1" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" /></a>
						</div>
						<div class="item">
							<a href="#image-2" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" /></a>
						</div>
						<div class="item">
							<a href="#image-3" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" /></a>
						</div>
						<div class="item">
							<a href="#image-4" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" /></a>
						</div>
						<div class="item">
							<a href="#image-5" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" /></a>
						</div>
						<div class="item">
							<a href="#image-6" data-toggle="tab">
								<img width="120px" height="120px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" /></a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="singlepro-right">
					<div class="snglepro-content">
						<span>编号：<s:property value="model.pid"/></span>
						<h3>
							<a href="single-product.html"><s:property value="model.pname"/></a>
						</h3>
						<div class="rating-box">
							<!-- 星级 -->
							<s:if test="model.star==5">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							</s:if>
							<s:if test="model.star==4">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							</s:if>
							<s:if test="model.star==3">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							<i class="fa fa-star"></i>
							</s:if>
							<s:if test="model.star==2">
							<i class="fa fa-star"></i> <i class="fa fa-star"></i>
							</s:if>
							<s:if test="model.star==1">
							&nbsp;
							<i class="fa fa-star"></i>
							</s:if>
							<span>满88包邮</span>
						</div>
						<div class="prce-stock">
							<h4>￥<s:property value="model.nowprice"/></h4>
							<h6>有货</h6>
						</div>
						<p><s:property value="model.desc"/></p><br><br>
						<div class="input-content mb-50">
							<div class="quantity">
								<form action="${pageContext.request.contextPath }/cart_addCart.action" method="post" id="cartForm">
									<input type="hidden" name="pid" value="<s:property value="model.pid"/>">
									<div>
									<font size="4px">数量&nbsp;&nbsp;&nbsp;&nbsp;</font>
										<input type="number" id="count" name="count" value="1" min="0"  style="width:80px;font-size:25px">
										<font size="4px">件</font>
									</div>
									<div class="wc-proceed-to-checkout">
										<a href="#" onclick="saveCart()" id="addCart">&nbsp;&nbsp;&nbsp;添加到购物车&nbsp;&nbsp;&nbsp;</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 商品信息end -->

	<!-- 商品介绍start -->
	<section class="pro-disciptin mt-100">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="p-details-tab">
					<ul role="tablist">
						<li role="presentation" class="active">
							<a href="#description" aria-controls="description" role="tab" data-toggle="tab">商品详情</a>
						</li>
						<li role="presentation">
							<a href="#reviews" aria-controls="reviews" role="tab" data-toggle="tab">规格参数</a>
						</li>
						<li role="presentation">
							<a href="#tags" aria-controls="tags" role="tab" data-toggle="tab">服务详情</a>
						</li>
					</ul>
				</div>
				<div class="tab-content review"> 
					<div role="tabpanel" class="tab-pane active" id="description">
						<p><s:property value="model.desc"/></p>
						<img width="300px" src="${pageContext.request.contextPath }/<s:property value="model.img1"/>" alt="" />
						<img width="300px" src="${pageContext.request.contextPath }/<s:property value="model.img2"/>" alt="" />
					</div>
					<div role="tabpanel" class="tab-pane" id="reviews">
						<table>
							<thead>
								<tr>
									<th></th>
									<th>1 star</th>
									<th>2 stars</th>
									<th>3 stars</th>
									<th>4 stars</th>
									<th>5 stars</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>Price</th>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
								</tr>
								<tr>
									<th>Value</th>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
								</tr>
								<tr>
									<th>Quality</th>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
									<td>规格参数</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div role="tabpanel" class="tab-pane" id="tags">
						<div>
							<h4>全国联保</h4>
							<p>消费者在天猫购买带有“全国联保”标识商品后，除可以按照《中华人民共和国产品质量法》、《中华人民共和国消费者权益保护法》以及国家关于产品修理、更换、退货的规定，享受商家提供的相应服务外，还可以享受到：向该商品所属品牌商（厂家）或第三方就机器故障进行在线咨询、对故障机器一键报修，或可以查阅品牌商相应售后信息的服务。<p>
						</div>
						<div>
							<h4>报修途径：</h4>
							<p>可通过拨打品牌商的400报修热线进行报修</p>
							<p>可通过点击“天猫系统中的“使用服务”按钮，并填写弹出的服务报修单进行报修；</p>
							<p>可通过点击供应商旺旺号，与品牌售后服务中心取得直接联系，并在线咨询售后相关问题。</p>
							<p>如消费者通过天猫系统中的“使用服务”按钮进行报修，则消费者将在报修之时起24小时之内得到响应；如需要邮寄给品牌商或第三方，品牌商或第三方收到商品且接受报修后，则品牌商或第三方将在接受报修之日起30天内向消费者反馈相应售后信息。</p>
							<p>如若违背承诺，对于不能经过天猫系统进行报修的相应品牌，按《淘宝规则》、《天猫规则》进行相应处理；对于可通过天猫系统进行报修的品牌，在消费者通过天猫系统报修后，品牌商或第三方受理报修30天内未通过天猫系统向消费者反馈任何信息的，消费者可向天猫就对应商品的售后服务发起投诉，如天猫判定消费者投诉成立，则商家需向消费者支付100元/单违约金（以天猫积分支付）。</p>
							<p>备注：消费者只有在品牌商或第三方受理消费者报修的情况下方可获得前述赔付，如品牌商或第三方未受理消费者报修（包括但不限于未响应消费者报修信息等），则消费者不能获得对应商家的赔付，相应投诉将反馈至商家，消费者投诉按《淘宝规则》、《天猫规则》进行相应处理。</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
	<!-- 商品介绍end -->
</section>
<!-- 网页内容end -->
	
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
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								
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