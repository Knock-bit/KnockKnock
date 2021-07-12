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
  <link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <!-- page css -->
   <link href="${cp}/resource/css/productDetail.css" rel="stylesheet">
   <script src="${cp}/resource/js/productDetail.js" type="text/javascript" charset="utf-8"></script> 
  <script>
 $(function(){
 
	
  $("#preminus").click(function(e){
	
	  e.preventDefault();
		 count('minus');
		
	});
  $("#nextplus").click(function(e){
		e.preventDefault();
		count('plus');
	});
  
 }); 
  </script>

</head>
<body>
  <!-- ======= Header ======= -->
        <c:choose>
     <c:when test="${!empty seller}">
   		<jsp:include page='/layout/navbar/navSeller.jsp' flush='false'/>   	
  	</c:when>
  	<c:when test="${users.uType eq 1 }">
   		<jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false'/>   	
  	</c:when>
  	<c:when test="${users.uType eq 0 }">
   		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false'/>   	  	
  	</c:when>
  	<c:otherwise>
	   <jsp:include page='/layout/navbar/nav.jsp' flush='false'/>
  	</c:otherwise>
  	</c:choose>
  <!-- ======= Header 끝  === -->
<div class="main-content">
	<div class="detailMain">

		<div class="pgrid">
			<div class="pnav">
				<!-- <button onclick="location.href='productList.do'">목록으로 이동</button> -->
				<a href="${cp }/run.jsp">HOME</a><i class="bi bi-chevron-compact-right">
				</i><a href="${cp }/productlist.do?pcIdx=0"> SHOP</a> <i class="bi bi-chevron-compact-right">
				</i> 
				<span id="pcIdx" style="display:none;">${pvo.pcIdx }</span>
				<a href="/productlist.do?pcIdx=${pvo.pcIdx }">
					<c:if test="${pvo.pcIdx == 1}"> 식품</c:if>
					<c:if test="${pvo.pcIdx == 2}"> 의류</c:if>
					<c:if test="${pvo.pcIdx == 3}"> 생활용품</c:if>
				</a>
			</div>
			<div class="pimg">
				
				<img src="/resource/img/product/${pvo.pImg }">
				<p>추가사진?</p>
			</div>
			<div class="pname">
				<span id="sIdx" style="display:none;">${pvo.sIdx }</span>
				<!-- 상품 idx -->
				<p id="pIdx" style="display:none;">${pvo.pIdx }</p>
				<h2 style="margin:10px;"><span style="font-size:18px;">[knock]</span> ${pvo.pName }</h2>
			</div>
			<div class="pprice">
				<span id="price" style="display:none;">${pvo.pPrice }</span>
				<fmt:formatNumber value="${pvo.pPrice }" var="price" pattern="#,###"/>
				<span>${price }</span><span>&nbsp;원</span>
				<hr>
			</div>
			
			<div class="pdesc">
				 ${pvo.pDesc }
			</div>
			
			<div class="pfee">
				<span style="color:rgb(10, 61, 14); font-weight:600;">배송비 :</span>
				<span id="pfee" style="display:none;">${pvo.pFee }</span>
				<fmt:formatNumber value="${pvo.pFee }" var="pfee" pattern="#,###"/>
				<span>${pfee }</span><span>&nbsp;원</span><br>
				<span style="font-size:13px; color:#8c8c8c;s">50,000원 이상 구매 시 무료 배송</span>
			</div>
			<div class="pcnt">
				<span style="color:rgb(10, 61, 14); font-weight:600; margin-right:20px;">수량</span>
				<i class="bi bi-caret-left-fill" id="preminus"></i>
				<input type="button" id="minus" onclick="count('minus')" value="-" />
				<span id="result">1</span>
				<input type="button" id="plus" onclick="count('plus')" value="+" />
				<i class="bi bi-caret-right-fill" id="nextplus"></i>
				<hr>
				<p style="text-align:right;" >
					<span id="totprice"></span>
					<span>원</span> 
				</p>
				
				
			</div>
			<div class="pbtn">
				
				<input type="button" onclick="orders()" value="구매하기" id="buying">
				<input type="button" onclick="addCart()" value="장바구니" id="addcart">
				<div id="fullheartbox">
				<i class="bi bi-suit-heart" id="emptyheart" ></i>
				<i class="bi bi-suit-heart-fill" id="fullheart" ></i>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page='/layout/navbar/product/navProduct.jsp' flush='false'/>   	
	
	
</div>	



<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
<script>
$(function(){
	// 찜하기 버튼
	$("#emptyheart").click(function(){
		$(this).css("display","none");
		$("#fullheart").css("display","block");
	});
	
	$("#fullheart").click(function(){
		$(this).css("display","none");
		$("#emptyheart").css("display","block");
	});
	
	// 초기 가격
	var number = parseInt($("#result").text());
	var price = parseInt($("#price").text());
	var pfee = parseInt($("#pfee").text());
	
	
	
	$("#totprice").html((number*price)+pfee);
	
	
	
});
//주문하기 버튼
function orders(){
	var vo = {};
	vo.pIdx = $("#pIdx").text();
	vo.oCnt = $("#result").text();
	vo.pPrice = $("#price").text();
	vo.oFee = $("#pfee").text();
	vo.oTotprice = $("#totprice").text();
	vo.sIdx = $("#sIdx").text();
	
	var jsonData = JSON.stringify(vo);
	console.log(jsonData);
	var pcIdx = $("#pcIdx").val();
	
	$.ajax({
		url : "/detailProductOrders.do",
		data :JSON.stringify(vo),
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
				location.reload();
			}
			
		},
		error : function(data){
			alert("상품 주문은 로그인 후에 가능합니다.");
			location.href="/user/login.do";
		}
		
	}); 
	
	}

</script>
</html>