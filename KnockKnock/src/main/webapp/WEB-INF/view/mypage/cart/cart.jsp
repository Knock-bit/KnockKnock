<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
  
  <!-- page  -->
  <link href="${cp}/resource/css/cart.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script src="${cp}/resource/js/cart.js" type="text/javascript" charset="utf-8"></script> 
  <style>
  
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>장바구니</h1>
	<div class="cartmain">
		<div>
			<button>상품목록 가기</button>
			<button>내 주문 목록</button>
		</div>
		<div class="cartText">
			<!-- 장바구니 text, 주문 진행 순서 명시, 상품 구매로 이동버튼, 내 주문내역 이동 버튼 -->
			<div>
				장바구니
			</div>
			<div>
				장바구니->주문목록->결제
			</div>
			<div>장바구니 비우기, 삭제</div>
		</div>
		<div class="cartview">
		<div class="topcartmenu">
			<div class="tct1">
				<input id="allchk" type="checkbox" name='selectall' onclick="selectAll(this)" >
			</div>
			<div class="tct2">
				상품
			
			</div>
			<div class="tct3">
				수량
			</div>
			<div class="tct4">
				가격
			</div>
			<div class="tct5">
				배송비
			</div>
		</div>
			<c:forEach var="cartItem" items="${cartList }">
			
			<div class="cartGrid">
				<div class="cg1">
					<input type="checkbox" class="opt" name='opt1' onclick="checkSelectAll()" >
				</div>
				<div class="cg2">
					<div class="cgimg">
						<img src="/resource/img/product/${cartItem.pImg }">
					</div>
				</div>
				<div class="cg3">
					<div style="margin-bottom:10px;">
						<span style="font-weight:700; ">[ ${cartItem.pName } ]</span><br>
						${cartItem.pDesc }
					</div>
					<div>
						<span style="font-size:10px;">삭제</span>
					</div>
				</div>
				<div class="cg4">
					<input type="button"  class="minus" onclick="minus(this)" value="-" / >
						<span class="pCount">${cartItem.pCount }</span>
					<input type="button" class="plus" onclick="plus(this)" value="+" />
					 
				</div>
				<div class="cg5">
					<fmt:formatNumber value="${cartItem.pPrice }" var="pPrice" pattern="#,###"/>
					<p class="cg5price">${pPrice }원</p>&nbsp;&nbsp;
					<input class="cg5btn" type="button" value="내 쿠폰">
				</div>
				<div class="cg6">
					${cartItem.pFee } 원
				</div>
			</div>
			</c:forEach>	
		</div>
		</div>
		<div>
			총 합계 :
		
		</div>

	
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
<script>
	
	


</script>
</html>