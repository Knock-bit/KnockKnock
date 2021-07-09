<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!--jQuery import방식 2(CDN방식)-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- CSS연결 -->
<link href="${cp}/resource/css/login.css" rel="stylesheet">
<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<!-- alert -->
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
function loginGo(){
	location.href = '/user/login.do'}
</script>

<title>비밀번호 찾기</title>
</head>
<body>
<!-- ===Header - Nav 대신 로고만 -->
<a href="/main.do"><img src="${cp}/resource/img/logo2.png" style="width:400px;"></a>
<!-- header끝 -->
    
    <div class="container" style="width: 500px; height: 400px;">
        <form method="GET">
            <div style="margin:30px;">
                <h1>이메일을 확인해주세요.</h1>
            </div>


            <h3>綠!Knock! 회원가입이 완료 되었습니다.<br>등록한 이메일을 통하여 인증절차를 완료한 후 바로 이용 가능합니다.</h3>
                <p>이메일을 통한 인증절차 완료한 뒤 로그인해주세요.</p>
                <p class="w3-center">
                <button type="button" onclick="loginGo()">로그인하기</button> 
                    
                </p>
        </form>
    </div>
</body>
</html>