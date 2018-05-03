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
	<title>taotao-cart</title>

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
					<h2>购物车</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>Cart</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页内容start -->
<section class="page-content-wrapper login-area ptb-20">
	<s:if test="#session.cart.cartItems.size() != 0">
	<!-- 折叠区域start -->
	<s:if test="#session.existUser==null">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="coupon-accordion">
					<!-- 登录START -->
					<h3>
						未登录！ <span id="showlogin">点击此处登录
					</h3>
					<s:actionmessage/>
					<div id="checkout-login" class="coupon-content">
						<div class="coupon-info">
							<form action="${pageContext.request.contextPath}/user_loginOrRegistPage.action" method="post">
								<p class="form-row-first">
									<label>登录名或邮箱 <span class="required">*</span></label> <input type="text" name="username">
								</p>
								<p class="form-row-last">
									<label>密码 <span class="required">*</span></label> <input type="password" name="password">
								</p>
								<p class="form-row">
									<input type="submit" value="登录"> <label> <a href="#">忘记密码？</a>
									</label>
								</p>
							</form>
						</div>
					</div>
					<!-- 登录END -->
				</div>
			</div>
		</div>
	</div>
	</s:if>
	<!-- 折叠区域end -->
	<!-- 购物车详情start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<form action="#">
					<div class="table-content table-responsive">
						<!-- 商品列表 -->
						<table>
							<thead>
								<tr>
									<th class="product-thumbnail"></th>
									<th class="product-name">商品名称</th>
									<th class="product-price">单价</th>
									<th class="product-quantity">数量</th>
									<th class="product-subtotal">小计</th>
									<th class="product-remove">删除</th>
								</tr>
							</thead>
							<tbody>
								<!-- 商品 -->
								<s:iterator var="cartItem" value="#session.cart.cartItems">
								<tr>
									<td class="product-thumbnail">
										<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>">
											<img src="<s:property value="#cartItem.product.img1"/>" alt=""></a>
									</td>
									<td class="product-name">
										<a href="${pageContext.request.contextPath }/product_findByPid.action?pid=<s:property value="#cartItem.product.pid"/>">
											<s:property value="#cartItem.product.pname"/></a>
									</td>
									<td class="product-price"><span class="amount"><s:property value="#cartItem.product.nowprice"/></span></td>
									<td class=""><input type="text" value="<s:property value="#cartItem.count"/>" readonly="readonly"></td>
									<td class="product-subtotal">￥<s:property value="#cartItem.subtotal"/></td>
									<td class="product-remove"><a href="${pageContext.request.contextPath }/cart_removeCart.action?pid=<s:property value="#cartItem.product.pid"/>"><i class="fa fa-times"></i></a></td>
								</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
					<div class="row">
						<div class="col-md-9 col-sm-7 col-xs-12">
							<div class="buttons-cart">
								<a href="${pageContext.request.contextPath }/cart_clearCart.action">&nbsp;清空购物车&nbsp;</a>
								<a href="${pageContext.request.contextPath}/product_findAll.action?page=1">&nbsp;继续购物&nbsp;</a>
							</div>
						</div>
						<div class="col-md-3 col-sm-5 col-xs-12">
							<div class="cart_totals">
								<table>
									<tbody>
										<tr class="order-total">
											<th>合计</th>
											<td><strong><span class="amount">￥<s:property value="#session.cart.total"/></span></strong>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="wc-proceed-to-checkout">
									<a href="${pageContext.request.contextPath }/order_saveOrder.action">&nbsp;&nbsp;&nbsp;结算&nbsp;&nbsp;&nbsp;</a>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 购物车详情end -->
	</s:if>
	<s:else>
	<!-- 折叠区域start -->
	<s:if test="#session.existUser==null">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="coupon-accordion">
					<!-- 登录START -->
					<h3>
						未登录？ <span id="showlogin">点击此处登录</span>
						<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您还没有购物！&nbsp;</font><a href="index">点击此处开始购物！</a>
					</h3>
					<div id="checkout-login" class="coupon-content">
						<div class="coupon-info">
							<form action="#" method="post">
								<p class="form-row-first">
									<label>登录名或邮箱 <span class="required">*</span></label> <input
										type="text">
								</p>
								<p class="form-row-last">
									<label>密码 <span class="required">*</span></label> <input
										type="text">
								</p>
								<p class="form-row">
									<input type="submit" value="登录"> <label> <a
										href="#">忘记密码？</a>
									</label>
								</p>
							</form>
						</div>
					</div>
					<!-- 登录END -->
				</div>
			</div>
		</div>
	</div>
	</s:if>
	<s:else>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="coupon-accordion">
					<!-- 登录START -->
					<h3>
						已登录！
						<font color="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您还没有购物！&nbsp;</font><a href="index">点击此处开始购物！</a>
					</h3>
					<!-- 登录END -->
				</div>
			</div>
		</div>
	</div>
	</s:else>
	<!-- 折叠区域end -->
	</s:else>
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
