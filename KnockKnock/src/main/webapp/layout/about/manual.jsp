<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="${cp}/resource/fonts/icomoon/style.css">
	
	<link rel="stylesheet" href="${cp}/resource/css/owl.carousel.min.css">
	
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="${cp}/resource/css/bootstrap.min.css">
	
	<!-- Style -->
	<link href="${cp}/resource/css/manual.css" rel="stylesheet">
	
	
	
	

<title>How to use Knock!Knock!</title>
</head>

<body>
<!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
  
	<div class="content">

		<div class="container">

			<div class="slider-92911">
				<div class="owl-carousel slide-one-item">

					<div class="d-md-flex testimony-29101  align-items-stretch">
						<div class="image"
							style="background-image: url('${cp }/resource/img/about/savetheplanet.jpg');"></div>
						<div class="text">
							<blockquote>
								<h2>캠페인 참여하기</h2>
								<br>
								<p id="text1">
									매달 진행되는 캠페인에 참여해보세요!<br>
									<strong>Knock!Knock!</strong>의 캠페인 참여하기 페이지에 들어가보면, 매달 진행중인
									캠페인을 확인할 수 있어요. 캠페인은 300p를 지불하고 참여할 수 있으며, 캠페인 내용에 따른 인증하기,
									후기남기기, 소셜미디어 공유하기 등 활발이 할수록 캠페인 참여 순위가 높아져요. 캠페인 순위가 높을수록, 받을 수
									있는 리워드 포인트가 더 올라가요! <br>지금 바로 참여해보세요!
								</p>

								<div class="author"><a href="#">진행중인 캠페인 보기</a></div>
							</blockquote>
						</div>
					</div>
					<!-- .item -->

					<div class="d-md-flex testimony-29101 align-items-stretch">
						<div class="image"
							style="background-image: url('${cp }/resource/img/about/theplanet.jpg');"></div>
						<div class="text">
							<blockquote>
								<h2>캠페인 펀딩하기</h2>
								<br>
								<p id="text1">
									캠페인 펀딩하기는 앞으로 진행될 캠페인 내용을 서포트 해주는 펀딩페이지에요. <strong>Knock!Knock!</strong>의
									캠페인은 일정 인원과 포인트가 모여야 진행이 가능한데, 펀딩을 통해 일정 인원과 목표 포인트를 달성하면 캠페인으로
									선정이 돼요.<br> 만일 펀딩한 캠페인이 다음달 캠페인으로 선정이 된 경우, 미리 지불한 250p가
									참여비로 미리 지불이 되어 다시 참여비를 지불하지 않아도 돼요.<br> 마음에 드는 캠페인에 지금 바로
									펀딩해주세요!


								</p>

								<div class="author">
									<a href="#">펀딩중인 캠페인 보기</a>
								</div>
							</blockquote>
						</div>
					</div>
					<!-- .item -->

					<div class="d-md-flex testimony-29101 align-items-stretch">
						<div class="image"
							style="background-image: url('${cp }/resource/img/about/document.jpg');"></div>
						<div class=" text">
							<blockquote>
								<h2>캠페인 제안하기</h2>
								<br>
								<p id="text1">
									함께 나누고 진행하고 싶은 캠페인 아이디어가 있으신가요? 지금 바로 알려주세요! <br> <strong>Knock!Knock!</strong>의
									캠페인은 모두 함께 만들어갑니다.<br> 캠페인 제안하기 페이지에 있는 양식에 맞춰 캠페인 아이디어를
									제안해주세요.<br> 제안된 아이디어는 운영진이 먼저 검토 후 펀딩을 받게 됩니다. 캠페인 제안서는
									보내주신 날을 기준으로 약 10-14일내에 이메일로 답변을 드려요.<br>톡톡튀는 아이디어로 모두 함께
									즐길 수 있는 캠페인을 만들어가요!
								</p>

								<div class="author"><a href="#">캠페인 제안하기</a></div>
							</blockquote>
						</div>
					</div>
				</div>

				<div class="my-5 text-center">
					<ul class="thumbnail">
						<li class="active"><a href="#"><img src="${cp }/resource/img/about/One.jpg"
								alt="Image" class="img-fluid"></a></li>
						<li><a href="#"><img src="${cp }/resource/img/about/Two.jpg" alt="Image"
								class="img-fluid"></a></li>
						<li><a href="#"><img src="${cp }/resource/img/about/Three.jpg" alt="Image"
								class="img-fluid"></a></li>
					</ul>
				</div>
			</div>


		</div>
	</div>


	<script src="${cp }/resource/js/jquery.min.js"></script>
	<script src="${cp }/resource/js/popper.js"></script>
	<script src="${cp }/resource/js/bootstrap.min.js"></script>
	<script src="${cp }/resource/js/owl.carousel.min.js"></script>
	<script src="${cp }/resource/js/manual.js"></script>

	<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>

</html>