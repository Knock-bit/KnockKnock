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
    <!-- js -->
    <script src="${cp}/resource/js/signup.css"></script>
    <!-- address -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
</head>

<body>

    <div class="main">
        <div class="container">
            <div class="signup-content">

                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form">
                        <h2>Knock!Knock! 회원가입</h2>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="name">이름 :</label>
                                <input type="text" name="name" id="name" required />
                            </div>
                            <div class="form-group">
                                <label for="father_name">아이디 :</label>
                                <input type="text" name="uId" id="id" required />
                            </div>
                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="pwd">비밀번호 :</label>
                                <input type="password" name="uPwd" id="pwd" required />
                            </div>
                            <div class="form-group">
                                <label for="pwd">비밀번호 확인 :</label>
                                <input type="password" name="uPwd2" id="pwd2" required />
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">이메일 :</label>
                                <input type="email" name="uEmail" id="uEmail" required />
                            </div>
                            <div class="form-group">
                                <label for="phone">휴대폰번호: </label>
                                <input type="number" name="uPhone" id="Nickname" required />
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
                                <input type="text" name="uBirth" id="Birth" required />
                            </div>
                            <div class="form-group">
                                <label for="pwd">닉네임: </label>
                                <input type="text" name="uNickname" id="Nickname" required />
                            </div>
                        </div>

                        <div class="form-row1">
                            <div class="form-group">

                                <label for="address">주소 :</label>
                                <input type="text" name="uAddress" id="addr" placeholder="우편번호" />
                                <button name="uAddress" value="검색" id="btnAddr">검색</button>

                            </div>
                            <div class="form-group">
                                <input type="text" name="uAddress" id="addr1" placeholder="주소">
                                <br>
                                <input type="text" name="uAddress" id="addr2" placeholder="상세주소">

                            </div>
                        </div>

                        <div class="form-submit">
                            <input type="submit" value="취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="확인" class="submit" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
</body>

</html>