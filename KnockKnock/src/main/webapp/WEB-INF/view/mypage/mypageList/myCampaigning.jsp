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
  
  <!-- page css -->
  <style>
   .main-content{
  		width:100%;
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
    }
   .campaingView {
   		width:70%;
   		margin: 0 auto;
   		text-align:center;
   		position:relative;
   }
   /*캠페인 리스트 영역*/
  .clist{
  		display:grid;
   		grid-template-columns: repeat(1, 80%);
    	grid-template-rows: repeat(3, 50vh);
   		border : 1px solid gray;
   		grid-gap:10%;
   		justify-content: center;
 
  
  }
  .citem{
  		display:grid;
  		grid-template-columns: repeat(6, 16%);
  		grid-template-rows: repeat(5, 10vh);
		padding:5px;
  		border : 1px solid gray;
  }
  .citem span {
  		
  		text-align:left;;
  		font-size:15px;
  		font-style:normal;
  }
  /*해당 캠페인 사진*/
  .itemPhoto{
  		grid-column : 1/3;
  		grid-row:1/6;
  		justify-content: center;
  
  }
  .cphoto{
		display:inline-block;
		width:90%;
  		border-radius: 5%;
		overflow: hidden;
      	align-items: center;
      	justify-content: center;
      	border : solid 2px black;
      	
  }
  .cphoto img{
  		object-fit:cover;
   		width:100%;
  }
  .cphoto img:hover{
  		opacity:0.5;
  		cursor:pointer;
  		
  }
  /*해당 캠페인 내용들*/
  .itemTitle{
  		grid-column:3/6;
  		grid-row:1/2;
  		
  }
  .itemContent{
  		grid-column:3/6;
  		grid-row:2/3;
  }
  .itemGoal{
  		grid-column:3/6;
  		grid-row:3/4;
  }
  .itemEnddate{
  		grid-column:3/6;
  		grid-row:4/5;
  }
  .itemEtc{
  		grid-column:3/6;
  		grid-row:5/6;
  }
  .itemPoint{
  		grid-column:6/7;
  		grid-row:1/6;
  		background-color:gray;
  }
  .it1{
  		width:30%;
  		float:left;
  }
  .it2{
  		width:69%;
  		float:left;
  }
  
 
  
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
	<div class="main-content">
		<h1>현재 진행중 캠페인 리스트</h1>
		<div class="campaingView">
			<div class="clist">
				
				<c:forEach var="campaign" items="${clist}">
				<div class="citem">
					<div class="itemPhoto">
						<p style="display:none;">${campaign.ciIdx }</p>
						<p class="cphoto"><img src="/resource/img/upload/${campaign.ciFile}"></p><br>
						
						
						
					</div>
					<div class="itemTitle">
						<span class="it1">타이틀 :</span>
						<span class="it2"> ${campaign.ciTitle }</span>
						
					</div>
					<div class="itemContent">
						<span class="it1">내용 :</span>
						<span class="it2">  ${campaign.ciContent }</span>
						
					</div>
					<div class="itemGoal ">
						<span class="it1">목표 :</span>
						<span class="it2"> ${campaign.ciGoal }</span>
						
					</div>
					<div class="itemEnddate">
						<span class="it1">마감일 :</span>
						<span class="it2"> ${campaign.ciEnddate }</span><br>
						
						
					</div>
					<div class="itemEtc">
						<span>이미지를 클릭하면 상세페이지로 이동합니다.</span>
					</div>
					<div class="itemPoint">
						<span>포인트 영역이 도ㅣ지 않을까..?</span>
						
					</div>
				
				</div>
	
				</c:forEach>
				
			</div>
		</div>
	</div>
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>