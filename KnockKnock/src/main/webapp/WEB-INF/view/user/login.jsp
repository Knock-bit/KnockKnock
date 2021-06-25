<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale-1.0">
<title>Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<a href="javascript:kakaoLogin();">카카오</a>
<script>
	window.kakao.init("32ddf4beafd028ac8b3afe142ef4fe9e");
	function kakaoLogin(){
		window.Kakao.Auth.login({
			scope: 'profile, account_email, gender, age_range',
			success: function(authObj){
				console.log(authObj);
				window.Kakao.API.request();
				url: '/v2/user/me', 
				success: res => {
					const kakao_account = res.kakao_account;
					console.log(kakao_account);
				}
			}
		});
	}
</script>
	
	
	
</body>
</html>