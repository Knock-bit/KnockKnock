
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


<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- slick css -->
<link rel="stylesheet" type="text/css" href="/resource/css/slick.css">

<!-- slick script -->
<script src="https://code.jquery.com/jquery-2.2.0.min.js"
	type="text/javascript"></script>
<script src="/resource/js/slick.js" type="text/javascript"
	charset="utf-8"></script>

<!-- page css -->
<link href="${cp}/resource/css/mycaming.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
<!-- page js -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- <script src="${cp}/resource/js/mycaming.js" type="text/javascript"
	charset="utf-8"></script> -->
<script>
$(function(){
	
	
	// 타이머
	 $(".enddate").each(function(index, obj){
		
		var idx = index;
		var ciEndDate = $(this).text();
		CountDownTimer(ciEndDate, idx);
	}); 
});

function CountDownTimer(dt, idx){
    var end = new Date(dt);

    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;

    function showRemaining(){
        var now = new Date();
        var distance = end - now;
        if ( distance < 0) {
            clearInterval(timer);
            $(".countdown").eq(idx).html("디데이!");
            return;
        }
        var days = Math.floor(distance / _day);
        var hour = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance%_minute) / _second);

       
		$(".countdown").eq(idx).html(days+'일' + hour +'시간' + minutes +'분'+seconds+'초');
    }
    timer = setInterval(showRemaining, 1000);
};
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
		<p id="ctext">My Campaign</p>
		<div class="campaingView">
			<div class="clist">
				<div id="con">
					<div class="slide_wrap">
					<div class="slide_box">
					<c:if test="${! empty clist }">
					<div class="slide_list clearfix">
					
						<c:forEach var="campaign" items="${clist}">
							
								
									<div class="slide_content slide01">
										<div class="citem">

											<div class="itemPhoto">
												<p style="display: none;">${campaign.ciIdx }</p>
												<p class="cphoto">
													<img src="${campaign.ciFile}">
												</p>
												<br>
											</div>
											<div class="itemTitle">
												<p class="it1">TITLE</p> <p class="it2">
													${campaign.ciTitle }</p>

											</div>
											<div class="itemContent">
												<p class="it1">CONTENTS</p> <p class="it2">
													${campaign.ciContent }</p>

											</div>
											<div class="itemGoal ">
												<p class="it1">GOAL</p> <p class="it2">
													${campaign.ciGoal }</p>
											</div>
											<div class="itemEnddate">
												<p class="it1">남은기간 </p>
												 <span class="enddate" style="display:none;">${campaign.ciEnddate }</span>
												 <div class="countdown"></div><br>
												 <p>이미지를 클릭하면 상세페이지로 이동합니다.</p>
					

											</div>
			
											<div class="itemPoint">
												<div class="pzone">
													<p>획득 가능 포인트</p>
													<div class="pt">
														<div class="pt2">
														 <fmt:formatNumber value="${campaign.cTotpoint }" var="totPoint" pattern="#,###"/>
															<p class="ptpt">${totPoint} &nbsp;<span style="font-size:20px; color:gray;">P</span></p> 
														
														</div>
													
													</div>
													</div>
													<div class="ezone">
														<p style="margin:0;">획득 가능 엠블럼</p>
														<div class="eb">
															<div  class="eb2">
																<img style="object-fit:cover; width:100%;" src="${campaign.ciEmblem }">
															</div>
													
													</div>
												</div>

											</div>
											
										</div>
									</div>
						</c:forEach>
						
					
						</div>
						</c:if>
						<c:if test="${empty clist }">
							<div style="margin:5%;">
								<p style="font-size:20px; color:#0e4b20;">현재 참여 중인 캠페인이 없습니다.</p>
							
							</div>
							
						</c:if>
						</div>
						<div class="slide_btn_box">
							<button type="button" class="slide_btn_prev">Prev</button>
							<button type="button" class="slide_btn_next">Next</button>
						</div>
						<ul class="slide_pagination"></ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>

	<!-- End Footer -->
</body>
</html>