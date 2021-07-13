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
<!-- comments css, js 추가 \ -->
<link href='${cp}/resource/css/admin/adminComment.css' rel="stylesheet"
	type="text/css">
<script src="${cp}/resource/js/admin/adminComment.js"></script>
<script src="${cp}/resource/js/admin/adminComment2.js"></script>
</head>

<body>

	<c:set var="contact" value="${contact }" scope="session" />
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
						<div class="card-body">
							<h1>${contact.ctTitle }</h1>
							<p class="time">${contact.uNickname }|${contact.ctWritedate }</p>
							<hr>
							<div class="show_content">
								<div class="content_body">
									<p style="font-size: 2em">${contact.ctContent }</p>
								</div>
							</div>
							<hr>
							<div class="author">
								<div class="avatar">
									<br> <img src="/resource/img/upload/${contact.uImgpath }">
									<h4 style="display: inline">${contact.uNickname }</h4>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div id="commentBox2" style="margin-top: 15px">
				<c:forEach var="comment" items="${comment }">
					<div class="media comment-box">
						<div class="media-left">
							<a href="#"> <img class="img-responsive user-photo"
								src="https://ssl.gstatic.com/accounts/ui/avatar_2x.png">
							</a>
						</div>
						<div class="media-body">
							<h4 class="media-heading" style="margin-left: 15px">관리자</h4>
							<p style="margin-left: 15px">${comment.cmContent }</p>
						</div>
					</div>
				</c:forEach>
				<hr>
			</div>
			<div class="row">
				<div class="col-md-6">
					<div class="widget-area no-padding blank">
						<div class="status-upload">
							<form action="insertContactComment.do" method="post">
								<label>답변 남기기</label>
								<textarea name=cmContent></textarea>

								<button type="submit" class="btn btn-success green">
									<i class="fa fa-share"></i> 댓글달기
								</button>
							</form>
						</div>
						<!-- Status Upload  -->
					</div>
					<!-- Widget Area -->
				</div>

			</div>
		</div>
	</div>

</body>

</html>