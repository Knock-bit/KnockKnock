
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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!-- page css -->
  <link href="${cp}/resource/css/updatePwd.css" rel="stylesheet">
  
  <!-- 비밀번호 확인 script -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="/resource/js/updatePwd.js" type="text/javascript"
	charset="utf-8"></script>
  
  <script>
  $(function(){
	  // 현재 비밀번호 입력-> 변경할 비밀번호 입력 넘어갈 때 
	  // 현재 비밀번호 일치하지 않으면 비활성화
	  $("#chPwd1").focus(function(){
		  var nowPwd = $("#nowPwd").val();
		  var uPwd = "${users.uPwd}";
		  if(nowPwd!=uPwd){
			  $("#nowPwd").focus();
			  $("#nowPwd").css("outline-color","red");
			  alert("비밀번호가 일치하지 않습니다.");
		  } 
	  });
	  
	  // 변경할 비밀번호 입력받기 
	  $("#chPwd2").focus(function(){
		  var nowPwd = $("#nowPwd").val();
		 var chPwd1 = $("#chPwd1").val();
		 var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		 
		 if(chPwd1==nowPwd){
			 alert("기존의 비밀번호와 동일합니다. 다시 입력해주세요.");
			 $("#chPwd1").focus();
			 $("#chPwd1").css("outline-color","red");
			 
			 if(pwdPattern.test(chPwd1)==false){
				 $("#chPwd1").focus();
				 $("#chPwd1").css("outline-color","red");
				 alert("비밀번호는 최소 8자 이상, 숫자 1개는 반드시 포함되어야 합니다.");
			 } 
		 }
		 
		 
		  
	  });
	  
	  // 비밀번호 일치여부 확인
	  
	  
	   $("#chPwd2").keyup(function(){
		  
		   var chPwd1 = $("#chPwd1").val();
			var chPwd2 = $("#chPwd2").val();
			 if(chPwd1==chPwd2){
				$("#matchPwd").css("display","block");
				 $("#updatePwdBtn").attr("disabled",false);
				 $("#matchPwd").html("*비밀번호가 일치합니다.");
				 $("#matchPwd").css("color","blue");
			 } else if(chPwd1 != chPwd2){
				 $("#updatePwdBtn").attr("disabled",true);
				 $("#matchPwd").html("*비밀번호가 일치하지 않습니다.");
				 $("#matchPwd").css("display","block");
				 $("#matchPwd").css("color","red");

			 }
	   });
	 
	  
  });
  // ajax 사용해서 비밀번호 변경하기
  function PwdBtn(frm){
	 var uPwd = $("#chPwd1").val();
	 alert("PwdBtn 실행!");
	 $.ajax("updateMyPwd.do",{
		 type:"post",
		 data:"uPwd="+uPwd,
		 dataType:"text",
		 success : function(result){
			  let dhtml = "";
			  dhtml += "<div class='changePwdView'><p> 비밀번호 변경이 완료되었습니다.</p>";
			  dhtml += "<p> 새로운 비밀번호로 다시 로그인 해주세요 </p><br><br>";
			  dhtml += "<a href='myPage.do'>로그인창으로 이동</a></div>";
			  
			  $(".updatePwd").html(dhtml);	  
		 },
		 error: function fnAjaxError(jqXHR, textStatus, errorThrown){
		   alert("Ajax 처리 실패 : \n"
			         + "jqXHR.readyState : " + jqXHR.readyState + "\n"
			         + "textStatus : " + textStatus + "\n"
			         + "errorThrown : " + errorThrown);
			}

	 });
	 
  }
  

  </script>
  <!-- 페이지 css -->
 
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<p class="ctext">
		<img src="/resource/img/upload/rock.png">
		비밀번호 변경
		<span>비밀번호 변경으로 소중한 내 정보를 보호하세요</span>
	</p>
	
	<div class="updatePwd">
		<form>
			<div class="pwdgrid">
				<div>
					<label>현재 비밀번호</label>
					<input type="password" id="nowPwd"><span id="notPwd"></span>
				</div>
				<div>
					<label>변경할  비밀번호</label>
					<input type="password" id="chPwd1" name="uPwd">
					<p class="min8">※비밀번호는 최소 8자 이상, 숫자 1개는 반드시 포함되어야 합니다. </p>
				</div>
				<div>
					<label>새 비밀번호 확인</label>
					<input type="password" id="chPwd2"><span id="matchPwd"></span>
				</div>			
			</div>
			<div class="pBtnn">
				<input id="updatePwdBtn" type="button" value="변경하기" disabled="disabled" onclick="PwdBtn(this.form)">
				<input id="laterBtn"  type="button" value="다음에 변경하기" onclick="location.href='updateMyInfo.do'">
			</div>
		
		</form>
	</div>
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>