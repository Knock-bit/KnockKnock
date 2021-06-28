<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/adminDelButton.js"></script>
<script src="js/adminAddButton.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
.table {
	margin-top: 250px;
	margin-left: 50px
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<form id="keywordForm" method="post"
						style="margin-top: 300px; margin-left: 100px;">
						<table class="table table-bordered table-striped"
							style="margin-top: 0px;">
							<h3 class="text-center">키워드관리창</h3>

							<c:if test="${empty viewAll }">
								<tr>
									<td>등록된 키워드가 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty viewAll }">
								<thead>
									<tr>
										<td>키워드 이름</td>
										<td>키워드 선택</td>
									</tr>
								</thead>
								<tbody id="tableList">
									<c:forEach var="keyword" items="${viewAll }">
										<tr>
											<td>${keyword.kContent }</td>
											<td><input type="checkbox" name="keyname" /></td>
										</tr>
									</c:forEach>
									<tr>
										<td><input type="text" name="keyadd" id="keyadd" /></td>
										<td><input type="button" value="추가하기" id="addButton" />&nbsp&nbsp<input
											type="button" value="삭제하기" id="delButton" class="delButton" /></td>
									</tr>
								</tbody>
							</c:if>
						</table>
					</form>
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/adminKeywordList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/adminKeywordList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/adminKeywordList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>






