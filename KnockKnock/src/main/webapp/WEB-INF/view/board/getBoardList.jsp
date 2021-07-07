<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center { text-align: center; }
</style>
<script>

	//게시글 등록창으로..
	function moveInsert_board(frm) {
		frm.action = "${cp}/board/moveInsert.do"
		frm.setAttribute('method', 'get');
		frm.submit();
	}
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${cp}/board/getBoardList.do?nowPage=${paging.nowPage}&cntPerPage="
				+ sel;
	}
	
</script>
</head>
<body>
<div id="container">
	<h1>게시판 목록</h1>
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개씩보기</option>
					<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩보기</option>
		</select>
	</div>
	<table>
		<tr>
			<th>게시글번호</th>
			<th>말머리</th>
			<th>제목</th>
			<th>작성자</th>
			<th>내용</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>추천수</th>
		</tr>
	<c:if test="${not empty getBoardList}">
		<c:forEach var="board" items="${getBoardList}">
		<tr style="cursor:pointer;" onclick="location.href='${cp}/board/getBoard.do?bIdx=${board.bIdx }'">
			<td>${board.bIdx}</td>
			<td>${board.sbIdx}</td>
			<td>${board.bSubject}</td>
			<td>${board.uIdx}</td>
			<td>${board.bContent}</td>
			<td>
				${fn:substring(board.bRegdate, 0, 10)}
			</td>
			<td class="center">${board.bViews}</td>
			<td class="center">${board.bHit}</td>
		</tr>
		</c:forEach>
	</c:if>	
	<c:if test="${empty getBoardList}">
		<tr>
			<td colspan="7">현재 게시글이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	</table>
	
	<form action="getBoardList.do" method="post">
	<table>
		<tr>
			<td>
				<select name="searchCondition">
				<c:forEach var="option" items="${conditionMap}">
					<option value="${option.value}">${option.key}</option>
				</c:forEach>
				</select>
				<input type="text" name="searchKeyword" placeholder="검색할 내용을 입력해주세요." style="width:200px">
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
	</form>
	<form>
	<div style="display: block; text-align: center;">
		<c:if test="${paging.startPage != 1}">
			<a href="/board/getBoardList.do?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="p">
		<c:choose>
		<c:when test="${p == paging.nowPage}">
		<b>${p}</b>
		</c:when>
		<c:when test="${p != paging.nowPage}">
			<a href="/board/getBoardList.do?nowPage=${p}&cntPerPage=${paging.cntPerPage}">${p}</a>
		</c:when>
		</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="/board/getBoardList.do?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<div>
		<p><input type="button" value="게시글등록" onclick="moveInsert_board(this.form)">
		<input type="button" value="내글보기"></p>
	</div>	
	</form>
</div>
	
</body>
</html>