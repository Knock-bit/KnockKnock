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
					commentsList();
				}, error: function(){
					alert('실패');
				}
				
			
		})
		})
		
	});
	
	  function delete_board(bIdx){
		  swal({
			  title: "게시글을 삭제하시겠습니까?",
			  text: "삭제시 복구하실 수 없으며, 포인트를 받지 못할 수 있습니다.",
			  icon: "warning",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal("성공적으로 삭제하였습니다", {
			      icon: "success",
			    });
  		$("#commonDiv").load("${cp}/board/deleteBoard.do?bIdx=" + bIdx + "&ciIdx=" + ciIdx);
			  } else {
			    swal("삭제하지 않았습니다");
			  }
			});
		  
		  
     	  }
	
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
	.commentsList{
	width:650px;}

   .board-cont > div {display: flex;}
   .board-cont > div span {flex: 1 1 85%;}
   .board-cont > div span:first-child {flex: 1 1 15%;}
   
   .btn-style {
     border: none; width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;
     padding:10px;
   }
   
   .areaComments {
   border:1px solid #e2e2e2; border-radius:8px;margin-bottom: 15px; padding:15px;
   }
   
   .regDate{
   font-size: 0.8em;
    color: grey;
   }
   
   .nickname{font-weight: 700;}
   
    .comments-pic{
    border-radius: 50%;
    overflow: hidden;
    align-items: center;
    justify-content: center;
    border: solid 1px #eef0ef;
    display: inline-block;
    width: 45px;
    height: 45px;
    vertical-align: middle;
    float: left;
    margin-right:20px;
    }
    
    .comments-pic img{
        width: 100%;
    height: 100%;}
</style>

</head>
<body>

<div id="container">
	<hr>
	<div>
		<input type="hidden" name="bIdx" value="${board.bIdx}">
	 <div class="board-cont">
         <div id="bSubject">
            <span>제목</span>
            <span>${board.bSubject}</span>
         </div>
         <div id="bWriter">
            <span>작성자</span>
               <span> ${board.uNickname }
                <input type="hidden" value="${users.uIdx }"></span>
           </div>
         <div id="bContent">
            <span>내용</span>
            <span>${board.bContent}</span>
         </div>
         <div id="bRegdate">
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
   <%-- 게시글 댓글 목록 --%>
   <div class="container">
      <div class="commentsList">
<%@ include file="commentsList.jsp" %>
</div>
   </div>

	<%-- 게시글 댓글  --%>
	<div class="container">
      <br><br>
      <form id="commentsInsertForm" action="${cp }/board/insertComments.do" method="POST">
         <div class="input-group" style="display:block; width:700px;">
            <div class="input-comment">
            <c:if test="${empty users}">
            <textarea class="form-control" id="cContent" name="cContent" disabled placeholder="로그인 후 사용 가능합니다" rows="3" cols="50" style="width:650px;"></textarea>
            </c:if>
            <c:if test="${!empty users}">            
            <textarea class="form-control" id="cContent" name="cContent" placeholder="내용을 입력해주세요" rows="3" cols="50" style="width:650px;"></textarea>
            </c:if>
            </div><br>
            <span class="input-group-btn">
            <input type="hidden" name="bIdx" value="${board.bIdx}">
            <input type="hidden" name="uIdx" value="${users.uIdx}">
            
               <button class="btn btn-default" type="button" id="commentsInsertBtn"
               style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px; margin-right:50px; float:right">등록</button>
            </span>
         </div>
      </form>
   </div>
	<br>
	<br>   
</div>
</body>
</html>