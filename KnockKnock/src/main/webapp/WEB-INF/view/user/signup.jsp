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
  	<!-- jQuery / JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  	<script src="${cp}/resource/js/signup.js"></script>
    <!--다음 카카오 주소값-->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

</script>   

</head>
<body>
     <body>
    <div class="main">
        <div class="container">
            <div class="signup-content">

                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form" action="join.do">
                        <h2>綠!Knock! 회원가입</h2>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="id">아이디 :</label>
                                <input type="text" name="uId" id="id" placeholder="영문/숫자 혼합 3-10자" maxlength="10"
                                    required />
                                <label class="warning" id="warningId"></label>
                            </div>
                            <div class="form-group">
                                <label for="name">이름 :</label>
                                <input type="text" name="uName" id="name" required />
                                <label class="warning" id="warningName"></label>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="pwd">비밀번호 :</label>
                                <input type="password" name="uPwd" id="pwd" placeholder="영문 8자이상, 숫자 1개 필수" required />
                                <label class="warning" id="warningPwd1"></label>

                            </div>
                            <div class="form-group">
                                <label for="pwd2">비밀번호 확인 :</label>
                                <input type="password" name="uPwd2" id="pwd2" required />
                                <label class="warning" id="warningPwd2"></label>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">이메일 :</label>
                                <input type="email" name="uEmail" id="email" required />
                                <label class="warning" id="warningEmail"></label>

                            </div>
                            <div class="form-group">
                                <label for="phone">휴대폰번호: </label>
                                <input type="text" name="uPhone" id="uPhone" maxlength="11" placeholder="(-)없이 숫자만 입력"
                                    required />
                                <label class="warning" id="warningPhone"></label>

                            </div>
                        </div>

                        <div class="form-radio">
                            <label for="gender" class="radio-label">성별 :</label>
                            <div class="form-radio-item">
                                <input type="radio" name="uGender" id="male" value="0" checked>
                                <label for="male">남성</label>
                                <span class="check"></span>
                            </div>
                            <div class="form-radio-item">
                                <input type="radio" name="uGender" id="female" value="1">
                                <label for="female">여성</label>
                                <span class="check"></span>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="birth">생년월일 :</label>
                                <input type="text" name="uBirth" id="birth" placeholder="생년월일 숫자 8자리 입력" required />
                                <label class="warning" id="warningBirth"></label>

                            </div>
                            <div class="form-group">
                                <label for="nickname">닉네임: </label>
                                <input type="text" name="uNickname" id="nickname" maxlength="8" placeholder="최대 한글 8자"
                                    required />
                                <label class="warning" id="warningNick"></label>

                            </div>
                        </div>

                        <div class="form-row1">
                            <div class="form-group">
                                <label for="address">주소 :</label>
                                <input type="text" name="uAddress" id="addr" placeholder="우편번호" />
                                <input type="button" name="uAddress" id="btnAddr" value="검색">
                            </div>
                            <div class="form-group">
                                <input type="text" name="uAddress" id="addr1" placeholder="주소" required>
                                <br>
                                <input type="text" name="uAddress" id="addr2" placeholder="상세주소">

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