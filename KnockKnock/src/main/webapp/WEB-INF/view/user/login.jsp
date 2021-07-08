<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

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
<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<!-- 구글연결 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1001122059226-auaj2qm316tuq1mik39kinrobt084viv.apps.googleusercontent.com">

<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        //로그인(일반 아이디/비밀번호)
        function logindo() {
            var id = $("#uId").val();
            var pwd = $("#uPwd").val();
            console.log(id, pwd);

            let vo = {};
            vo.uId = id;
            vo.uPwd = pwd;

            $.ajax({
                url: "/user/loginUser.do",
                type: 'post',
                data: JSON.stringify(vo),
                dataType: "json",
                contentType: "application/json",
                success: function (data) {
 					if(data=="1"){
	                    location.href = "/main.do";	
					}else if(data=="3"){
						alert("이메일 인증이 완료되지 않은 계정입니다.\n이메일을 확인해주세요.");
						location.href="/user/login.do";
					}else if(data=="2"){
	                    alert("아이디와 비밀번호를 확인해주세요.");
						location.href="/user/login.do";

					}
                },
                error: function (data) {
                    alert("시스템 오류입니다. 관리자에게 문의해주시기 바랍니다.");
                    location.href = "/main.do";
                }
            });
        };
        //회원가입 페이지로 이동   
        function signup_connect(frm) {
            frm.action = "user/signup.do";
            frm.submit();
        }
        //판매자 로그인/가입창으로 전환하기
        function sellerPage() {
            location.href = "sellerPage.do";
        }
        

            //카카오로그인	
            $(document).ready(function () {
                Kakao.init('32ddf4beafd028ac8b3afe142ef4fe9e');
                Kakao.isInitialized();
            });

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
                                //             let name = kakao_account.profile.nickname;
                                var name = res.properties && res.properties.nickname;
                                let email = kakao_account.email;
                                $.ajax({
                                    type: "post",
                                    url: "/user/kakaologin.do",
                                    data: { uId: email },
                                    dataType: "text",
                                    success: function (data) {
                                        console.log("data: ", data);
                                        if (data == "noid") {
                                            alert("가입되지 않은 회원입니다.\n회원가입을 진행해주세요.");
                                            location.href = "/user/tnc.do";
                                        } else {
                                            alert("로그인 가능");
                                            location.href = "main/main";
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
<!-- ===Header - Nav 대신 로고만 -->
<a href="/main.do"><img src="${cp}/resource/img/logo2.png" style="width:400px;"></a>
<!-- header끝 -->
	<div class="container" id="container">

		<div class="form-container sign-in-container">
			<form method="post">
				<h1>로그인</h1>
				<div class="social-container">
					<span>소셜계정 이용하기</span><br> 
						<a href="/user/googleGo.do">구글</a>
						<a href="#" id="kakao"
						class="social" onclick="kakaoLogin()">Kakao<i
						class="fab fa-linkedin-in"></i></a>
				</div>
				<input type="text" placeholder="아이디" name="uId" id="uId"
					value="${user.uId}" }/> 
				<input type="password" placeholder="비밀번호"
					name="uPwd" id="uPwd" value="${user.uPwd }" /> <a href="/user/findpwd.do">비밀번호를
					잊으셨나요?</a> <input type="button" style="width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;
					" onclick="logindo()" value="Log In">
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>Knock!綠!
</h1>
					<p>
						아직 회원이 아니신가요?<br>지금 바로 가입하세요.
					</p>
					<button class="ghost" id="signUp"
						onclick="location.href='/user/tnc.do'">회원가입</button>
                    <a href="#" onclick="sellerPage()" style="font-style: italic; color:white; font-size:7px;">판매자로 로그인/회원가입</a>
				
				</div>
			</div>
		</div>
	</div>
</body>

</html>