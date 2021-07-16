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
<title>제안서 상세보기</title>
<!-- js link , table css -->
<jsp:include page='${cp}/layout/admin/adminLink.jsp' flush='false' />
<link href='${cp}/resource/css/admin/adminCss.css' rel="stylesheet"
	type="text/css">

</head>

<body>
	<!-- 상단, 좌측 네비바 추가1 -->
	<nav
		class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
	</nav>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
		<div class="content-wrapper" style="background: white;">
			<!-- 상단, 좌측 네비바 추가1 -->
			<div class="row">
				<div class="col-md-12">
					<div class="card">
						<form action="/createFunding.do?cpIdx=${cpIdx }">
							<input type="hidden" value="${proposal.cpIdx }"
								name="proposalIdx">
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
										<br> <img style="width:20%; border:2px solid gray; padding:3%;" src="/resource/img/upload/${proposal.uImgpath }">
										<h4 style="display: inline; font-size:20px;">닉네임 : ${proposal.uNickname }</h4>
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
	</div>

</body>

</html>