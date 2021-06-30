<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- bootstrap jquery 추가-->
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>

<script>
	function active_onoff(frm) {
		frm.action = "adminActive.do";
		frm.submit();
	}
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "adminUserList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
</script>
<title>관리자 - 회원관리</title>
</head>
<body>

	<div class="container" style="margin-top: 60px">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">회원관리창</h3>
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
				<form>
					<table class="table table-bordered table-striped">
						<thead>
							<tr>
								<th>번호</th>
								<th>ID</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>가입일</th>
								<th>최근접속일</th>
								<th>계정활성화상태</th>
								<th>활성/비활성</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty viewAll }">
								<tr>
									<td>가입한 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty viewAll }">
								<c:forEach var="user" items="${viewAll }">
									<input type="hidden" name="uIdx" value="${user.uIdx }" />
									<tr>
										<td>${user.uIdx }</td>
										<td>${user.uId}</td>
										<td>${user.uName }</td>
										<td>${user.uNickname }</td>
										<td><fmt:formatDate value="${user.uJoindate }"
												pattern="yyyy.MM.dd" /><</td>
										<td><fmt:formatDate value="${user.uLastlogin }"
												pattern="yyyy.MM.dd" /></td>
										<c:if test="${user.uActive eq 1}">
											<td>활성</td>
										</c:if>
										<c:if test="${user.uActive eq 0}">
											<td>비활성</td>
										</c:if>
										<td><input type="button"
											onclick="active_onoff(this.form)" value="활성/비활성"></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
				</form>
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1 }">
						<a
							href="/adminUserList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="/adminUserList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="/adminUserList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>

		</div>
	</div>
</body>
</html>