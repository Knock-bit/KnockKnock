<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up for Knock!Knock!</title>

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <!-- css -->
   	<link href="${cp}/resource/css/signup.css" rel="stylesheet">
  	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <!--다음 카카오 주소값-->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

$(document).ready(function () {

    //아이디    
    $('#id').on('blur', function () {
        var id = $("#id").val();
        var idPattern = /^[A-Za-z]{1}[A-Za-z0-9]{3,10}$/;

        if (idPattern.test(id) == true) {
            $.ajax("idCheck.do", {
                type: "get",
                dataType: "text",
                data: { "id": $("#id").val() },
                success: function (data) {
                    console.log(data);
                    if (data == 1) {
                        console.log("사용가능");
                        $("#warningId").hide();
                    } else {
                        $("#warningId").html("중복된 아이디입니다.");
                        $("#id").val("");
                        $("#id").focus();

                    }
                },
                error: function () {
                    console.log("ajax오류");
                }
            })
        } else {//false인경우
            $("#warningId").html("잘못된 형식의 아이디입니다.");
            $("#id").val("");
            $("#id").focus();
        }
    });


    //이름
    $('#name').on('blur', function () {
        var namePattern = /^[가-힣]+$/;
        var name = $("#name").val();
        console.log(namePattern.test(name));
        if (namePattern.test(name) == false) {
            $("#warningName").html("이름은 한글만 입력해주세요.");
            $("#name").val("");
            $("#name").focus();
            //alert("올바른 형식의 이름을 입력해주세요. (한글만 가능)");
        } else {
            $("#warningName").hide();
        }
    });

    //비밀번호
    $('#pwd').on('blur', function () {
        var pwd = $("#pwd").val();
        var pwdPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
        console.log(pwdPattern.test(pwd));

        if (pwdPattern.test(pwd) == true) {
            console.log("ok");
            $("#warningPwd1").hide();
        } else {
            //alert("비밀번호는 최소 8자이상, 숫자 1개는 반드시 포함이 되어야합니다.");
            $("#warningPwd1").html("비밀번호는 최소 8자이상, 숫자 1개는 반드시 포함이 되어야합니다.");
            $("#warningPwd1").val("");
            $("#warningPwd1").focus();
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
            $("#warningPwd2").html("비밀번호가 일치하지 않습니다.");
            $("#pwd2").val("");
            $("#pwd1").val("");
            $("#pwd1").focus();
        }
    });

    //이메일
    $('#email').on('blur', function () {
        var email = $('#email').val();
        console.log(email);
        $.ajax("emailCheck.do", {
            type: "get",
            dataType: "text",
            data: { "email": $("#email").val() },
            success: function (data) {
                if (data == 1) {
                    console.log("ok");
                    $("#warningEmail").hide();
                } else {
                    //alert("중복된 이메일 주소입니다.\n다시 확인해주세요.");
                    $("#warningEmail").html("중복된 이메일 주소입니다. 다시 입력해주세요.");
                    $("#email").val("");
                    $("#email").focus();
                }
            },
            error: function () {
                alert("실패");
            }
        })
    });

    //휴대폰번호
    $("#uPhone").on('blur', function () {
        var phone = $("#uPhone").val();
        console.log(phone);
        var phonePattern = /^\d{2,3}-\d{3,4}-\d{4}$/;
        if (phonePattern.test(phone) == false) {
            $("#warningPhone").html("숫자만 입력해주세요.");
        } else {
            $("#warningPhone").hide();

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
            $("#warningBirth").hide();
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
            $("#warningBirth").html("생년월일 양식에 맞게 기입해주세요.");
            $("#birth").val("");
            $("#birth").focus();
        }
    });

    //닉네임
    $('#nickname').on('blur', function () {
        var nick = $("#nickname").val();
        var nickPattern = /[\{\}\[\]\/?.,;:|\)*~`!^\-+<>@\#$%&\\\=\(\'\"]/gi;
        console.log(nick);
        if (nickPattern.test(nick) == true) {//특수문자를 가지고 있는 경우-> 제외
            alert("닉네임에 특수문자 사용은 불가능합니다.");
        } else {
            $.ajax("nickCheck.do", {
                type: "get",
                dataType: "text",
                data: { "nickname": $("#nickname").val() },
                success: function (data) {
                    if (data == 0) {
                        $("#warningNick").html("사용중인 닉네임입니다.\n다른 닉네임을 사용해주세요.");
                        $("#nickname").val("");
                        $("#nickname").focus();

                    } else {
                        $("#warningNick").hide();
                    }
                },
                error: function () {
                    alert("오류입니다. 관리자에게 문의하여 주세요.");
                }
            })
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

                document.getElementById('addr').value = data.zonecode; //5자리 새우편번호 사용 
                document.getElementById('addr1').value = fullAddr; // 커서를 상세주소 필드로 이동한다. 
                document.getElementById('addr2').focus();
            }
        }).open();
    });

}); 
</script>   

</head>
<body>
     <body>
    <div class="main">
        <div class="container">
            <div class="signup-content">

                <div class="signup-form">
                    <form method="POST" class="register-form" id="register-form" action="join.do">
                        <h2>Knock!Knock! 회원가입</h2>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="id">아이디 :</label>
                                <input type="text" name="uId" id="id" placeholder="영문/숫자 혼합 3-10자" maxlength="10"
                                    required />
                                <label class="warning" id="warningId"></label>
                            </div>
                            <div class="form-group">
                                <label for="name">이름 :</label>
                                <input type="text" name="uName" id="name" required />
                                <label class="warning" id="warningName"></label>

                            </div>

                        </div>
                        <div class="form-row">
                            <div class="form-group">
                                <label for="pwd">비밀번호 :</label>
                                <input type="password" name="uPwd" id="pwd" placeholder="영문 8자이상, 숫자 1개 필수" required />
                                <label class="warning" id="warningPwd1"></label>

                            </div>
                            <div class="form-group">
                                <label for="pwd2">비밀번호 확인 :</label>
                                <input type="password" name="uPwd2" id="pwd2" required />
                                <label class="warning" id="warningPwd2"></label>

                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="email">이메일 :</label>
                                <input type="email" name="uEmail" id="email" required />
                                <label class="warning" id="warningEmail"></label>

                            </div>
                            <div class="form-group">
                                <label for="phone">휴대폰번호: </label>
                                <input type="text" name="uPhone" id="uPhone" maxlength="11" placeholder="(-)없이 숫자만 입력"
                                    required />
                                <label class="warning" id="warningPhone"></label>

                            </div>
                        </div>

                        <div class="form-radio">
                            <label for="gender" class="radio-label">성별 :</label>
                            <div class="form-radio-item">
                                <input type="radio" name="uGender" id="male" value="0" checked>
                                <label for="male">남성</label>
                                <span class="check"></span>
                            </div>
                            <div class="form-radio-item">
                                <input type="radio" name="uGender" id="female" value="1">
                                <label for="female">여성</label>
                                <span class="check"></span>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="birth">생년월일 :</label>
                                <input type="text" name="uBirth" id="birth" placeholder="생년월일 숫자 8자리 입력" required />
                                <label class="warning" id="warningBirth"></label>

                            </div>
                            <div class="form-group">
                                <label for="nickname">닉네임: </label>
                                <input type="text" name="uNickname" id="nickname" maxlength="8" placeholder="최대 한글 8자"
                                    required />
                                <label class="warning" id="warningNick"></label>

                            </div>
                        </div>

                        <div class="form-row1">
                            <div class="form-group">
                                <label for="address">주소 :</label>
                                <input type="text" name="uAddress" id="addr" placeholder="우편번호" />
                                <input type="button" name="uAddress" id="btnAddr" value="검색">
                            </div>
                            <div class="form-group">
                                <input type="text" name="uAddress" id="addr1" placeholder="주소" required>
                                <br>
                                <input type="text" name="uAddress" id="addr2" placeholder="상세주소">

                            </div>
                        </div>

                        <div class="form-submit">
                            <input type="reset" value="취소" name="reset" id="reset" />
                            <input type="button" value="확인" name="submit" id="submit" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>