<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css" /> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

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
				<button id="emblemBtn" style="border:2px solid #6c9378; color:rgb(10, 61, 14);">EMBLEM</button>
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
					
					<!-- 조회기간 -->
					<div class="day">
						<div class="topsearch">
							<input type="button" class="allTimeSerch" value="전체 조회" onclick="location.href='myPoint.do'";>
							<div class="searchCal">
								<span>기간 선택</span>
								<input type="text" name="cal1" id="cal1"> ~ <input type="text" name="cal2" id="cal2">
								<input type="button" name="canBtn" id="canBtn" value="조회" onclick="goSearch()" >	
							</div>		
						</div>
					</div>
					<div class="menu">
						<p class="m1">이용일자</p>
						<p class="m2">사용/획득처</p>
						<p class="m3">포인트내역</p>
						
					</div>
					<!-- 내역 -->
					<c:forEach var="plist" items="${pointList }">
						<div class="usingPointList">
							<div class="up1"> <!-- 이용일자 -->
								<fmt:formatDate value="${plist.poDate }" var="poDate" pattern="yyyy-MM-dd HH:ss" />
								${poDate }
							</div>
							<div class="up2"> <!-- 사용유형 -->
								<c:if test="${plist.poWhere==0 }">
									FUNDING
								</c:if>
								<c:if test="${plist.poWhere==1 }">
									COUPON
								</c:if>
								<c:if test="${plist.poWhere==2}">
									CAMPAIGN
								</c:if>
								<c:if test="${plist.poWhere==3}">
									CANCEL POINT
								</c:if>
							</div>
							<div class="up3"> <!-- 사용 포인트 -->
								<c:if test="${plist.poEarn eq 0 }">
									 <span style="color:#ff6666">- ${plist.poUsed }</span>
								</c:if>
								<c:if test="${plist.poUsed eq 0}">
									 <span style="color:#66b3ff">+ ${plist.poEarn }</span>
								</c:if>
							</div>						
						</div>
					</c:forEach><br>
				</div>
			</div>
			<!-- 엠블럼 영역 -->
			<div class="emblemZone">
				<p style="text-align:center;">EMBLEM</p>
				<div class="getEmblem">

					<c:forEach var="emblem" items="${emImgList }">
						<div class="eitem">
							<img src="${emblem.CI_EMBLEM }">
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
<script>
$(function(){
	$("#cal1").datepicker();
	$("#cal2").datepicker();
	
	$("#cal1").datepicker('setDate','today');
	$("#cal2").datepicker('setDate','today'); 
});
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' // Input Display Format 변경
    ,showOtherMonths: true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear: true // 년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true // 콤보박스에서 년 선택 가능
    ,changeMonth: true // 콤보박스에서 월 선택 가능
    //,showOn: "both" // button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
    ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" // 버튼 이미지 경로       ,buttonImageOnly: true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트
    ,yearSuffix: "년" // 달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] // 달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] // 달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] // 달력의 요일 부분 Tooltip 텍스트
    ,minDate: "-1Y" // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "+1Y" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
});
function goSearch(){
	var cal1 = $("#cal1").val();
	var cal2 = $("#cal2").val();
	console.log("cal1:"+cal1+",cal2:"+cal2);
	
	location.href="myPointPageCal.do?cal1="+cal1+"&cal2="+cal2;
	
}
</script>
</html>