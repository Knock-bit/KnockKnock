<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up as Seller</title>
  	<!-- JS jQuery -->
  	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>  
	<script src="${cp}/resource/js/signupSeller.js" type="text/javascript" charset="utf-8"></script>
    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- css -->
   	<link href="${cp}/resource/css/signup.css" rel="stylesheet">
  	<!--다음 카카오 주소값-->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

 

</head>
<body>
     <body>
    <div class="main">
        <div class="container">
            <div class="signup-content">

                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form" action="sellerJoinConfirm2.do">
                        <h2>Knock!綠! 개인판매자 등록</h2>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="id">판매자 계정 아이디 :</label>
                                <input type="text" name="sId" id="id" placeholder="영문/숫자 혼합 3-10자" maxlength="10"
                                    required />
                                <label class="warning" id="warningId"></label>
                            </div>
                            <div class="form-group">
                                <label for="name">상호명 :</label>
                                <input type="text" name="sName" id="sName" required />
                                <label class="warning" id="warningName"></label>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="pwd">비밀번호 :</label>
                                <input type="password" name="sPwd" id="pwd" placeholder="영문 8자이상, 숫자 1개 필수" required />
                                <label class="warning" id="warningPwd1"></label>

                            </div>
                            <div class="form-group">
                                <label for="pwd2">비밀번호 확인 :</label>
                                <input type="password" name="sPwd2" id="pwd2" required />
                                <label class="warning" id="warningPwd2"></label>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">판매자 이메일 :</label>
                                <input type="email" name="sEmail" id="email" required />
                                <label class="warning" id="warningEmail"></label>

                            </div>
                            <div class="form-group">
                                <label for="phone">판매자 연락처: </label>
                                <input type="text" name="sPhone" id="uPhone" maxlength="11" placeholder="(-)없이 숫자만 입력"
                                    required />
                                <label class="warning" id="warningPhone"></label>
                            </div>
                        </div>
                        

                        <div class="form-row1">
                            <div class="form-group">
                                <label for="address">판매자 주소 :</label>
                                <input type="text" name="sAddress" id="addr" placeholder="우편번호" />
                                <input type="button" name="sAddress" id="btnAddr" value="검색">
                            </div>
                            <div class="form-group">
                                <input type="text" name="sAddress" id="addr1" placeholder="주소" required>
                                <br>
                                <input type="text" name="sAddress" id="addr2" placeholder="상세주소">

                            </div>
                        </div>

                        <div class="form-submit">
                            <input type="reset" value="취소" name="reset" id="reset" />
                            <input type="submit" value="확인" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>