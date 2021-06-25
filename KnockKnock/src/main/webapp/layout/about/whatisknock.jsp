<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!doctype html>
<html lang="ko">

<head>
	<title>What is knock</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!--구글폰트-->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900" rel="stylesheet">

	<link rel="stylesheet" href="${cp }/resource/css/owl.carousel.min.css">
	<link rel="stylesheet" href="${cp }/resource/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/4.5.6/css/ionicons.min.css">
	<link rel="stylesheet" href="${cp }/resource/css/whatisknock.css">
</head>

<body>

  <!-- ======= Header ======= -->

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
										<h3 class="mb-4">綠KNOCK!<br>지금 지구는..</h3>
										<p class="h5">기후변화·지구온난화·기후위기...</p>
										<p class="h5 mb-4">대응이 필요한 환경문제</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>
													국회미래연구원의 중장기 미래예측을 바탕으로 볼 때, 현재와 같은 추이로 환경이 지속될 경우 2050년 한반도는 환경
													재앙수준이 될 것이라고 해요. 40도가 넘는 기온에 대기중 미세먼지 악화로 인해 숨을 쉴 수 없어 방독면을 쓰는
													일상...상상이 되시나요?<br>이런 환경재앙을 막기위해 우리는 뭐부터 해야할까요?
												</p>
											</div>
										</div>
										<p>
											<button type="button"
												class="btn btn-outline-dark mb-2 py-3 px-4">KNOCK!KNOCK! 시작하기</button>
											<button type="button" class="btn btn-dark mb-2 py-3 px-4">캠페인 보기</button>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="work-wrap d-md-flex">
								<div class="img order-md-last"
									style="background-image: url(images/deforestation.jfif);"></div>
								<div class="text text-left text-lg-right p-4 px-xl-5 d-flex align-items-center">
									<div class="py-md-5">
										<h3 class="mb-4">KNOCK!<br>KNOCK!</h3>
										<p class="h5">환경을 위한 노크</p>
										<p class="h5 mb-4">라이프 스타일의 변화</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>녹녹은 힘들어하는 지구를 위해 우리가 지켜나가야 할 환경보호의 인식을 여러분들의 라이프스타일에 자연스럽게 녹아들도록 도움을
													주는 사이트에요.<br>전혀 어렵지 않아요! 현재 당신이 생각하고 있는 환경 보호를 조금씩 생활면에서 바꿔갈 수 있도록
													캠페인도 참여하고, 환경에 알맞은 소비를 도와주고 그에 따른 습관을 길러주죠.</p>
											</div>
										</div>
										<p>
											<button type="button"
												class="btn btn-outline-dark mb-2 py-3 px-4">KNOCK!KNOCK! 시작하기</button>
											<button type="button" class="btn btn-dark mb-2 py-3 px-4">캠페인 보기</button>
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
										<h2 class="mb-4">綠綠</h2>
										<p class="h5">지구를 더욱 푸르게</p>
										<p class="h5 mb-4">우리 모두를 위한 변화</p>
										<div class="row justify-content-end">
											<div class="col-xl-8">
												<p>세상의 변화는 아주 작은것으로부터 시작된다고 해요.<br>여러분들이 생활속에서 지켜가는 작은 변화가 우리 지구를 다시
													푸르게, 아름다운 지구로 바꿔나갈 수 있어요.<br>
													우리 바로 함께 아름다운 지구를 위해 환경에 노크해보러 가볼까요?</p>
											</div>
										</div>
										<p>
											<button type="button"
												class="btn btn-outline-dark mb-2 py-3 px-4">KNOCK!KNOCK! 시작하기</button>
											<button type="button" class="btn btn-dark mb-2 py-3 px-4">캠페인 보기</button>
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
	
	<!-- footer -->
</body>

</html>