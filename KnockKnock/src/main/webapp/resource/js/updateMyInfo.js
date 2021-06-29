 $(function(){
	  // 이메일 수정 시 정규표현식 확인
	  $("#email").blur(function(){
		 var uEmail = $("#email").val();
		 var emPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		 
		 if(emPattern.test(uEmail)==false){
			 $("#email").focus();
			 $("#email").css("outline-color","red");
			 alert("올바른 이메일 형식으로 작성해주세요");
		 } 
		  
	  }); 
	  
	// 이메일 중복 검사 => 아작스로
	
	
	
	
	// 휴대폰 수정 시 정규표현식 확인
	 $("#phone").blur(function(){
		 var uPhone = $("#phone").val();
		 var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/; 
		 
		 if(phonePattern.test(uPhone)==false){
			 $("#phone").focus();
			 $("#phone").css("outline-color","red");
			 alert("올바른  형식으로 입력해주세요\n['-'를 포함하여 작성해주세요]");
		 } 
		  
	  }); 
	  
	  // 사진 업로드
	  $("#btn-upload").click(function(e){
	  		e.preventDefault();
	  		$("#fileBtn").click();
	  });
	  
  });
  
  
  
  function updatePwd(){
	  location.href="updatePwd.do";

  }
  // 사진 업로드 관련
  function readURL(input) {
      if (input.files && input.files[0]) {
         var reader = new FileReader();
         reader.onload = function(e) {
            $('#preview').attr('src', e.target.result);
         }
         reader.readAsDataURL(input.files[0]);
      }
   }
  
  // 변경할 이메일 정규표현식