<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
</head>
<body>

<div id="container">
	<h1>글상세보기</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="bIdx" value="${board.bIdx }">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="bSubject" value="${board.bSubject }">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.uIdx }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="bContent" rows="10" cols="50">${board.bContent }</textarea>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.bRegdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${board.bViews }</td>
		</tr>
		<tr>
			<th>추천수</th>
			<td>${board.bHit }</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글 수정하기">
			</td>
		</tr>
	</table>
	</form>
	
	<p>
		<a href="insertBoard.jsp">글 등록</a>
		<a href="deleteBoard.do?bIdx=${board.bIdx }">글 삭제</a>
		<a href="getBoardList.do">글 목록으로..</a>
	</p>
</div>
</body>
</html>