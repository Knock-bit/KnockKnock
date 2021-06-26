<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<% String cp = request.getContextPath(); %>
<!doctype html>
<html>

<head>
    <meta charset="UTF-8">
    <title></title>
    <!--jQuery import방식 2(CDN방식)-->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

	<link href="${cp}/resource/css/main.css" rel="stylesheet">

    <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
    </script>
</head>

<body>
	
    <div class="container" id="container">

        <div class="form-container sign-in-container">
            <form action="signup.do" method="post">
                <h1>Sign in</h1>
                <div class="social-container">
                    <span>소셜계정 이용하기</span><br>

                    <a href="#" class="social">Google<i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social">Kakao<i class="fab fa-linkedin-in"></i></a>
                </div>
                <input type="text" placeholder="아이디" id="uid" value="${user.uId}" }/>
                <input type="password" placeholder="비밀번호" />
                <a href="#">비밀번호를 잊으셨나요?</a>
                <button>Log In</button>
            </form>
        </div>
        
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-right">
                    <h1>Knock!Kncok!</h1>
                    <p>아직 회원이 아니신가요?<br>지금 바로 가입하세요.</p>
                    <button class="ghost" id="signUp"><a href="${cp}/user/reg">회원가입</a></button>
                </div>
            </div>
        </div>
    </div>
</body>
</html>