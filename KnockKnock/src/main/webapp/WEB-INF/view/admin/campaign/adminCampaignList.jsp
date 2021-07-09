<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- bootstrap jquery 추가 -->
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>

<style>
.table {
	margin-top: 250px;
	margin-left: 50px
}
</style>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "adminCampaignList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
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
</head>
<body>
	<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div style="float: right;">
						<a href="/adminCampaignList.do?sort=제목">제목순</a> 
						<a href="/adminCampaignList.do?sort=제안자">제안자순</a> 
						<a href="/adminCampaignList.do?sort=시작일">시작일순</a> 
						<a href="/adminCampaignList.do?sort=종료일">종료일순</a>
						<a href="/adminCampaignList.do?sort=활성상태">활성상태</a> 
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
								보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
								보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
								보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
								보기</option>
						</select>
					</div>
					<!-- 검색기능추가 -->
					<form action="adminCampaignList.do" method="get">
						<table class="border-none">
							<tr>
								<td><select name="searchCondition">
										<c:forEach var="option" items="${conditionMapUserCampaign }">
											<option value="${option.value}">${option.key }</option>
										</c:forEach>
								</select> <input type="text" name="searchKeyword"> <input
									type="submit" value="검색"></td>
							</tr>
						</table>
					</form>
					<form id="proposalForm" method="post"
						style="margin-top: 300px; margin-left: 100px;">
						<table class="table table-bordered table-striped"
							style="margin-top: 0px;">
							<h3 class="text-center">캠페인리스트</h3>

							<c:if test="${empty viewAll }">
								<tr>
									<td>등록된 캠페인 리스트가 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty viewAll }">
								<thead>
									<tr>
										<td>캠페인 번호</td>
										<td>제목</td>
										<td>제안자</td>
										<td>캠페인 시작일</td>
										<td>캠페인 종료일</td>
										<td>상태</td>
									</tr>
								</thead>
								<tbody id="tableList">
									<c:forEach var="campaign" items="${viewAll }">
										<tr>
											<td>${campaign.ciRn }</td>
											<td><a href="getCampaign.do?ciIdx=${campaign.ciIdx }">${campaign.ciTitle }</a></td>
											<td>${campaign.uNickname }</td>
											<td>${campaign.ciStartdate }</td>
											<td>${campaign.ciEnddate }</td>
											<c:if test="${campaign.ciStatus  eq 0}">
												<td>진행 대기중</td>
											</c:if>
											<c:if test="${campaign.ciStatus eq 1}">
												<td>진행중</td>
											</c:if>
											<c:if test="${campaign.ciStatus  eq 2}">
												<td>캠페인 종료(포인트 분배 예정)</td>
											</c:if>
											<c:if test="${campaign.ciStatus  eq 3}">
												<td>포인트 분배 완료</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</c:if>
						</table>
					</form>
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/adminCampaignList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/adminCampaignList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/adminCampaignList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






