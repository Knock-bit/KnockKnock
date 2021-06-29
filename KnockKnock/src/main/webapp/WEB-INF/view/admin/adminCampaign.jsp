<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>캠페인 등록하기</title>
		<!-- 구글폰트 넣어보기-->
		<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
		<!-- STYLE CSS -->
		<link href="${contextPath}/resources/css/style1.css" rel="stylesheet" >
		
	</head>

	<body>
		<div class="wrapper">
			<div class="inner">
				<form method="post" action="${contextPath }/admin?type=campaignOk"
				class="regCampaign" enctype="multipart/form-data">
					<h3>캠페인 등록하기</h3>
						<label class="form-group">
						<input type="text" name="title" class="form-control"  required>
						<span>캠페인 제목</span>
						<span class="border"></span>
					</label>					
					<label class="form-group" >
						<textarea  name="goal" id="goal" class="form-control" required></textarea>
						<span for="">캠페인 내용</span>
						<span class="border"></span>
					</label>
					<label class="form-group" >
						<textarea  name="content" id="content" class="form-control" required></textarea>
						<span for="">캠페인 목표</span>
						<span class="border"></span>
					</label>
					<label class="form-group" for="End-date">
						<input type="date"  id="start" name="trip-start" value="2021-06-15"
						min="2021-01-01" max="2040-12-31" class="form-control" required>
						<span for="">종료날짜</span>
						<span class="border"></span>
					</label>

               <label class="form-group" >
                  <span for="">캠페인 카테고리</span><br>
                  <span class="border"></span>
               <select name="category" class="form-control">
                   <c:forEach var="item" items="${list }">
							<option value="${item.c_category }" name="category">
								${item.c_category_name }</option>
                  </c:forEach>
               </select>
               </label>
				
		
					<p id=ptag>파일첨부</p>
					<label class="form-group">
						<input type="file" name="file" class="file-form"  surequired>				
						<span class="border"></span>
					</label>

					<button type=submit class="button">&nbsp;&nbsp;등록 
						<i class="zmdi zmdi-arrow-right"></i>
					</button>
					<button type=reset onClick="location.href='main.jsp'"  class="button">&nbsp;&nbsp;취소
                  						<i class="zmdi zmdi-arrow-right"></i>
					</button>
				</form>
			</div>
		</div>
	</body> 
</html>