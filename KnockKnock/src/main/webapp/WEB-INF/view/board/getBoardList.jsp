<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri ="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.center { text-align: center; }
</style>
<script>
	function insert_board(frm){
		frm.action = "moveInsert.do"
		frm.setAttribute('method', 'get');
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h1>게시판 목록</h1>
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
	<c:if test="${not empty boardList}">
		<c:forEach var="board" items="${boardList}">
		<tr>
			<td>
				<a href="getBoard.do?bIdx=${board.bIdx}">${board.bIdx}</a>
			</td>
			<td>${board.sbIdx}</td>
			<td>
				<a href="getBoard.do?bIdx=${board.bIdx}">${board.bSubject}</a>
			</td>
			<td>${board.uIdx}</td>
			<td>${board.bContent}</td>
			<td>
				<fmt:formatDate pattern="yyyy/MM/dd" value="${board.bRegdate}"/>
			</td>
			<td class="center">${board.bViews}</td>
			<td class="center">${board.bHit}</td>
		</tr>
		</c:forEach>
	</c:if>	
	<c:if test="${empty boardList}">
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
	
	<div>
		<p><input type="button" value="게시글 등록" onclick="insert_board(this.form)"></p>
	</div>	
	</form>
</div>
	
</body>
</html>