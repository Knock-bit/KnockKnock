<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
    <meta name="google-signin-client_id"
        content="1001122059226-8ighhu12ecf40egqsi5kr6btkhakt8ss.apps.googleusercontent.com">
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body>   
 <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>

    <script>
        function onSignIn(googleUser) {
            // Useful data for your client-side scripts:
            var profile = googleUser.getBasicProfile();
            console.log("ID: " + profile.getId()); // Don't send this directly to your server!
            console.log('Full Name: ' + profile.getName());
            console.log('Given Name: ' + profile.getGivenName());
            console.log('Family Name: ' + profile.getFamilyName());
            console.log("Image URL: " + profile.getImageUrl());
            console.log("Email: " + profile.getEmail());
            alert("구글 아쟉스 시작");

            // The ID token you need to pass to your backend:
            var id_token = googleUser.getAuthResponse().id_token;
            console.log("ID Token: " + id_token);

            $.ajax ({
          		
            	type: "post",
                url:"/googlelogin.do", 
                data: { uEmail: profile.getEmail() },
                dataType: "text",
                success: function (data) {
                    console.log("success: " + data);
                    if(data=="noid"){
                    	alert("가입되지 않은 회원입니다.\n회원가입을 진행해주세요.");
               		 location.href="/user/tnc.do";
               	 	}else{
               		 alert("로그인 가능");
               		 location.href="main/main";
               	 	}
                },
                error: function(){
                console.log("땡");
            	}
        	});
        }
    </script>
</body>

</html>