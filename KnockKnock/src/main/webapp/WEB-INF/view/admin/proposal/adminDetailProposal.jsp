<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up for Knock!Knock!</title>
	<!-- bootstrap jquery 추가 -->
	<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>

</head>

<body>
     <div class="main">
        <div class="container">
            <div class="proposal-content">

                <div class="proposal-form">
     				 
                        <div class="form-row1">
                            <div class="form-group">
                                <label for="cpTitle">캠페인 이름</label>
                                <input type="text" name="cpTitle" id="name" required/>
                            </div>
                            <div class="form-group">
                                <label for="cpGoal">캠페인 목표</label>
                                <input type="text" name="cpGoal" id="id" required/>
                            </div>
                             <div class="form-group" >
                                <label for="cpContent">캠페인 취지</label>
                                 <textarea name="cpContent" id="cpContent" rows="5" required></textarea>
                            </div>
                        </div>
                        <div class="form-row1">
                           <div class="form-group">
                                <label for="cpTitle">목표포인트</label>
                                <input type="number" name="cpTitle" id="cpGoalPoint" min="2500" required/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="keyword1">키워드1</label>
                                <input type="text" name="keyword" id="pKeyword1" />
                            </div>
                            <div class="form-group">
                                <label for="keyword2">키워드2</label>
                                <input type="text" name="keyword" id="pKeyword2" />
                            </div>
                            <div class="form-group">
                                <label for="keyword3">키워드3</label>
                                <input type="text" name="keyword" id="pKeyword3" />
                            </div>
                        </div>
                         <div class="form-row1">
                           <div class="form-group">
                                <label for="file">첨부파일</label>
                                <input type="file" name="file" >
                            </div>
                        </div>


                        <div class="form-submit">
                            <input type="reset" value="취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="제출" class="submit" name="submit" id="submit" />
                        </div>
                </div>
            </div>
        </div>

    </div>

</body>

</html>