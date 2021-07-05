// 수량 감소
function minus(e){
		var idx = $(".minus").index(e);
		console.log(idx);
		
		var pCount = $(".pCount").eq(idx).text();
		
		var minus = $(".minus").eq(idx);
		var number;
		number = parseInt(pCount) -1;
		
		console.log("minus:"+number);
		
		$(".pCount").eq(idx).html(number);
		
		pCount = $(".pCount").eq(idx).text();
		
		// 현재 수량이 0이면 버튼 비활성화
		if(pCount <= 0){
			minus.attr("disabled", true);
			
		} else{
			minus.attr("disabled", false);
		} 
		
	}
	// 수량 증가
	function plus(e){
		var idx = $(".plus").index(e);
		console.log("plusIdx:"+idx);
		var minus = $(".minus").eq(idx);
		
		var pCount = $(".pCount").eq(idx).text();
		
		var number;
		number = parseInt(pCount) +1;
		console.log("plus:"+number);
		
		$(".pCount").eq(idx).html(number);
		
		if(pCount >= 0) {
			minus.attr("disabled", false);
		
		}
}

// 체크박스
	// 전체 선택 / 해제
	function checkSelectAll() {
		const checkboxes = document.querySelectorAll('input[name="opt1"]');
		
		const checked = document.querySelectorAll('input[name="opt1"]:checked');
		
		const selectAll = document.querySelector('input[name="selectall"]');
		
		if(checkboxes.length === checked.length) {
			selectAll.checked=true;
		} else {
			selectAll.checked=false;
		}
	
	}
	function selectAll(selectAll)  {
	  const checkboxes 
	     = document.getElementsByName('opt1');
	  
	  checkboxes.forEach((checkbox) => {
	    checkbox.checked = selectAll.checked
	  })
	}
	
// 장바구니 비우기
function deleteCart(){

	var deleteCart = confirm('장바구니에 있는 상품을 전체 삭제하시겠습니까?');
	
	if(deleteCart){
		 $.ajax({
		 url : "deleteCart.do",
		 type : "post",
		 dataType : "text",
		 success : function(data){
		 
			 if(data==1) { // 장바구니로 이동
				 alert("상품 삭제가 완료되었습니다.");
				 location.href="moveCart.do";
			 } 
		 },
		 error : function(data){
			 alert("에러");
		 }
		  
	  });
	  
	 } else {
		 location.href="moveCart.do"; // 장바구니페이지
	 }

}

// 상품 하나 삭제
$(function(){
	$(".deleteOne").each(function(index){
		
		var idx = index;
		console.log("삭제idx"+idx);
	
		$(".deleteOne").click(function(){
			var pIdx = $(".pIdx").eq(idx).text();
			console.log(pIdx);
			
			var deleteOne = confirm('해당 상품을 전체 삭제하시겠습니까?');
			
			if(deleteOne){
				 $.ajax({
				 url : "deleteOne.do",
				 data : {pIdx : pIdx},
				 type : "post",
				 dataType : "text",
				 success : function(data){
				 
					 if(data==1) { // 장바구니로 이동
						 alert("해당 상품이 삭제되었습니다.");
						 location.href="moveCart.do";
					 } 
				 },
				 error : function(data){
					 alert("에러");
				 }
				  
			  });
			  
			 } else {
				 location.href="moveCart.do"; // 장바구니페이지
			 }
		
		
		
		});
	
	});

});

