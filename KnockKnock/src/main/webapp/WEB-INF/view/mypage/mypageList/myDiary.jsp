<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html lang='ko'>
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
<!-- <link href='/resource/img/upload/mypage/main.css' rel='stylesheet' />
<script src='/resource/img/upload/mypage/main.js'></script>
<script src='/resource/img/upload/mypage/ko.js'></script> -->
<link href="/resource/img/upload/mypage/packages/core/main.css" rel ="stylesheet" />
<link href="/resource/img/upload/mypage/packages/daygrid/main.css" rel ="stylesheet" />
<script src="/resource/img/upload/mypage/packages/core/main.js"></script>
<script src="/resource/img/upload/mypage/packages/interaction/main.js"></script>
<script src="/resource/img/upload/mypage/packages/daygrid/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>

$(function(){
	var calendarEl = document.getElementById('calendar');
	var calendar = new FullCalendar.Calendar(calendarEl, {
		plugins:["interaction","dayGrid"],
		defaultView : 'dayGridMonth',
		locale : 'ko',
		navLinks : true, //날짜 등을 클릭하면 view로 이동하는 거인듯..?
		editable : true,
		eventLimit : true, // allow "more" link when too many events
		contentHeight : 'auto',
		
		//날짜 클릭시 모달 활성화
        dateClick: function (data) {
           /* $("#myModal3").css("display","block");
           $("#myModal3").addClass("in"); */
           $("#myModal3").click();
           onload="calModal()";
          /*  console.log(data.dateStr); */
        }
      });
      var calendar;
      calendar.render();

      $.ajax({
  		url : "/myCal.do",
  		type : "get",
  		success : function(data) {
  			console.log(data);
  			
			for(var i=0; i< data.length; i++){
				var title = data[i].bSubject;
				var start = data[i].bRegdate; // date타입 받음
				//var start = moment(data[i].bRegdate).format('yyyy-MM-dd'); 
				var color =  '#6c9378'; 
				var textColor = '#FFFFFF';
				
				calendar.addEvent({title : title,color:color,textColor:textColor, start: start});
			
			}
  			
  		}
  		
  	});  
});
			
		


		
	
	
</script>
<style>
*{
	font-family: 'Noto Sans KR', sans-serif;
}
.main-content {
	flex: 1;
	height:100%;
	margin-top: 100px;
}

.myRecode {
	width: 80%;
	margin: 0 auto;
}

#calendar {
	width: 70%;
	margin: 0 auto;
	font-size:13px;
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