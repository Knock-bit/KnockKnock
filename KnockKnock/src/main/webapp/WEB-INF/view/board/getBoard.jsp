<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 
 
    <c:if test = "${sessionScope.uId != null and sessionScope.uId != userVO.uId
    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != userVO.uId
    or sessionScope.googlename != null and sessionScope.facebookname != userVO.uId}">
    
    </c:if>  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<script>	

	//게시글 등록창으로..
	function moveInsert_board(frm){
		frm.action="moveInsert.do";
		frm.setAttribute('method', 'get');
		frm.submit();
	}
	
	//게시글 삭제
	function delete_board(frm){
		frm.action="deleteBoard.do";
		frm.submit();
	}
	
	//게시판 목록으로..
	function list_board(frm){
		frm.action="getBoardList.do";
		frm.submit();
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
			<td>
				<input type="text" name="bSubject" value="${board.bSubject}">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.uIdx}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="bContent" rows="10" cols="50">${board.bContent}</textarea>
			</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${board.bRegdate}</td>
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
	
	<%-- 게시글 댓글 작성  --%>
	<form action="insertComments.do" method="post">
		<p>이름 : <input type="text" name="uIdx"></p>
		<p>내용 : <textarea name="cContent" rows="4" cols="50"></textarea></p>
		<input type="submit" value="댓글저장">
	</form>
	
	<hr>
	댓글들
	<hr>
	
	<%-- 게시글 댓글 표시 --%>
	<c:forEach var="comments" items="${commentsList}">
	<div class="comment">
		<form action="deleteComments.do" method="post">
			<p>이름: ${comments.uIdx} %nbsp;%nbsp; 날짜 : ${comments.cRegdate}</p>
			<p>내용: ${comments.cContent}</p>
			<input type="submit" value="댓글삭제">
			<input type="hidden" name="mIdx" value="${comments.mIdx}">
		</form>
	</div>
	<hr>
	</c:forEach>
	
</div>

</body>
</html>