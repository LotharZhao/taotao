<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<!-- 头部列表start -->
<div class="menu-area mt-60">
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-sm-12">
				<div class="logo-area text-center text-uppercase">
					<!-- logo图片 -->
					<a href="${pageContext.request.contextPath}/index.action"><img src="img/icon/logo.gif" alt="" /></a>
				</div>
			</div>
			<div class="col-md-9 col-sm-12">
				<div class="main-menu lemon-bg">
					<!-- 分类 -->
					<nav>
						<ul id="nav">
							<li><a href="${pageContext.request.contextPath}/index.action">首页</a></li>
							<s:iterator var="c" value="#session.cList">
							<li><a href="${pageContext.request.contextPath}/product_findByCid.action?cid=<s:property value="#c.cid"/>&page=1">
								<s:property value="#c.cname"/></a>
								<ul>
									<s:iterator var="cs" value="#c.categorySeconds">
									<li><a href="${pageContext.request.contextPath}/product_findByCsid.action?csid=<s:property value="#cs.csid"/>&page=1">
										<i class="arrow_carrot-right"></i> <s:property value="#cs.csname"/></a>
									</li>
									</s:iterator>
								</ul>
							</li>
							</s:iterator>
							<s:if test="#session.existUser==null">
								<li><a href="${pageContext.request.contextPath}/user_loginOrRegistPage.action">登陆/注册</a></li>
							</s:if>
							<s:else>
								<s:if test="#session.existUser.realname!=null">
									<li><h4><font color="white" id="aa">&nbsp;&nbsp;欢迎,<s:property value="#session.existUser.realname" /></font></h4>
								</s:if>
								<s:else>
									<li><font color="white"><s:property value="#session.existUser.email"/></font>
								</s:else>
								<ul>
									<li><a href="${pageContext.request.contextPath}/user_info.action"><i class="arrow_carrot-right"></i> 个人中心</a></li>
									<li><a href="${pageContext.request.contextPath}/order_findByUid.action?page=1"><i class="arrow_carrot-right"></i> 我的订单</a></li>
									<li><a href="${pageContext.request.contextPath}/user_quit.action"><i class="arrow_carrot-right"></i> 退出登陆</a></li>
								</ul>
								</li>
							</s:else>
						</ul>
					</nav>
					<!-- 购物车start -->
					<div class="menu-right-area">
						<a href="${pageContext.request.contextPath}/cart_myCart.action" class="mini-cart-icon"><i class="icon_cart_alt"></i>
							<!-- 购物车里的商品数量 -->
							<span>
								<s:if test="#session.cart.cartItems.size() != 0">
									<s:property value="#session.cart.cartItems.size()"/>
								</s:if>
								<s:else>
								0
								</s:else>
							</span> </a>
					</div>
					<!-- 购物车end -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- 头部列表end -->