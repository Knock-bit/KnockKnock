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
  
  <!-- pagecss -->
  <link href="${cp}/resource/css/ordersList.css" rel="stylesheet">
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
				<h4>주문자정보</h4>
				<div>
					<p>이름 : ${users.uName }</p>
					<p>주소 : ${users.uAddress}</p>
					<p>핸드폰 : ${users.uPhone }</p>
					<p>이메일 : ${users.uEmail }</p>
				
				</div>
			
			</div>
			<div class="infoReciever">
				<h4>수령자정보</h4>
				<input type="checkbox" >주문자와 동일<br>
				<label>이름 :</label><input type="text" name="uName"><br>
				<label>배송지 :</label><input type="text" name="uName"><br>
				<label>핸드폰 :</label><input type="text" name="uName"><br>
				<label>이메일 :</label><input type="text" name="uName"><br>
				
				<select>
					<option value="">배송 시 요청사항을 선택해주세요</option>
					<option value="">부재 시 문 앞에 두고 가주세요</option>
					<option value="">배송 전 전화 또는 문자 주세요</option>
					<option value="">부재 시 경비실에 두고가주세요</option>
					<option value="">직접입력</option>
				</select>
			
			</div>
			<div class="paymentMethod">
				<p>결제방법</p>
				<input type="radio" name="pm"><label>무통장입금</label>
				<input type="radio" name="pm"><label>카카오페이</label>
				<input type="radio" name="pm"><label>계좌이체</label>
			
			
			</div>
			<div class="payment">
				<p>결제하기(금액/버튼)</p>
				<p>얼마얼마 원</p>
				<input type="button" value="주문하기">
			</div>
			<div class="infoOrdersProduct">
				<p>주문상품정보</p>
			
			</div>
		
		
		</div>
	</div>
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>