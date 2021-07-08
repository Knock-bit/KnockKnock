<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>綠!Knock! - SHOP</title>

<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${cp}/resource/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="${cp}/resource/css/main.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">

<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>
<header id="header" class="fixed-top">
	<div class="container d-flex align-items-center">

		<h1 class="logo me-auto">
			<a href="${cp }/layout/main.jsp"><img
				src="${cp }/resource/img/logo.png" id=:logo></a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li><a class="active" href="index.html">Home</a></li>
				<li class="dropdown"><a href="#"><span>About</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${cp }/layout/about/whatisknock.jsp">녹녹은</a></li>
						<li><a href="${cp }/layout/about/manual.jsp">녹녹 사용법</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"><span>Campaign</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${cp }/campaign/ing/list.do">진행중인 캠페인</a></li>
						<li><a href="${cp }/campaign/funding/list.do">캠페인 펀딩하기</a></li>
						<li><a href="${cp }/campaign/ed/list.do">지난 캠페인</a></li>
						<li><a href="${cp }/campaign/proposal.do">캠페인 제안하기</a></li>
					</ul></li>
				<li><a href="${cp }/productlist.do">Shop</a></li>
				<li><a href="${cp }/contact/contact.do">Contact</a></li>

				<li class="dropdown"><a href="#"><button type="button"
							class="btn btn-outline-success">${seller.sName }</button> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${cp }/seller/sellerDashboard.do">판매자 페이지</a></li>
					</ul></li>
					</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->
	</div>
</header>
<!-- End Header -->

<!-- 불러오기 -->
<c:forEach var="list" items="${list }">

O_IDX = ${list.oIdx }
P_IDX = ${list.pIdx }
O_CNT = ${list.oCnt }
P_PRICE = ${list.pPrice }
O_STATUS = ${list.oStatus }
F_CHECK = ${list.fCheck }
O_TOTPRICE = ${list.oTotprice }
O_FEE = ${list.oFee }
O_NUMBER = ${list.oNumber }
U_IDX = ${list.uIdx }
PA_IDX = ${list.paIdx }
O_DATE = ${list.oDate }
S_IDX = ${list.sIdx }

 
</c:forEach>


</body>
</html>