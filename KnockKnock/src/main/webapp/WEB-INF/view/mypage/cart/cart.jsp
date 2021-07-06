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
			<input type="button" onclick="location.href='${cp }/productlist.do'" value="더 구매하러 가기">
			<input type="button" onclick="" value="내 주문 목록">
		</div>
		<div class="cartText">
			<!-- 장바구니 text, 주문 진행 순서 명시, 상품 구매로 이동버튼, 내 주문내역 이동 버튼 -->
			<div>
				장바구니
			</div>
			<div>
				장바구니->주문목록->결제
			</div>
			<div>
				<input type="button" onclick="deleteCart()" value="장바구니 비우기">
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
					<div style="margin-bottom:10px;">
						<span class="pIdx" style="display:none;">${cartItem.pIdx }</span>
						<span style="font-weight:700; "><a href="productDetail.do?pIdx=${cartItem.pIdx}">[ ${cartItem.pName } ]</a></span><br>
						${cartItem.pDesc }
					</div>
					<div>
						<span class="deleteOne" style="font-size:10px;">삭제</span>
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
					<p class="cg5price">${cartItem.pPrice }</p><span>원</span>&nbsp;&nbsp;
				</div>
				<div class="cg6">
					<!-- 배송비 -->
					<span class="pFee">${cartItem.pFee }</span> 원
				</div>
				<div class="cg7">
					<!-- 전체 가격(수량 및 배송비 합쳐서) -->
					<p class="cg6price">${(cartItem.pCount * cartItem.pPrice) + cartItem.pFee }</p><span>원</span>&nbsp;&nbsp;
				</div>
			</div>
			</c:forEach>	
			</c:if>
			<c:if test="${empty cartList }">
				<div style="text-align:center;"> 상품이 존재하지 않습니다. </div>
			
			
			</c:if>
		</div>
		<div class="totPrice">
			<!-- 체크박스에 체크 된 상품의 가격만 가져오기(+배송비) -->
			<div>총 합계 :</div><span id="price">0</span>원
			<input type="button" value="주문하기" onclick="orders()">
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
		console.log("인덱스:" + idx);
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
			pTotPrice = parseInt($(this).closest('div').nextAll().filter($(".cg7")).children().text());
			
			console.log("pTotPrice:"+pTotPrice);
			
			totalPrice += pPrice;
			pTotPrice += pPrice;
			
			$(this).closest('div').nextAll().filter($(".cg7")).children().html(pTotPrice+"원");
			$("#price").html(totalPrice);
			
			
			
		});
		// - 버튼 클릭했을 때 해당 가격 줄어들게
		$(".minus").click(function(e){
			
			var totalPrice = parseInt($("#price").text());
			var pPrice = 0;
			
			// 총 합계
			pPrice = parseInt($(this).closest('div').next().children().text());
			// 상품당 가격 총 합계
			pTotPrice = parseInt($(this).closest('div').nextAll().filter($(".cg7")).children().text());
			
			totalPrice -= pPrice;
			pTotPrice -= pPrice;
			
			$(this).closest('div').nextAll().filter($(".cg7")).children().html(pTotPrice+"원");
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
	console.log
	var param = [];
	
	var length = $(".pIdx").length;
	console.log("길이:"+length);
	
	 var data = {};
	for(var i=0; i<length; i++){
	
		if($(".opt").eq(i).is(":checked")==true){
			data = {
					pIdx : $(".pIdx").eq(i).text(),
					oCnt : $(".pCount").eq(i).text(),
					pPrice : $(".cg5price").eq(i).text(),
					sIdx : $(".sIdx").eq(i).text(),
					oTotprice : $(".cg6price").eq(i).text(),
					uIdx : $(".uIdx").text()
					};
			param.push(data);
		}
	}
	var jsonData = JSON.stringify(param);
	console.log("제발:"+jsonData);
	
	$.ajax({
		url : "/moveOrders.do",
		data :JSON.stringify(param),
		type:"post",
		dataType:"json",
		contentType : "application/json;",
		async:false,
		success: function(data){
			var moveOrders = confirm('주문이 완료되었습니다. \n 주문페이지로 이동하시겠습니까?');
			
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

</script>
</html>