$(document).ready(function () {
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



	//리셋버튼
	  $('#reset').on('click', function () {
    $('#register-form').reset();
  });
	
});