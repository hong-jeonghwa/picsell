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

<!-- Start Header Style -->
        <header id="htc__header" class="htc__header__area header--one">
            <!-- Start Mainmenu Area -->
            <div id="sticky-header-with-topbar" class="mainmenu__wrap sticky__header">
                <div class="container">
                    <div class="row">
                        <div class="menumenu__container clearfix">
                            <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5"> 
                                <div class="logo">
                                    <a href="<%=cp%>/picsell/main.do">
                                     <img src="<%=cp %>/psPage/image/picsell1.png" alt="logo images"></a>
                                </div>
                            </div>
                            <div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
                                <nav class="main__menu__nav hidden-xs hidden-sm">
                                    <ul class="main__menu">
                                        <li class="drop"><a href="main.do">Home</a></li>
                                        <li class="drop"><a href="">Tag's</a>
                                            <ul class="dropdown mega_dropdown">
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="<%=cp %>/psPage/product-grid.html">PICTURE</a>
                                                    <!-- <ul class="mega__item">
                                                        <li><a href="product-grid.html">Product Grid</a></li>
                                                        <li><a href="cart.html">cart</a></li>
                                                        <li><a href="checkout.html">checkout</a></li>
                                                        <li><a href="wishlist.html">wishlist</a></li>
                                                    </ul> -->
                                                </li>
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="<%=cp %>/psPage/product-grid.html">ILLUST</a>
                                                   <!--  <ul class="mega__item">
                                                        <li><a href="#">Category</a></li>
                                                        <li><a href="#">My Account</a></li>
                                                        <li><a href="wishlist.html">Wishlist</a></li>
                                                        <li><a href="cart.html">Shopping Cart</a></li>
                                                        <li><a href="checkout.html">Checkout</a></li>
                                                    </ul> -->
                                                </li>
                                                <!-- End Single Mega MEnu -->
                                                <!-- Start Single Mega MEnu -->
                                                <li><a class="mega__title" href="<%=cp %>/psPage/product-grid.html">MOVIE POSTER</a>
                                                   <!--  <ul class="mega__item">
                                                        <li><a href="#">Simple Product</a></li>
                                                        <li><a href="#">Variable Product</a></li>
                                                        <li><a href="#">Grouped Product</a></li>
                                                        <li><a href="#">Downloadable Product</a></li>
                                                        <li><a href="#">Simple Product</a></li>
                                                    </ul> -->
                                                </li>
                                                
                                                <li><a class="mega__title" href="<%=cp %>/psPage/product-grid.html">VIDEO</a>
                                                
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
                                        <li class="drop"><a href="<%=cp%>/picsell/chargePage.do">CHARGE POINT</a>
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
<%--                                           <li class="drop"><a href="<%=cp%>/picsell/created.do">SIGN UP</a> --%>
                                          </c:otherwise>
										  </c:choose>
                                      
                                           
                                          
                                          
                                          
                                          
                                         
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
        
        

				<!-- --------------------- -->

				<%-- <table align="right">

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



				</table> --%>

				<br /> <br /> <br />


				<table style="margin-left: 300px;">

					<tr height="90">
						<td rowspan="5"><img src="${imagePath }/${dto.fileName}"
							width="600" height="600" style="margin-left: 200px;"
							onmouseover="imageOver();" /></td>

						<td rowspan="5"><img src="<%=cp%>/psPage/image/white.png"
							width="1" height="600" style="margin-left: 200px;" /></td>

						<td colspan="2" align="center"><img
							src="<%=cp%>/psPage/images/peo.JPG" width="70" height="70" /></td>

						<td style="font-size: 30px;">${dto.uploadUserID }님</td>
					</tr>


					<tr height="0.5">
						<td></td>
						<td colspan="3" bgcolor="#cccccc"></td>
					</tr>

					<tr height="90">
						<td></td>
						<td></td>
						<td style="font-size: 30px;" align="left"><b>${dto.imagePoint }
								Point</b></td>
						<td align="center">
						
						
						<div class="send__btn">
							<a style="border-radius: 10px;" class="fr__btn" href="<%=cp%>/picsell/down_imageClick.do?imageCode=${dto.imageCode }">
							♡${dto.hitCount }
							
							
							</a>
						</div>
						
						
						
						
						</td>

					</tr>

					<tr height="0.5">
						<td></td>
						<td colspan="3" bgcolor="#cccccc"></td>
					</tr>

					<tr>

						<td></td>
						<td>
							<div class="send__btn">
								<a style="border-radius: 10px;" class="fr__btn"
									href="<%=cp %>/picsell/down_download.do?imageCode=${dto.imageCode }">DOWNLOAD</a>&nbsp;&nbsp;
							</div>
						</td>
						<td>
							<div class="send__btn">
								<a style="border-radius: 10px;" class="fr__btn"
									href="<%=cp %>/picsell/down_addcart.do?imageCode=${dto.imageCode }">ADD
									CART</a>&nbsp;&nbsp;
							</div>
						</td>
						<td>
							<div class="send__btn">
								<a style="border-radius: 10px;" class="fr__btn"
									href="<%=cp %>/picsell/down_basket.do?imageCode=${dto.imageCode }">GO
									CART</a>
							</div>
						</td>
					</tr>

					<tr></tr>
					<tr></tr>
					<tr></tr>

				</table>
				
				
				
				<c:forEach var="i" begin="0" end="${tag.size()-1 }" step="1">
				
					<c:if test="${i==0 }">
						<a href="<%=cp%>/picsell/list.do?imageTag=${tag.get(i)}" style="margin-left: 500px;">#${tag.get(i) }
						&nbsp;</a>
					</c:if>
					
					<c:if test="${i!=0 }">
						<a href="<%=cp%>/picsell/list.do?imageTag=${tag.get(i)}">#${tag.get(i) }
						&nbsp;</a>
					</c:if>
					
					
				</c:forEach>
		</form>
	</div>
</body>
</html>