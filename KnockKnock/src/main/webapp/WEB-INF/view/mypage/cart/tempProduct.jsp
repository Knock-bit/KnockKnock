<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
 
  // 구매 수량 선택
  function count(type)  {
	  // 결과를 표시할 element
	  var result = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  var number = result.innerText;
	  var minus = document.getElementById('minus');

	  // 더하기/빼기
	  if(type === 'plus') {
		  
	    number = parseInt(number) + 1;
	    
	  }else if(type === 'minus')  {
		  
	    number = parseInt(number) - 1;
	  }
	  
	  // 결과 출력
	  result.innerText = number;
	  console.log(result.innerText);
	  
	  // 현재 수량이 0이하이면 - 버튼 비활성화
	  if(result.innerText <= 0){
		  	
	    	minus.disabled = 'disabled';
	  } else if (result.innerText != 0){
		  
		  minus.disabled = false;
		  
	  } 
	  
 
}
  </script>
  <style>
  .main-content{
        flex: 1;d
        min-height:100vh;
        margin-top:100px;
        
    }
   .pgrid {
   		width:80%;
   		display : grid;
   		grid-template-columns: 30% 69%;
		grid-template-rows: repeat(7, 1fr) ;
		margin:0 auto;
   }
   .pimg {
   		grid-column: 1/2;
		grid-row: 1/7;
		overflow: hidden;
		align-items: center;
		justify-content: center;
		margin : 5%;
   }
   .pimg img {
   		object-fit: cover;
		width: 100%;
   
   }
   .pname {
   		grid-column: 2/3;
		grid-row: 1/2;
   }
   .pprice{
   		grid-column: 2/3;
		grid-row: 2/3;
   }
   .pcnt{
   		grid-column: 2/3;
		grid-row: 3/4;
   }
   .pdesc{
   		grid-column: 2/3;
		grid-row: 4/6;
   }
   .pfee {
   		grid-column: 2/3;
		grid-row: 6/7;
   }
   .pbtn {
   		grid-column: 2/3;
		grid-row: 7/8;
   }
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>주문임시페이지</h1>
	<div class="pgrid">
		<div class="pimg">
			<img src="/resource/img/product/${pvo.pImg }">
		
		</div>
		<div class="pname">
			<!-- 상품 idx -->
			<p id="pIdx" style="display:none;">${pvo.pIdx }</p>
			상품명 : ${pvo.pName }
		</div>
		<div class="pprice">
			상품가격 : ${pvo.pPrice }원
			
		</div>
		<div class="pcnt">
			<input type="button" id="minus" onclick="count('minus')" value="-" />
			<span id="result">1</span>
			<input type="button" id="plus" onclick="count('plus')" value="+" />
			
			
		</div>
		<div class="pdesc">
			상품 설명 : ${pvo.pDesc }
		</div>
		<div class="pfee">
			배송비 : ${pvo.pFee }
		</div>
		<div class="pbtn">
			<button onclick="location.href='productList.do'">목록으로 이동</button>
			<button>주문하기</button>
			<input type="button" onclick="addCart()" value="장바구니">
		</div>
	</div>
</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
<script>
function addCart(){
	  var pIdx = $("#pIdx").text();
	  var selectCnt = $("#result").text(); 
	  console.log(pIdx+","+selectCnt);
	  
	  
	  $.ajax({
		 url : "addCart.do",
		 data : {pIdx : pIdx, selectCnt:selectCnt},
		 type : "post",
		 dataType : "text",
		 success : function(data){
			 
			 
			 if(data==1) { // 장바구니로 이동
				 // 동일한 상품 존재
				 alert("장바구니에 동일한 상품이 존재합니다.");
			 } else {
				 var moveCart = confirm('장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?');
				 
				 if(moveCart){
					 location.href="moveCart.do";
				 } else {
					 location.href="productDetail.do?pIdx="+pIdx; // 상품페이지 다시 리턴
				 }
				 
			 }
		 },
		 error : function(data){
			 alert("에러");
		 }
		  
		  
	  });
	  
}


</script>
</html>