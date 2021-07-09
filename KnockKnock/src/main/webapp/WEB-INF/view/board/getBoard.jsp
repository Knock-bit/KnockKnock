<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 
 
    <c:if test = "${sessionScope.uIdx != null and sessionScope.uIdx != userVO.uIdx
    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != userVO.uIdx
    or sessionScope.googlename != null and sessionScope.facebookname != userVO.uIdx}">
    
    </c:if>  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="/resource/js/jquery/jquery-3.6.0.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>	
	//게시글 등록창으로..
	function moveInsert_board(frm){
		$("#commonDiv").load("${cp}/board/moveInsert.do?ciIdx=${board.ciIdx}");
	}
	
	//게시글 삭제
	function delete_board(frm){
		alert()
		$("#commonDiv").load("${cp}/board/deleteBoard.do?bIdx=" + ${board.bIdx});
	}
	
	//게시판 목록으로..
	function list_board(frm){
		frm.action="getBoardList.do";
	}
	
	//추천하기 버튼
	function updateHit_board(frm){
		frm.action="updateHit.do";
		frm.submit();
	}
</script>
</head>
<body>

<div id="container">
	<h1>글상세보기</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="bIdx" value="${board.bIdx}">
	<table>
		<tr>
			<th>제목</th>
			<td>${board.bSubject}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				 ${users.uNickname }
          		<input type="hidden" value="${users.uIdx }">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.bContent}</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>
				${fn:substring(board.bRegdate, 0, 10)}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글 수정하기">
			</td>
		</tr>
	</table>
	<hr>
	<div>
		<input type="button" value="글 등록" onclick="moveInsert_board(this.form)">
		<input type="button" value="글  삭제" onclick="delete_board(this.form)">
		<input type="button" value="글 목록으로.." onclick="list_board(this.form)">
		<hr>
		<input type="button" value="추천하기" onclick="updateHit_board(this.form)">
	</div>
	</form>
	<hr>
	<%-- 게시글 댓글  --%>
	<div class="container">
		<label for="cContent">댓글 목록</label>
		<form name="commentsInsertForm">
			<div class="input-group">
				<input type="text" name="bIdx" value="${board.bIdx}">
				<input type="text" name="uIdx" value="${board.uIdx }">
				<br><br>
				<textarea class="form-control" id="cContent" name="cContent" placeholder="내용을 입력해주세요" rows="3" cols="50"></textarea>
				<br><br>
				<span class="input-group-btn">
					<button class="btn btn-default" type="button" name="commentsInsertBtn">등록</button>
				</span>
			</div>
		</form>
	</div>
	<hr>
	<%-- 게시글 댓글 목록 --%>
	<div class="container">
		<div class="commentsList"></div>
	</div>
	<hr>
</div>
<%@ include file="commentsList.jsp" %>
</body>
</html>