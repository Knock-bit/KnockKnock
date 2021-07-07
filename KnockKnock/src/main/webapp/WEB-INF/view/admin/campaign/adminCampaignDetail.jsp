<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<jsp:useBean id="today" class="java.util.Date" />
<%-- <fmt:formatDate var="nowDate" value="${today }" pattern ="yyyy-MM-dd" /> --%>
<fmt:parseNumber var="now"
	value="${today.time / (1000 * 60 * 60 * 24) }" integerOnly="true" />
<fmt:parseNumber var="end"
	value="${campaign.ciEnddate.time / (1000 * 60 * 60 * 24) }"
	integerOnly="true" />
<%-- <fmt:parseNumber var = "end" value="${endDate.time() }" integerOnly="true"/>
 --%>
<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Mentor Bootstrap Template - Index</title>
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
<link href="${cp}/resource/css/campaign/campaign.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- Import Kakao -->
<script type="text/JavaScript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<style>
.profile-container {
	width: 200px;
	line-height: 50px;
	height: 50px;
	text-align: center;
}

.helper {
	display: inline-block;
	width: 10%;
	height: 100%;
	vertical-align: middle;
}

.profile-pic {
	border-radius: 50%;
	overflow: hidden;
	align-items: center;
	justify-content: center;
	border: solid 1px #eef0ef;
	display: inline-block;
	width: 40px;
	height: 40px;
	vertical-align: middle;
}

.profile-pic img {
	width: 100%;
	height: 100%;
}
/* .img-box {
   width:100%;
    height:30vh;
    overflow:hidden;
}
.img-box img {
	width:100%; 
	height:100%; 
	object-fit:cover;
	-webkit-filter: blur(20px); 
	filter:blur(20px);
	opacity: 70%;
	position:relative;
	z-index:-1;
	}
 .detail-title {
 	position:relative;
 	top:50%;
 	left:40%;
 	width:500px;
	}  */
.detail-title {
	margin-top: 100px;
	text-align: center;
}

@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 1100px) {
	.container {
		width: 1080px;
	}
}
</style>
</head>
<body>



	<!-- ======= Header ======= -->
	<c:choose>
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
	<main id="main">

		<!-- ======= Breadcrumbs ======= -->

		<section>
			<div class="detail-title">
				<h1>${campaign.ciTitle}</h1>
				<div class="profile-contianer">
					<div class=profile-pic>
						<img src="/resource/img/profile/user_default.png">
					</div>
					${campaign.uNickname }
				</div>
				<div class="helper"></div>
			</div>


		</section>

		<!-- ======= Cource Details Section ======= -->
		<section id="campaign-details" class="campaign-details">
			<div class="container" data-aos="fade-up">
				<%@ include file="/layout/navbar/campaign/navCampaignDetail.jsp"%>
				<div class="row">
					<div class="col-lg-8" id="commonDiv">
					<!-- 썸네일 -->
						<img src="${campaign.ciFile }" class="img-fluid" alt="">
						<h2>${campaign.ciContent }
							</h3>
					</div>







					<div class="col-lg-4">

						<div class="campaign-info align-items-center">
							<h2>${end - now + 1}일남았어요</h2>
							<h3>캠페인 인증방법</h3>
						</div>

						<div
							class="campaign-info d-flex justify-content-between align-items-center">
							<h5>참여중인 사람 목록</h5>
							<p>
								<!-- <div class=profile-container>
              <div class=profile-pic-1>
              <img src="/resource/img/profile/user_default.png">
              </div>
              <div class=profile-pic-2>
              <img src="/resource/img/profile/user_default.png">
              </div></div> -->
								<c:if test="${!empty userList }">
              ${userList.size() }명 참여중<br>
									<c:forEach var="user" items="${userList }">
		              	${user.getNickname() }<br>
									</c:forEach>
								</c:if>
								<c:if test="${empty userList }">
               먼저 참여해보세요!
              </c:if>
							</p>
						</div>

						<div class="campaign-info align-items-center">
							<div class="btn-wrap funding">
								<button onclick="sendLink();" id="share" class="btn-funding">
									공유하기</button>
							</div>
						</div>

						<div class="campaign-info align-items-center">
							<div class="btn-wrap funding">
								<button onclick="funding()" id="participate" class="btn-funding">
									참여하기</button>
							</div>

						</div>

					</div>
				</div>

			</div>
		</section>

		<div class="modal-footer">
			<c:if test="${campaign.ciStatus eq 0 }">
				<button type="button" class="btn btn-secondary" data-dismiss="modal"
					id="fundingStartBtn">캠페인 진행하기</button>
			</c:if>

			<c:if test="${campaign.ciStatus eq 1 }">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">진행중인
					캠페인입니다.</button>
			</c:if>

			<c:if test="${campaign.ciStatus eq 2 }">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">종료된 캠페인(포인트 분배 대기중)</button>
			</c:if>
			<c:if test="${campaign.ciStatus eq 3 }">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">종료된 캠페인</button>
			</c:if>
		</div>

	</main>
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>

	<!-- End Footer -->

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

</html>