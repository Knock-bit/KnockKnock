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
		
		$("#commentsInsertBtn").click(function(){
			
			var formData = $("#commentsInsertForm").serialize();
			
			$.ajax({
				cache : false,
				url: "${cp }/board/insertComments.do",
				type: 'POST',
				data : formData,
				success: function(data){
					alert("댓글 입력 성공");
					commentsList();
					alert("load!");
				}, error: function(){
					alert('실패');
				}
				
			
		})
		})
		
	});
	
	function updateHit_board(bIdx){
		$.ajax({
			url:"${cp}/board/updateHit.do",
			type: "get",
			data: {"bIdx": bIdx},
			 contentType: "application/x-www-form-urlencoded; charset=utf-8",
	            dataType: "JSON",
	            success: function (data) {
	            	$("#bHit").html(data);
	            }, error: function(){
	            	alert("실패");
	            }
		})
		
	}
	//게시판 목록으로..
	function list_board(){
		$("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=${board.ciIdx}");
	}
	
	//추천하기 버튼

</script>

<style type="text/css">
   .board-cont > div {display: flex;}
   .board-cont > div span {flex: 1 1 85%;}
   .board-cont > div span:first-child {flex: 1 1 15%;}
   
   .btn-style {
      width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;
   }
   
    .comments-pic{
    border-radius: 50%;
    overflow: hidden;
    align-items: center;
    justify-content: center;
    border: solid 1px #eef0ef;
    display: inline-block;
    width: 40px;
    height: 40px;
    vertical-align: middle;
    float: left;
    }
    
    .comments-pic img{
        width: 100%;
    height: 100%;}
</style>

</head>
<body>

<div id="container">
	<h1>글상세보기</h1>
	<hr>
	<div>
		<input type="hidden" name="bIdx" value="${board.bIdx}">
	 <div class="board-cont">
         <div>
            <span>제목</span>
            <span>${board.bSubject}</span>
         </div>
         <div>
            <span>작성자</span>
               <span> ${board.uNickname }
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
          	<span><i class="bi bi-eye"></i></span>
          	<span>${board.bViews }</span>
            <span><i class="bi bi-heart"></i></span>
            <span  id="bHit">${board.bHit}</span>
         </div>
         <div>
         </div>
      </div>
			
	<hr>
	<div>
            <%-- <button class="btn-style" id="modify" onclick="modify(${board.bIdx})">수정하기</button> --%>
		<button class="btn-style" type="button" id="delete"  onclick="delete_board(${board.bIdx})">글 삭제하기</button>
		<button class="btn-style" type="button" onclick="list_board()">글목록</button>
		<c:if test="${!empty users}">
		<button class="btn-style" type="button" onclick="updateHit_board(${board.bIdx})">추천하기</button>
		</c:if>
		<c:if test="${empty users}">
		<button class="btn-style" type="button" onclick="location.href='${cp}/user/login.do'">추천하기</button>
		</c:if>
		
		<hr>
	</div>
	</div>
	<hr>
   <%-- 게시글 댓글 목록 --%>
   <div class="container">
      <div class="commentsList">
<%@ include file="commentsList.jsp" %>
</div>
   </div>

	<%-- 게시글 댓글  --%>
	<div class="container">
      <br><br>
      <label for="cContent">댓글 달기</label>
      <form id="commentsInsertForm" action="${cp }/board/insertComments.do" method="POST">
         <div class="input-group">
            <span>댓글번호 : ${board.bIdx}</span> / 
            <span>작성자 : ${users.uNickname }</span>
            <br><br>
            <textarea class="form-control" id="cContent" name="cContent" placeholder="내용을 입력해주세요" rows="3" cols="50" style="width:100%;"></textarea>
            <br><br>
            <span class="input-group-btn">
            <input type="hidden" name="bIdx" value="${board.bIdx}">
            <input type="hidden" name="uIdx" value="${users.uIdx}">
            
               <button class="btn btn-default" type="button" id="commentsInsertBtn"
               style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;">등록</button>
            </span>
         </div>
      </form>
   </div>
   <hr>
   <hr>
</div>
</body>
</html>