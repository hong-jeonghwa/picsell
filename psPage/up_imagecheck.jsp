<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="no-js" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>이미지 확인</title>
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
</head>
<body style="background-color: black;">

<form action="<%=cp %>/picsell/upload_ok.do" name="myForm" method="post" enctype="multipart/form-data" style="padding-top: 200px; padding-left: 700px;">
	

	
<table align="left" style="background-color: #ffffff; border-radius: 10px; " width="400" height="400">
	<tr height="5">
		<td align="center" style="padding-top: 20px">
			<div class="ft__details">
				<p>해당 이미지가 일치합니까?</p><br/>
			</div>
		</td>
	</tr>
	<tr>
		<td align="center"><img style="border-radius: 10px;" src="${imagePath}/${imagecheck }" width="300" height="300"></td>
	</tr>
	<tr>
	
	<div class="col-xs-12">
			<div class="ft__details">
				<div class="blog__thumb" style="margin-right: 325px;">
					<tr>
						<td height="100" align="center">
							<a class="fr__btn" name="yes" style="size: 30px; border-radius: 10px;" href="<%=cp %>/picsell/main.do">YES</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a class="fr__btn" name="no" style="size: 30px; border-radius: 10px;" href="<%=cp %>/picsell/up_dbdelete.do">NO</a>
						</td>
					</tr>
				</div>
			</div>
		</div>
		
	

</table>
</form>

</body>
</html>