<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<%
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up for Knock!Knock!</title>
<!-- bootstrap jquery 추가 -->
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
	rel="apple-touch-icon">

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
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">
<link href="${cp}/resource/css/campaign/funding.css" rel="stylesheet">

<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function create_funding(frm) {
		frm.action = "createFunding.do";
		frm.submit();
	}
</script>
</head>

<body>
	<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />

	<div class="container-fluid" style="margin-top: 200px">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<form action="/createFunding.do?cpIdx=${cpIdx }">
					<input type="hidden" value="${proposal.cpIdx }" name="proposalIdx">
						<div class="card-body">
							<h1>${proposal.cpTitle }</h1>
							<p class="time">${proposal.uNickname }|${proposal.cpRegdate }</p>
							<hr>
							<div class="show_content">
								<p></p>
								<div class="content_body">
									<p>
										<label><h2>캠페인 목표</h2></label>${proposal.cpGoal }</p>
									<p>
										<label><h2>캠페인 취지</h2></label>${proposal.cpContent }</p>
									<p>
										<label><h2>캠페인 키워드</h2></label>
										<c:if test="${proposal.cpKeyword1 ne null}"> ${proposal.cpKeyword1 }</c:if>
										|
										<c:if test="${proposal.cpKeyword2  ne null}">${proposal.cpKeyword2 }</c:if>
										|
										<c:if test="${proposal.cpKeyword3  ne null}">${proposal.cpKeyword3 }</c:if>
									</p>
									<p>
										<label><h2>목표 포인트</h2></label>${proposal.cpGoalpoint }</p>
										
										
								</div>
							</div>
							<hr>
							<div class="author">
								<div class="avatar">
									<br> <img src="${proposal.uImgpath }">프로필 이미지
									<h4 style="display: inline">${proposal.uNickname }</h4>
								</div>
							</div>
							<div class="active">
								<c:if test="${proposal.cpActive == 0 }">
									<input type="submit" value="펀딩 생성하기">
								</c:if>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

</body>

</html>