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
  
  <!-- page script -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script>
  $(function(){
	  // 누적 포인트 
	 var allPoint = "${users.uTotPoint}";
	 
	 $({val:0}).animate({val:allPoint}, {
		 dutation : 4000,
		 step:function(){
			 var num = numberWithCommas(Math.floor(this.val));
			 $("#allPoint").text(num+"P");
		 },
		 complete : function(){
			 var num =  numberWithCommas(Math.floor(this.val));
			 $("#allPoint").text(num+"P");
		 }
	 });
	 
	 // 사용,가용포인트 그래프
	 var uPoint = ${users.uPoint/users.uTotPoint*100};
	 var ePoint = ${100-(users.uPoint/users.uTotPoint*100)};

	 $("#uPoint").css("width",uPoint+"%");
	 $("#ePoint").css("width",ePoint+"%");
	  
	  
  });
  function numberWithCommas(x){
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g,",");
  }
  
  
  </script>
  
  <!-- page css -->
  <style>
  .main-content{
  		width:100%;
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
   }
   .myPoint {
   		width:50%;
   		margin: 0 auto;
   		text-align:center;
   		position:relative;
   }
   .pointZone, .emblemZone {
   		width:100%;
   }
   .pointZone{
   		display:grid;
   		grid-template-columns: 30% 60%;
   		grid-template-rows: 30vh 50vh;
   		border : 1px solid gray;
   		
   		justify-content: center;

   }
   .item1, .item2, .item3{
   		border : 1px solid gray;
   }
   
   .item3{
   		grid-column : 1/3;
   
   }
   .item1 img{
   		width:40%;
   		height:10vh;
   }
   #allPoint{
   		font-size:28px;
   }
   
   /*포인트 그래프*/
   @keyframes stack1{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${users.uPoint/users.uTotPoint*100}%; }
	}
	@keyframes stack2{
		0% {width:0; color:rgba(255, 255, 255, 0);}
		40% {color:rgba(255, 255, 255, 1);}
		100%{width:${100-(users.uPoint/users.uTotPoint*100)}%; }
	}
	.graph {
		height : 40px;	
		margin:0 0 10px;
		
	}
	.graph p{
		font-size:12px;
		font-weight:bold;
		margin-bottom:0px;
		width: 50%;
		text-align:left;
		padding-left:10px;
		color : black;;
	
	}
	.graph span {
		display: block;
		padding: 0 10px;
		height: 20px;
		line-height: 40px;
		text-align: right;
		background: gray;
		border-top-left-radius: 0px;
		border-bottom-left-radius: 0px;
		box-sizing: border-box;
		color: #fff;
		font-size:12px;
		
		
	}
	.graph.stack1 span {background: rgb(248, 133, 133); animation: stack1 2s 1;}
	.graph.stack2 span {background: rgb(248, 192, 120); animation: stack2 2s 1;}
	.graph.stack3 span {background: rgb(203, 248, 120); animation: stack3 2s 1;}
	  
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
	<div class="main-content">
	<h3>포인트현황 페이지</h3>
	<hr>
		<div class="myPoint">
			<!-- 포인트 영역 -->
			<div class="pointZone">
				<div class="item1">
					<p>누적 포인트</p>
					<img src="/resource/img/upload/point.png">
					<div id="allPoint">
						
					</div>
				
				</div>
				<div class="item2">
					<p>사용포인트와 보유 포인트</p>
					<div class="graph stack1">
                        <p>[ 사용한 포인트 : ${users.uPoint}]</p>
                        <span style="width: 37.5%" id="uPoint" ></span>
                        
                    </div>
                    <div class="graph stack2">
                       <p>[ 가용 포인트 :${users.uTotPoint-users.uPoint}]</p>
                       <span id="ePoint" style="width: 62.5%" ></span>
                        
                    </div>
				
				
				</div>
				<div class="item3">
					<p>포인트 적립 및 사용 현황</p>
				
				
				
				
				</div>
			
			
			
			
			
			</div>
			<!-- 엠블럼 영역 -->
			<div class="emblemZone">




			</div>
		</div>
	</div>
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>