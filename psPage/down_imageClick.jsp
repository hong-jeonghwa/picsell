<%@page import="java.util.List"%>
<%@page import="com.picsell.GuestDTO"%>
<%@page import="com.util.DBCPConn"%>
<%@page import="com.picsell.PicsellImageDAO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	String message = request.getParameter("message");

	//PicsellImageDAO dao = PicsellImageDAO(DBCPConn.getConnection());
	//String imageTag;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<script src="js/vendor/modernizr-3.5.0.min.js"></script>

</head>
<body>

	<!-- --------------------- -->
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
                            
                            <c:choose>
                            <c:when test="${!empty sessionScope.PicSellCustomInfo.userId }">
                            <div class="header__account">
                            <a href="<%=cp%>/picsell/join_mypage.do"><i class="icon-user icons"></i></a>
                            </div>
                            <div class="htc__shopping__cart">
                            <a href="<%=cp%>/picsell/down_basket.do"><i class="icon-handbag icons"></i></a>
                            </div> 
                            </c:when> 
                            <c:otherwise>
                            <div class="header__account">
                            <a href="<%=cp%>/picsell/login.do"><i class="icon-user icons"></i></a>
                            </div>
                            <div class="htc__shopping__cart">
                            <a href="<%=cp%>/picsell/login.do"><i class="icon-handbag icons"></i></a>
                            </div> 
                            </c:otherwise>
                            </c:choose>    
                                   
                                     
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
                                <form action="" method="post" name="myForm">
                                    <input placeholder="Search here... " type="text" name="imageTag">
                                    <button type="submit" onclick="sendIt();"/>
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
	<!-- --------------------- -->

	<form action="<%=cp%>/picsell/down_guest.do" method="post"
		enctype="multipart/form-data" name="myForm">
		<table align="right">

			<c:if test="${info.userId==null }">
				<tr>
					<td><a href="<%=cp%>/psPage/join_login.jsp">로그인을 해주세요</a></td>
				</tr>
			</c:if>

			<c:if test="${info.userId!=null }">
				<tr>
					<td>${info.userId }</td>
				</tr>

				<tr>
					<td>${i.chargePoint }</td>
				</tr>

				<tr>
					<td><a href="<%=cp%>/picsell/join_logout.do">로그아웃</a></td>
				</tr>

			</c:if>



		</table>

		<br /> <br /> <br />


		<table style="margin-left: 100px;">

			<tr height="90">
				<td rowspan="7"><img src="${imagePath }/${dto.fileName}"
					width="800" height="750" style="margin-left: 200px; margin-right: 50px;"
					onmouseover="imageOver();" />
				</td>

				<td colspan="2" align="center" style="margin-left: 50px;">
					<img src="<%=cp%>/psPage/images/peo.JPG" width="70" height="70"/>&nbsp;&nbsp;
					<font style="font-size: 30px;" ><a href="<%=cp %>/picsell/up_idupload.do?uploadUserId=${dto.uploadUserID }"> ${dto.uploadUserID }님</a></font>
				</td>

			</tr>


			<tr height="0.5">
				<td></td>
				<td colspan="3" bgcolor="#cccccc" style="margin-left: 50px;"></td>
			</tr>

			<tr height="90">
				<td></td>
				
				<td style="font-size: 30px;" align="center"><b>${dto.imagePoint }
						Point</b></td>

			</tr>

			<tr height="0.5">
				<td></td>
				<td colspan="3" bgcolor="#cccccc" ></td>
			</tr>

			<tr>

				<td></td>
				<td valign="top" >
					<div class="send__btn">

						<c:if test="${dto.imagePoint==0 }">
							<a style="border-radius: 10px;" class="fr__btn"
								href="<%=cp %>/picsell/down_download.do?imageCode=${dto.imageCode }">FREE
								DOWNLOAD</a>&nbsp;&nbsp;
						</c:if>

						<c:if test="${dto.imagePoint!=0 }">
							<a style="border-radius: 10px;" class="fr__btn"
								href="<%=cp %>/picsell/down_download.do?imageCode=${dto.imageCode }">DOWNLOAD</a>&nbsp;&nbsp;
						</c:if>
						
						<a style="border-radius: 10px;" class="fr__btn"
							href="<%=cp %>/picsell/down_addcart.do?imageCode=${dto.imageCode }">ADD
							CART</a>&nbsp;&nbsp;
							
						<a style="border-radius: 10px;" class="fr__btn"
							href="<%=cp %>/picsell/down_basket.do?imageCode=${dto.imageCode }">GO
							CART</a>
				</td>
			</tr>
			
			<tr height="0.5">
				<td></td>
				<td colspan="3" bgcolor="#cccccc" style="margin-top: 20px;"></td>
			</tr>

			<tr>
			
			
			<td></td>
			<td colspan="3" >
				<table  style="margin-top: 20px;" >
					<tr>
						<td>
							<c:forEach var="i" begin="0" end="4" step="1">
								<c:if test="${i==0 }"><a href="<%=cp%>/picsell/down_imageClick.do?imageCode=${famous_list.get(i).imageCode}">
									<img src="${imagePath }/${famous_list.get(i).fileName}" width="230" height="230"/>&nbsp;</a>

								</c:if>
								<c:if test="${i==1}">
								<a href="<%=cp%>/picsell/down_imageClick.do?imageCode=${famous_list.get(i).imageCode}">
									<img src="${imagePath }/${famous_list.get(i).fileName}" width="230" height="230"/></a></td>
									</tr>
									<tr>
								</c:if>
								<c:if test="${i==2}">
								
									<td colspan="2" style="padding-top: 10px;">
<a href="<%=cp%>/picsell/down_imageClick.do?imageCode=${famous_list.get(i).imageCode}"><img src="${imagePath }/${famous_list.get(i).fileName}" width="230" height="230"/></a>&nbsp;
								</c:if>
								<c:if test="${i==3}"><a href="<%=cp%>/picsell/down_imageClick.do?imageCode=${famous_list.get(i).imageCode}">
									<img src="${imagePath }/${famous_list.get(i).fileName}" width="230" height="230"/></a></td>
							
								</c:if>
			
			
			
			</c:forEach>
					
					</tr>
			</table>
			</tr>
					
					
					</table>
				
				
			
			</tr>

			</tr>

		</table>


		<%-- <table>
			<tr>
				<td></td>
				<td></td>
				<td><c:forEach var="i" begin="0" end="4" step="1">
						<c:if test="${i==0 }">
							<img src="${imagePath }/${famous_list.get(i).fileName}"
								width="40" height="40" style="margin-left: 200px;" /></td>

				</c:if>
				<c:if test="${i==1}">
					<td><img src="${imagePath }/${famous_list.get(i).fileName}"
						width="40" height="40" style="margin-left: 200px;" /></td>
			</tr>
			<tr>
				</c:if>
				<c:if test="${i==2}">
					<td><img src="${imagePath }/${famous_list.get(i).fileName}"
						width="40" height="40" style="margin-left: 200px;" /></td>
				</c:if>
				<c:if test="${i==3}">
					<td><img src="${imagePath }/${famous_list.get(i).fileName}"
						width="40" height="40" style="margin-left: 200px;" /></td>
			</tr>
			</c:if>
			</c:forEach>

			</tr>

		</table> --%>
		
		</form>
		
		<form action="" method="post">

		<br />
		<table style="margin-left: 100px;" width="1000px">
			<tr>
				<td><c:forEach var="i" begin="0" end="${tag.size()-1 }"
						step="1">

						<c:if test="${i==0 }">
							<a href="<%=cp%>/picsell/list.do?imageTag=${tag.get(i)}"
								style="margin-left: 200px;"><font size="5px;"><b>#${tag.get(i)} &nbsp;</b></font></a>
						</c:if>

						<c:if test="${i!=0 }">
							<a href="<%=cp%>/picsell/list.do?imageTag=${tag.get(i)}"><font
								size="5px;"><b>#${tag.get(i) } &nbsp;</b></font></a>
						</c:if>


					</c:forEach></td>
				<td align="right">

					<div class="send__btn">
						<a style="border-radius: 10px;" class="fr__btn"
							href="<%=cp%>/picsell/down_imageClick.do?imageCode=${dto.imageCode }">
							<img width="20px" height="20px"
							src="<%=cp%>/psPage/image/like.png" />&nbsp;&nbsp;${dto.hitCount }
						</a>
					</div>

				</td>
			</tr>

		</table>

		<br />

	</form>


	<form action="<%=cp%>/picsell/down_guest.do" method="post">


		<table style="margin-left: 300px;">
			<tr>
				<td><input type="hidden" name="imageCode"
					value="${dto.imageCode }"></td>

			</tr>
			<tr>
				<td><img src="<%=cp%>/psPage/image/who.JPG" /></td>
				<td><textarea rows="2" cols="80" name="content" placeholder="당신의 코멘트를 입력해주세요"
						style="background-color: white; border-color: pink;" ></textarea></td>
				<td style="padding-left: 20px;" valign="middle">
					<input type="submit" value="확인" class="fr__btn" style="border-radius: 10px;" /></td>
			</tr>

			<!-- <tr>
				<td></td>
				<td align="right">
					<div class="send__btn">
						<input type="submit" value="확인" />
					</div>
				</td>

			</tr> -->
			<tr>
			</tr>
		</table>

		<div>


			<table width="600px" style="margin-left: 300px; border: 3px;">
				<c:forEach var="dto" items="${guest_list }">
					<tr>

						<td rowspan="2" style="width: 60px;"><img
							src="<%=cp%>/psPage/image/who.JPG" width="59px" height="58px" /></td>
						<td colspan="2" align="left" style="font-size: 20px;"><a href="<%=cp %>/picsell/up_idupload.do?uploadUserId=${dto.uploadUserID }"><b>${dto.psUserId }</b></a></td>
						<td></td>

					</tr>
					<tr>
						<td align="left" width="4000x" height="2" style="font-size: 18px;">${dto.content }</td>

					</tr>

					<tr>
						<td headers="1" width="540px"></td>
					</tr>

				</c:forEach>

			</table>



		</div>

		<div style="text-align: center;">
			<p>
				<c:if test="${dataCount!=0 }">
					${pageIndexlist }
				</c:if>
				<c:if test="${dataCount==0 }">
					※등록된 방명록이 없습니다※
				</c:if>

			</p>
		</div>
	</form>

	<br />
	<br />















	<!-- Start Footer Area -->
	<footer id="htc__footer"> <!-- Start Footer Widget -->
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

									<li><a href="#"><i class="icon-social-instagram icons"></i></a></li>

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
	<!-- End Footer Widget --> <!-- Start Copyright Area -->
	<div class="htc__copyright bg__cat--5">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="copyright__inner">
						<p>
							Copyrightⓒ <a href="https://freethemescloud.com/">Free themes
								Cloud</a> 2018. All right reserved.
						</p>
						<a href="#"><img src="images/others/shape/paypol.png"
							alt="payment images"></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Copyright Area --> </footer>
	<!-- End Footer Style -->






</body>
</html>