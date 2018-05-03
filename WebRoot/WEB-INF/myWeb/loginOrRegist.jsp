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
	<title>taotao-login/register</title>

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
		function checkRegist() {
			//校验注册信息
			var email = document.getElementById("email").value;
			var password = document.getElementById("registPassword").value;
			var repassword = document.getElementById("reRegistPassword").value;
			var reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if(email==null || email=='') {
				alert("注册邮箱为空！")
				return false;
			}else if(!(reg.test(email))) {  
        		alert("请输入正确的邮箱格式!");
        		return false;
			}else if(password==null || password==''){
				alert("注册密码为空！")
				return false;
        	}else if(repassword != password){
				alert("两次密码输入不一致!");
				return false;
			}
		}
		function checkLogin() {
			//校验注册信息
			var username = document.getElementById("username").value;
			var password = document.getElementById("loginPassword").value;
			if(username==null || username=='') {
				alert("登陆名或邮箱为空！")
				return false;
			}else if(password==null || password==''){
				alert("登陆密码为空！")
				return false;
			}
		}
		
		function checkEmail() {
			// 获得文本框的值
			var email = document.getElementById("email").value;
			if(email==null || email==''){
				return false;
			}
			var reg=/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/;
			if(!(reg.test(email))) {  
        		alert("请输入正确的邮箱格式!");
        		document.getElementById("email").value = "";
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
							document.getElementById("email").value = "";
							document.getElementById("emailspan").innerHTML = "<font color='red'>该邮箱已注册</font>";							
						}else if(a==6){
							document.getElementById("emailspan").innerHTML = "<font color='green'>该邮箱可以使用</font>";
						}
					}
				}
			}
			// 3.打开链接
			xhr.open("GET", "${pageContext.request.contextPath}/user_findByEmail.action?time="+new Date().getTime()+"&email="+email, true);
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
		function change(){
			var img1 = document.getElementById("checkImg");
			img1.src="${pageContext.request.contextPath}/checkImg.action?"+new Date().getSeconds().toString();
		}
	</script>
</head>

<body class="other-page">
<header>
	<!-- 头部列表start -->
	<%@ include file="headerMenu.jsp" %>
	<!-- 头部列表end -->

	<!-- 图片start -->
	<!-- 图片位置img\other\banner-bg.jpg -->
	<div class="banner-area pb-90 pt-160 bg-2">
		<div class="container">
			<div class="row">
				<div class="banner-content text-center text-white">
					<h2>登录/注册</h2>
					<ul>
						<li><a href="${pageContext.request.contextPath}/index.action">home</a> <span class="arrow_carrot-right "></span></li>
						<li>Login/Register</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- 图片end -->
</header>
<!-- 头部列表end -->

<!-- 网页内容start -->
<section class="page-content-wrapper login-area ptb-60">
	<!-- 登陆注册start -->
	<div class="container">
		<div class="row">
			<!-- 登陆 -->
			<div class="col-md-6 col-lg-6 col-sm-6 res-mb-25">
				<div class="account-info">
					<form action="${pageContext.request.contextPath}/user_login.action" method="post" onsubmit="return checkLogin()">
						<div class="form-fields">
							<h1>登录</h1><br>
							<p>
								<label> 登录名或邮箱 <span class="required">*</span> </label>
								<input type="text" id="username" name="username">
							</p>
							<p>
								<label> 密码 <span class="required">*</span> </label>
								<input type="password" id="loginPassword" name="password">
							</p>
							<p>
								<label> 验证码 <span class="required">*</span> </label>
								<input type="text" id="checkcode" name="checkcode" style="width: 300px">&nbsp;&nbsp;&nbsp;&nbsp;
								<img alt="" src="${pageContext.request.contextPath}/checkImg.action" style="height: 40px" id="checkImg" onclick="change()" title="点击更换验证码">
							</p>
						</div>
						<div class="form-action">
							<label>
								<a href="#" class="lost_password">忘记密码？</a>
								<!--<input type="checkbox">Remember me -->
								<s:actionerror/>
							</label>
							<input value="登录" type="submit">
						</div>
					</form>
				</div>
			</div>
			<!-- 注册 -->
			<div class="col-md-6 col-lg-6 col-sm-6">
				<form action="${pageContext.request.contextPath}/user_regist.action" method="post" onsubmit="return checkRegist();">
					<div class="form-fields">
						<h1>快速注册</h1><br>
						<p>
							<label>邮箱 <span class="required">*</span></label>
							<input type="text" id="email" name="email" onblur="checkEmail()">
						</p>
						<p>
							<label>密码 <span class="required">*</span></label>
							<input type="password" id="registPassword" name="password">
						</p>
						<p>
							<label>确认密码 <span class="required">*</span></label>
							<input type="password" id="reRegistPassword" name="password">
						</p>
					</div>
					<div class="form-action">
						<label>
							<span id="emailspan"></span>
							<s:fielderror/>
						</label>
						<input value="注册" type="submit">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 登陆注册end -->
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
