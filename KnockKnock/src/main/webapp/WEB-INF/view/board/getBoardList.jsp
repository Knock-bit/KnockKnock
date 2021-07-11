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
	#container > div {
   display:flex;
   justify-content: space-between;
   align-items: center; 
   width: 100%;
}

#container > div + table {
   width: 100%;
}

#container > div + table th {

}

   .text-center { text-align: center; }
   .text-left { text-align: left; }
   .title { width:50%;}
   
</style>
<script>

	function nextPage() {
		$("#commonDiv").load("${cp }''/board/getBoardList.do?nowPage=${paging.endPage+1}&cntPerPage=${paging.cntPerPage}&ciIdx=${ciIdx}")
	}
	function page(page) {
		$("#commonDiv").load("${cp }/board/getBoardList.do?nowPage="+page+"&cntPerPage=${paging.cntPerPage}&ciIdx=${ciIdx}")	
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
	 <div>
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5개씩보기</option>
					<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10개씩보기</option>
					<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20개씩보기</option>
		</select>
	</div>
	<table class="table">
      <tr>
         <th class="text-center">글번호</th>
         <th class="text-left title">제목</th>
         <th class="text-center">작성자</th>
         <th class="text-center">작성일</th>
         <th class="text-center">조회수</th>
      </tr>
	<c:if test="${not empty getBoardList}">
		<c:forEach var="board" items="${getBoardList}">
		
		<tr style="cursor:pointer;" onclick="getBoardView(${board.bIdx})">
			 <td class="text-center">${board.bIdx}</td>
	         <td class="text-left">${board.bSubject}</td>
	         <td class="text-center">${board.uNickname}</td>
	         <td class="text-center">
	            ${fn:substring(board.bRegdate, 0, 10)}
	         </td>
	         <td class="text-center">${board.bViews}</td>
		</tr>
		</c:forEach>
	</c:if>	
	<c:if test="${empty getBoardList}">
		<tr>
			<td colspan="7">현재 게시글이 존재하지 않습니다.</td>
		</tr>
	</c:if>
	</table>
	
	
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
			<a href="#" onclick="page(${p})">${p}</a>
		</c:when>
		</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="#" onclick="nextPage()" >&gt;</a>
		</c:if>
	</div>
	<div>
		<p><button type="button" id="participate3" onclick="participate()"
		 style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;">게시글등록</button>
		<button type="button" onclick="myBoardList()"
		style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;">내 글 보기</button></p>
	</div>	
	</form>
</div>
	
</body>
</html>

