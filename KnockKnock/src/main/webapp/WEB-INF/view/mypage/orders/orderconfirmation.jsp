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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">
  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- page CSS File -->
  <link href="${cp}/resource/css/orderconfirmation.css" rel="stylesheet">
  
<style>

  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<div class="orderConfirm">
		<div class="orderform">
			<div class="of1">
				<h3>결제 완료</h3>
			</div>
			<div class="of2">
				<img src="/resource/img/upload/etc/shopping-cart.png"><span style="font-size:18px;">장바구니</span>
				<img src="/resource/img/upload/etc/checklist.png"><span style="font-size:18px;">주문목록</span>
				<img src="/resource/img/upload/etc/checked.png"><span style="font-weight:bold; color:rgb(10, 61, 14);">결제</span>
			</div>
			<div class="of3">
				<p>knockknock을 이용해주셔서 감사합니다</p>
			
			</div>
			<div class="of4">
				<p class="of4-1">구매 목록</p>
				
				<div class="op1">
					<p class="op0-1">-</p>
					<p class="op0-2">상품명 </p>
					<p class="op0-3">가격</p>
					<p class="op0-4">수량</p>
					<p class="op0-5">설명</p>	
					<c:forEach var="product" items="${plist }" varStatus="status">
							<p class="op1-1"><c:out value="${status.count }" /></p>
							<p class="op1-2">${product.pName }</p>
							<p class="op1-3">${product.pPrice }원</p>
							<p class="op1-4"></p>
							<p class="op1-5">${product.pDesc }</p>
							<p class="delivaryFee" style="display:none;">${product.pFee }</p>
					</c:forEach>
				</div>
			</div>
			<div class="of5">
				<p class="of4-1">결제 내역</p>
				<div class="of5-1">
					<!-- 결제수단가져오기 -->
					<c:forEach var="paidx" items="${ovo }">
						<p id="paIdx" style="display:none;">${paidx.paIdx }</p>
						<p class="oTotPrice" style="display:none;">${paidx.oTotprice }</p>
						<p class="oCnt" style="display:none;">${paidx.oCnt }</p>
					</c:forEach>
					<p class="of5-1-1">결제 수단  </p> <p class="of5-2-1"> </p>
					<p class="of5-1-2">결제 금액 </p> <p class="of5-2-2"></p>
					<p class="of5-1-3">할인 금액 </p>	<p class="of5-2-3"></p>
					<p class="of5-1-4">총 배송비 </p>	<p class="of5-2-4"></p>
					<p class="of5-1-5">최종 결제 금액</p> 	<p class="of5-2-5"></p>
					
				</div>
			</div>
			<div class="of6">
				<p class="of4-1">배송 (수령) 정보</p>
				<div class="of6-1">
					<p class="of6-1-1">구매자 이름 </p><p class="of6-2-1"> ${users.uName }</p>
					<p class="of6-1-2">수취인 이름 </p><p class="of6-2-2"> ${uovo.oReceiver }</p>
					<p class="of6-1-3">우편번호  </p><p class="of6-2-3">${uovo.oZipcode }</p>
					<p class="of6-1-4">배송지 주소 </p><p class="of6-2-4"> ${uovo.oAddress1 }&nbsp; ${uovo.oAddress2}</p>
					<p class="of6-1-5">수취인 연락처 </p><p class="of6-2-5"> ${uovo.oPhone }</p>
					<p class="of6-1-6">배송 메시지 </p><p class="of6-2-6">${uovo.oDelivery }</p>
				</div>
			</div>
			<div class="of7">
				<input type="button" value="주문내역" onclick="location.href='${cp }/orderHistory.do'">
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
	// 결제수단
	var paIdx=$("#paIdx").text();
	if(paIdx==1){
		$(".of5-2-1").html("신용/체크카드");
	}
	
	// 총 결제 금액
	var ototprice = 0;
	//ototprice = numberWithCommas(ototprice);
	
	$(".op1-3").each(function(){
		var idx = $(".op1-3").index(this);
		var totprice = parseInt($(".op1-3").eq(idx).text());
		ototprice += totprice;
	});
	console.log("토탈"+ototprice);
	$(".of5-2-2").html(ototprice+"원");
	
	// 수량
	$(".oCnt").each(function(){
		var idx = $(".oCnt").index(this);
		var cnt = $(".oCnt").eq(idx).text();
		$(".op1-4").eq(idx).html(cnt);
	});
	
	// 배송비
	var delFee = 0;
	$(".delivaryFee").each(function(){
		var idx = $(".delivaryFee").index(this);
		var df = parseInt($(".delivaryFee").eq(idx).text());
		delFee += df;
	});
	$(".of5-2-4").html(delFee+"원");
	
	// 최종 결제금액
	$(".of5-2-5").html(ototprice+delFee+"원");
})

function numberWithCommas(x) {
	return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
</script>
</html>