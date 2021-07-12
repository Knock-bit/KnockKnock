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

<!-- js link , table css -->
<jsp:include page='${cp}/layout/admin/adminLink.jsp' flush='false' />
<link href='${cp}/resource/css/admin/adminCss.css' rel="stylesheet"
	type="text/css">

<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
	rel="apple-touch-icon">


<!-- Import Kakao -->
<script type="text/JavaScript"
	src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

.campaign-main-info {
	display: inline-block;
	margin: 0 auto;
}

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
		width: 1100px;
	}
}

.ci-emblem {
	float: left;
	margin-left: 0.3em;
}

.certification {
	margin-top: 10px;
	font-size: 1em;
}

.campaign-keyword {
	margin-top: 10px;
	margin-bottom: 10px;
	color: grey;
}

.campaign-main-info {
	margin-top: 25px;
	margin-bottom: 25px;
	padding: 15px;
}

.sticky-parent {
	overflow-x: hidden;
	overflow-y: hidden;
}

.sticky {
	position: -webkit-sticky;
	position: sticky;
	top: 0;
}

.campaign-info {
	border-radius: 10px;
}

.buttons {
	display: block;
	margin-top: 1.5em;
}

#share {
	width: 2.8em;
	height: 2.8em;
	border-radius: 8px;
	font-size: 1.5em;
	border: 1px solid #c1c1c1;
}

#participate {
	width: 9.7em;
	height: 2.8em;
	margin-left: 0.3em;
	border-radius: 8px;
	background-color: rgb(10, 61, 14);
	color: white;
	font-size: 1.5em;
	border: none;
}

.campaign-details .campaign-info {
	background: #f6f7f6;
	padding: 25px 15px;
	margin-bottom: 15px;
	border-radius: 5px;
	border: 1px solid #e3e3e3;
}

.inner-nav {
	margin-bottom: 10px;
}

#commonDiv {
	padding-right: 20px;
}
</style>


<script>
	function getBoardView(bIdx) {
		$("#commonDiv").load("${cp}/board/getBoard.do?bIdx=" + bIdx);
	}

	function participate() {
		$("#commonDiv").load("${cp}/board/moveInsert.do");
	}
	$(function() {

		var uIdx = "${users.uIdx}";
		if (uIdx == "") {
			$("#participate").attr("onclick",
					"location.href='${cp}/user/login.do'");
		}

		$("#getBoard").click(function() {
			$("#commonDiv").load("${cp}/board/getBoardList.do");
		});
		$("#getContent")
				.click(
						function() {
							$("#commonDiv")
									.load(
											"${cp}/campaign/getDetailContent.do?ciIdx=${campaign.ciIdx }")
						})
		/*  $("#participate").click(function () {
		   $("#commonDiv").load("${cp}/board/moveInsert.do");
		 }) */
		$("#insertBoard").click(function() {
			$("#commonDiv").load("${cp}/board/getBoard.do?bIdx=${board.bIdx }")
		});

	});
	Kakao.init('24f056f59d439e22eab3d1d0b80755f1');
	try {
		function sendLink() {
			Kakao.Link.sendDefault({
				objectType : 'feed',
				content : {
					title : '${campaign.ciTitle}',
					description : '#케익 #녹차 #백범로 #학원 #비트캠프 #분위기',
					imageUrl : '/resource/img/campaign/recycle.png',
					link : {
						mobileWebUrl : document.location.href,
						webUrl : document.location.href,
					},
				},
				buttons : [ {
					title : '웹으로 보기',
					link : {
						mobileWebUrl : document.location.href,
						webUrl : document.location.href,
					},
				}, {
					title : '앱으로 보기',
					link : {
						mobileWebUrl : document.location.href,
						webUrl : document.location.href,
					},
				}, ],
			})
		}
		;
		window.kakaoDemoCallback && window.kakaoDemoCallback()
	} catch (e) {
		window.kakaoDemoException && window.kakaoDemoException(e)
	}
</script>


</head>
<body>




	<!-- 상단, 좌측 네비바 추가1 -->
	<nav
		class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
	</nav>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
		<div class="content-wrapper" style="background: white;">
			<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
			<div class="content-wrapper" style="background: white;">
				<!-- 상단, 좌측 네비바 추가1 -->
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
								<h2>${campaign.ciContent }</h2>
							</div>


							<div class="col-lg-4" style="padding-left: 0px;">
								<center>
									<div class="campaign-main-info">
										<div class="campaign-left">
											<h2>
												<b>${end - now + 1}일</b> 남았어요
											</h2>
										</div>
										<div class="campaign-point">
											총 ${campaign.cTotpoint } 포인트가<br> 참여자들에게 나눠집니다.
										</div>
									</div>
									<div class="campaign-info campaign-keyword">
										<div>
											<center># ${campaign.ciKeyword1 } #
												${campaign.ciKeyword2 } # ${campaign.ciKeyword3 }
										</div>
									</div>
									<div
										class="campaign-info justify-content-between align-items-center">

										<p>
											<img class="ci-emblem" src="${campaign.ciEmblem }"
												width=70px;>
										<div class="certification">
											<span>인증방법</span><br> ${campaign.cGoal }
											</p>
										</div>
										<div class="buttons">
											<div class="btn-wrap funding">
												<button onclick="sendLink();" id="share" class="btn-funding">
													<i class="bi bi-share"></i>
												</button>
												<button onclick="participate()" id="participate"
													class="btn-funding">참여하기</button>
											</div>
										</div>
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
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
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
			<button type="button" class="btn btn-secondary" data-dismiss="modal">종료된
				캠페인(포인트 분배 대기중)</button>
		</c:if>
		<c:if test="${campaign.ciStatus eq 3 }">
			<button type="button" class="btn btn-secondary" data-dismiss="modal">종료된
				캠페인</button>
		</c:if>
	</div>
	</main>
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>


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