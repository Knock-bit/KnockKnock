$(document).ready(function(){
	
	// 주문자 정보 가져와서 수령자 정보에 넣기
	$("#sameOrdersInfo").click(function(){
		var orderName = $(".orderName").text();
		var orderAddress = $(".orderAddress").text();
		var orderPhone = $(".orderPhone").text();
		var orderEmail = $(".orderEmail").text();
		
		if($(".reciever").val() =="" || $(".reciever").val() == null) {
			$("input[name='rName']").attr('value',orderName);
			$("input[name='rAddress']").attr('value',orderAddress);
			$("input[name='rPhone']").attr('value',orderPhone);
			$("input[name='rEmail']").attr('value',orderEmail);
		} else {
			$("input[name='rName']").attr('value',null);
			$("input[name='rAddress']").attr('value',null);
			$("input[name='rPhone']").attr('value',null);
			$("input[name='rEmail']").attr('value',null);
			
		}
		
	});
	
	// 주소 입력 API
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

                document.getElementById('addr').value = data.zonecode; //5자리 새우편번호 사용 
                document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
                document.getElementById('addr2').focus();
            }
        }).open();
    });
    
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
	           		 	 $("#warningEmail").show();
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
			 $("#phone").css("outline-color","red");
			 $("#warningPhone").show();
			 $("#warningPhone").html("*숫자만 입력해주세요.");
		 } else {
			 $("#warningPhone").hide();
		 }
		 var phoneFormat = uPhone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");

	        $("#phone").val(phoneFormat);
		  
	  }); 

	// 배송  요청사항 - 직접입력 선택 시 
	$("#selboxDirect").hide();



	$("#selbox").change(function() {

	//직접입력을 누를 때 나타남

	if($("#selbox").val() == "direct") {

		$("#selboxDirect").show();
	}  else {
		$("#selboxDirect").hide();
	}

	}) ;
	
	$("#pm1").click(function(){
		$(".pm-1").css("display","block");
		$(".pm-2").css("display","none");
		$(".pm-3").css("display","none");
		
	});
	$("#pm2").click(function(){
		$(".pm-1").css("display","none");
		$(".pm-2").css("display","block");
		$(".pm-3").css("display","none");
		
	});
	$("#pm3").click(function(){
		$(".pm-1").css("display","none");
		$(".pm-2").css("display","none");
		$(".pm-3").css("display","block");
		
	});

	// 총 결제금액에 가격 입력
	var otp = 0;
	var payment = 0;
	
	$(".ototPrice").each(function(){
		otp = parseInt($(this).text());
		payment += otp;
	});
	console.log("총금액" + payment);
	$(".payPrice").html(payment+"원");





});