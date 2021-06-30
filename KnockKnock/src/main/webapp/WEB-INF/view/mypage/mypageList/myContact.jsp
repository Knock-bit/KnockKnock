<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

 
  <!-- Vendor CSS Files -->
  <link href="${cp}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="${cp}/resource/css/main.css" rel="stylesheet">
	<link href="${cp}/resource/css/nav.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  	
  <!-- page css -->
  <link href="${cp}/resource/css/myContact.css" rel="stylesheet">
  
<script>
	

</script>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">
<p id="ctext">My Question</p>
	<div class="myQuestion">
		<div class="qsgrid">
			<div class="qs1">
				<div class="qs1-2">
					<p>제목</p> 
					<p>${cvo.ctTitle }</p>
				</div>
				<p>${cvo.ctWriteDate }</p>
			</div>
			<div class="qs2">
				${cvo.ctContent }
			</div>
			<c:if test="${cvo.ctResp > 0 }">
			<div class="qs3">
				
					<div class="qs3-1">
						<p>▶ 관리자</p>
						<p>작성일 : ${cvo.cmWriteDate }</p>
					</div>
					<div class="qs3-2">
						${cvo.cmContent }
					</div>
			</div>
			</c:if>
			<c:if test="${cvo.ctResp == 0 }">
					<div class="qs4">
						작성된 답글이 없습니다.
						
					</div>
				</c:if>
			<div class="qs5">
				<button onclick="location.href='myContactList.do'">목록</button>
			</div>

		</div>

	</div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>