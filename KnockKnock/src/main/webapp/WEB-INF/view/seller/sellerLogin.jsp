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
<meta name="google-signin-scope" content="profile email">
<meta name="google-signin-client_id"
    content="1001122059226-8ighhu12ecf40egqsi5kr6btkhakt8ss.apps.googleusercontent.com">
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>



<script>
	   //로그인
	   function sellerLogin(){
		   alert("온클릭실행");
		   var id = $("#sId").val();
		   var pwd = $("#sPwd").val();
		   
		   console.log("id & Pwd = " + id, pwd);
		   
		   let vo = {};
		   vo.sId = id;
		   vo.sPwd = pwd;
		 
		  $.ajax({
			  url : "/seller/sellerLogin.do",
			  type: 'post',
			  data : JSON.stringify(vo),
			  dataType : "json",
			  contentType : "application/json",
			  success: function(data){
 
				  location.href="/main.do";
			  },
			  error: function(data){
				  alert("판매자용 아이디와 비밀번호를 확인해주세요.");
				  location.href="/seller/sellerLogin.do";
			  }
		  });
	   };
	   
   function signup_connect(frm) {
       frm.action = "user/signup.do";
       frm.submit();
   }
   
 
	
  
   
   
</script>
</head>

<body>

    <div class="container" id="container">

        <div class="form-container sign-in-container">
            <form method="post">
                <h1>판매자 로그인</h1>

				<input type="text" placeholder="아이디" name="sId" id="sId"
					value="${seller.sId}" } /> <input type="password" placeholder="비밀번호" name="sPwd" id="sPwd" value="${seller.sPwd }" /> <a
                    href="#">비밀번호를
                    잊으셨나요?</a> <input type="button" class="btn btn-outline-dark" onclick="sellerLogin()" value="Log In">
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
				<div class="overlay-panel overlay-right">
					<h1>綠!Knock!</h1>
					<p>
						안녕하세요 판매자님!<br>오늘도 그린커슈머를 위한 친환경소비에 힘써주셔서 감사합니다.
					</p>
					<p>
						<a href="history.back()" style="font-style: italic; color: white;">회원전용 로그인으로 돌아가기</a>
					</p>
					<a href="#" onclick="sellerJoin()"
						style="font-style: italic; color: white; font-size: 7px;">판매자
						등록하기</a>
				</div>
			</div>
        </div>
    </div>
</body>
</html>