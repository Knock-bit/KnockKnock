<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">
<link href="${cp}/resource/css/main.css" rel="stylesheet">

<!-- ======= Header ======= -->

<meta charset=utf-8>
<header id="header" class="fixed-top">
	<div class="container d-flex align-items-center">

		<h1 class="logo me-auto">
			<a href="${cp }/main.do"><img src="${cp }/resource/img/logo.png"></a>
		</h1>
		<!-- Uncomment below if you prefer to use an image logo -->
		<!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

		<nav id="navbar" class="navbar order-last order-lg-0">
			<ul>
				<li><a href="${cp }/run.jsp">Home</a></li>
				<li class="dropdown"><a href="#"><span>About</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${cp }/layout/about/whatisknock.jsp">綠!Knock은?</a></li>
						<li><a href="${cp }/layout/about/manual.jsp">綠!Knock!이용법</a></li>
					</ul></li>
				<li class="dropdown"><a href="#"><span>Campaign</span> <i
						class="bi bi-chevron-down"></i></a>
					<ul>
						<li><a href="${cp }/campaign/ing/list.do">진행중인 캠페인</a></li>
						<li><a href="${cp }/campaign/funding/list.do">캠페인 펀딩하기</a></li>
						<li><a href="${cp }/user/login.do">캠페인 제안하기</a></li>
					</ul></li>


				<li><a href="${cp }/productlist.do?pcIdx=0">Shop</a></li>
				<li><a href="${cp }/contact/contact.do">Contact</a></li>

			</ul>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
		<!-- .navbar -->

		<a href="${cp }/user/login.do" class="get-started-btn">로그인</a> 
		<a href="${cp }/user/signupNav.do" class="get-started-btn">회원가입</a>

	</div>
</header>
<!-- End Header -->