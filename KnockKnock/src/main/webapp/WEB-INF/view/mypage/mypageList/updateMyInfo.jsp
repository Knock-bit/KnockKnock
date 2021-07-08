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
<link href="https://fonts.googleapis.com/css2?family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!--  -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="${cp}/resource/js/updateMyInfo.js" type="text/javascript" charset="utf-8"></script>
<script>
$(function(){
	 
	  
	// 이메일 중복 검사 => 아작스로
	$('#email').on('blur', function () {
        var email = $('#email').val();
        console.log(email);
        $.ajax("emailCheck.do", {
            type: "get",
            dataType: "text",
            data: { "email": $("#email").val() },
            success: function (data) {
            	console.log(data);
                if (data == 1) {
                    console.log("ok");
                    var uEmail = $("#email").val();
	           		var emPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	           		 
	           		 if(emPattern.test(uEmail)==false){
	           			 $("#email").focus();
	           			 $("#email").css("outline-color","red");
	           		 	 $("#warningEmail").html("*형식에 맞게 입력해주세요.");
	           		 } else {
	           		 	 $("#warningEmail").hide();
	           		 }
                  
                } else {
                    //alert("중복된 이메일 주소입니다.\n다시 확인해주세요.");
                    $("#warningEmail").html("*중복된 이메일 주소입니다. 다시 입력해주세요.");
                    $("#email").val("");
                    $("#email").focus();
                }
            },
            error: function () {
                alert("실패");
            }
        })
    });
	
	
	
	// 휴대폰 수정 시 정규표현식 확인
	 $("#phone").blur(function(){
		 var uPhone = $("#phone").val();
		 var phonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
		 
		 if(phonePattern.test(uPhone)==false){
			 $("#phone").focus();
			 $("#warningPhone").html("*숫자만 입력해주세요.");
		 } else {
			 $("#warningPhone").hide();
		 }
		 var phoneFormat = uPhone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");

	        $("#phone").val(phoneFormat);
		  
	  }); 
	  
	  // 사진 업로드
	  $("#btn-upload").click(function(e){
	  		e.preventDefault();
	  		$("#fileBtn").click();
	  });
	  
	  // 모달창 닫기
	  $(".close").on('click',function(){
		  $(".modal").css("display","none");
		  $(".madalDiv").fadeOut(300);
	  
  	});
	  
	// 회원탈퇴 약관?확인
	$("#deleteCk").click(function(){
		
		if($("#deleteCk").is(":checked")==true){
			$("#deletePwd").focus();
			$("#deletePwd").css("outline-color","#0e4b20");
		} 
	});
	
	
	
	  
});

// 회원탈퇴 모달창
function deleteUser(){
	  // 게시물 인덱스 값
	  
	  $(".modal").css("display", "block");
	  $(".modal").css("z-index", "10000");
		
	  $(".madalDiv").css("display", "block");
	  $(".madalDiv").css("z-index", "10000");
}

// 회원탈퇴 비밀번호 확인 버튼
function deletePwdCk(){
	var deletePwd = $("#deletePwd").val();
	console.log($("#myPwd").text());
	if(deletePwd == $("#myPwd").text()) {
		console.log("일치");
		$("#deleteBtn").attr("disabled",false);
		
	} else {
		alert("비밀번호가 일치하지 않습니다.");
		$("#deletePwd").focus();
		$("#deletePwd").css("outline-color","red");
	}
	
}
// 회원 탈퇴
function deleteBtn(){
	var uIdx = $("#myuIdx").text();
	var deleteConfirm = confirm("정말 회원탈퇴를 진행하시겠습니까?");
	if(deleteConfirm){
		// 일단 get방식이고 시간남으면 수정하기
		location.href="deleteUsers.do?uIdx="+uIdx;
	} else {
		location.href="updateMyInfo.do";
	}
}

</script>

</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<p id="ctext">My Infomation</p>
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
					<label ><span>*&nbsp;</span>닉네임  </label>
					<input type="text" name="uNickname" value="${users.uNickname }">
				</div>
				<div class="it4">
					<label><span>*&nbsp;</span>주소  </label>
					<input type="text" name="uAddress" value="${users.uAddress }">
				</div>
				<div class="it5">
					<label>생년월일  </label>
					<input type="text" name="uBirth" value="${users.uBirth }" disabled="disabled">
				</div>
				<div class="it6">
					<label><span>*&nbsp;</span>이메일  </label>
					<input type="text" name="uEmail" id="email" value="${users.uEmail }">					
				</div>
				<div class="it6-1">
					<p id="warningEmail"></p>
				</div>
				<div class="it7">
					<label><span>*&nbsp;</span>핸드폰  </label>
					<input type="text" name="uPhone" id="phone" value="${users.uPhone }">
					
				</div>
				<div class="it7-1">
					<p id="warningPhone"></p>
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
	                   <button type="button" id="btn-upload">이미지 업로드</button>
	               	</div>
				</div>
				<div class="it10">
					<div class="it10-1" style="display:inline-block; width:50%; text-align:right;">
						<input style="width:70%;" class="btn-upload1" type="submit" value="내 정보 수정">
					</div>
					
					<div class="it10-2" style="display:inline-block; width:39%; ">
						<input style="width:35%; font-size:11px; background-color:#6c9378; padding:5px;" class="btn-upload1" type="button" value="비밀번호 변경" onclick="updatePwd()">
						<input style="width:35%; font-size:11px; background-color:#6c9378; padding:5px;" class="btn-upload1" type="button" value="회원탈퇴" onclick="deleteUser()">
					</div>
				</div>
			</div>
		</form>

	</div>
	<div class="modal">
	  <div class="madalDiv">
		    <a href="javascript:;" class="close">X</a>
		   	<div class="dtmodal">
		   		<p >Knockknock 계정 탈퇴</p>
		   		<p class="dttxt">- 회원 탈퇴 시 보유하고 있던 포인트는 전부 <span style="color:red;">초기화</span>됩니다.<br>
		   			- 회원 탈퇴 후 <span style="color:red;">3일 이내에는 재가입이 불가능</span>합니다. <br>
		   			- 회원 탙퇴 후 남아있는 게시글은 <span style="color:red;">삭제</span>할 수 없습니다.
		   		</p>
		   		<input style="transform : scale(1.5);"type="checkbox" id="deleteCk">
		   		<label style="font-size:14px; font-weight:550; color:#0e4b20; margin-bottom:10px;;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label><br>
		   		<label style="margin-right:10px; text-align:left;"><span style="color:red; margin:10px; text-align:left;">*</span>PW</label>
		   		<input type="password" name="uPwd" id="deletePwd" placeholder="비밀번호를 입력해주세요" style="width:70%; height:4vh;font-size:13px; border:0px;">
		   		<input type="button" value="확인" id="pwdCk" onclick="deletePwdCk()">
		   		<p id="myPwd" style="display:none;">${users.uPwd }</p>
		   	</div><br>
		   	<div style="width:100%; text-align:center;">
		   		<input type="button" value="회원탈퇴" disabled="disabled" onclick="deleteBtn()" id="deleteBtn">
		   	</div>
		   	<p id="myuIdx" style="display:none;">${users.uIdx }</p>
  	  </div>
  	 </div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>