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
   <link href="${cp}/resource/css/nav.css" rel="stylesheet">

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- 사진 클릭하면 창  -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
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
	 
	  $(".con2").html($(".imTitle").eq(idx).html()); //  타이틀
	  $(".con3").html($(".imContent").eq(idx).html()); //  내용
	  $(".con4").html($(".imGoal").eq(idx).html()); //  목표
	  $(".con5").html($(".imEndDate").eq(idx).html()); //  마감일
  		
 }
	
</script>


  
  <!-- page css -->
  <style>
  /* 메인 css */
  .main-content{
  		width:100%;
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
    }
   .main {
   		width:70%;
   		margin: 0 auto;
   		text-align:center;
   		position:relative;
   }
   .endList{
   		display:grid;
  		grid-template-columns: repeat(3, 25%);
  		grid-template-rows: repeat(5, 50vh);
  		grid-gap:8%;
		padding:5px;
  		border : 1px solid gray;
  		justify-content: center;
   }
   .item{
   		display:grid;
  		grid-template-columns: repeat(1, 100%);
  		grid-template-rows: 6fr 1fr;
   }
   /*캠페인 이미지*/
   .itemImg{
   		overflow: hidden;
      	align-items: center;
      	justify-content: center;
      	
   
   }
   .itemImg img{
   		border-radius:5%;
   		object-fit:cover;
   		width:90%;
   		height:100%;
   }
   .itemImg img:hover{
   		opacity:0.6;
   		cursor:pointer;
   
   }
   
   /*캠페인 제목*/
   .item p{
   		font-style:normal;
   		font-size:13px;
   }
   
   /*모달*/
   .modal{
	  display:none;
	  position:fixed; 
	  width:100%; height:100%;
	  top:0; left:0; 
	  background:rgba(0,0,0,0.7);
	}
	.madalDiv{
	  position:fixed;
	  top:50%; left:50%;
	  transform: translate(-50%,-50%);
	  max-width: 60%;
	  min-height: 30%;
	  background:#fff;
	  width:60%;
	  height:60vh;
	}
	.madalDiv .con{
	  font-size:15px; line-height:1.3;
	  height:100%;
	  display:grid;
	  grid-template-columns: 30% 50% 19%;
  	  grid-template-rows: repeat(5, 1fr);
	}
	.madalDiv .close{
	  display:block;
	  position:absolute;
	  width:20px; height:20px;
	  text-align:center; line-height: 30px;
	  text-decoration:none;
	  color:#000; font-size:13px; font-weight: bold;
	  right:10px; top:7px;
	}
	/*모달창 데이터*/
	.con1{
		grid-column : 1/2;
  		grid-row:1/6;
  		justify-content: center;
  		overflow: hidden; 
      	text-align:center
	}
	.con1 img{
		border-radius:5%;
   		object-fit:cover;
   		width:80%;
   		height:80%;
   		margin-top:20px;
	
	}
	.con2{
		grid-column : 2/3;
  		grid-row:1/2;
  		justify-content: center;
  		
	}
	.con3{
		grid-column : 2/3;
  		grid-row:2/3;
  		justify-content: center;
	}
	.con4{
		grid-column : 2/3;
  		grid-row:3/4;
  		justify-content: center;
	}
	.con5{
		grid-column : 2/3;
  		grid-row:4/5;
  		justify-content: center;
	}
	.con6{
		grid-column : 2/3;
  		grid-row:5/6;
  		justify-content: center;
	}
	.con7{
		grid-column : 3/4;
  		grid-row:1/6;
  		justify-content: center;
	}
   </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>종료 캠페인 리스트</h1>
	<div class="main">
		<div class="endList">
			<c:forEach var="endlist" items="${endlist }">
				<div class="item">
					<p class="itemImg" onclick="infoImg(this)"><img class="imim" src="/resource/img/upload/${endlist.ciFile}"></p>
					<p class="imTitle">${endlist.ciTitle }</p>
					<div style="display:none;">
						<p class="onlyImg">${endlist.ciFile}</p>
						<p class="imContent">${endlist.ciContent }</p>
						<p class="imEndDate">${endlist.ciEnddate }</p>
						<p class="imGoal">${endlist.ciGoal }</p>
					</div>
					
				
				
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="modal">
	  <div class="madalDiv">
		    <a href="javascript:;" class="close">X</a>
		    <div class="con">
		    	<div class="con1">

		    	</div>
		    	<div class="con2">
		    	
		    	</div>
		    	<div class="con3">
		    	
		    	</div>
		    	<div class="con4">
		    	
		    	</div>
		    	<div class="con5">
		    	
		    	</div>
		    	<div class="con6">
		    	
		    	</div>
		    	<div class="con7">
		    	
		    	</div>
		    </div>
  	  </div>
  	 </div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>