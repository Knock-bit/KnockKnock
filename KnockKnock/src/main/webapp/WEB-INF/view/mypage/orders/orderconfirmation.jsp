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
				<p style="text-align:left;">구매목록</p>
				<c:forEach var="product" items="${plist }" varStatus="status">
				<div style="display:inline-block; text-align:left;">
					<c:out value="${status.count }" />
					<div class="op1">
						<p><img src="/resource/img/product/${product.pImg }" /></p>
					</div>
					<div  class="op2">
						<p>상품명 : ${product.pName }</p>
						<p>가격: ${product.pName }</p>
					</div>
				</div>
				</c:forEach>
				<c:forEach var="orders" items="${ovo }">
					<p style="display:none;">수량 : ${orders.oCnt }
					<p class="paidx" style="display:none;">${orders.paIdx }</p>
				</c:forEach>
			</div>
			<div class="of5">
				<p style="text-align:left;">결제내역</p>
				<p>최종 결제 수단 <%-- ${ovo.paIdx } --%></p>
				<div class="of5-1">
					<p class="of5-1-1">상품가격  </p> <p class="of5-2-1">1000</p>
					<p class="of5-1-2">할인금액 </p>	<p class="of5-2-2">-</p>
					<p class="of5-1-3">총 배송비 </p>	<p class="of5-2-3">3000</p>
					<p class="of5-1-4">최종 결제금액</p> 	<p class="of5-2-4">4000</p>
					
				</div>
			</div>
			<div class="of6">
				<p style="text-align:left;">배송정보내역</p>
				<p>구매자 이름: ${users.uName }</p>
				<p>수취인 이름: ${uovo.oReceiver }</p>
				<p>우편번호 : ${uovo.oZipcode }</p>
				<p>배송지 주소: ${uovo.oAddress1 }, ${uovo.oAddress2}</p>
				<p>수취인 연락처: ${uovo.oPhone }</p>
				<p>배송 메시지:${uovo.oDelivery }</p>
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
</html>