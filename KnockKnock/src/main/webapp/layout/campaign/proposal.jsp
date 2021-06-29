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

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- css -->
   	<link href="${cp}/resource/css/signup.css" rel="stylesheet">
   	<link href="${cp}/resource/css/proposal.css" rel="stylesheet">
    <!-- js -->
    <link href="${cp}/resource/js/signup.js">
  	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>

<body>
     <div class="main">
        <div class="container">
            <div class="proposal-content">

                <div class="proposal-form">
                    <form method="POST" class="register-form" id="register-form">
                        <h2>캠페인 제안하기</h2>
                        <p>KNOCK!KNOCK!의 캠페인 아이디어는 모두에게 열려 있습니다.<br>다음 회차에 진행될 캠페인 아이디어를 제안해주세요.
            		   제안된 아이디어는 검토 후에 회원들의 펀딩 참여여부에 따라 다음회차 캠페인으로 선정됩니다.</p>
     				 
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
                                <input type="number" name="cpGoalpoint" id="cpGoalPoint" min="2500" required/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="keyword1">키워드1</label>
                                <input type="text" name="keyword" id="cpKeyword1" />
                            </div>
                            <div class="form-group">
                                <label for="keyword2">키워드2</label>
                                <input type="text" name="keyword" id="cpKeyword2" />
                            </div>
                            <div class="form-group">
                                <label for="keyword3">키워드3</label>
                                <input type="text" name="keyword" id="cpKeyword3" />
                            </div>
                        </div>


                        <div class="form-submit">
                            <input type="submit" value="취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="제출" class="submit" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

</body>

</html>