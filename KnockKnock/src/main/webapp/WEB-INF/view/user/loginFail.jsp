 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />
<%
	String cp = request.getContextPath();
%>
<!doctype html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<!--jQuery import방식 2(CDN방식)-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS연결 -->
<link href="${cp}/resource/css/login.css" rel="stylesheet">
<!-- 카카오연결 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

<script>
   function signup_connect(frm) {
       frm.action = "user/signup.do";
       frm.submit();
   }
   $(document).ready(function () {
       Kakao.init('32ddf4beafd028ac8b3afe142ef4fe9e');
       Kakao.isInitialized();
   });
   //카카오로그인
   function kakaoLogin() {
       window.Kakao.Auth.login({
           scope: 'account_email',
           success: function (authObj) {
               console.log(authObj);
               window.Kakao.API.request({
                   url: '/v2/user/me',
                   success: res => {
                       const kakao_account = res.kakao_account;
                       console.log(kakao_account);
                       let name = kakao_account.profile.nickname;
                       let email = kakao_account.email;
                       $.ajax({
                           type: "post",
                           url: "/user/kakaologin.do",
                           data: { uId: email},
                           dataType: "text",
                           success: function (data) {
                        	 console.log("data: ", data);
                        	 if(data=="noid"){
                        		 alert("가입되지 않은 회원입니다.\n회원가입을 진행해주세요.");
                        		 location.href="/user/tnc.do";
                        	 }else{
                        		 alert("로그인 가능");
                        		 location.href="main/main";
                        	 }
                        	   
                           },
                           error: function () {
                               console.log("땡");
                           }
                       })
                   }
               });
           }
       })
   }
</script>
</head>

<body>

	<div class="container" id="container">

		<div class="form-container sign-in-container">
			<form action="loginUser.do" method="post">
				<h1>Sign in</h1>
				<div class="social-container">
					<span>소셜계정 이용하기</span><br> <a href="#" class="social">Google<i
						class="fab fa-google-plus-g"></i></a> <a href="#" id="kakao"
						class="social" onclick="kakaoLogin()">Kakao<i
						class="fab fa-linkedin-in"></i></a>
				</div>
				
				<input type="text" placeholder="아이디" name="uId" value="${user.uId}" }/>
				
				<input type="password" placeholder="비밀번호" name="uPwd"
					value="${user.uPwd }" /> <a href="#">비밀번호를 잊으셨나요?</a><p>아이디와 비밀번호를 확인해주세요.</p>
				<button>Log In</button>
				
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>Knock!Knock!</h1>
					<p>
						아직 회원이 아니신가요?<br>지금 바로 가입하세요.
					</p>
					<button class="ghost" id="signUp"
						onclick="location.href='/user/tnc.do'">회원가입</button>
				</div>
			</div>
		</div>
	</div>
</body>