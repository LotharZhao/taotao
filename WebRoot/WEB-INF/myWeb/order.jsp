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
	<title>taotao-order</title>

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
	<!-- 头部列表start -->
	<%@ include file="headerMenu.jsp" %>
	<!-- 头部列表end -->
	
	<!-- 图片start -->
	<div class="banner-area pb-90 pt-160 bg-2">
		<div class="container">
			<div class="row">
				<div class="banner-content text-center text-white">
					<h2>订单</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>order</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页主体start -->
<section class="page-content-wrapper pt-100 pb-40">
	<%-- <!-- 折叠区域start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="coupon-accordion">
					<!-- 登录START -->
					<h3>
						未登录？ <span id="showlogin">点击此处登录</span><font color="red"><s:actionmessage/></font>
					</h3>
					<div id="checkout-login" class="coupon-content">
						<div class="coupon-info">
							<form action="#">
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
	<!-- 折叠区域end --> --%>
	<!-- 订单信息start -->
	<div class="checkout-area">
		<div class="container">
			<div class="row">
				<form action="${pageContext.request.contextPath}/order_payOrder.action" method="post">
					<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
					<div class="col-lg-4 col-md-6">
						<div class="checkbox-form">
							<h3></h3>
							<h3>收货地址</h3>
							<div class="row">
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>姓名 <span class="required">*</span></label> 
										<input type="text" name="name" placeholder="" value="<s:property value="model.user.realname"/>">
									</div>
								</div>
								<div class="col-md-6">
									<div class="checkout-form-list">
										<label>电话 <span class="required">*</span></label> 
										<input type="text" name="phone" placeholder="" value="<s:property value="model.user.phone"/>">
									</div>
								</div>
								<div class="col-md-12">
									<div class="checkout-form-list">
										<label>收货地址 <span class="required">*</span></label> 
										<input type="text" name="addr" placeholder="" value="<s:property value="model.user.addr"/>">
									</div>
								</div>
							</div>
							<div class="different-address">
								<div class="ship-different-title">
									<h3>
										<label>给卖家留言？</label> <input id="ship-box" type="checkbox">
									</h3>
								</div>
								<div id="ship-box-info" class="row">
									<div class="col-md-12">
										<div class="checkout-form-list">
											<label>备注</label>
											<textarea id="checkout-mess" name="remark" cols="30" rows="4" placeholder="选填：对本次交易的说明（建议填写已和网站协商一致的内容）"></textarea>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-8 col-md-6">
						<div class="your-order">
							<h3>&nbsp;订 单</h3>
							<div class="your-order-table table-responsive">
								<table>
									<thead>
										<tr>
											<th class="product-name">商品</th>
											<th class="product-total">单价 X 数量</th>
											<th class="product-total">小计</th>
										</tr>
									</thead>
									<tbody>
										<!-- 商品 -->
										<s:iterator var="orderItem" value="model.orderItems">
										<tr class="cart_item">
											<td class="product-name">
												<s:property value="#orderItem.product.pname"/>
											</td>
											<td class="product-total">
												<s:property value="#orderItem.product.nowprice"/> <strong class="product-quantity"> X </strong><s:property value="#orderItem.count"/>
											</td>
											<td class="product-total">
												<span class="amount">￥<s:property value="#orderItem.subtotal"/></span>
											</td>
										</tr>
										</s:iterator>
									</tbody>
									<tfoot>
										<tr class="order-total">
											<th></th>
											<th>总计</th>
											<td><strong><span class="amount">￥<s:property value="model.total"/></span></strong>
											</td>
										</tr>
									</tfoot>
								</table>
							</div>
							<div class="payment-method">
								<div class="payment-accordion">
									<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingOne">
												<h4 class="panel-title">
													<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
														支付宝支付</a>
												</h4>
											</div>
											<div id="collapseOne" class="panel-collapse collapse in"
												role="tabpanel" aria-labelledby="headingOne">
												<div class="panel-body">
													<input type="radio" name="payment" value="alipay" style="width: 15px">选择该支付方式
													<p>提交订单之后，使用支付宝扫描二维码完成支付。</p>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingTwo">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
														银行转账</a>
												</h4>
											</div>
											<div id="collapseTwo" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingTwo">
												<div class="panel-body">
													<input type="radio" name="payment" value="bank" style="width: 15px" >选择该支付方式
													<p>即时到账，支持绝大数银行借记卡及部分银行信用卡。</p>
												</div>
											</div>
										</div>
										<div class="panel panel-default">
											<div class="panel-heading" role="tab" id="headingThree">
												<h4 class="panel-title">
													<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
														货到付款 </a>
												</h4>
											</div>
											<div id="collapseThree" class="panel-collapse collapse"
												role="tabpanel" aria-labelledby="headingThree">
												<div class="panel-body">
													<input type="radio" name="payment" value="cod" style="width: 15px">选择该支付方式
													<p>送货上门后再收款，支持现金、POS机刷卡、支票支付。</p>
												</div>
											</div>
										</div>
									</div>
									<div class="order-button-payment">
										<input type="submit" value="确 认 支 付">
									</div>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 订单信息end -->
</section>
<!-- 网页主体end -->

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
