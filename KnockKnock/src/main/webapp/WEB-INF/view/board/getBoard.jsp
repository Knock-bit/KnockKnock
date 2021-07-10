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

	$(function () {
		var uIdx = "${users.uIdx }";
		var buIdx = "${board.uIdx}";
		if(uIdx != buIdx){
			$("#modify").css("display", "none");
			$("#delete").css("display", "none");
		}
		
	});
	
	//게시글 등록창으로..
	function moveInsert_board(frm){
		$("#commonDiv").load("${cp}/board/moveInsert.do?ciIdx=${board.ciIdx}");
	}
	
	
	//게시글 삭제
	function delete_board(){
		alert("정말 삭제하시겠습니까?");
		$("#commonDiv").load("${cp}/board/deleteBoard.do?bIdx=${board.bIdx}&ciIdx=${board.ciIdx}");
	}
	
	//게시판 목록으로..
	function list_board(){
		$("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=${board.ciIdx}");
	}
	
	//추천하기 버튼
	function updateHit_board(frm){
		frm.action="${cp}/board/updateHit.do";
		frm.submit();
	}
</script>

<style type="text/css">
   .board-cont > div {display: flex;}
   .board-cont > div span {flex: 1 1 85%;}
   .board-cont > div span:first-child {flex: 1 1 15%;}
   
   .btn-style {
      width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;
   }
</style>

</head>
<body>

<div id="container">
	<h1>글상세보기</h1>
	<hr>
	<form action="updateBoard.do" method="post">
		<input type="hidden" name="bIdx" value="${board.bIdx}">
	 <div class="board-cont">
         <div>
            <span>제목</span>
            <span>${board.bSubject}</span>
         </div>
         <div>
            <span>작성자</span>
               <span> ${users.uNickname }
                <input type="hidden" value="${users.uIdx }"></span>
           </div>
         <div>
            <span>내용</span>
            <span>${board.bContent}</span>
         </div>
         <div>
            <span>작성일</span>
            <span>${fn:substring(board.bRegdate, 0, 10)}</span>
         </div>
         <div>
            <input class="btn-style" id="modify" type="submit" value="글 수정하기">
         </div>
      </div>
			
	<hr>
	<div>
		<button class="btn-style" type="button" onclick="participate()">글 등록</button>
		<button class="btn-style" type="button" id="delete"  onclick="delete_board()">글 삭제하기</button>
		<button class="btn-style" type="button" onclick="list_board()">글목록</button>
		<hr>
		<input class="btn-style" type="button" value="추천하기" onclick="updateHit_board(this.form)">
	</div>
	</form>
	<hr>
	<%-- 게시글 댓글  --%>
	<div class="container">
      <label for="cContent">댓글 목록</label>
      <br><br>
      <form name="commentsInsertForm">
         <div class="input-group">
            <span>댓글번호 : ${board.bIdx}</span> / 
            <span>작성자 : ${board.uIdx }</span>
            <br><br>
            <textarea class="form-control" id="cContent" name="cContent" placeholder="내용을 입력해주세요" rows="3" cols="50" style="width:100%;"></textarea>
            <br><br>
            <span class="input-group-btn">
               <button class="btn btn-default" type="button" name="commentsInsertBtn"
               style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;">등록</button>
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