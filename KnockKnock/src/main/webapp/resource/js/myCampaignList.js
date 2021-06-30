$(function(){
	  $(".close").on('click',function(){
		  $(".modal").css("display","none");
		  $(".madalDiv").fadeOut(300);
	  
	  
	  
  });
});
 function infoImg(e){
	  // 게시물 인덱스 값
	  var idx = $(".itemImg").index(e);
	  
	  $(".modal").css("display", "block");
	  $(".modal").css("z-index", "10000");
  		
	  $(".madalDiv").css("display", "block");
	  $(".madalDiv").css("z-index", "10000");
	  
	  // 모달창 내 값 넣기
	  
	  //1 사진
  
	  $(".con1").html("<img src='/resource/img/upload/"+$('.onlyImg').eq(idx).html()+"'>"); // 사진
	 
	  $(".c2").html($(".imTitle").eq(idx).html()); //  타이틀
	  $(".c3").html($(".imContent").eq(idx).html()); //  내용
	  $(".c4").html($(".imGoal").eq(idx).html()); //  목표
	  $(".c5").html($(".imEndDate").eq(idx).html()); //  마감일
	  $(".ce").html("<img src='/resource/img/upload/"+$('.imEmblem').eq(idx).html()+"'>"); //  엠블럼
  		
 }