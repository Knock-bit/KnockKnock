<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

 
  <!-- Vendor CSS Files -->
  <link href="${cp}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
 
  <!-- Main CSS File -->
  <link href="${cp}/resource/css/main.css" rel="stylesheet">

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- 비밀번호 확인 script -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(function(){
	  // 현재 비밀번호 입력-> 변경할 비밀번호 입력 넘어갈 때 
	  // 현재 비밀번호 일치하지 않으면 비활성화
	  $("#chPwd1").focus(function(){
		  var nowPwd = $("#nowPwd").val();
		  var uPwd = ${users.uPwd};
		  if(nowPwd!=uPwd){
			  $("#nowPwd").focus();
			  $("#nowPwd").css("outline-color","red");
			  alert("비밀번호가 일치하지 않습니다.");
		  }
		  
		  
		  
	  });
	  
	  
	  
	 
	  
  });
  
  </script>
  
  <style>
  .main-content{
  		width:100%;
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
   }
   .updatePwd {
   		width:50%;
   		margin: 0 auto;
   		text-align:center;
   		position:relative;
   }
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>비밀번호 변경페이지</h1>
	<hr>
	<div class="updatePwd">
		<form>
			<div>
				<label>현재 비밀번호</label>
				<input type="password" id="nowPwd"><span id="notPwd"></span>
				<hr>
				<label>변경할  비밀번호</label>
				<input type="password" id="chPwd1" name="uPwd"><br>
				<p>비밀번호는 특수문자를 포함하여 어쩌구 </p>
				<hr>
				<label>새 비밀번호 확인</label>
				<input type="password" id="chPwd2">
			</div>
			<div>
				<input type="submit" value="변경하기">
				<input type="button" value="다음에 변경하기" onclick="location.href='updateMyInfo.do'">
			</div>
		
		</form>
	</div>
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>