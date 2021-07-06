<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="cp" value="${pageContext.request.contextPath }" />
 
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
   <!-- Google Fonts -->
      <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

      <!-- Vendor CSS Files -->
      <link href="${cp}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

 	<link rel="stylesheet" href="${cp}/resource/fonts/icomoon/style.css">
	
	<link rel="stylesheet" href="${cp}/resource/css/owl.carousel.min.css">
	 
	
	<!-- Style -->
	<link href="${cp}/resource/css/manual.css" rel="stylesheet">
	
	  <!-- Vendor CSS Files -->
  <link href="${cp}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
	
  <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
    <link href="${cp}/resource/css/main.css" rel="stylesheet">
  

<!-- Style -->
<link href="${cp}/resource/css/contact.css" rel="stylesheet">
 
      <!-- Main CSS File -->
      <link href="${cp}/resource/css/main.css" rel="stylesheet">
      <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
      <link href="${cp}/resource/css/contact.css" rel="stylesheet">
 
      <!-- Import BootStrap -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 
<title>문의하기</title>
</head>

<body>
<!-- ======= Header ======= -->
      <c:choose>
  	<c:when test="${users.uType eq 1 }">
   		<jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false'/>   	
  	</c:when>
  	<c:when test="${users.uType eq 0 }">
   		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false'/>   	  	
  	</c:when>
  	<c:otherwise>
	   <jsp:include page='/layout/navbar/nav.jsp' flush='false'/>
  	</c:otherwise>
  	</c:choose>
  <!-- ======= Header 끝  === -->
	<div class="content">

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="row align-items-center">
						<div class="col-lg-7 mb-5 mb-lg-0">
							<h2 class="mb-5">
								내 문의사항 <br>전송하기
							</h2>
							<form class="border-right pr-5 mb-5" method="post"
								id="contactForm" name="contactForm" action="sendContact.do">
								<div class="row">
									<div class="col-md-6 form-group">
										<input type="text" class="form-control" name="ctTitle"
											id="title" placeholder="제목" maxlength="20">
											<p style="display:none;" >${userVO.uIdx } </p>
									</div>
									<div class="col-md-6 form-group">
										<select name="ctcIdx" id="category">
											<option selected value="문의유형">문의유형</option>
											<option name="ctcIdx" value="1">주문상품/배송문의</option>
											<option name="ctcIdx" value="2">결제/취소/환불문의</option>
											<option name="ctcIdx" value="3">캠페인 관련</option>
										</select>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12 form-group">
										<textarea class="form-control" name="ctContent" id="message"
											cols="30" rows="10" placeholder="문의사항을 작성해주세요."></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" value="전송"
											class="btn btn-success rounded-0 py-2 px-4"> <span
											class="submitting"></span>
									</div>
								</div>
							</form>

						</div>
						<div class="col-lg-4 ml-auto">
							<h3 class="mb-4">Knock!Knock!궁금하신 점이 있으신가요?</h3>
							<p>문의를 작성해서 보내주시면 확인 후 5일이내에 답변 보내드려요. 작성한 문의내역은 "나의 문의내역"에서도
								확인 가능합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

        <!-- Template Main JS File -->
   <script src="${cp }/resource/js/jquery.min.js"></script>
   <script src="${cp }/resource/js/popper.js"></script>
   <script src="${cp }/resource/js/bootstrap.min.js"></script>
   <script src="${cp }/resource/js/owl.carousel.min.js"></script>
   <script src="${cp }/resource/js/main.js"></script>

   <!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</html>