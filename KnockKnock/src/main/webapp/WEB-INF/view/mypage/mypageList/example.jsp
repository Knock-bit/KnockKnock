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

<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- page css  -->
<link href='/resource/img/upload/mypage/main.css' rel='stylesheet' />
<script src='/resource/img/upload/mypage/main.js'></script>
<script src='/resource/img/upload/mypage/ko.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	document.addEventListener('DOMContentLoaded', function() {

		var calendarEl = document.getElementById('calendar');
		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'datGrid', 'timeGrid', 'list', 'interaction' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth, timeGridWeek, timeGridDay, listWeek'
			},
			defaultView : 'dayGridMonth',
			locale : 'ko',
			navLinks : true, //날짜 등을 클릭하면 view로 이동하는 거인듯..?
			editable : true,
			allDaySlot : false,
			eventLimit : true, // allow "more" link when too many events
			minTime : '10:00:00',
			maxTime : '24:00:00',
			contentHeight : 'auto',

			events : function(info, successCallback, failureCallback) {
				$.ajax({
					url : "myCal.do",
					type : "get",
					dataType : 'json',
					success : function(result) {
						var list = result;
						console.log(list);

						

						var calendarEl = document.getElementById('calendar');

						var events = list.map(function(item) {
							return {
								title : item.bSubject,
								start : item.bRegdate + "T"
							}

						});

						var calendar = new FullCalendar.Calendar(calendarEl, {
							events : events,
							eventTimeFormat : {
								hour : '2-digit',
								minute : '2-digit',
								hour12 : false
							}
						});
						calendar.render();
						
					}, 
					
				}); 
				
			}
		});

	});
	
</script>
<style>
.main-content {
	flex: 1;
	min-height: 100vh;
	margin-top: 100px;
}

.myRecode {
	width: 80%;
	margin: 0 auto;
}

#calendar {
	width: 70%;
	margin: 0 auto;
}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/layout/navbar/navLoggedin.jsp"%>
	<!-- ======= Header 끝  === -->
	<div class="main-content">
	<p class="uidx" style="display:none;">${users.uIdx }</p>
		<h3 style="text-align: center;">My Diary</h3>
		<div class="myRecode">
			<div id='calendar'></div>





		</div>
	</div>
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>

	<!-- End Footer -->
</body>
</html>