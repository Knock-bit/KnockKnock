<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!doctype html>
<html lang="ko">

<head>
<title>What is knock</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!--구글폰트-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${cp }/resource/css/whatisknock.css">
<link rel="stylesheet" href="${cp }/resource/css/owl.carousel.min.css">
<link rel="stylesheet" href="${cp }/resource/css/owl.theme.default.min.css">

  <!-- Main CSS File 넣는순간 옹졸녹됨
     <link href="${cp}/resource/css/main.css" rel="stylesheet">-->

<style></style>

</head>

<body>

<!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
  
  <section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="featured-carousel owl-carousel">
						<div class="item">
							<div class="work-wrap d-md-flex">
								<div class="img order-md-last" style="background-image: url(${cp }/resource/img/about/plastic.jpg);"></div>
								<div class="text text-left text-lg-right p-4 px-xl-5 d-flex align-items-center">
									<div class="desc w-100">
										<h3 class="mb-4">綠KNOCK!<br>지금 지구는...</h3>
										<p class="h5">탄소배출·지구온난화·기후위기...</p>
										<p class="h5">멸종 없는 인류를 위한 문제</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>
													국회미래연구원의 중장기 미래예측을 바탕으로 볼 때, 현재와 같은 추이로 환경이 지속될 경우 2050년 한반도는 환경
													재앙수준이 될 것이라고 해요. </p>
												<p>40도가 넘는 기온, 미세먼지 악화..거주불능의 지구.
													<br>우리의 지구. 이대로 괜찮을까요?
												</p>
											</div>
										</div>
										<p id="btngrp">
											<button type="button" id="button1"
												class="btn btn-outline-dark mb-2 py-3">KNOCK!KNOCK! 시작하기</button>
											<button type="button" id="button2" class="btn btn-dark mb-2 py-3">캠페인
												보기</button>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="work-wrap d-md-flex">
								<div class="img order-md-last"
									style="background-image: url(${cp }/resource/img/about/deforestation.jfif);"></div>
								<div class="text text-left text-lg-right p-4 px-xl-5 d-flex align-items-center">
									<div class="py-md-5">
										<h3 class="mb-4">綠KNOCK!<br>노크하다</h3>
										<p class="h5">환경을 위한 노크</p>
										<p class="h5">라이프 스타일의 변화</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>환경보호를 위한 실천. 아주 쉽게 즐기도록 Knock!Knock!이 옆에서 도와드릴게요!</p>
												<p>힘들어하는 지구를 위해 우리가 지켜야할 것들을 라이프스타일에 자연스럽게 녹아들도록 환경에 노크해봐요!
													녹녹과 함께 현재 당신의 삶에서 쉽게 실천할 수 있는 캠페인에 참여하고, 환경에 알맞은 소비를 하면 돼요.</p>
											</div>
										</div>
										<p id="btngrp">
											<button type="button" id="button1"
												class="btn btn-outline-dark mb-2 py-3">KNOCK!KNOCK! 시작하기</button>
											<button type="button" id="button2" class="btn btn-dark mb-2 py-3">캠페인
												보기</button>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="work-wrap d-md-flex">
								<div class="img order-md-last" style="background-image: url(${cp }/resource/img/about/green.jpg);"></div>
								<div class="text text-left text-lg-right p-4 px-xl-5	 d-flex align-items-center">
									<div class="py-md-5">
										<h3 class="mb-4">綠KNOCK!<br>푸를 녹</h3>
										<p class="h5">지구를 더욱 푸르게</p>
										<p class="h5">우리 모두를 위한 변화</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>세상의 변화는 아주 작은것부터 시작된다고 해요.<br>생활속에서 지켜가는 작은 변화가 우리 지구를 다시
													푸르게, 아름다운 지구로 바꿔나갈 수 있어요.</p>
												<p>환경을 위한 작은 변화, 녹녹과 함께 시작해봐요.</p>
												<p>지금 바로! 함께 아름다운 지구를 위해 환경에 노크해보러 가볼까요?</p>
											</div>
										</div>
										<p>
											<button type="button" id="button1"
												class="btn btn-outline-dark mb-2 py-3">KNOCK!KNOCK!
												시작하기</button>
											<button type="button" id="button2" class="btn btn-dark mb-2 py-3">캠페인
												보기</button>
										</p>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>

	<script src="${cp }/resource/js/jquery.min.js"></script>
	<script src="${cp }/resource/js/popper.js"></script>
	<script src="${cp }/resource/js/bootstrap.min.js"></script>
	<script src="${cp }/resource/js/owl.carousel.min.js"></script>
	<script src="${cp }/resource/js/whatisknock.js"></script>

	<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>

</html>