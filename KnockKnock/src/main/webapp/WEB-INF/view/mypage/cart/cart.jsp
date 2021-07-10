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
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR:wght@300&family=Roboto+Slab:wght@300&display=swap" rel="stylesheet">
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
<!-- nav -->
		<nav class="navbar navbar-expand-lg navbar-light bg-light"
			style="padding: 0 5% 0 5%;">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"><a class="nav-link" id="myq"
						href="${cp }/productlist.do">더 구매하러 가기</a></li>
					<li class="nav-item"><a class="nav-link" id="myf" href="orderHistory.do">주문 내역</a></li>
					 
				</li><!--
				<li class="nav-item dropdown"><a class="nav-link" href="#">생활용품</a>
				</li> -->
				</ul>

			</div>
			<form action="" method="post">
				<input type="search" placeholder="Search" aria-label="Search"><input
					type="submit" value="검색">
			</form>
		</nav>
	<div class="cart">
	
	<div class="cartmain">
		<div class="cartText">
			<!-- 장바구니 text, 주문 진행 순서 명시, 상품 구매로 이동버튼, 내 주문내역 이동 버튼 -->
			<div class="ct1">
				<h1 style="margin:4%; text-align:center;">C A R T</h1>
			</div>
			<div class="ct2">
				<img src="/resource/img/upload/etc/shopping-cart.png"><span style="font-weight:bold; color:rgb(10, 61, 14);">장바구니</span>
				<img src="/resource/img/upload/etc/checklist.png"><span style="font-size:18px;">주문목록</span>
				<img src="/resource/img/upload/etc/checked.png"><span style="font-size:18px;">결제</span>
			</div>
			<div class="ct3">
				<i class="bi bi-trash"></i><input type="button" onclick="deleteCart()" value="장바구니 비우기">
			</div>
			<p class="uIdx" style="display:none;">${users.uIdx }</p>
		</div>
		<div class="cartview">
		<div class="topcartmenu">
			<div class="tct1">
				<input id="allchk" type="checkbox" name='selectall' onclick="selectAll(this)" checked="checked" >
			</div>
			<div class="tct2">
				상품
			
			</div>
			<div class="tct3">
				수량
			</div>
			<div class="tct4">
				상품가격
			</div>
			<div class="tct5">
				배송비
			</div>
			<div class="tct6">
				합계
			</div>
		</div>
			<c:if test="${not empty cartList }">
			<c:forEach var="cartItem" items="${cartList }">
			
			
			<div class="cartGrid">
				<div class="cg1">
					<!-- 판매자idx -->
					<p class="sIdx" style="display:none;">${cartItem.sIdx }</p>
					<!-- 체크박스 default값 checked -->
					<input type="checkbox" class="opt" name='opt1' onclick="checkSelectAll()" checked="checked"  value="0">
				</div>
				<div class="cg2">
					<!-- 상품 이미지 -->
					<div class="cgimg">
						<img src="/resource/img/product/${cartItem.pImg }">
					</div>
				</div>
				<div class="cg3">
					<!-- 상품명, 설명 -->
					<div>
						<span class="pIdx" style="display:none;">${cartItem.pIdx }</span>
						<span style="font-weight:700; "><a href="productDetail.do?pIdx=${cartItem.pIdx}">[ ${cartItem.pName } ]</a></span><br>
						<p style="font-size:12px;">${cartItem.pDesc }</p>
						
					</div>
					
				</div>
				<div class="cg4">
					<!-- 수량 -->
					<input type="button"  class="minus" onclick="minus(this)" value="-" name="count" />
						<span class="pCount">${cartItem.pCount }</span>
					<input type="button" class="plus" onclick="plus(this)" value="+" name="count"/>
					 
				</div>
				<div class="cg5">
					<!-- 상품 개당가격 -->
					<p class="cg5price" style="margin:0;">${cartItem.pPrice }</p><span>원</span>&nbsp;&nbsp;
				</div>
				<div class="cg6">
					<!-- 배송비 -->
					<span class="pFee">${cartItem.pFee }</span> 원
				</div>
				<div class="cg7">
					<!-- 전체 가격(수량 및 배송비 합쳐서) -->
					<p class="cg6price" style="margin:0;">${(cartItem.pCount * cartItem.pPrice) + cartItem.pFee }</p>원&nbsp;&nbsp;
					<div class="cg6price2">
						<span class="deleteOne" style="font-size:10px; text-align:right; margin-left:10px;">삭제</span>
					</div>
				</div>
				
			</div>
			</c:forEach>	
			</c:if>
			<c:if test="${empty cartList }">
				<div style="text-align:center; margin:8% 0 10% 0;"> 상품이 존재하지 않습니다. </div>
			
			
			</c:if>
		</div>
		<div class="totPrice">
			<!-- 체크박스에 체크 된 상품의 가격만 가져오기(+배송비) -->
			<div class="totp1">
				<div>총 결제 금액 :</div>&nbsp;&nbsp;&nbsp;<span id="price">0</span>&nbsp;&nbsp;&nbsp;원
			</div>
			<div class="totp2">
				<input type="button" value="주문하기" onclick="orders()">
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
	
	
	
	var totalPrice = 0; // 총 합계에 나타낼 금액
	var totalPrice1 = 0; // 전체 체크때 사용할 총 합계금액(보관?용)
	var pCount = 0;
	var pPrice = 0;
	var pFee = 0;
	var aa = 0;
	
	$('input:checkbox[name=opt1]').each(function() {
		// 체크된 상품의 인덱스 번호
		idx = $('input:checkbox[name=opt1]').index(this); 
		// 동일한 인덱스번호의 상품 수량, 가격, 배송비 
		pCount = parseInt($(".pCount").eq(idx).text());
		
		pPrice = parseInt($(".cg5price").eq(idx).text());
		
		pFee = parseInt($(".pFee").eq(idx).text());

		//aa = $('input:checkbox[name=opt1]').eq(idx).val();
		var tot = ((pCount*pPrice)+pFee);
		$('input:checkbox[name=opt1]').eq(idx).val((pCount*pPrice)+pFee);
		
		// 나중에 전체체크 때문에 전체 계산 값 따로 저장해놓기(좋은방법 생기면...알고싶다..ㅠ)
		totalPrice1 += parseInt($('input:checkbox[name=opt1]').eq(idx).val());
		
	});
		totalPrice = totalPrice1;
	
		$("#price").html(totalPrice); // 전체 체크된 상태이기 때문에 먼저 토탈값 저장해주기
		
		// 전체 체크/해제 상태 때의 값
		$("#allchk").change(function(){
			if(this.checked){
				totalPrice += totalPrice1;
			} else {
				totalPrice -= totalPrice;
			}
			$("#price").html(totalPrice);
		});
		
		// 상품 하나당 체크 해제하고 체크됐을 때의 값 
		$(".opt").change(function(){
			
			if(this.checked) {
				totalPrice += Number($(this).val());
			} else {
				totalPrice -= Number($(this).val());
			}
			$("#price").html(totalPrice);
		});
	
		
		// + 버튼 클릭했을 때 가격 증가
		$(".plus").click(function(e){
			
			var totalPrice = parseInt($("#price").text());
			var pPrice = 0;
			// 총 합계
			pPrice = parseInt($(this).closest('div').next().children().text());
			// 상품당 가격 총 합계
			pTotPrice = parseInt($(this).closest('div').nextAll().filter($(".cg7")).children('p').text());
						
			totalPrice += pPrice;
			pTotPrice += pPrice;
			
			$(this).closest('div').nextAll().filter($(".cg7")).children('p').html(pTotPrice);
			$("#price").html(totalPrice);
			
			
			
		});
		// - 버튼 클릭했을 때 해당 가격 줄어들게
		$(".minus").click(function(e){
			
			var totalPrice = parseInt($("#price").text());
			var pPrice = 0;
			
			// 총 합계
			pPrice = parseInt($(this).closest('div').next().children().text());
			// 상품당 가격 총 합계
			pTotPrice = parseInt($(this).closest('div').nextAll().filter($(".cg7")).children('p').text());
			
			totalPrice -= pPrice;
			pTotPrice -= pPrice;
			
			$(this).closest('div').nextAll().filter($(".cg7")).children('p').html(pTotPrice);
			$("#price").html(totalPrice);
			
			
		});
		
		$(".pCount").each(function(index){
			var idx = index;
			if($(this).text()==1){
				$(".minus").eq(idx).attr("disabled",true);
			}
			if($(this).text()==10){
				$(".plus").eq(idx).attr("disabled",true);
			}
		});
		
	
});	
// 주문하기 버튼
function orders(){
	var param = [];
	
	var length = $(".pIdx").length;
	
	if(length==0){
		alert("주문가능한 상품이 존재하지 않습니다.");
	} else {
	
	 var data = {};
	for(var i=0; i<length; i++){
	
		if($(".opt").eq(i).is(":checked")==true){
			data = {
					pIdx : $(".pIdx").eq(i).text(),
					oCnt : $(".pCount").eq(i).text(),
					pPrice : $(".cg5price").eq(i).text(),
					sIdx : $(".sIdx").eq(i).text(),
					oTotprice : $(".cg6price").eq(i).text(),
					oFee : $(".pFee").eq(i).text(),
					uIdx : $(".uIdx").text()
					
					};
			param.push(data);
		}
	}
	var jsonData = JSON.stringify(param);
	
	$.ajax({
		url : "/moveOrders.do",
		data :JSON.stringify(param),
		type:"post",
		dataType:"json",
		contentType : "application/json;",
		async:false,
		success: function(data){
			var moveOrders = confirm('주문페이지로 이동하시겠습니까?');
			
			if(moveOrders){
				// 주문페이지로 이동
				location.href="ordersList.do";
			} else {
				location.href="moveCart.do";
			}
			
		},
		error : function(data){
			alert("에러");
		}
		
	}); 
	
	}
}

</script>
</html>