<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<%
request.setCharacterEncoding("UTF-8");
%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<jsp:include page='${cp}/layout/admin/adminLink.jsp' flush='false' />
<link href='${cp}/resource/css/admin/adminCss.css' rel="stylesheet" type="text/css">

<script>

$(() =>{
    $(".activeButton").click(getActive);
 });
 
 function getActive(){  
    var str = "";
    var tdArr = new Array();
    var checkBtn = $(this);
    
   // checkBtn.parent() : checkBtn의 부모는 <td>이다.
   // checkBtn.parent().parent() : <td>의 부모이므로 <tr>이다.
    var tr = checkBtn.parent().parent();
    var td = tr.children();
    
   /*  console.log("클릭한 Row의 모든 데이터 : " + tr.text()) */ 
    var user_idx = td.eq(0).text();
    var user_id = td.eq(1).text();
    var active = {"uIdx" : user_idx};
	$.ajax({
		url: "adminActive.do",
		type: "post",
		data: JSON.stringify(active),
		contentType: 'application/json; charset=utf-8',
		success: function(result) {
			location.reload();

		},
		error: function(){
			location.reload();
		}
	})
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
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
   		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false'/>   
    </nav>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
		<div class="content-wrapper" style="background: white;">
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">회원관리창</h3>
					<div style="float: right;">
						<a href="/adminUserList.do?sort=아이디">아이디순</a> <a
							href="/adminUserList.do?sort=가입일">가입일순</a> <a
							href="/adminUserList.do?sort=최종접속일">최종접속일순</a> <a
							href="/adminUserList.do?sort=활성상태">활성상태</a> <select
							id="cntPerPage" name="sel" onchange="selChange()">
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
					<form action="adminUserList.do" method="get">
						<table class="border-none">
							<tr>
								<td><select name="searchCondition">
										<c:forEach var="option" items="${conditionMapUser }">
											<option value="${option.value}">${option.key }</option>
										</c:forEach>
								</select> <input type="text" name="searchKeyword"> <input
									type="submit" value="검색"></td>
							</tr>
						</table>
					</form>
					<table class="table table-bordered table-striped" id="list-table">
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
									<tr>
										<td style="display: none">${user.uIdx }</td>
										<td>${user.RN }</td>
										<td>${user.uId}</td>
										<td>${user.uName }</td>
										<td>${user.uNickname }</td>
										<td><fmt:formatDate value="${user.uJoindate }"
												pattern="yyyy.MM.dd" /></td>
										<td><fmt:formatDate value="${user.uLastlogin }"
												pattern="yyyy.MM.dd" /></td>
										<c:if test="${user.uActive eq 1}">
											<td>활성</td>
										</c:if>
										<c:if test="${user.uActive eq 0}">
											<td>비활성</td>
										</c:if>
										<td><input type="button" class="activeButton"
											value="활성/비활성"></td>
									</tr>
								</c:forEach>
							</c:if>

						</tbody>
					</table>
					</div>
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