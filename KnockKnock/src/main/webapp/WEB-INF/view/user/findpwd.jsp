<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<link href="${cp}/resource/css/login.css" rel="stylesheet">
<script> 
	$(function(){
		$("#findBtn").click(function(){
			$.ajax({
				url : "/user/findpwdClick.do",
				type : "POST",
				data : {
					uId : $("#uId").val(),
					uEmail : $("#uEmail").val()
				},
				success : function(result) {
					alert(result);
					href.location = "/main.do"
				},
				fail : function(){
					alert("서버에 오류가 있습니다.\n관리자에게 문의해주시기 바랍니다.")
				}
			})
		});
	})
</script>
 
<title>비밀번호 찾기</title>
</head>
<body>

<!-- ===Header - Nav 대신 로고만 -->
<a href="/main.do"><img src="${cp}/resource/img/logo2.png" style="width:400px;"></a>
<!-- header끝 -->
    <div class="container" style="width: 500px; height: 400px;">
        <form method="post">
            <div style="margin:30px;">
                <h1>비밀번호 찾기</h1>
            </div>
            <input type="text" placeholder="등록한 아이디" name="uId" id="uId" style="width:300px;" } />
            <input type="email" placeholder="등록한 이메일주소" name="uEmail" id="uEmail" style="width:300px;" />
            <p class="w3-center">
                <button type="button" id="findBtn" >찾기</button>
					<button type="button" onclick="history.go(-1);" >로그인으로</button>
				 </p>
            <p>비밀번호를 잊으셨나요?<br>등록한 아이디와 이메일주소를 입력하시면 임시 비밀번호를 전송해드립니다.</p>

        </form>
    </div> 
</body>
</html>