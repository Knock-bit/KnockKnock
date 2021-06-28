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
  <link href="${cp}/resource/css/updateMyInfo.css" rel="stylesheet">

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!--  -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${cp}/resource/js/updateMyInfo.js" type="text/javascript" charset="utf-8"></script>


</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<p id="ctext">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내 정보 수정</p>
	<div class="updateMyInfoForm">
		<form action="updateMyInfoBtn.do" method="post" enctype="multipart/form-data">
			<div class="myInfo">
				<div class="it1">
					<label>아이디  </label>
					<input type="text" name="uId" value="${users.uId }" disabled="disabled">
				</div>
				<div class="it2">
					<label>이름  </label>
					<input type="text" name="uName" value="${users.uName }"  disabled="disabled">
				</div >
				<div class="it3">
					<label><span>*&nbsp;</span>닉네임  </label>
					<input type="text" name="uNickname" value="${users.uNickname }">
				</div>
				<div class="it4">
					<label><span>*&nbsp;</span>주소  </label>
					<input type="text" name="uAddress" value="${users.uAddress }">
				</div>
				<div class="it5">
					<label>생년월일  </label>
					 <fmt:formatDate var="uBirth" value="${users.uBirth }" pattern="yyyy.MM.dd"  />
					<input type="text" name="uBirth" value="${uBirth }" disabled="disabled">
				</div>
				<div class="it6">
					<label><span>*&nbsp;</span>이메일  </label>
					<input type="text" name="uEmail" id="email" value="${users.uEmail }">
				</div>
				<div class="it7">
					<label><span>*&nbsp;</span>핸드폰  </label>
					<input type="text" name="uPhone" id="phone" value="${users.uPhone }">
				</div>
				<div class="it8">
					<label>가입일  </label>
					<fmt:formatDate var="uJoindate" value="${users.uJoindate }" pattern="yyyy.MM.dd"  />
					<input type="text" name="uJoindate" value="${uJoindate }" disabled="disabled">
				</div>
	
			
				<div class="it9">
					<div class="photo">            
	                   <img id="preview" src="/resource/img/upload/${users.uImg }" width=180 height=200><br>
	                   <input id="fileBtn" type="file" name="file" onchange="readURL(this);" >
	                   <button type="button" class="btn-upload">IMAGE</button>
	               	</div>
				</div>
				<div class="it10">
					<input class="btn-upload" type="submit" value="내 정보 수정">
					<input style="width:20%; font-size:13px; background-color:#4d4d4d;" class="btn-upload" type="button" value="비밀번호 변경하기" onclick="updatePwd()">
				</div>
			</div>
		</form>

	</div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>