<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Asbab - eCommerce HTML5 Templatee</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
<link rel="apple-touch-icon" href="apple-touch-icon.png">


<!-- All css files are included here. -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/bootstrap.min.css">
<!-- Owl Carousel min css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%=cp%>/psPage/css/owl.theme.default.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/shortcode/shortcodes.css">
<!-- Theme main style --> 
<link rel="stylesheet" href="<%=cp%>/psPage/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/custom.css"> 

 
<!-- Modernizr JS -->
<script src="<%=cp%>/psPage/js/vendor/modernizr-3.5.0.min.js"></script>



<!-- Modernizr JS -->
<script src="<%=cp%>/psPage/js/vendor/modernizr-3.5.0.min.js"></script>
<script>
	
	function sendIt() {
	
		var f = document.myForm;
		
		str = f.userId.value;
		str = str.trim();
		
		if(!str) {
			alert ("아이디 입력");
			f.userId.focus();
			return
		}
		f.userId.value = str;
		
	/* 	if(f.idDuplication.value != "idCheck"){
			alert("아이디 중복체크를 해주세요.");
			return false;
		}
		 */
		str = f.userPwd.value;
		str = str.trim();
		
		if(!str) {
			alert ("패스워드 입력");
			f.userPwd.focus();
			return
		}
		f.userPwd.value = str;
		
		str = f.userName.value;
		str = str.trim();
		
		if(!str) {
			alert ("이름 입력");
			f.userName.focus();
			return
		}
		f.userName.value = str;
		
		str = f.userEmail.value;
		str = str.trim();
			
		if(!str){
			alert ("이메일 입력");
			f.userEmail.focus();
			return
		}
		f.userEmail.value = str;
	 

	/* 		if(!isValidEmail(str)){
				alert("\n정상적인 이메일을 입력하세요.");
				f.userEmail.focus();
				return;
			}
			
			if(isValidEmail(str)){
				alert("\n정상적인 이메일");
				f.userEmail.focus();
				return;
			} */
		
			
		str = f.userTel.value;
		str = str.trim();
		
		if(!str) {
			alert ("전화번호 입력");
			f.userTel.focus();
			return
		}
		f.userTel.value = str;
		
		f.action = "<%=cp%>/picsell/created_ok.do";
		f.submit();
	}
</script>

</head>

<body>
<form action="" method="post" name="myForm">
	<!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->

	    <!-- Body main wrapper start -->
    <div class="wrapper">
        <!-- Start Header Style -->
        <header id="htc__header" class="htc__header__area header--one">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                                <div class="logo">
                                     <a href="<%=cp%>/picsell/main.do"><img src="<%=cp %>/psPage/image/picsell1.png" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="main.do">Home</a></li>
                                        <li class="drop"><a href="#">Tag's</a>
                                            <ul class="dropdown mega_dropdown">
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="product-grid.html">PICTURE</a>
                                            
                                                </li>
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="product-grid.html">ILLUST</a>
                                         
                                                </li>
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="product-grid.html">MOVIE POSTER</a>
                                            
                                                </li>
                                                
                                                <li><a class="mega__title" href="product-grid.html">VIDEO</a>
                                                
                                                </li>
                                                
                                                
                                                
                                                <!-- End Single Mega MEnu -->
                                            </ul>
                                        </li>
                                        <li class="drop"><a href="<%=cp%>/picsell/up_upload.do">UPLOAD</a>
                               
                                        </li>
                                        <li class="drop"><a href="<%=cp%>/picsell/up_myuploadlist.do">MY UPLOAD LIST</a>
                                          
                                        </li>
                                        <li class="drop"><a href="<%=cp%>/picsell/chargePage.do">CHARGE POINT</a>
                                         
                            </div>
                            <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                                <div class="header__right">
                                    <div class="header__search search search__open">
                                        <a href="<%=cp%>/picsell/list.do"><i class="icon-magnifier icons"></i></a>
                                     
                                    </div>
                                    <div class="header__account">
                                        <a href="<%=cp%>/picsell/login.do"><i class="icon-user icons"></i></a>
                                    </div>
                                   <div class="htc__shopping__cart">
                                        <a href="<%=cp%>/picsell/down_basket.do"><i class="icon-handbag icons"></i></a>
                                        
                                    </div> 
                                    
                                    <div>
                                    	<img alt="" src="./image/baguni.PNG" align="top">
                                        
                                        <a href="#"></a>
                                    </div> 
                                    
                               </div>
                            </div>
                        </div>
                    </div>
                    <div class="mobile-menu-area"></div>
                </div>
            </div>
            <!-- End Mainmenu Area -->
        </header>
        <!-- End Header Area -->
		
		<div class="ht__bradcaump__area"
			style="background-image:url(<%=cp%>/psPage/image/dal.jpg);">
			<div class="ht__bradcaump__wrap">
				<div class="container">
					<div class="row">
						<div class="col-xs-12">
							<div class="bradcaump__inner">
								<nav class="bradcaump-inner"> <!-- 그림 위에 올리기 --> </nav>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
		<h2 class="title__line--2"></h2>
		<h2 class="title__line--2"></h2>
		<h2 class="title__line--2"></h2> 
		<h2 class="title__line--2"></h2> 
		
		 	<section class="htc__blog__details bg__white ptb--100">
		<div class="order-details"> 
	
                            <h5 class="order-details__title" style="font-size: 20;">회원가입</h5> 
                            
                            <div class="order-details__item">
                          <div class="send__btn" align="center">

						<a class="fr__btn"
							href="https://www.facebook.com/dialog/oauth?client_id=114593902037957&amp;redirect_uri=https%3A%2F%2Fpixabay.com%2Faccounts%2Fauth%2Ffacebook%2F&amp;scope=email&amp;state=login|/ko/"
							class="social_sign_in pure-button prevent_dblsubmit"
							style="background-color: #3b5998">FaceBook</a>
						 <a class="fr__btn"
							href="https://accounts.google.com/o/oauth2/auth?redirect_uri=https%3A%2F%2Fpixabay.com%2Faccounts%2Fauth%2Fgoogle%2F&amp;response_type=code&amp;client_id=575185734362.apps.googleusercontent.com&amp;scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email&amp;state=login|/ko/"
							class="social_sign_in pure-button prevent_dblsubmit"
							style="background-color: #d73d32;"></i>Google</a>
 
						<h2 class="title__line--2"></h2>
 
					</div>
                            </div>
                      

 		<div class="footer">
 
			<h2 class="title__line--2"></h2>
			<div class="ft__inner">
				<div class="news__input" align="center">
					
					<input type="text"  name = "userId" onfocus="this.value=''" value="사용자 아이디"
						style="width: 300px;"height:50px;"> <br /> <br /> 
					<input type="password" name = "userPwd" onfocus="this.placeholder=''" placeholder="사용자 비밀번호"
						style="width: 300px;"height:50px;"><br/><br/>
					<input type="text"  name = "userName" onfocus="this.value=''" value="사용자 이름"
						style="width: 300px;"height:50px;"> <br /> <br /> 
					<input type="text"  name = "userEmail" onfocus="this.value=''" value="사용자 이메일"
						style="width: 300px;"height:50px;"> <br /> <br /> 
					<input type="text"  name = "userTel" onfocus="this.value=''" value="사용자 전화번호"
						style="width: 300px;"height:50px;"> <br /> <br /> 			

					<div class="send__btn" align="center">
					
						<a class="fr__btn" onclick="sendIt();">가입하기</a> 
						<a class="fr__btn"	
							onclick="document.myForm.userId.focus();"/>다시입력</a>
						<a class="fr__btn"
							onclick="javascript:location.href='<%=cp%>/picsell/main.do';"" />가입취소</a>
							<br/><br/>
								<font color="red"><b>${message }</b></font>
					</div>
					
					<h2 class="title__line--2"></h2>
					<h2 class="title__line--2"></h2>   
							
				</div>
					<h2 class="title__line--2"></h2>
					<h2 class="title__line--2"></h2>
			</div>
					<h2 class="title__line--2"></h2>
					<h2 class="title__line--2"></h2>
		</div> 
		<section class="htc__blog__details bg__white ptb--100">


		<div class="footer__container bg__cat--1">
			<div class="container">
				<div class="row">
					<!-- Start Single Footer Widget -->
					<div class="col-md-3 col-sm-6 col-xs-12">
						<div class="footer">
							<h2 class="title__line--2">ABOUT US</h2>
							<div class="ft__details">
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
									sed do eiusmod tempor incididunt ut labore et dolore magna
									aliqua. Ut enim</p>
								<div class="ft__social__link">
									<ul class="social__link">
										<li><a href="#"><i class="icon-social-twitter icons"></i></a></li>

										<li><a href="#"><i
												class="icon-social-instagram icons"></i></a></li>

										<li><a href="#"><i class="icon-social-facebook icons"></i></a></li>

										<li><a href="#"><i class="icon-social-google icons"></i></a></li>

										<li><a href="#"><i class="icon-social-linkedin icons"></i></a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<!-- End Single Footer Widget -->
					<!-- Start Single Footer Widget -->
					<div class="col-md-2 col-sm-6 col-xs-12 xmt-40">
						<div class="footer">
							<h2 class="title__line--2">information</h2>
							<div class="ft__inner">
								<ul class="ft__list">
									<li><a href="#">About us</a></li>
									<li><a href="#">Delivery Information</a></li>
									<li><a href="#">Privacy & Policy</a></li>
									<li><a href="#">Terms & Condition</a></li>
									<li><a href="#">Manufactures</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Footer Widget -->
					<!-- Start Single Footer Widget -->
					<div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
						<div class="footer">
							<h2 class="title__line--2">my account</h2>
							<div class="ft__inner">
								<ul class="ft__list">
									<li><a href="#">My Account</a></li>
									<li><a href="cart.html">My Cart</a></li>
									<li><a href="#">Login</a></li>
									<li><a href="wishlist.html">Wishlist</a></li>
									<li><a href="checkout.html">Checkout</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Footer Widget -->
					<!-- Start Single Footer Widget -->
					<div class="col-md-2 col-sm-6 col-xs-12 xmt-40 smt-40">
						<div class="footer">
							<h2 class="title__line--2">Our service</h2>
							<div class="ft__inner">
								<ul class="ft__list">
									<li><a href="#">My Account</a></li>
									<li><a href="cart.html">My Cart</a></li>
									<li><a href="#">Login</a></li>
									<li><a href="wishlist.html">Wishlist</a></li>
									<li><a href="checkout.html">Checkout</a></li>
								</ul>
							</div>
						</div>
					</div>
					<!-- End Single Footer Widget -->
					<!-- Start Single Footer Widget -->
					<div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
						<div class="footer">
							<h2 class="title__line--2">NEWSLETTER</h2>
							<div class="ft__inner">
								<div class="news__input">
									<input type="text" placeholder="Your Mail*">
									<div class="send__btn">
										<a class="fr__btn" href="#">Send Mail</a>
									</div>
								</div>

							</div>
						</div>
					</div>
					<!-- End Single Footer Widget -->
				</div>
			</div>
		</div>
		<!-- End Footer Widget -->
		<!-- Start Copyright Area -->
		<div class="htc__copyright bg__cat--5">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<div class="copyright__inner">
							<p>
								Copyright© <a href="https://freethemescloud.com/">Free
									themes Cloud</a> 2018. All right reserved.
							</p>
							<a href="#"><img src="images/others/shape/paypol.png"
								alt="payment images"></a>
						</div>
					</div>
				</div>
			</div> 
		</div>
		<!-- End Copyright Area -->
		</footer>
		<!-- End Footer Style -->
	</div>
	<!-- Body main wrapper end -->

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- jquery latest version -->
	<script src="<%=cp%>/psPage/js/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap framework js -->
	<script src="js/bootstrap.min.js"></script>
	<!-- All js plugins included in this file. -->
	<script src="js/plugins.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!-- Waypoints.min.js. -->
	<script src="js/waypoints.min.js"></script>
	<!-- Main js file that contents all jQuery plugins activation. -->
	<script src="js/main.js"></script>
</form>
</body>
</html>