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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
<!-- Import BootStrap -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- page css -->
<link href="${cp}/resource/css/myContactList.css" rel="stylesheet">

<!--  page script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(function() {

		// tr 클릭시 해당 게시물로 이동
		$(".oneSection").each(function(idx) {
			$(this).click(function(e) {
				var ctIdx = $(".tdctIdx").eq(idx).text();
				location.href = "myQuestion.do?ctIdx=" + ctIdx;

			});
		});

		$("#myf").click(function() {
			$("#content2").css("display", "block");
			$("#content1").css("display", "none");
		});

		$("#myq").click(function() {
			$("#content2").css("display", "none");
			$("#content1").css("display", "block");
		});

	});
</script>
<style>
.navbar-nav a:hover {
	font-weight: bold;
}
</style>
</head>
<body>
	<!-- ======= Header ======= -->
	<%@ include file="/layout/navbar/navLoggedin.jsp"%>
	<!-- ======= Header 끝  === -->
	<div class="main-content">
		<!-- nav -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light"
			style="padding: 0 5% 0 5%;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" id="myq"
						href="#">문의내역</a></li>
					<li class="nav-item"><a class="nav-link" id="myf" href="#">제안글
							보기</a></li>
					<!-- <li class="nav-item dropdown"><a class="nav-link" href="#">의류</a>
				</li>
				<li class="nav-item dropdown"><a class="nav-link" href="#">생활용품</a>
				</li> -->
				</ul>

			</div>
			<form action="" method="post">
				<input type="search" placeholder="Search" aria-label="Search"><input
					type="submit" value="검색">
			</form>
		</nav>
		<div class="list">
			<div id="content1" class="p-4 p-md-5" style="text-align: center">

				<div class="container1" style="text-align: center;">
					<p
						style="font-size: 20px; text-align: left; border-bottom: 1px solid gray; font-style: normal;">나의
						문의내역</p>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="title" style="background-color: gray; color: white;">
									<th class="no" style="width: 10%;">NO</th>
									<th class="category" style="width: 40%;">제목</th>
									<th class="end_date" style="width: 25%;">작성일</th>
									<th class="reply" style="width: 24%;">답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty contactList }">
									<tr>
										<td colspan="4">
											<p style="text-align: center; font-size: 15px;">문의 내역이
												없습니다.</p>
										</td>
									</tr>
								</c:if>
								<c:if test="${not empty contactList }">
									<c:forEach var="list" items="${contactList }"
										varStatus="status">
										<tr class="oneSection">
											<td class="tdctIdx" style="display: none;">${list.ctIdx }</td>
											<td>${(pvo.total - status.index)-((pvo.nowPage-1) * pvo.cntPerPage) }</td>
											<td class="ctTitles">${list.ctTitle }</td>
											<td style="font-size: 14px;">${list.ctWriteDate}</td>
											<c:if test="${list.ctResp eq 0}">
												<td class="ctresp">-</td>
											</c:if>
											<c:if test="${list.ctResp > 0}">
												<td class="ctresp" style="color: #4d79ff;">답변완료</td>
											</c:if>
										</tr>

									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>

				</div>

				<div class=pagingNum>
					<div class="paginging">
						<ol class="paging">
							<c:if test="${pvo.startPage == 1 }">
								<li id='disable' style="font-size: 13px;">이전으로</li>
							</c:if>
							<c:if test="${pvo.startPage != 1 }">
								<li><a
									href="/myContactList.do?nowPage=${pvo.startPage-1 }&cntPerPage=${pvo.cntPerPage}">이전으로</a>
									<!-- 현재페이지에서 -1페이지 --></li>
							</c:if>
							<%-- 블록 내 표시할 페이지 태그 작성 --%>
							<c:forEach var="pageNo" begin="${pvo.startPage}"
								end="${pvo.endPage}">
								<c:choose>
									<c:when test="${pageNo == pvo.nowPage}">
										<li class="now">${pageNo }</li>
									</c:when>
									<c:otherwise>
										<li><a style="font-weight: 500;"
											href="/myContactList.do?nowPage=${pageNo }&cntPerPage=${pvo.cntPerPage}">${pageNo }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- [다음으로] 사용여부 처리 --%>
							<c:if test="${pvo.endPage == pvo.lastPage }">
								<li class="disale" style="font-size: 13px;">다음으로</li>
							</c:if>
							<c:if test="${pvo.endPage != pvo.lastPage }">
								<span><a
									href="/myContactList.do?nowPage=${pvo.endPage+1 }&cntPerPage=${pvo.cntPerPage}">다음으로</a></span>
							</c:if>
						</ol>
					</div>
				</div>
			</div>
			<!-- 제안글 보기 -->
			<div id="content2" class="p-4 p-md-5" style="text-align: center">
				<div class="container1" style="text-align: center;">
					<p
						style="font-size: 20px; text-align: left; border-bottom: 1px solid gray; font-style: normal;">제안글보기</p>

					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr class="title" style="background-color: gray; color: white;">
									<th class="no" style="width: 10%;">NO</th>
									<th class="category" style="width: 40%;">제목</th>
									<th class="end_date" style="width: 25%;">작성일</th>
									<th class="reply" style="width: 24%;">답변상태</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty proposalList }">
									<tr>
										<td colspan="4">
											<p style="text-align: center; font-size: 15px;">제안 글이
												없습니다</p>
										</td>
									</tr>
								</c:if>
								<c:if test="${not empty proposalList }">
									<c:forEach var="list" items="${proposalList }"
										varStatus="status">
										<tr class="oneSection">
											<td class="tdctIdx" style="display: none;">${list.cpIdx }</td>
											<td>${(ppvo.total - status.index)-((ppvo.nowPage-1) * ppvo.cntPerPage) }</td>
											<td class="ctTitles"><a
												href="getProposal.do?cpIdx=${list.cpIdx }">${list.cpTitle }</a></td>
											<td style="font-size: 14px;">${list.cpRegdate}</td>
											<c:if test="${list.cpActive eq 0}">
												<td class="ctresp" style="color: #ff8080;">승인 대기</td>
											</c:if>
											<c:if test="${list.cpActive > 0}">
												<td class="ctresp" style="color: #4d79ff;">승인 완료</td>
											</c:if>
										</tr>

									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
				<div class=pagingNum>
					<div class="paginging">
						<ol class="paging">
							<c:if test="${ppvo.startPage == 1 }">
								<li id='disable' style="font-size: 13px;">이전으로</li>
							</c:if>
							<c:if test="${ppvo.startPage != 1 }">
								<li><a
									href="/myContactList.do?pnowPage=${ppvo.startPage-1 }&pcntPerPage=${ppvo.cntPerPage}">이전으로</a>
									<!-- 현재페이지에서 -1페이지 --></li>
							</c:if>
							<%-- 블록 내 표시할 페이지 태그 작성 --%>
							<c:forEach var="pageNo" begin="${ppvo.startPage}"
								end="${ppvo.endPage}">
								<c:choose>
									<c:when test="${pageNo == ppvo.nowPage}">
										<li class="now">${pageNo }</li>
									</c:when>
									<c:otherwise>
										<li><a style="font-weight: 500;"
											href="/myContactList.do?pnowPage=${pageNo }&pcntPerPage=${ppvo.cntPerPage}">${pageNo }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- [다음으로] 사용여부 처리 --%>
							<c:if test="${ppvo.endPage == ppvo.lastPage }">
								<li class="disale" style="font-size: 13px;">다음으로</li>
							</c:if>
							<c:if test="${ppvo.endPage != ppvo.lastPage }">
								<span><a
									href="/myContactList.do?pnowPage=${ppvo.endPage+1 }&pcntPerPage=${ppvo.cntPerPage}">다음으로</a></span>
							</c:if>
						</ol>
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