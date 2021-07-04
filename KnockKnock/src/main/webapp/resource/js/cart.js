// 수량 감소
	function minus(e){
		var idx = $(".minus").index(e);
		
		var pCount = $(".pCount").eq(idx).text();
		
		var minus = $(".minus").eq(idx);
		var number;
		number = parseInt(pCount) -1;
		
		console.log(pCount);
		
		// 현재 수량이 0이면 버튼 비활성화
		if(pCount <= 0){
			minus.disabled = 'disabled';
		} else if(pCount > 0) {
			minus.disabled = false;
		} 
		
		$(".pCount").eq(idx).html(number);
		
		
	}
	// 수량 증가
	function plus(e){
		var idx = $(".plus").index(e);

		var pCount = $(".pCount").eq(idx).text();
		
		var number;
		number = parseInt(pCount) +1;

		$(".pCount").eq(idx).html(number);
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
	

	
	



