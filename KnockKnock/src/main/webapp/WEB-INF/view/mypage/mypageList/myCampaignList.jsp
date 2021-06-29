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

	
</script>


  
  <!-- page css -->
  <link href="${cp}/resource/css/myCampaignList.css" rel="stylesheet">
<script src="${cp}/resource/js/myCampaignList.js" type="text/javascript"
	charset="utf-8"></script>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<p id="ctext">Ended Campagin List</p>
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
						<p class="imGoal">${endlist.cGoal }</p>
						<p class="imEmblem">${endlist.ciEmblem }</p>
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
		    		<p>TITLE</p>
		    		<p style="font-style:normal; font-size:11px;" class="c2"></p>
		    	
		    	</div>
		    	<div class="con3">
		    		<p>CONTENT</p>
		    		<p style="font-style:normal; font-size:11px;" class="c3"></p>
		    	</div>
		    	<div class="con4">
		    		<p>GOAL</p>
		    		<p style="font-style:normal; font-size:11px;" class="c4">난 고기가...좋아요..</p>
		    	</div>
		    	<div class="con5">
		    		<p>END DATE</p>
		    		<p style="font-style:normal; font-size:11px;" class="c5"></p>
		    	</div>
		    	<div class="con6">
		    		<div class="c61">
			    		<p>RANK</p>
			    		<p class="cr">
			    			1위. 홍길동 <br>
			    			2위. 존도<br>
			    			3위. 나
			    		</p>
			    		
			    	</div>
		    		<div class="c62">
			    		<p>POINT</p>
			    		<p class="cp">
			    			52,000 P<br>
			    			
			    		</p>
			    	</div>
			    	<div class="c63">
			    		<p>EMBLEM</p>
			    		<p class="ce">
			    			
			    			
			    			
			    		</p>
			    	
			    	</div>
			    	
			    	
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