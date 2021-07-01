<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<script>	
	function insert_board(frm){
		frm.action="insertBoard.do";
		frm.setAttribute('method', 'get');
		frm.submit();
	}
	function delete_board(frm){
		frm.action="deleteBoard.do";
		frm.submit();
	}
	function list_board(frm){
		frm.action="getBoardList.do";
		frm.submit();
	}

	//추천하기 버튼
	$("#btnHit").click(function(){
	    if(confirm("해당 글을 추천하시겠습니까?")){
	        document.form1.action="hitBoard.do";
	        document.form1.submit();
	        
	        alert("해당 글을 추천하였습니다.");
	        
	        }
	    });
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
		<input type="button" value="글 등록" onclick="insert_board(this.form)">
		<input type="button" value="글  삭제" onclick="delete_board(this.form)">
		<input type="button" value="글 목록으로.." onclick="list_board(this.form)">
		<hr>
		<button type="button" id="btnHit">추천하기</button>
	</div>
	</form>
	
	
</div>

</body>
</html>