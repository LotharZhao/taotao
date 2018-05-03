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
	<title>taotao-orderList</title>

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
					<h2>我的订单</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>order list</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页内容start -->
<section class="page-content-wrapper login-area ptb-20">
	<!-- 订单详情start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-sm-12 col-xs-12">
				<div class="table-content table-responsive">
					<!-- 订单列表 -->
					<table>
						<tbody>
							<s:iterator var="order" value="pageBean.list">
								<tr>
									<th colspan="5">
										订单编号：<s:property value="#order.oid" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										订单金额：<s:property value="#order.total" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<font color="red">
											<s:if test="#order.state == 0">
												未付款，<a href="${ pageContext.request.contextPath }/order_findByOid.action?oid=<s:property value="#order.oid" />">点击付款</a>
											</s:if>
											<s:if test="#order.state == 1">
												已付款 - 
													<s:if test="#order.payment == 'alipay'">支付宝支付</s:if>
													<s:if test="#order.payment == 'bank'">银行转账</s:if>
													<s:if test="#order.payment == 'cod'">货到付款</s:if>
											</s:if>
											<s:if test="#order.state == 2">
												已发货
											</s:if>
											<s:if test="#order.state == 3">
												派件中-<a href="${ pageContext.request.contextPath }/order_updateState.action?oid=<s:property value="#order.oid" />">点击确认收货</a>
											</s:if>
											<s:if test="#order.state == 4">
												交易成功
											</s:if>
										</font>
									</th>
								</tr>
								<tr>
									<th>图片</th>
									<th>商品</th>
									<th>价格</th>
									<th>数量</th>
									<th>小计</th>
								</tr>
								<s:iterator var="orderItem" value="#order.orderItems">
									<tr>
										<td width="80">
											<img src="${ pageContext.request.contextPath }/<s:property value="#orderItem.product.img1"/>" />
										</td>
										<td><s:property value="#orderItem.product.pname" /></td>
										<td width="150"><s:property value="#orderItem.product.nowprice"/></td>
										<td width="150"><s:property value="#orderItem.count" /></td>
										<td width="150"><span class="subtotal">￥<s:property value="#orderItem.subtotal" />
										</span></td>
									</tr>
								</s:iterator>
							</s:iterator>
							<tr>
								<th colspan="5">
								<!-- 页码start -->
									<div class="col-md-12">
										<div class="page-pagination text-center pt-50 sm-p-0">
											<ul>
												<li>
													<font size="4px">第&nbsp;<s:property value="pageBean.page"/>/<s:property value="pageBean.totalPage"/>&nbsp;页&nbsp;&nbsp;&nbsp;&nbsp;</font>
												</li>
												<li class="active">
													<s:if test="pageBean.page != 1">
													<a href="${pageContext.request.contextPath }/order_findByUid.action?uid=<s:property value="uid" />&page=<s:property value="pageBean.page-1"/>">上一页</a>
													</s:if>
													<s:else>
													<font size="4px">上一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
													</s:else>
												</li>
												<s:iterator var="i" begin="1" end="pageBean.totalPage">
												<li class="active">
													<s:if test="pageBean.page != #i">
													<a href="${pageContext.request.contextPath }/order_findByUid.action?uid=<s:property value="uid" />&page=<s:property value="#i"/>"><s:property value="#i"/></a>
													</s:if>
													<s:else>
													<font size="4px"><s:property value="#i"/>&nbsp;&nbsp;&nbsp;</font>
													</s:else>
												</li>
												</s:iterator>
												<li class="active">
													<s:if test="pageBean.page != pageBean.totalPage">
													<a href="${pageContext.request.contextPath }/order_findByUid.action?uid=<s:property value="uid" />&page=<s:property value="pageBean.page+1"/>">下一页</a>
													</s:if>
													<s:else>
													<font size="4px">下一页&nbsp;&nbsp;&nbsp;&nbsp;</font>
													</s:else>
												</li>
											</ul>
										</div>
									</div>
									<!-- 页码end -->
								</th>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- 购物车详情end -->
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
