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

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- page css/js -->
  <link href="${cp}/resource/css/ordersList.css" rel="stylesheet">
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${cp}/resource/js/ordersList.js" type="text/javascript" charset="utf-8"></script> 
   
   <!-- 다음 카카오 주소 값 -->
   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <!-- 결제API -->
   <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <style>
  
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h3>주문결제</h3>
	<div class="ordersMain">
		<div class="ordersGrid">
			<div class="infoOrder">
				<p style="background-color:#0e4b20; color:white; padding:10px; width:30%; margin: 10px; font-size:13px;">주문자 정보</p>
				<div style="padding:20px; text-align:left;">
					<p style="font-weight:600;" class="orderName">${users.uName }</p>
					<p class="orderAddress"> ${users.uAddress}</p>
					<p class="orderPhone"> ${users.uPhone }</p>
					<input type="checkbox"><label>안심번호 사용</label><span style="width:50%; border:1px solid gray; border-radius: 50%;">?</span>
					<p class="orderEmail">${users.uEmail }</p>
				
				</div>
			
			</div>
			<div class="infoReciever" style="text-align:left; font-size:13px;">
				<p style="background-color:#0e4b20; color:white; padding:10px; width:30%; margin: 10px; font-size:13px;">수령자 정보</p>
				<input id="sameOrdersInfo" type="checkbox" >주문자와 동일<br>
				<label>이름 :</label><input type="text" name="rName" class="reciever" id="uname"><br>
				<div class="reciever">
                    <label for="address">주소 :</label>
                    <input type="text" name="uAddress" id="addr" placeholder="우편번호" />
                    <input type="button" name="uAddress" id="btnAddr" value="검색">
                </div>
                <div class="form-group">
                    <input type="text" name="rAddress" id="addr1" class="addrr" placeholder="주소" required>
                    <input type="text" name="uAddress" id="addr2" class="addrr" placeholder="상세주소">

                </div>
				<label>연락처 :</label><input type="text" name="rPhone" class="reciever" id="phone">
				<p style="display:none;" id="warningPhone"></p><br>
				<label>이메일 :</label><input type="text" name="rEmail" class="reciever" id="email">
				<p style="display:none;" id="warningEmail"></p><br>
				<select id="selbox" name="selbox">
					<option value="">배송 시 요청사항을 선택해주세요</option>
					<option value="">부재 시 문 앞에 두고 가주세요</option>
					<option value="">배송 전 전화 또는 문자 주세요</option>
					<option value="">부재 시 경비실에 두고가주세요</option>
					<option value="direct">직접입력</option>
				</select>
				<input type="text" id="selboxDirect" name="selboxDirect"/>
			
			</div>
			<div class="paymentMethod" style="text-align:left;">
				<p>결제방법</p>
				<input type="radio" name="pm" id="pm1" value="card" checked="checked">신용카드<br>
				<input type="radio" name="pm" id="pm2" value="trans">실시간 계좌이체<br>
				<input type="radio" name="pm" id="pm3" value="vbank" >가상계좌 <br>
				<input type="radio" name="pm" id="pm3" value="phone">휴대폰 소액결제 <br>
				<input type="radio" name="pm" id="pm3" value="samsung">삼성페이<br>
			
			
			</div>
			<div class="payment">
				<p>결제하기(금액/버튼)</p>
				<p class="payPrice"></p>
				<input type="button" value="결제하기" id="payBtn" onclick="goPayment()">
			</div>
			<div class="infoOrdersProduct">
				<p>주문상품정보</p>
				<div>
				<c:forEach var="item" items="${olist }">
					<div class="onePlist">
						상품명 : ${item.pName }<br>
						상품설명 : ${item.pDesc }<br>
						가격 : ${item.pPrice }<br>
						수량 : ${item.oCnt }<br>
						배송비 : ${item.pFee }<br>
						총 금액 : <span class="ototPrice">${item.oTotprice }</span>
					</div>
				
				</c:forEach>
				
				</div>
			
			</div>
		
		
		</div>
	</div>
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
<script>
$(function(){

	
	
});
function goPayment(){
	
	var info = $("input[type=text]").val();
	var pay_method = $("input[name=pm]:checked").val();
	// 결제자 정보
	var uName = $(".orderName").text();
	var uPhone = $(".orderPhone").text();
	var uEmail = $(".orderEmail").text();
	var uAddress = $(".orderAddress").text();
	
	console.log("결제방법 : " + pay_method);
	if (info=="" || info==null){
		alert("수령자 정보를 정확히 입력해주세요");
	} else {
		// 결제하기
		var payView = confirm('결제하기 창으로 이동합니다.');
		if(payView) {
				// 결제
		         //var price = $(".payPrice").text();
				 var price = 1000;
		         var d = new Date();   //결제고유번호의 날짜를 위해 날짜생성
		         //날짜 넣기 (+""+를 안하면 숫자가 합해지기에 공백 넣는다)
		         var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
		         
		         //스크립트 임포트해서 IMP사용 가능
		         IMP.init('imp37279783');   //결제 api 사용을 위한 코드입력
		         IMP.request_pay({
		        	pg : 'naverpay',
		        	pay_method : pay_method,
		        	merchant_uid : "결제_"+date,         //거래ID
		            name : "상품 결제",                     //결제 이름
		            amount : price,                     //결제금액
		            
		            buyer_email : uEmail,   //구매자 email주소
		            buyer_name : uName,   //구매자 이름
		            buyer_phone : uPhone,   //구매자 전화번호
		            buyer_addr : uAddress,   //구매자 주소
		            m_redirect_url : 'https://www.yourdomain.com/payments/complete'
		            //buyer_postcode : $("#addr").val()           //구매자 우편번호
		         }, function(rsp){   // rsp : 결제 성공여부
			            if(rsp.success){
			               //결제 성공시 DB에 결제정보 저장하고 사용자 화면 처리
			               alert("결제가 완료되었습니다. 주문내역으로 이동합니다.");
			               //location.href="";
			               
			               // 아작스 처리
			               $.ajax({
			            	  url : "",
			            	  data : "".
			            	  dataType : "",
			            	  success : function(){
			            		  
			            	  },
			            	  error : function(){
			            		  
			            	  }
			            	   
			               });
			               
			               /* var msg = '결제가 완료되었습니다.';
			               msg += '고유ID : ' + rsp.imp_uid;
			               msg += '상점 거래ID : ' + rsp.merchant_uid;
			               msg += '결제 금액 : ' + rsp.paid_amount;
			               msg += '카드 승인번호 : ' + rsp.apply_num; 
			               alert(msg);  */
			               // 주문서? 창으로 이동하기
			               
			            }else{
			            	alert("실패했어용~");
			                //msg = '결제실패 , 에러내용 : ' + rsp.error_msg;
			            }
		         	});
					

		} else {
			alert("결제가 취소되었습니다.");
			location.href="ordersList.do";
			
		}
		
	}
	
	
}

</script>
</html>