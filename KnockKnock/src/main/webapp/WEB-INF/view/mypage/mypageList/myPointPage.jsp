<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
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
<link href="${cp}/resource/css/nav.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR:wght@300&family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- page script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- paga css -->
<link href="${cp}/resource/css/myPointPage.css" rel="stylesheet">

<script>
	$(function() {

		// 포인트 or 엠블럼 버튼 클릭
		$("#pointBtn").on("click", function() {
			$("#pointBtn").css("border-bottom","none");
			$("#pointBtn").css("background-color","#6c9378");
			$("#pointBtn").css("border","2px solid #6c9378");
			$("#pointBtn").css("color","white");
			
			$("#emblemBtn").css("background-color","white");
			$("#emblemBtn").css("border","2px solid #6c9378");
			$("#emblemBtn").css("color","#0e4b20");
			$(".emblemZone").hide();
			$(".pointZone").show();
		});
		$("#emblemBtn").on("click", function() {
			$("#emblemBtn").css("border-bottom","none");
			$("#emblemBtn").css("background-color","#6c9378");
			$("#emblemBtn").css("border","2px solid #6c9378");
			$("#emblemBtn").css("color","white");
			
			$("#pointBtn").css("background-color","white");
			$("#pointBtn").css("border","2px solid #6c9378");
			$("#pointBtn").css("color","#0e4b20");
			$(".emblemZone").show();
			$(".pointZone").hide();
		});

		// 누적 포인트 
		var allPoint = "${users.uTotPoint}";

		$({
			val : 0
		}).animate({
			val : allPoint
		}, {
			dutation : 4000,
			step : function() {
				var num = numberWithCommas(Math.floor(this.val));
				$("#allPoint").text(num );
			},
			complete : function() {
				var num = numberWithCommas(Math.floor(this.val));
				$("#allPoint").text(num );
			}
		});

		// 사용,가용포인트 그래프
		var uPoint = ${users.uUsedPoint / users.uTotPoint * 100};
		var ePoint = ${100 - (users.uUsedPoint / users.uTotPoint * 100)};

		$("#uPoint").css("width", uPoint + "%");
		$("#ePoint").css("width", ePoint + "%");
		

		//엠블럼 활성화 상태
		$(".exitem").each(function(i) {
			if ($(this).children('span').text() == 0) {
				$(this).children('img').css("opacity", "0.1");
			}
		});
		//=======================

		$(".exitem").each(function(i) {
			var imgName = $(this).children('p').text();
			var onlyName = imgName.substring(0, imgName.indexOf("."));
			console.log(onlyName);

			if ($(this).children('span').text() == 0) {

				$(".eitem > img[src*='think-green']").each(function(i) {

					$(this).css("opacity", "0.1");

				});

			}

		});

	});
	// 포인트 , 함수
	function numberWithCommas(x) {
		return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	}
</script>


</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/layout/navbar/navLoggedin.jsp"%>
	<!-- ======= Header 끝  === -->
	<div class="main-content">



		<div class="myPoint">
			<div class="btnDiv">
				<button id="pointBtn" style="background-color:#6c9378; color:white; border:2px solid #6c9378;">POINT</button>
				<button id="emblemBtn" style="border:2px solid #6c9378;">EMBLEM</button>
			</div>
			<!-- 포인트 영역 -->
			<div class="pointZone">
				<div class="item1">
					<p>누적 포인트</p>
					<img src="/resource/img/upload/pp.png">
					<div id="allPoint"></div>

				</div>
				<div class="item2">
					<p>사용 포인트 / 보유 포인트</p>
					<div class="graph stack1">
						<p style="font-weight:530;">[ Used Point ]</p>
						<p style="font-size:15px;	color:#ff6666;font-weight:bold;"> ${users.uUsedPoint}&nbsp;P</p><br>
						<span id="uPoint"></span>

					</div>
					<br>
					<div class="graph stack2">
						<p style="font-weight:530;">[ Available Point ]</p>
						<p style="font-size:15px;	color:#f8c078;font-weight:bold;">${users.uTotPoint-users.uUsedPoint}&nbsp;P</p><br>
						<span id="ePoint"></span>

					</div>


				</div>
				
				<div class="item3">
					
					<p><img src="/resource/img/upload/pp2.png">&nbsp;&nbsp;&nbsp;포인트 적립 / 사용 내역</p>




				</div>
			</div>
			<!-- 엠블럼 영역 -->
			<div class="emblemZone">
				<p style="text-align:right;">MY EMBLEM</p>
				<div class="getEmblem">

					<c:forEach var="emblem" items="${emImgList }">
						<div class="eitem">
							<img src="/resource/img/upload/${emblem.CI_EMBLEM }">
						</div>

					</c:forEach>



				</div>



			</div>
		</div>
	</div>
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>

	<!-- End Footer -->
</body>
</html>