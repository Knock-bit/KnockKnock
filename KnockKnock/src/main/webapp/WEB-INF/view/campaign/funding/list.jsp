<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Mentor Bootstrap Template - Index</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${cp}/resource/img/favicon.png" rel="icon">
  <link href="${cp}/resource/img/apple-touch-icon.png" rel="apple-touch-icon">

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

  <!-- Import BootStrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- Main CSS File -->
  <link href="${cp}/resource/css/main.css" rel="stylesheet">
  <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
  <link href="${cp}/resource/css/campaign/campaign.css" rel="stylesheet">
  
  <style>
  .carousel {
  martin-top: 70px;}
  .carousel-item active {
  display:flex;
  vertical-align: middle;
}

  	@media (min-width: 768px) {
  .container {
    width: 750px;
		  }
		}

	@media (min-width: 1100px) {
  .container {
    width: 1080px;
		  }
		}
	.inner-nav{
	margin-top:20px;
	margin-bottom:20px;}
  </style>
</head>
<body>



  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

     
          <c:choose>
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
  	
      <a href="campaigns.html" class="get-started-btn">Get Started</a>

    </div>
  </header><!-- End Header -->

  <main id="main" data-aos="fade-in">

    <!-- ======= Breadcrumbs ======= -->
    
    <div class="container">
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" src="/resource/img/campaign/tempMain.png" alt="First slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resource/img/campaign/recycle.png" alt="Second slide">
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" src="/resource/img/campaign/running.png" alt="Third slide">
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div></div>
    
    
    
    
    <!-- 
    <div class="container">
    <div class="campaigncrumbs">
      <div class="container">
      <br>
      <br>
      <br>
         <h2>funding campaign</h2>
        <p>펀딩중인 캠페인 리스트</p>
      </div></div>
    </div>End Breadcrumbs -->

    <!-- ======= Campaign Section ======= -->
    <section id="campaigns" class="campaigns">
      <div class="container" data-aos="fade-up">
      <div class="inner-nav">
       <%@ include file= "/layout/navbar/campaign/navCampaign.jsp" %> 
</div>
        <div class="row" data-aos="zoom-in" data-aos-delay="100">
		<c:if test="${!empty fundingList  }">
        <c:forEach var="funding" items="${fundingList }">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" >
            <div class="campaign-item campaign-wrapper" >
            <div class="wrapper-item">
              <img src="${funding.cfFile }" class="img-fluid" alt="...">
              <div class="campaign-content">
                <div class="d-flex justify-content-between align-items-center mb-3">
                  <h4>${funding.category}</h4>
                </div>

                <h3><a href="${cp }/campaign/funding/detail.do?cfIdx=${funding.cfIdx }">${funding.cfTitle } </a></h3>
                <p>${funding.cGoal }</p>
                <div class="trainer d-flex justify-content-between align-items-center">
                  <div class="trainer-profile d-flex align-items-center">
                    <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                    <span>suggested by  ${funding.hostNickname } </span>
                  </div>
                  <div class="trainer-rank d-flex align-items-center">
                    <i class="bx bx-user"></i>&nbsp;${funding.userCount }명 참가중
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> <!-- End Course Item-->
          </c:forEach>
        </c:if>


        </div>

      </div>
    </section><!-- End Courses Section -->

  </main><!-- End #main -->
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->

<!--   <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

 -->  <!-- Vendor JS Files -->
  <script src="${cp}/resource/vendor/aos/aos.js"></script>
  <script src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
  <script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
  <script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${cp}/resource/js/main.js"></script>
  
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>

</body>

</html>