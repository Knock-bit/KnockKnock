<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Knock!Knock!-Main</title>
<meta content="" name="description">
<meta content="" name="keywords">

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

	<!-- ======= Header ======= -->
	<c:choose>
		<c:when test="${!empty seller}">
			<jsp:include page='/layout/navbar/navSeller.jsp' flush='false' />
		</c:when>
		<c:when test="${users.uType eq 1 }">
			<jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false' />
		</c:when>
		<c:when test="${users.uType eq 0 }">
			<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
		</c:when>
		<c:otherwise>
			<jsp:include page='/layout/navbar/nav.jsp' flush='false' />
		</c:otherwise>
	</c:choose>

	<!-- ======= Hero Section ======= -->
	<section id="hero"
		class="d-flex justify-content-center align-items-center">
		<div class="container position-relative" data-aos="zoom-in"
			data-aos-delay="100">
			<h1>
				Knock!綠!<br>Knock Environment, Knock your life.
			</h1>
			<h2>To make our planet greener.</h2>
			<a href="${cp }/layout/about/whatisknock.jsp" class="btn-get-started">Knock!綠!
				시작하기</a>
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
						data-aos-delay="100">
						<img src="${cp}/resource/img/about/planet.jpg" class="img-fluid">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
						<h1>Knock!綠!</h1>
						<p class="fst-italic" style="font-size: 20px;">더 푸르고 깨끗한 지구를
							위해 환경에 노크하다.</p>
						<ul>
							<li><i class="bi bi-check-circle"></i>아름답고 푸른 지구를 위한 캠페인 진행</li>
							<li><i class="bi bi-check-circle"></i>지속가능한 소비를 위한 친환경 제품 쇼핑</li>
						</ul>
						<p>
							환경오염으로 아파하는 지구가 다시 푸른 지구가 될 수 있도록 함께 노력해가요.<br> 환경을 위한 올바른
							인식과 생활습관을 가질 수 있도록 Knock!綠! 함께 하겠습니다.
						</p>

					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->



		<!-- ======= Why Us Section ======= -->
		<section id="why-us" class="why-us">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-4 d-flex align-items-stretch">
						<div class="content">
							<h3>
								Why Choose<br>Knock!綠?
							</h3>
							<p>
								Knock!綠!의 이용자들은 누구인가요?<br> Knock!綠!을 써야하는 이유가 뭘까요?
							</p>
							<div class="text-center">
								<a href="${cp }/layout/about/whatisknock.jsp" class="more-btn">Knock!綠!알아보기
									<i class="bx bx-chevron-right"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-lg-8 d-flex align-items-stretch" data-aos="zoom-in"
						data-aos-delay="100">
						<div class="icon-boxes d-flex flex-column justify-content-center">
							<div class="row">
								<div class="col-xl-4 d-flex align-items-stretch">
									<div class="icon-box mt-4 mt-xl-0">
										<i class="bi bi-search"></i>
										<h4 style="margin-top:20px;">환경보호에 대해 관심이 있는 분들</h4>
										<p>연일 보도되는 환경오염 뉴스를 보며 환경에 관심은 있으신데 환경보호 어디서부터 시작해야 할 지
											모르시겠다구요? 그럼 지금 바로 Knock!綠!해주세요.</p>
									</div>
								</div>
								<div class="col-xl-4 d-flex align-items-stretch">
									<div class="icon-box mt-4 mt-xl-0">
										<i class="bi bi-cart"></i>
										<h4 style="margin-top:20px;">건강한 생활습관을 가지고 싶으신 분들</h4>
										<p>지속가능한 소비를 하면서 건강에도 좋은 친환경 제품들을 지금 바로 Knock!綠! 쇼핑에서
											구매해보세요.</p>
									</div>
								</div>
								<div class="col-xl-4 d-flex align-items-stretch">
									<div class="icon-box mt-4 mt-xl-0">
										<i class="bi bi-globe"></i>
										<h4 style="margin-top:20px;">현재 지구에 살고 있는 모든 분들</h4>
										<p>날이 갈수록 심각해지는 환경오염. 지구에 있는 우리 모두는 안전할 수 없어요. 지구에서 더
											안전하게, 더 행복하게, 더 푸른 지구를 다시 볼 수 있도록 바로 Knock!綠!해주세요.</p>
									</div>
								</div>
							</div>
						</div>
						<!-- End .content-->
					</div>
				</div>

			</div>
		</section>
		<!-- End Why Us Section -->


		<!-- ======= Trainers Section ======= -->
		<section id="trainers" class="trainers">
			<div class="container" data-aos="fade-up">

				<div class="section-title">
					<h2>Developers</h2>
					<p>Knock!綠!을 개발한 사람들</p>
				</div>

				<div class="row" data-aos="zoom-in" data-aos-delay="100">
 
					<div>
						<div class="member">
							<img src="" class="img-fluid" alt="">
							<div class="col">
								<h4>김동아</h4>
								<span>Web Development</span>
								<p>Knock!綠! 회원가입 및 로그인 개발</p>

							</div>
							<div class="col">
								<h4>김소해</h4>
								<span>Web Development</span>
								<p>Knock!綠! 캠페인 등록, 개시 개발</p>

							</div>
							<div class="col">
								<h4>설한정</h4>
								<span>Web Development</span>
								<p>Knock!綠! 홈페이지 관리자 기능 개발</p>

							</div>
							<div class="col">
								<h4>홍혜민</h4>
								<span>Web Development</span>
								<p>Knock!綠! 회원관리 수정 및 쇼핑몰 개발</p>

							</div>
							<div class="col">
								<h4>최기영</h4>
								<span>Web Development</span>
								<p>Knock!綠! 캠페인/쇼핑몰 후기, 커뮤니티 게시판 개발</p>
								<div class="social">
									<a href="https://github.com/Knock-bit/KnockKnock.git"><i
										class="bi bi-github"></i></a>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Trainers Section -->

	</main>
	<!-- End #main -->


	<!-- Vendor JS Files -->
	<script src="${cp}/resource/vendor/aos/aos.js"></script>
	<script
		src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
	<script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
	<script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${cp}/resource/js/main.js"></script>

</body>
<!-- ======= Footer ======= -->
<%@ include file="/layout/footer.jsp"%>

<!-- End Footer -->
</html>
</html>