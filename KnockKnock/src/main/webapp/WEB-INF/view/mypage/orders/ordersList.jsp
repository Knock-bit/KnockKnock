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
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
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

	<div class="ordersMain">
		<div class="ordersGrid">
			<div class="infoOrder">
				<p style="background-color:#0e4b20; color:white; padding:10px; width:30%; margin: 10px; font-size:13px;">주문자 정보</p>
				<div style="padding:20px; text-align:left;" class="ifo1">
					<div>
						<p class="orderUIdx" style="display:none;">${users.uIdx }</p>
						이름<p style="font-weight:600;" class="orderName">${users.uName }</p>
						주소<p class="orderAddress"> ${users.uAddress}</p>
					</div>
					<div>
						휴대폰<p class="orderPhone"> ${users.uPhone }</p>
						
						이메일<p class="orderEmail">${users.uEmail }</p>
					</div>
				</div>
			
			</div>
			<div class="infoReciever" style="text-align:left; font-size:13px;">
				<p id="ifrtext" style="background-color:#0e4b20; color:white; padding:10px; width:30%; margin: 10px; font-size:13px;">수령자 정보</p>
				<input id="sameOrdersInfo" type="checkbox" >주문자와 동일<br>
				<div class="ifr1">
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
                </div>
                <div class="ifr1">
					<label>연락처 :</label><input type="text" name="rPhone" class="reciever" id="phone">
					<p style="display:none;" id="warningPhone"></p><br>
					<label>이메일 :</label><input type="text" name="rEmail" class="reciever" id="email">
					<p style="display:none;" id="warningEmail"></p><br>
				</div>
				<br>
				<select id="selbox" name="selbox">
					<option value="d_none">배송 시 요청사항을 선택해주세요</option>
					<option value="d_door">부재 시 문 앞에 두고 가주세요</option>
					<option value="d_call">배송 전 전화 또는 문자 주세요</option>
					<option value="d_security">부재 시 경비실에 두고가주세요</option>
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
				<p>총 결제 금액</p>
				<p class="payPrice"></p>
				<input type="button" value="결제하기" id="payBtn" onclick="goPayment()">
			</div>
			<div class="infoOrdersProduct">
				<p>주문상품정보</p>
				<div>
				<c:if test="${!empty olist }">
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
				</c:if>
				<c:if test="${empty olist }">
					<p>주문 정보가 없습니다.</p>
				</c:if>
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
	console.log($("#selbox option:selected").text());
	if($(".payPrice").html()=="0원"){
		alert("결제할 상품이 존재하지 않습니다.");
	} else {
		
	
	
	var info = $("input[type=text]").val();
	var pay_method = $("input[name=pm]:checked").val();
	// 결제방법 데이터변환
	var payData = 0;
	if($("input[name=pm]:checked").val()=="card"){
		payData = 1;
	} else if($("input[name=pm]:checked").val()=="trans"){
		payData = 2;
	} else if($("input[name=pm]:checked").val()=="vbank"){
		payData = 3;
	} else if($("input[name=pm]:checked").val()=="phone"){
		payData = 4;
	} else if($("input[name=pm]:checked").val()=="samsung"){
		payData = 5;
	}
	// 결제자 정보 ( 데이터 넣을 때도 필요 )
	var uName = $(".orderName").text();
	var uPhone = $(".orderPhone").text();
	var uEmail = $(".orderEmail").text();
	var uAddress = $(".orderAddress").text();
	//console.log($("#addr1").val());
	// 수령자 정보
	var vo = {};
	vo.oAddress1 = $("#addr1").val(); // 기본주소
	vo.oAddress2 = $("#addr2").val(); // 상세주소
	vo.oPhone = $("#phone").val(); // 핸드폰
	vo.oReceiver = $("#uname").val(); // 수령자이름
	vo.oZipcode = $("#addr").val(); // 우편번호
	if($("#selbox").val()=="direct"){ // 배송 요청사항
		vo.oDelivery = $("#selboxDirect").val();
		
	} else if($("#selbox").val()=="d_none"){
		vo.oDelivery = "없음";
	} else {
		vo.oDelivery = $("#selbox option:selected").text();
	}
	console.log(vo.oDelivery);
	console.log("json:"+JSON.stringify(vo));
	
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
			             
			               //location.href="";
			               var msg = '결제가 완료되었습니다.\n';
			               msg += '고유ID : ' + rsp.imp_uid+'\n';
			               msg += '상점 거래ID : ' + rsp.merchant_uid+'\n';
			               msg += '결제 금액 : ' + rsp.paid_amount+'\n';
			               msg += '카드 승인번호 : ' + rsp.apply_num; 
			               alert(msg);  
			               console.log(payData);
			               // 아작스 처리
			               $.ajax({
			            	  url : "orderInfo.do",
			            	  data : {'payData':payData}, // 일단은 결제방식만 업데이트 (필요한 데이터)
			            	  dataType : "text",
			            	  type:"post",
			            	  success : function(data){
			            		  // 수령자 정보 db에 저장
			            		  $.ajax({
			            			  url : "userOrder.do",
			            			  data : JSON.stringify(vo),
			            			  contentType : "application/json",
			            			  dataType : 'json',
			            			  type : 'post',
			            			  success : function(data){
			            				  location.href="orderConfirm.do";
			            			  },
			            			  error : function(data){
			            				  alert("수령인 정보 에러");
			            			  }
			            			  
			            		  });
			            	  },
			            	  error : function(data){
			            		  alert("실패");
			            	  }
			            	   
			               });
			               
			               
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
}

</script>
</html>