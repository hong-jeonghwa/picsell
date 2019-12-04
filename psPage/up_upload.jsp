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
<title>이미지 업로드</title>
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
<link rel="stylesheet" href="<%=cp%>/psPage/css/owl.theme.default.min.css">
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
<script type="text/javascript">

	function sendIt(){
		
		var f = document.myForm;
		
		f.action = "<%=cp %>/picsell/up_upload_ok.do";
		f.submit();
		
	}
	
	function reset(){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/picsell/up_tag.do?check=" + "yes";
		
		f.submit();
		
	}

</script>
</head>

<body>

	<div class="wrapper">

		<form action="" name="myForm" method="post" enctype="multipart/form-data">
			<!-- Start Header Style -->
			<header id="htc__header" class="htc__header__area header--one">
			<!-- Start Mainmenu Area -->
			<div id="sticky-header-with-topbar"
				class="mainmenu__wrap sticky__header">
				<div class="container">
					<div class="row">
						<div class="menumenu__container clearfix">
							<div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
								<div class="logo">
									<a href="<%=cp%>/picsell/main.do"><img
										src="<%=cp%>/psPage/image/picsell1.png" alt="logo images"></a>
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
                                      
                                           <li class="drop"><a href="<%=cp%>/picsell/up_myupload.do">MY UPLOAD</a></li>
                                           <li class="drop"><a href="<%=cp%>/picsell/board_memory.do">QnA</a>	
                                          
                                          
                                          
                                         
                            </div>
							<div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
								<div class="header__right">
									<div class="header__search search search__open">
										<a href=""><i class="icon-magnifier icons"></i></a>
									</div>
									<div class="header__account">
										<a href=""><i class="icon-user icons"></i></a>
									</div>
									<div class="htc__shopping__cart">
										<a class="cart__menu" href=""><i
											class="icon-handbag icons"></i></a> <a href="#"><span
											class="htc__qua">2</span></a>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="mobile-menu-area"></div>
				</div>
			</div>
			<!-- End Mainmenu Area --> </header>
			
			<div class="body__overlay"></div>
			<!-- Start Offset Wrapper -->
			<div class="offset__wrapper">
				<!-- Start Search Popap -->
				<div class="search__area">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="search__inner">
									<form action="#" method="get">
										<input placeholder="Search here... " type="text">
										<button type="submit"></button>
									</form>
									<div class="search__close__btn">
										<span class="search__close__btn_icon"><i
											class="zmdi zmdi-close"></i></span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
		<div class="ht__bradcaump__area" style="background-image:url(<%=cp%>/psPage/image/sibal.jpg);">
            <div class="ht__bradcaump__wrap">
                <div class="container">
                    <div class="row">
                        <div class="col-xs-12">
                            <div class="bradcaump__inner">
                                <nav class="bradcaump-inner">
                                  <a class="breadcrumb-item" style="color: #ffffff; font-size: 30px;" >UPLOAD &nbsp;&nbsp;SECTION </a>
                                  <span class="brd-separetor"><i class="zmdi zmdi-chevron-right"></i></span>
                                  
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
			
			<br/><br/><br/><br/>

								<div class="htc__comment__area">
            		<h4 style="margin-left: 350px;" class="title__line--5">FILE UPLOAD CONSTRAINTS</h4>
            		<div class="ht__comment__content">
                		<table width="2000">
                    	<!-- Start Single Comment -->
                    	<tr>
                    		<td width="300">
                            <div class="comment">
                                <div class="comment__thumb">
                                    <img style="margin-left: 350px; padding-top: 20px;" src="<%=cp %>/psPage/image/photo-camera1.png" alt="comment images">
                                </div>
                                <div class="ht__comment__details">
                                    <div class="ht__comment__title">
                                        <h2 style="padding-top: 15px; padding-left: 15px;"> 동영상은 최대 300MB, 최소 해상도 1920x800입니다.<br/> 동영상들은 60초를 넘으면 안됩니다. </h2>
                                    </div>
                                    <div class="reply__btn" style="padding-top: 10px;">
                                        <a style="padding-top: 1px;" href="https://pixabay.com/ko/blog/posts/image-quality-guidelines-22/">▶ 비디오품질지침 </a>
                                     </div>
                                   	<p style="padding-top: 10px;">Exercitation photo booth stumptown tote bag Banksy</p>
                                </div>
                             </div>
                             </td>
                             <td width="300">
                             	<img style="margin-left: 150px;" height="80" width="100" src="<%=cp %>/psPage/data/cameraicon.png" alt="comment images">
                             </td>
                          </tr>
                                    <!-- End Single Comment -->
                                    <!-- Start Single Comment -->
                          <tr>
                          	<td>
                            	 <div class="comment comment--reply">
                                     <div class="comment__thumb">
                                         <img style="margin-left: 330px; padding-top: 20px;" src="<%=cp %>/psPage/image/picture.png" alt="comment images">
                                     </div>
                                     <div class="ht__comment__details">
                                         <div class="ht__comment__title">
                                             <h2 style="padding-top: 5px;">최대 40MB, 최소 3000 픽셀의 JPG, PNG, PSD, AI,<br/> 또는 SVG 포맷.</h2>
										 </div>
										 <div class="reply__btn" style="padding-top: 5px;">
                                             <a style="padding-top: 1px;" href="https://pixabay.com/ko/blog/posts/video-quality-guidelines-68/">▶ 이미지품질지침</a>
                                         </div>
                                            <p style="padding-top: 5px;">Exercitation photo booth stumptown tote bag Banksy</p>
                                      </div>
                                 </div>
                              </td>
                              <td>
                              	<div class="ht__comment__form">
                               	   <div class="ht__comment__form__inner">
                                    	<div class="comment__form">
                                        	<input name="imagetitle" type="text"  placeholder="Subject *">
                                        	<input name="imagetag" type="text" value="${t }" placeholder="Tag *" id="imagetag_text">
                                        	<input name="imagepoint" type="text" placeholder="Point *">
                                        	&nbsp;&nbsp; Category:<input style="margin-left: 30px;" type="checkbox" name="category" value="video"/>Video&nbsp;&nbsp;&nbsp;
                                        	<input type="checkbox" name="category" value="illust"/>Illust&nbsp;&nbsp;&nbsp;
                                        	<input type="checkbox" name="category" value="movie"/>Movie&nbsp;&nbsp;&nbsp;
                                        	<input type="checkbox" name="category" value="picture"/>Picture
                                    	</div>
                                	</div>
                            	</div>
                              </td>
                           </tr>
                                    <!-- End Single Comment -->
                                    <!-- Start Single Comment -->
                           <tr>
                           	<td>
                              	 <div class="comment">
                               	 	<div class="comment__thumb">
                                    	<img style="margin-left: 350px; margin-top: 15px;" src="<%=cp %>/psPage/image/photo-camera1.png" alt="comment images">
                                	</div>
                                	<div class="ht__comment__details">
                                   		<div class="ht__comment__title">
                                        	<h2 style="padding-top: 15px;"> 이 기간동안 남아있는 업로드 수는 10 입니다.</h2>
                                   		 </div>
                                    <div class="reply__btn" style="padding-top: 10px;">
                                         <a style="padding-top: 1px;" href="#">▶ reply</a>
                                    </div>
                                    <p style="padding-top: 10px;">Exercitation photo booth stumptown tote bag Banksy</p>
                                </div> 
                               </div>
                               </td>
                               <td>
                               	 &nbsp; &nbsp;인기 TAG : &nbsp;&nbsp; <a name="a" href="<%=cp %>/picsell/up_tag.do?chtag=연예인&check=no">#연예인&nbsp;&nbsp;</a>
                                 <a name="b" href="<%=cp %>/picsell/up_tag.do?chtag=배경&check=no" >#배경&nbsp;&nbsp;</a>
                                 <a name="c" href="<%=cp %>/picsell/up_tag.do?chtag=동물&check=no">#동물&nbsp;&nbsp;</a>
                                 <a name="d" href="<%=cp %>/picsell/up_tag.do?chtag=그림&check=no" >#그림&nbsp;&nbsp;</a>
                                 <a name="e" href="<%=cp %>/picsell/up_tag.do?chtag=짤&check=no">#짤&nbsp;&nbsp;</a>
                                 <a name="e" href="<%=cp %>/picsell/up_tag.do?chtag=영화&check=no">#영화&nbsp;&nbsp;</a>
                                 <a name="e" href="<%=cp %>/picsell/up_tag.do?chtag=비디오&check=no">#비디오&nbsp;&nbsp;</a>
                               </td> 
                            </tr>
                             </table>
                            </div>
                        </div>

                             <br/>
                             <input type="file" name="upload" size="50" value="찾아보기" style="background-color: #ffffff; padding-left: 500px;">

			<br/><br/>


		<div class="col-xs-12">
			<div class="blog__thumb" align="right" style="margin-right: 325px;">
				<table style="margin-right: 450px">
					<tr>
						<td>
							<a class="fr__btn" style="size: 10px; border-radius: 10px;" onclick="sendIt();">UPLOAD</a>&nbsp;&nbsp; 
							<a class="fr__btn" style="size: 10px; border-radius: 10px;" onclick="reset();">RESET</a>&nbsp;&nbsp;
							<a class="fr__btn" style="size: 10px; border-radius: 10px;" href="<%=cp%>/picsell/main.do">CANCEL</a>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</form>
</div>

<br/><br/><br/><br/><br/><br/>

<footer id="htc__footer"> <!-- Start Footer Widget -->

			<!-- End Footer Widget --> <!-- Start Copyright Area -->
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
			<!-- End Copyright Area --> </footer>
			<!-- End Footer Style -->

		</form>
	</div>
	<!-- Body main wrapper end -->

	<!-- Placed js at the end of the document so the pages load faster -->

	<!-- jquery latest version -->
	<script src="js/vendor/jquery-3.2.1.min.js"></script>
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



</body>
</html>