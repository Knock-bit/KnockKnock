
  
  
  
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