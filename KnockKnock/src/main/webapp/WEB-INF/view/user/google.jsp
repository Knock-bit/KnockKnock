<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html lang="en">

<head>
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="1001122059226-auaj2qm316tuq1mik39kinrobt084viv.apps.googleusercontent.com">
 
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>   
<div class="g-signin2" data-onsuccess="onSignIn"></div>
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
 
       	var auth2 = gapi.auth2.getAuthInstance();

   		if(auth2.isSignedIn.get()){
      		 var profile = auth2.currentUser.get().getBasicProfile();
      		 
      		  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      		  console.log('Name: ' + profile.getName());
      		  console.log('Image URL: ' + profile.getImageUrl());
      		  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
      		
   		
   		} 
   		
   		var uEmail = profile.getEmail();
   		console.log("data " + uEmail);
   		$.ajax({
   			type: 'POST',
   			url: '/user/googleLogin.do',
   			data: {"uEmail": uEmail},
   			dataType: 'text',
   			success:function(data){ 
   				if(data=="idok"){
   					location.href="/main.do";
   				}else{
   					alert("가입되지 않은 회원입니다.\n회원가입을 진행해주시기 바랍니다."); 
   					location.href="/user/tnc.do"
   				}
   			},
   			fail:function(){
   				alert("시스템 오류입니다. 관리자에게 문의해주세요.");
   			}
   			
   		});
     
    }
    </script>
</body>

</html>