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
		location.href = "adminKeywordList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div style="float: right;">
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
					<form action="adminProposalList.do" method="get">
						<table class="border-none">
							<tr>
								<td><select name="searchCondition">
										<c:forEach var="option" items="${conditionMapFunding }">
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
							<h3 class="text-center">제안서관리창</h3>

							<c:if test="${empty viewAll }">
								<tr>
									<td>등록된 키워드가 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty viewAll }">
								<thead>
									<tr>
										<td>제안서 번호</td>
										<td>제목</td>
										<td>작성일</td>
										<td>작성자</td>
										<td>생성상태</td>
									</tr>
								</thead>
								<tbody id="tableList">
									<c:forEach var="proposal" items="${viewAll }">
										<tr>
											<td>${proposal.cpRn }</td>
											<td><a href="getProposal.do?cpIdx=${proposal.cpIdx }">${proposal.cpTitle }</a></td>
											<td>${proposal.cpRegdate }</td>
											<td>${proposal.uNickname }</td>
											<c:if test="${proposal.cpActive eq 1}">
												<td>활성</td>
											</c:if>
											<c:if test="${proposal.cpActive  eq 0}">
												<td>비활성</td>
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
								href="/adminProposalList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/adminProposalList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/adminProposalList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>






