<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kakao Login</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Kakao Login -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>
<!-- 카카오 스크립트 -->
Kakao.init('32ddf4beafd028ac8b3afe142ef4fe9e');//발급받은 javascript키
console.log(Kakao.isinitialized()); //sdk 초기화 여부판단
//카카오 로그인 function
function kakaoLogin(){
	Kakao.Auth.login({
		success: function(response){
			Kakao.API.request({
				url:'/v2/user/me',
				success: function(response){
					console.log(response)
				},
				fail: function(error){
					console.log(error)
				},
			})
		},
		fail: function(error){
			console.log(error)
		},
	})
}
//카카오로그아웃
function kakaoLogout(){
	if(Kakao..Auth.getAccessToken()){
		Kakao.API.request({
			url: '/v1/user/unlink',
			success: function(response){
				console.log(response)
			},
			fail: function(error){
				console.log(error)
			},
		})
		 Kakao.Auth.setAccessToken(undefined)
	}
}
</script>



</head>
<body>	
	<ul>
		<li onclick="kakaoLogin();">
			<a href="javascript:void(0)"><span>카카오 로그인</span></a>
		</li>
		<li onclick="kakaoLogout();">
			<a href="javascript:void(0)"><span>카카오 로그아웃</span></a>
		</li>
	</ul>
	

</body>
</html>