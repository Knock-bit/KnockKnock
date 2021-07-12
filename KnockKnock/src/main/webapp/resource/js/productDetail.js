
// 장바구니 수량

function count(type)  {
	  // 결과를 표시할 element
	  var result = document.getElementById('result');
	  
	  // 현재 화면에 표시된 값
	  var number = result.innerText;
	  var minus = document.getElementById('minus');

	  // 더하기/빼기
	  if(type === 'plus') {
		  
		  if(number == 10){
		  	number = 10;
		  	alert ("10개 이상 구매하실 수 없습니다");
		  } else {
		   
	    	number = parseInt(number) + 1;
	       }
	  }else if(type === 'minus')  {
		  if(number<=1){
		  	console.log("1임");
		  	number = 1;
		  } else { 
		  
	    	number = parseInt(number) - 1;
	  	   }
	  }
	  
	  // 결과 출력
	  result.innerText = number;
	  console.log(result.innerText);
	  
	  // 현재 수량이 0이하이면 - 버튼 비활성화
	  if(result.innerText <= 1){
		  	
	    	minus.disabled = 'disabled';
	  } else if (result.innerText != 1){
		  
		  minus.disabled = false;
		  
	  } 
	  
	  // 결제금액
	  var price = parseInt(document.getElementById('price').innerText);
	  var pfee = parseInt(document.getElementById('pfee').innerText);
	  console.log("가격"+price);
 	  var totprice = (price * number)+pfee;
 	  document.getElementById('totprice').innerHTML=totprice;
 
}

// 장바구니 동일상품 존재여부
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
			 alert("로그인 후 이용해주세요.");
			 location.href="/user/login.do";
		 }
		  
		  
	  });
	  
}
