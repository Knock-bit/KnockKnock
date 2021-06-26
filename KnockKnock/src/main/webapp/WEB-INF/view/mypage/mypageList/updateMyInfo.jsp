<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
  
  <!--  -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
  
  function updatePwd(){
	  location.href="updatePwd.do";

  }
  function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }
  
  </script>
  <style>
  .main-content{
  		width:100%;
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
    }
   .updateMyInfoForm {
   		width:70%;
   		margin: 0 auto;
   		text-align:center;
   		position:relative;
   }
   /* 내 정보 수정 css */
   .myInfo, .myPhoto{
   		display:inline-block;
   }
   .myInfo {
   		width:70%;
   
   }
    .myPhoto {
   		width:29%;
   		position:absolute;
   		top:30px;
   
   }
   .myInfo label{
   		width:15%;
   		text-align:left;
   		font-size:18px;
   
   }
   .myInfo input{
   		width:60%;
   		text-align:left;
   		margin: 5px;
   		border:0;
   		border-bottom:1px solid black;
   		min-height:7vh;
   		padding-left: 2%;

   }
   .myInfo input:focus {
   		outline:none;
   		background-color:rgba(200,200,200,0.3);
   }
   .myInfo input:disabled{
   		background-color:white;
   }
   .myInfo span {
   		color:blue;
   }
   .btn{
  		width:100%;
		padding-top:5%;
   }
   .btn input {
   		height:100%;
   
   }
   /* 버튼 css */
   #updateBtn{
   		width:40%;
   		
   		outline:none;
   }
   
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>내 정보 수정 페이지</h1>
	<div class="updateMyInfoForm">
		<form action="updateMyInfoBtn.do" method="post" enctype="multipart/form-data">
			<div class="myInfo">
				<div>
					<span>&nbsp;&nbsp;</span><label>아이디  </label>
					<input type="text" name="uId" value="${users.uId }" disabled="disabled">
				</div>
				<div>
					<span>&nbsp;&nbsp;</span><label>이름  </label>
					<input type="text" name="uName" value="${users.uName }"  disabled="disabled">
				</div>
				<div>
					<span>*&nbsp;</span><label>닉네임  </label>
					<input type="text" name="uNickname" value="${users.uNickname }">
				</div>
				<div>
					<span>*&nbsp;</span><label>주소  </label>
					<input type="text" name="uAddress" value="${users.uAddress }">
				</div>
				<div>
					<label>생년월일  </label>
					 <span>&nbsp;&nbsp;</span><fmt:formatDate var="uBirth" value="${users.uBirth }" pattern="yyyy.MM.dd"  />
					<input type="text" name="uBirth" value="${uBirth }" disabled="disabled">
				</div>
				<div>
					<span>*&nbsp;</span><label>이메일  </label>
					<input type="text" name="uEmail" value="${users.uEmail }">
				</div>
				<div>
					<span>*&nbsp;</span><label>핸드폰  </label>
					<input type="text" name="uPhone" value="${users.uPhone }">
				</div>
				<div>
					<span>&nbsp;&nbsp;</span><label>가입일  </label>
					<fmt:formatDate var="uJoindate" value="${users.uJoindate }" pattern="yyyy.MM.dd"  />
					<input type="text" name="uJoindate" value="${uJoindate }" disabled="disabled">
				</div>
	
			</div>
			<div class="myPhoto">
				<div class="photo">            
                   <img id="preview" src="${users.uImg }" width=180 height=200><br>
                   <input type="file" name="uImg" onchange="readURL(this);" >
               	</div>
			</div>
			<div class="btn">
				<input id="updateBtn" type="submit" value="내 정보 수정">
				<input id="updatePasswordBtn" type="button" value="비밀번호 변경하기" onclick="updatePwd()">
			</div>
		</form>

	</div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>