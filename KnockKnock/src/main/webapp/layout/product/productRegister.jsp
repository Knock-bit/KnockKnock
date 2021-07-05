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

   	<link href="${cp}/resource/css/campaign/proposal.css" rel="stylesheet">
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
                    <form method="POST" action="${cp }/productRegister.do" class="register-form" id="register-form" enctype="multipart/form-data">
                        <h2>상품등록</h2>
                        <p>KNOCK!KNOCK!의 캠페인 아이디어는 모두에게 열려 있습니다.<br>다음 회차에 진행될 캠페인 아이디어를 제안해주세요.
            		   제안된 아이디어는 검토 후에 회원들의 펀딩 참여여부에 따라 다음회차 캠페인으로 선정됩니다.</p>
     				 
                        <div class="form-row1">
                       		 <div class="form-group">
                                <label for="pcIdx">상품이름</label>
                                <input type="text" name="cpTitle" id="name" required/>
                            </div>
                            <div class="form-group">
                                <label for="pcIdx">상품분류</label>
                                <select class="form-select" aria-label="Default select example" name="pIdx">
								  <option selected>상품분류</option>
								  <option value="1">식품</option>
								  <option value="2">의류</option>
								  <option value="3">생활용품</option>
								</select>
                            </div>
                            <div class="form-group">
                                <label for="pPrice">가격</label>
                                <input type="text" name="cpGoal" id="id" required/>
                            </div>
                             <div class="form-group" >
                                <label for="pStock">재고</label>
                                 <textarea name="cpContent" id="cpContent" rows="5" required></textarea>
                            </div>
                            
                            <div class="form-group" >
                                <label for="pDesc">상품설명</label>
                                 <textarea name="cpContent" id="cpContent" rows="5" required></textarea>
                            </div>
                        </div>
                        
                         <div class="form-row1">
                           <div class="form-group">
                                <label for="file">상품 대표이미지</label>
                                <input type="file" name="pImg" >
                            </div>
                        </div>


                        <div class="form-submit">
                            <input type="reset" value="취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="제출" class="submit" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

</body>

</html>