<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
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

	<div class="wrapper">

		<form action="" name="myForm" method="post"
			enctype="multipart/form-data">
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
									<a href="index.html"><img
										src="<%=cp%>/psPage/images/picsell.png" alt="logo images"></a>
								</div>
							</div>
							<div class="col-md-7 col-lg-8 col-sm-5 col-xs-3">
								<nav class="main__menu__nav hidden-xs hidden-sm">
								<ul class="main__menu">
									<li class="drop"><a href="<%=cp%>/picsell/main.do">Home</a></li>
									<li class="drop"><a href="<%=cp%>/picsell/up_upload.do">UPLOAD</a></li>
								</ul>
								</nav>

								<div class="mobile-menu clearfix visible-xs visible-sm">
									<nav id="mobile_dropdown">
									<ul>
										<li><a href="index.html">Home</a></li>
										<li><a href="blog.html">blog</a></li>
										<li><a href="#">pages</a>
											<ul>
												<li><a href="blog.html">Blog</a></li>
												<li><a href="blog-details.html">Blog Details</a></li>
												<li><a href="cart.html">Cart page</a></li>
												<li><a href="checkout.html">checkout</a></li>
												<li><a href="contact.html">contact</a></li>
												<li><a href="product-grid.html">product grid</a></li>
												<li><a href="product-details.html">product details</a></li>
												<li><a href="wishlist.html">wishlist</a></li>
											</ul></li>
										<li><a href="contact.html">contact</a></li>
									</ul>
									</nav>
								</div>
							</div>
							<div class="col-md-3 col-lg-2 col-sm-4 col-xs-4">
								<div class="header__right">
									<div class="header__search search search__open">
										<a href="#"><i class="icon-magnifier icons"></i></a>
									</div>
									<div class="header__account">
										<a href="#"><i class="icon-user icons"></i></a>
									</div>
									<div class="htc__shopping__cart">
										<a class="cart__menu" href="#"><i
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
			<!-- End Header Area -->

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

				<div class="ht__bradcaump__area"
					style="background-image:url(<%=cp%>/psPage/image/main1.jpg);">
					<div class="ht__bradcaump__wrap">
						<div class="container">
							<div class="row">
								<div class="col-xs-12">
									<div class="bradcaump__inner">
										<nav class="bradcaump-inner"> <a class="breadcrumb-item"
											href="index.html" style="color: #ffffff">MY UPLOAD</a> <span
											class="brd-separetor"><i
											class="zmdi zmdi-chevron-right"></i></span> </nav>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- --------------------- -->


				<table align="right">
					<tr>
						<td>${PicSellCustomInfo.userId }</td>
					</tr>

					<tr>
						<td>${PicSellCustomInfo.chargePoint }</td>
					</tr>
				</table>

				<br /> <br /> <br />

				<form>
					<table width="800" style="margin-left: 500px;">

						<tr align="center" style="border-top: 1px solid #cccccc;">
							<td width="200"
								style="font-size: 20px; padding-top: 10px; border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;"><b>이미지</b></td>
							<td width="250"
								style="font-size: 20px; padding-top: 10px; border-right: 1px solid #cccccc;""><b>Point</b></td>
							<td width="50"
								style="font-size: 20px; padding-top: 10px; border-right: 1px solid #cccccc;""><b>삭제</b></td>
						</tr>

						<tr height="1">
							<td colspan="3"
								style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;"
								bgcolor="#cccccc"></td>

						</tr>



						<c:forEach var="dto" items="${Basket_list}">

							<tr align="center">
								<td
									style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc; padding-bottom: 10px; padding-top: 10px;"><img
									src="${imagePath }/${dto.fileName}" width="150" height="150" /></td>
								<td style="font-size: 20px; border-right: 1px solid #cccccc;"">${dto.imagePoint }Points</td>
								<td style="border-right: 1px solid #cccccc;"><a
									href="<%=cp%>/picsell/down_delete.do?imageCode=${dto.imageCode }"><i
										class="icon-trash icons"></i></a>
							<tr height="1">
								<td
									style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;"
									bgcolor="#cccccc"></td>
								<td
									style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;"
									bgcolor="#cccccc"></td>
								<td
									style="border-right: 1px solid #cccccc; border-left: 1px solid #cccccc;"
									bgcolor="#cccccc"></td>
							</tr>

						</c:forEach>

						<tr>
							<td colspan="3" align="right" style="margin-right: 100px;">

								<div class="cart__total">
									<span>order total</span> <span>${sumPoint } Points</span>
								</div>
								<ul class="payment__btn">
									<li class="active"><a href="<%=cp%>/picsell/charge.do">payment</a></li>
									<li><a href="<%=cp%>/picsell/main.do">continue
											shopping</a></li>
								</ul>
							</td>

						</tr>

					</table>

				</form>
</body>
</html>