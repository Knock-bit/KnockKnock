(function ($) {

  $('#reset').on('click', function () {
    $('#register-form').reset();
  });

})


$(document).ready(function () {

  //이름
  $('#name').on('blur', function () {
    var namePattern = /^[가-힣]+$/;
    var name = $("#name").val();
    console.log(namePattern.test(name));
    if (namePattern.test(name) == false) {
      alert("올바른 형식의 이름을 입력해주세요. (한글만 가능)");
    }
  });

  //비밀번호
  $('#pwd').on('blur', function () {
    var pwd = $("#pwd").val();
    var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
    console.log(pwdPattern.test(pwd));
    console.log(pwd);
    if (pwdPattern.test(pwd) == true) {
      console.log("ok");
    } else {
      alert("비밀번호는 최소 8자이상, 숫자 1개는 반드시 포함이 되어야합니다.");
      $("#pwd1").val(null);
    }
  });

  $('#pwd2').on('blur', function () {
    if ($("#pwd").val() == $("#pwd2").val()) {
      //비밀번호 일치하는 경우
      $('#pwd').css({
        'background': "yellow",
        'color': "black",
        'border': "0.7px solid balck"
      });
      $('#pwd2').css({
        'background': "yellow",
        'color': "black",
        'border': "0.7px solid balck"
      });
    } else {
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
      alert("비밀번호가 일치하지 않습니다.");
      $("#pwd1").val(null);
      $("#pwd2").val(null);
    }
  });


  //휴대폰번호
  $("#uPhone").on('blur', function () {
    var phone = $("#uPhone").val();
    console.log(phone);
    var phonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
    if (phone.phonePattern == false) {
      alert("숫자만 입력해주세요.");
    }
    var phoneFormat = phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
    console.log(phoneFormat);

    $("#uPhone").val(phoneFormat);
  });


  //생년월일
  $("#birth").on('blur', function () {
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
      var DataFormat;
      var RegPhonNum;

      if (date.length <= 6) {
        DataFormat = "$1-$2"; // 포맷을 바꾸려면 이곳을 변경
        RegPhonNum = /([0-9]{4})([0-9]+)/;
      } else if (date.length <= 8) {
        DataFormat = "$1-$2-$3"; // 포맷을 바꾸려면 이곳을 변경
        RegPhonNum = /([0-9]{4})([0-9]{2})([0-9]+)/;
      }

      date = date.replace(RegPhonNum, DataFormat);
      this.value = date;

      if (date.length == 10) {
        var isVaild = true;
        if (isNaN(Date.parse(date))) {
          isVaild = false;
        } else {
          //년, 월, 일
          var date_sp = date.split("-");
          date_sp.forEach(function (sp) {
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
  //주소
  $("#btnAddr").on("click", function () {
    new daum.Postcode({
      oncomplete: function (data) {

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
        if (data.userSelectedType === 'R') {
          //법정동명이 있을 경우 추가
          if (data.bname !== '') {
            extraAddr += data.bname;
          }
          // 건물명이 있을 경우 추가 
          if (data.buildingName !== '') {
            extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
          }
          // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소 
          fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
        }

        document.getElementById('zip').value = data.zonecode; //5자리 새우편번호 사용 
        document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
        document.getElementById('addr2').focus();
      }
    }).open();
  });

});