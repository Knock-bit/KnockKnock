$(document).ready(function(){
   var count = 0;
   //아이디 유효성체크 및 아이디 정규문자식 설정
   $("#dupchk").on('click',function(){
       var count = 0;
      
      var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,10}$/;
      if (idPattern.test(user_id.value) == true) {
 
         $.ajax("checkcheck", {
            type : "post",
            data : "type=dupchk&user_id=" + $("#user_id").val(),

            success : function(data) {
               console.log("아이디 사용여부Y/N : " + data);
               if (data == "Y") {
                  alert("사용가능한 아이디입니다.");
               } else if (data == "N") {
                  alert("중복된 아이디입니다.")
                  
               } else if (data == "NULL") {
                  alert("입력된 아이디가 없습니다.\n아이디를 입력해주세요.");
                  //회원가입 버튼 비활성화 시키는 법
               }
            },
            error : function() {
               alert("아쟉스오류입니당");
            }
         })

      } else {
         alert("잘못된 형식의 아이디입니다.\n다시 입력해주세요.");
      }
   });

$('#pwd').on('blur',function(){
   var pwd = $("#pwd").val();
    var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
   console.log(pwdPattern.test(pwd));
   console.log(pwd);
    if(pwdPattern.test(pwd)==true){
      console.log("ok");       
    }else{
       alert("비밀번호는 최소 8자이상, 숫자 1개는 반드시 포함이 되어야합니다.");
    }
});

$('#pwd2').on('blur',function(){
          if($("#pwd").val() == $("#pwd2").val()){
            //비밀번호 일치하는 경우
            $('#pwd').css({
                'background': "#6BDF8F",
                'color': "black",
                'border': "0.7px solid balck"
               });
            $('#pwd2').css({
                'background': "yellow",
                'color': "black",
                'border': "0.7px solid balck"
               }); 
            $('.pwdSuccess').html("일치");
            $('#pwd2').off('keyup');
            $('.pwdSuccess').hide();
          }else{
            //비밀번호가 일치하지 않는 경우
            $('#pwd').css({
                'background': "red",
                'color': "black",
                'border': "0.7px solid balck"
               });
            $('#pwd2').css({
                'background': "red",
                'color': "black",
                'border': "0.7px solid balck"
               });
            $('.pwdSuccess').html("비밀번호가 일치하지 않습니다.");
            //회원가입 버튼 비활성화 시키는 법
            } 
          
      
    
 });   
   
   $('#email').on('blur', function(){
 
      var emailPattern =/^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; 
      var email = $("#email").val();
       if(emailPattern.test(email) ==true){
          console.log("올바른 이메일 형식");
 
          $.ajax("checkemail", {
            type : "post",
            data : "type=emailchk&email=" + $("#email").val(),

            success : function(data) {
               if (data == "Y") {
                  console.log("이메일체크okay");
                  $(".emailSuccess").hide();
               } else{
                  alert("이미 가입된 이메일입니다.\n다시 확인해주시기 바랍니다.");
               }
            },
            error : function() {
               alert("아쟉스오류입니당");
            }
          })
       }else{
         $("#emailSuccess").html("올바른 이메일 형식을 사용해주시기 바랍니다.");         
       }
   });
   
   $('#name').on('blur',function(){
      var namePattern=  /^[가-힣]+$/;
      var name = $("#name").val();
      
      if(namePattern.test(name) ==false){
         $(".nameSuccess").html("이름은 한글만 입력 가능합니다.");         
      }else{
         $(".nameSuccess").hide();
      }
      
   });
   
   $("#phone").on('blur', function(){
      var phonePattern = /^\d{3}-\d{3,4}-\d{4}$/; 

      var phone = $("#phone").val();
      
      console.log("전화번호검사: "+phonePattern.test(콜));
      
      
      if(phonePattern.test(콜)==false){
          $(".phoneSuccess").html("올바른 형식의 전화번호를 써주세요");
      }else{
          $(".phoneSuccess").hide();
      }
   });


        
   $("#birth").on('blur', function() {
      $("#birth").attr("maxlength", 10);
      var RegNotNum = /[^0-9]/;
      var date = $("#birth").val();
      var birthPattern = /^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/;
   
      if (birthPattern.test(date) == true) {
         date = date.replace(RegNotNum, '');//숫자남기기 
         if (date == "" || date == null || date.length < 5) {
            this.value = date;
            return;
         }
         var DateFormat;
         var RegPhonNum;
         console.log(date);

         if (date.length <= 6) {
            DataFormat = "$1-$2"; // 포맷을 바꾸려면 이곳을 변경
            RegPhonNum = /([0-9]{4})([0-9]+)/;
         } else if (date.length <= 8) {
            DataFormat = "$1-$2-$3"; // 포맷을 바꾸려면 이곳을 변경
            RegPhonNum = /([0-9]{4})([0-9]{2})([0-9]+)/;
         }

         date = date.replace(RegPhonNum, DataFormat);
         this.value = date;
         console.log("2번" + date);
         
            
            
            


         if (date.length == 10) {
            var isVaild = true;
            if (isNaN(Date.parse(date))) {
               isVaild = false;
            } else {
               //년, 월, 일
               var date_sp = date.split("-");
               date_sp.forEach(function(sp) {
                  if (parseInt(sp) == 0) {
                     isVaild = false
                  }
               });
               var last = new Date(new Date(date).getFullYear(), new Date(date).getMonth() + 1, 0);
               if (parseInt(date_sp[1]) != last.getMonth() + 1) {
                  var date_sp2 = date.sp_slice(0);
                  date_sp[2] = '01';
                  var date2 = date_sp2.join("-");
                  last = new Date(new Date(date2).getFullYear(), new Date(date2).getMonth() + 1, 0);
               }
               if (last.getDate() < parseInt(date_sp[2])) {
                  isVaild = false;
               }
            }

         }

      } else {
         alert("생년월일 양식에 맞게 기입해주세요.");
      }
   });

   $("#btnAddr").on("click",function(){   
      new daum.Postcode({ 
         oncomplete: function(data) { 
            
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다. 
            var fullAddr = ''; // 최종 주소 변수 
            var extraAddr = ''; // 조합형 주소 변수 
            
            // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다. 
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우 
               fullAddr = data.roadAddress; 
            } else { // 사용자가 지번 주소를 선택했을 경우(J) 
               fullAddr = data.jibunAddress; 
            } 
            
            // 사용자가 선택한 주소가 도로명 타입일때 조합
            if(data.userSelectedType === 'R'){ 
               //법정동명이 있을 경우 추가
               if(data.bname !== ''){ 
                  extraAddr += data.bname; 
               } 
               // 건물명이 있을 경우 추가 
               if(data.buildingName !== ''){ 
                  extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName); 
               } 
               // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소 
               fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : ''); 
            } 
            
            document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
            document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
            document.getElementById('addr2').focus(); 
         } 
      }).open(); 
   });
   
   $("#submit").on("click",function(){
      alert("회원가입이 완료되었습니다.\n녹녹에 오신걸 환영합니다!");   
     
   });
}); 