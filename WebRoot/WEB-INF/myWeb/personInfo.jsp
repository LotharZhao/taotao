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
	<title>taotao-center</title>

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
	function checkAdd() {
		//校验信息
		var username = document.getElementById("username").value;
		var realname = document.getElementById("realname").value;
		var phone = document.getElementById("phone").value;
		var addr = document.getElementById("addr").value;
		var password = document.getElementById("password").value;
		var repassword = document.getElementById("repassword").value;
		if(username==null || username=='') {
			alert("登录名为空！")
			return false;
		}else if(realname==null || realname=='') {
			alert("真实姓名为空！")
			return false;
		}else if(phone==null || phone=='') {
			alert("电话为空！")
			return false;
		}else if(addr==null || addr=='') {
			alert("地址为空！")
			return false;
		}else if(password==null || password==''){
			alert("注册密码为空！")
			return false;
		}else if(repassword != password){
			alert("两次密码输入不一致!");
			return false;
		}
	}
	function checkUsername() {
		// 获得文本框的值
		var username = document.getElementById("username").value;
		if(username==null || username==''){
			return false;
		}
		// 1.创建异步交互对象
		var xhr = createXmlHttp();
		// 2.设置监听
		xhr.onreadystatechange = function() {
			if(xhr.readyState==4) {
				if(xhr.status==200) {
					var a=xhr.responseText.length;
					if(a==5){
						document.getElementById("username").value = "";
						document.getElementById("usernamespan").innerHTML = "<font color='red'>该登录名已注册</font>";							
					}else if(a==6){
						document.getElementById("usernamespan").innerHTML = "<font color='green'>该登录名可以使用</font>";
					}
				}
			}
		}
		// 3.打开链接
		xhr.open("GET", "${pageContext.request.contextPath}/user_findByUsername.action?time="+new Date().getTime()+"&username="+username, true);
		// 4.发送
		xhr.send(null);
	}
	function createXmlHttp() {
		var xmlHttp;
		try{
			xmlHttp = new XMLHttpRequest();
		} catch(e) {
			try {
				xmlHttp = new ActiveXObject("Msxm12.XMLHTTP");
			} catch(e) {
				try {
					xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				} catch(e) {}
			}
		}
		return xmlHttp;
	}
	function isaccepted(){
	    if(document.getElementById("rememberme").checked==true){
	        document.getElementById("signup").disabled = false;
	    }else{
	        document.getElementById("signup").disabled = true;
	    }
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
					<h2>个人中心</h2>
					<ul>
						<li><a href="index">home</a> <span class="arrow_carrot-right "></span></li>
						<li>Personal Center</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>

<!-- 网页内容start -->
<section class="page-content-wrapper login-area ptb-20">
	<div class="container">
		<div class="row">
		   <div class="centered-title text-center mb-40">
			  <h2>个人中心</span></h2>
			  <div class="clear"></div>
		   </div>
		   <form action="${pageContext.request.contextPath}/user_saveInfo.action" method="post" onsubmit="return checkAdd();">
		   <div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
			  <div class="billing-fields row">
				 <p class="form-row col-sm-6">
					<label for="username">登录名<abbr title="required" class="required">*</abbr></label>
					<input type="text" name="username" id="username" class="form-controller" value="<s:property value="#session.existUser.username"/>" onblur="checkUsername()">
				 </p>
				 <p class="form-row col-sm-6">
					<label for="realname">真实姓名<abbr title="required" class="required">*</abbr></label>
					<input type="text" name="realname" id="realname" class="form-controller" value="<s:property value="#session.existUser.realname"/>">
				 </p>
				 <p class="form-row col-sm-6">
					<label for="email">注册邮箱<abbr title="required" class="required">*</abbr></label>
					<input type="text" name="email" value="<s:property value="#session.existUser.email"/>" class="form-controller" readonly="readonly">
				 </p>
				 <p class="form-row col-sm-6">
					<label for="phone">电话<abbr title="required" class="required">*</abbr></label>
					<input type="text" name="phone" id="phone" class="form-controller" value="<s:property value="#session.existUser.phone"/>">
				 </p>
				 <p class="form-row col-sm-12">
					<label for="addr">地址<abbr title="required" class="required">*</abbr></label>
					<input type="text" name="addr" id="addr" class="form-controller" value="<s:property value="#session.existUser.addr"/>">
				 </p>
				 <p class="col-sm-12">
					<label class="" for="password">密码<abbr title="required" class="required">*</abbr></label>
					<input type="password" value="<s:property value="#session.existUser.password"/>" id="password" name="password" class="form-controller">
				 </p>
				 <p class="col-sm-12">
					<label class="" for="repassword">确认密码<abbr title="required" class="required">*</abbr></label>
					<input type="password" value="<s:property value="#session.existUser.password"/>" id="repassword" name="repassword" class="form-controller">
				 </p>
				 <p class="col-sm-12">
					<input type="checkbox" value="forever" id="rememberme" name="rememberme" onclick="isaccepted()">
					<label class="inline" for="rememberme">我同意 <a href="#">taotao网站协议</a></label>
					<span id="usernamespan"></span>
				 </p>
				 <p class="col-sm-12">
					<input type="submit" value="提交" name="signup" class="theme-button marL0" id="signup" disabled="disabled">
				 </p>
			  </div>
		   </div>
		   </form>
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
