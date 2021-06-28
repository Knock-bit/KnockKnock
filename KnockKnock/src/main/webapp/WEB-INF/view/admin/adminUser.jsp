<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!--jQuery import방식 2(CDN방식)-->
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function active_onoff(frm) {
		frm.action = "adminActive.do";
		frm.submit();
	}
</script>
<title>관리자 - 회원관리</title>
</head>
<body>

	<div class="container" style="margin-top: 60px">
		<div class="row">
			<div class="col-md-12">
				<h3 class="text-center">회원관리창</h3>
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
							<c:if test="${empty userList }">
								<tr>
									<td>가입한 회원이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty userList }">
								<c:forEach var="user" items="${userList }">
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
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">이전</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</div>

</body>
</html>