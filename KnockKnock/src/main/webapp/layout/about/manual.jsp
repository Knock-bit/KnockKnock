<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>How to use...</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
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

	<main id="main">
		<!-- ======= Breadcrumbs ======= -->
		<div class="breadcrumbs" data-aos="fade-in">
			<div class="container">
				<h2>Knock!綠!</h2>
				<p>Knock!綠! 어떻게 이용해야 할까요?</p>
			</div>
		</div>
		<!-- End Breadcrumbs -->

		</section>
		<!-- End About Section -->
		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
						data-aos-delay="100">
						<img src="${cp}/resource/img/about/planet.jpg"
							class="img-fluid" style="width: 520px; height: 300px;">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
						<h3>캠페인 참여하기</h3>
						<br>
						<p class="fst-italic">매달 진행되는 캠페인에 참여해보세요!</p>

						<p>
							Knock!綠!의 캠페인 참여하기 페이지에 들어가보면, 매달 진행중인 캠페인을 확인할 수 있어요. 캠페인은 300p를
							지불하고 참여할 수 있으며, 캠페인 내용에 따른 인증하기, 후기남기기, 소셜미디어 공유하기 등 활발이 할수록 캠페인
							참여 순위가 높아져요. 캠페인 순위가 높을수록, 받을 수 있는 리워드 포인트가 더 올라가요! <br>지금
							바로 참여해보세요!
						</p>
						<a href="/campaign/ing/list.do"
							style="margin-top: 35px; color: rgb(10, 61, 14)">캠페인 보러가기</a>
					</div>

				</div>

			</div>
		</section>
		<!-- End About Section -->

		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
						data-aos-delay="100">
						<img src="${cp}/resource/img/about/planet2.jpg" class="img-fluid"
							style="width: 520px; height: 300px;">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
						<h3>캠페인 펀딩하기</h3>
						<br>
						<p class="fst-italic">앞으로 진행될 캠페인을 직접 선택해주세요!</p>

						<p>
							캠페인 펀딩하기는 앞으로 진행될 캠페인 내용을 서포트 해주는 펀딩페이지에요. <strong>Knock!綠!</strong>의
							캠페인은 일정 인원과 포인트가 모여야 진행이 가능한데, 펀딩을 통해 일정 인원과 목표 포인트를 달성하면 캠페인으로
							선정이 돼요.<br> 만일 펀딩한 캠페인이 다음달 캠페인으로 선정이 된 경우, 미리 지불한 250p가
							참여비로 미리 지불이 되어 다시 참여비를 지불하지 않아도 돼요.<br> 마음에 드는 캠페인에 지금 바로
							펀딩해주세요!
						</p>
						<a href="/campaign/funding/list.do"
							style="margin-top: 35px; color: rgb(10, 61, 14)">캠페인 펀딩하러 가기</a>
					</div>
				</div>
			</div>
 
		</section>
		<!-- End About Section -->




		<section id="about" class="about">
			<div class="container" data-aos="fade-up">

				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
						data-aos-delay="100">
						<img src="${cp}/resource/img/about/document.jpg" class="img-fluid"
							style="width: 520px; height: 300px;">
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
						<h3>캠페인 제안하기</h3>
						<br>
						<p class="fst-italic">우리 모두 함께하는 캠페인의 아이디어를 내가 직접 만들기</p>

						<p>
							Knock!綠! 의 캠페인은 모두 함께 만들어갑니다.<br> 캠페인 제안하기 페이지에 있는 양식에 맞춰
							캠페인 아이디어를 제안해주세요.<br> 제안된 아이디어는 운영진이 먼저 검토 후 펀딩을 받게 됩니다. 캠페인
							제안서는 보내주신 날을 기준으로 약 10-14일내에 이메일로 답변을 드려요.<br>톡톡튀는 아이디어로 모두
							함께 즐길 수 있는 캠페인을 만들어가요!
						</p>
						<a href="/campaign/proposal.do"
							style="margin-top: 35px; color: rgb(10, 61, 14)">캠페인 제안하러 가기</a>

					</div>
				</div>

			</div>


			<section id="about" class="about">
				<div class="container" data-aos="fade-up">

					<div class="row">
						<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
							data-aos-delay="100">
							<img src="${cp}/resource/img/about/zerowaste.jpg"
								class="img-fluid" style="width: 520px; height: 300px;">
						</div>
						<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
							<h3>쇼핑하기</h3>
							<br>
							<p class="fst-italic">지속가능한 소비를 위한 친환경 제품 사용하기</p>

							<p>
								Knock!綠! 의 쇼핑몰은 친환경 제품, 지속가능한 소비를 추구하는 판매자들이 자유롭게 운영하는 사이트에요.<br>
								친환경 제품을 구매해서 사용해보세요! 식품부터 의류까지 다양한 물품들이 준비 되어있어요.<br> 혹시 물품
								판매를 원하시나요? 그렇다면 Knock!綠!의 판매자 가입하기를 해주세요. 판매자가 되어 지속가능한 소비를 함께
								이끌어가 주세요.
							</p>
							<a href="/productlist.do?pcIdx=0"
								style="margin-top: 35px; color: rgb(10, 61, 14)">쇼핑하러 가기</a>

						</div>
					</div>

				</div>
			</section>
			<!-- End About Section -->
			<!-- ======= Counts Section ======= -->


			<!-- ======= Testimonials Section ======= -->

		</section>
		<!-- End Testimonials Section -->

	</main>
	<!-- End #main -->




	<!--   <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

 -->
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