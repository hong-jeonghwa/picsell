<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");

	String cp = request.getContextPath();
%>
<!doctype html>
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Wishlist || Asbab - eCommerce HTML5 Template</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Place favicon.ico in the root directory -->
<link rel="shortcut icon" type="image/x-icon"
	href="<%=cp%>/psPage/images/favicon.ico">
<link rel="apple-touch-icon" href="<%=cp%>/psPage/apple-touch-icon.png">


<!-- All css files are included here. -->
<!-- Bootstrap fremwork main css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/bootstrap.min.css">
<!-- Owl Carousel min css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="<%=cp%>/psPage/css/owl.theme.default.min.css">
<!-- This core.css file contents all plugings css file. -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/core.css">
<!-- Theme shortcodes/elements style -->
<link rel="stylesheet"
	href="<%=cp%>/psPage/css/shortcode/shortcodes.css">
<!-- Theme main style -->
<link rel="stylesheet" href="<%=cp%>/psPage/style.css">
<!-- Responsive css -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/responsive.css">
<!-- User style -->
<link rel="stylesheet" href="<%=cp%>/psPage/css/custom.css">


<!-- Modernizr JS -->
<script src="<%=cp%>/psPage/js/vendor/modernizr-3.5.0.min.js"></script>

<style>
#my_modal {
	display: none;
	width: 1000px;
	padding: 20px 60px;
	background-color: #fefefe;
	border: 1px solid #888;
	border-radius: 3px;
}

#my_modal .modal_close_btn {
	position: absolute; 
	top: 100px;
	right: 100px;
}

.button {
	background: #252525 none repeat scroll 0 0;
    color: #fff;
    display: block;
    font-weight: 700;
    padding: 10px 56px;
    text-transform: uppercase;
    width: 280px;
    padding: 0; 
    border: none; 
    height: 50px;
    border-radius: 10px;
}

.button:hover {
	background: #c43b68;
    color: #fff;
}
</style>

<script type="text/javascript">

	function charge() {
		
		document.myForm.action = "<%=cp%>/picsell/charge_ok.do";
		document.myForm.submit();

	}
	
</script>

</head>

<body>
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
                                       
                                        <li class="drop">
                                        	<a href="">Tag's</a>
                                            <ul class="dropdown mega_dropdown">
                                                <!-- Start Single Mega MEnu -->
                                                
                                                <li><a class="mega__title" 
                                                href="<%=cp %>/picsell/list_video.do">VIDEO</a>
                                                    <!-- <ul class="mvideoTaglist.jspega__item">
                                                        <li><a href="product-grid.html">Product Grid</a></li>
                                                        <li><a href="cart.html">cart</a></li>
                                                        <li><a href="checkout.html">checkout</a></li>
                                                        <li><a href="wishlist.html">wishlist</a></li>
                                                    </ul> -->
                                                </li>
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                              
                                                   <!--  <ul class="mega__item">
                                                        <li><a href="#">Category</a></li>
                                                        <li><a href="#">My Account</a></li>
                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                        <li><a href="cart.html">Shopping Cart</a></li>
                                                        <li><a href="checkout.html">Checkout</a></li>
                                                    </ul> -->
                                                
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="<%=cp %>/picsell/list_movie.do">MOVIE POSTER</a>
                                                   <!--  <ul class="mega__item">
                                                        <li><a href="#">Simple Product</a></li>
                                                        <li><a href="#">Variable Product</a></li>
                                                        <li><a href="#">Grouped Product</a></li>
                                                        <li><a href="#">Downloadable Product</a></li>
                                                        <li><a href="#">Simple Product</a></li>
                                                    </ul> -->
                                                </li>
                                                
                                                <li><a class="mega__title" href="<%=cp %>/picsell/list_illust.do">ILLUST</a>
                                                
                                                </li>
                                                
                                                
                                                
                                                <!-- End Single Mega MEnu -->
                                            </ul>
                                        </li> 
                                        <c:if test="${empty sessionScope.PicSellCustomInfo.userId }">
                                        <li class="drop"><a href="<%=cp%>/picsell/login.do">UPLOAD</a>
                                        </c:if>
                                        <c:if test="${!empty sessionScope.PicSellCustomInfo.userId }">
										<li class="drop"><a href="<%=cp%>/picsell/up_upload.do">UPLOAD</a>
										</c:if>
                                           <!--  <ul class="dropdown mega_dropdown">
                                                Start Single Mega MEnu
                                                <li><a class="mega__title" href="product-grid.html">Shop Pages</a>
                                                    <ul class="mega__item">
                                                        <li><a href="product-grid.html">Product Grid</a></li>
                                                        <li><a href="cart.html">cart</a></li>
                                                        <li><a href="checkout.html">checkout</a></li>
                                                        <li><a href="wishlist.html">wishlist</a></li>
                                                    </ul>
                                                </li>
                                                End Single Mega MEnu
                                                Start Single Mega MEnu
                                                <li><a class="mega__title" href="product-grid.html">Variable Product</a>
                                                    <ul class="mega__item">
                                                        <li><a href="#">Category</a></li>
                                                        <li><a href="#">My Account</a></li>
                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                        <li><a href="cart.html">Shopping Cart</a></li>
                                                        <li><a href="checkout.html">Checkout</a></li>
                                                    </ul>
                                                </li>
                                                End Single Mega MEnu
                                                Start Single Mega MEnu
                                                <li><a class="mega__title" href="product-grid.html">Product Types</a>
                                                    <ul class="mega__item">
                                                        <li><a href="#">Simple Product</a></li>
                                                        <li><a href="#">Variable Product</a></li>
                                                        <li><a href="#">Grouped Product</a></li>
                                                        <li><a href="#">Downloadable Product</a></li>
                                                        <li><a href="#">Simple Product</a></li>
                                                    </ul>
                                                </li>
                                                End Single Mega MEnu
                                            </ul>
                                        </li>
                                        <li class="drop"><a href="#">Product</a>
                                            <ul class="dropdown">
                                                <li><a href="product-grid.html">Product Grid</a></li>
                                                <li><a href="product-details.html">Product Details</a></li>
                                            </ul> 
                                        </li>-->
                                        <c:choose>
                                        <c:when test="${!empty sessionScope.PicSellCustomInfo.userId }">
                                        <li class="drop"><a href="<%=cp%>/picsell/charge.do">CHARGE POINT</a>
                                        </c:when> 
                                        <c:otherwise>
                                         <li class="drop"><a href="<%=cp%>/picsell/login.do">CHARGE POINT</a>
                                        </c:otherwise>
                                        </c:choose>
                                        
                                        	
                                       
                                        	
                                        	
                                        	
                                        	
                                        	
                                        	
                                        	
                                        	
                                          <c:choose>
                                          <c:when test="${empty sessionScope.PicSellCustomInfo.userId }">
                                          <li class="drop"><a href="<%=cp%>/picsell/login.do">LOGIN</a>
                                          <li class="drop"><a href="<%=cp%>/picsell/created.do">SIGN UP</a>
                                          </c:when>
                                          <c:otherwise>
                                          <li class="drop"><a href="<%=cp%>/picsell/logout.do">LOGOUT</a>
                                          <%-- <li class="drop"><a href="<%=cp%>/picsell/created.do">SIGN UP</a> --%>
                                          </c:otherwise>
										  </c:choose>
                                      
                                           
                                           <li class="drop"><a href="<%=cp%>/picsell/board_memory.do">QnA</a>	
                                          
                                          
                                          
                                         
                            </div>
                            <div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
                                <div class="header__right">
                                    <div class="header__search search search__open">
                                        <a href="<%=cp%>/picsell/list.do"><i class="icon-magnifier icons"></i></a>
                                     
                                    </div>
                                    <div class="header__account">
                                        <a href="<%=cp%>/picsell/join_mypage.do"><i class="icon-user icons"></i></a>
                                    </div>
                                   <div class="htc__shopping__cart">
                                        <a href="<%=cp%>/picsell/down_basket.do"><i class="icon-handbag icons"></i></a>
                                        
                                    </div> 
                                    
                                   <!--  <div>
                                    	<img alt="" src="./image/baguni.PNG" align="top">
                                        
                                        <a href="#"></a>
                                    </div> 
                                     -->
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

        <div class="body__overlay"></div>
        <!-- Start Offset Wrapper -->
        <div class="offset__wrapper">
            <!-- Start Search Popap -->
            <div class="search__area">
                <div class="container" >
                    <div class="row" >
                        <div class="col-md-12" >
                            <div class="search__inner">
                                <form action="#" method="get">
                                    <input placeholder="Search here... " type="text">
                                    <button type="submit"></button>
                                </form>
                                <div class="search__close__btn">
                                    <span class="search__close__btn_icon"><i class="zmdi zmdi-close"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Search Popap -->
            <!-- Start Cart Panel -->
            <div class="shopping__cart">
                <div class="shopping__cart__inner">
                    <div class="offsetmenu__close__btn">
                        <a href="#"><i class="zmdi zmdi-close"></i></a>
                    </div>
                    <div class="shp__cart__wrap">
                        <div class="shp__single__product">
                            <div class="shp__pro__thumb">
                                <a href="#">
                                    <img src="images/product-2/sm-smg/1.jpg" alt="product images">
                                </a>
                            </div>
                            <div class="shp__pro__details">
                                <h2><a href="product-details.html">BO&Play Wireless Speaker</a></h2>
                                <span class="quantity">QTY: 1</span>
                                <span class="shp__price">$105.00</span>
                            </div>
                            <div class="remove__btn">
                                <a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                            </div>
                        </div>
                        <div class="shp__single__product">
                            <div class="shp__pro__thumb">
                                <a href="#">
                                    <img src="images/product-2/sm-smg/2.jpg" alt="product images">
                                </a>
                            </div>
                            <div class="shp__pro__details">
                                <h2><a href="product-details.html">Brone Candle</a></h2>
                                <span class="quantity">QTY: 1</span>
                                <span class="shp__price">$25.00</span>
                            </div>
                            <div class="remove__btn">
                                <a href="#" title="Remove this item"><i class="zmdi zmdi-close"></i></a>
                            </div>
                        </div>
                    </div>
                    <ul class="shoping__total">
                        <li class="subtotal">Subtotal:</li>
                        <li class="total__price">$130.00</li>
                    </ul>
                    <ul class="shopping__btn">
                        <li><a href="cart.html">View Cart</a></li>
                        <li class="shp__checkout"><a href="<%=cp %>/psPage/checkout.html">Checkout</a></li>
                    </ul>
                </div>
            </div>
            <!-- End Cart Panel -->
        </div>
        <!-- End Offset Wrapper -->
        <!-- Start Slider Area -->

		<div class="ht__bradcaump__area"
			style="background-image:url(<%=cp%>/psPage/image/sibal.jpg);">
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

		<div id="my_modal" align="center">
			<form action="" name="myForm" method="post"">
				<div style="font-size: 20px; font-stretch: normal;">
					결제금액 : <b id="chargeMoney" align="center">ㅎㅇㅎㅇㅎㅇ</b>
				</div>
				<hr>

				<div style="height: 100px"></div>
				<div>
					<input type="button" value="충전하기" onclick="charge();"/> 
					<input type="hidden" value="5000" id="hdChagePoint" name="hdcp" />
				</div>
			</form>
		</div>

		<div class="wishlist-area ptb--100 bg__white">

			<div class="container">
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="wishlist-content">
								<div class="wishlist-table table-responsive" align="center">
									<table style="width: 900px; border: none;">
										<thead>
											<tr>
												<th class="product-name" style="border: none;"><span class="nobr">
														충전포인트 </span></th>
												<th class="product-name" style="border: none;"></th>
												<th class="product-price" style="border: none;"><span class="nobr"> 금액
												</span></th>
												<th class="product-add-to-cart" style="border: none;"><span class="nobr">
												</span></th>
											</tr>
										</thead>
										<tbody >
											<c:forEach var="dto" items="${lists }">
												<tr style="border: none;">
													<td class="product-name" width="200" style="border: none;"><img src="<%=cp %>/psPage/image/${dto.chargePoint }p.png"></td>
													<td class="product-name" width="300" style="border: none;">&nbsp;&nbsp;&nbsp;${dto.realMoney }P + ${dto.realMoney }B</td>
													<td class="product-price" width="300" style="border: none;"><span class="amount" style="font-size: 30px">${dto.realMoney }</span>원</td>
													<td class="product-add-to-cart" width="300" style="border: none;">
														<button id="popup_open_btn_${dto.chargeCode }"
															class="button"
															onclick="modal('my_modal','${dto.realMoney}');"
															 >구매하기</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
						</div>
					</div>
				</div>
			</div>

		</div>

		<script>
			function modal(id, chargeM) {
				var zIndex = 9999;
				var modal = document.getElementById(id);

				document.getElementById('hdChagePoint').value = chargeM;
				document.getElementById('chargeMoney').innerHTML = chargeM;

				// 모달 div 뒤에 희끄무레한 레이어
				var bg = document.createElement('div');
				bg.setStyle({
					position : 'fixed',
					zIndex : zIndex,
					left : '0px',
					top : '0px',
					width : '100%',
					height : '100%',
					overflow : 'auto',
					// 레이어 색갈은 여기서 바꾸면 됨
					backgroundColor : 'rgba(0,0,0,0.4)'
				});
				
				bg.onclick = function() {
					bg.remove();
					modal.style.display = 'none';
				};
				document.body.append(bg);

				modal
						.setStyle({
							position : 'fixed',
							display : 'block',
							boxShadow : '0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19)',

							// 시꺼먼 레이어 보다 한칸 위에 보이기
							zIndex : zIndex + 1,

							// div center 정렬
							top : '50%',
							left : '50%',
							transform : 'translate(-50%, -50%)',
							msTransform : 'translate(-50%, -50%)',
							webkitTransform : 'translate(-50%, -50%)'
						});
			}

			// Element 에 style 한번에 오브젝트로 설정하는 함수 추가
			Element.prototype.setStyle = function(styles) {
				for ( var k in styles)
					this.style[k] = styles[k];
				return this;
			};
		</script>
		
		<div>
		<!-- <div style="height: 100px"></div> -->
		<footer id="htc__footer">
            <!-- Start Footer Widget -->
           <!--  <div class="footer__container bg__cat--1">
                <div class="container">
                    <div class="row">
                        Start Single Footer Widget
                        <div class="col-md-3 col-sm-6 col-xs-12">
                            <div class="footer">
                                <h2 class="title__line--2">ABOUT US</h2>
                                <div class="ft__details">
                                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim</p>
                                    <div class="ft__social__link">
                                        <ul class="social__link">
                                            <li><a href="#"><i class="icon-social-twitter icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-instagram icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-facebook icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-google icons"></i></a></li>

                                            <li><a href="#"><i class="icon-social-linkedin icons"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        End Single Footer Widget
                        Start Single Footer Widget
                        <div class="col-md-2 col-sm-6 col-xs-12 xmt-40">
                            <div class="footer">
                                <h2 class="title__line--2">information</h2>
                                <div class="ft__inner">
                                    <ul class="ft__list">
                                        <li><a href="#">About us</a></li>
                                        <li><a href="#">Delivery Information</a></li>
                                        <li><a href="#">Privacy & Policy</a></li>
                                        <li><a href="#">Terms  & Condition</a></li>
                                        <li><a href="#">Manufactures</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        End Single Footer Widget
                        Start Single Footer Widget
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
                        End Single Footer Widget
                        Start Single Footer Widget
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
                        End Single Footer Widget
                        Start Single Footer Widget
                        <div class="col-md-3 col-sm-6 col-xs-12 xmt-40 smt-40">
                            <div class="footer">
                                <h2 class="title__line--2">NEWSLETTER </h2>
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
                        End Single Footer Widget
                    </div>
                </div>
            </div> -->
            <!-- End Footer Widget -->
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
            <!-- Start Copyright Area -->
            <div class="htc__copyright bg__cat--5">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="copyright__inner">
                                <p>Copyright© <a href="https://freethemescloud.com/">Free themes Cloud</a> 2018. All right reserved.</p>
                                <!-- <a href="#"><img src="images/others/shape/paypol.png" alt="payment images"></a> -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Copyright Area -->
        </footer>
        </div>
</body>

</html>