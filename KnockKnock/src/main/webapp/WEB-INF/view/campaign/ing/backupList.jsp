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
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <!-- Main CSS File -->
  <link href="${cp}/resource/css/main.css" rel="stylesheet">
   <link href="${cp}/resource/css/nav.css" rel="stylesheet">
   <link href="${cp}/resource/css/campaign.css" rel="stylesheet">

  
</head>
<body>



  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/nav.jsp" %>

  <!-- End Header -->

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <div class="campaigncrumbs justify-content-center align-items-center">
      <div class="container position-relative">
        <h2>knock, campaign</h2>
        <p>???????????? ????????? ?????????</p>
      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Campaign Section ======= -->
    <section id="campaigns" class="campaigns">
      <div class="container" id="campaign" data-aos="fade-up">

        <div class="row" data-aos="zoom-in" data-aos-delay="100">
        	<c:if test="${!empty list  }">
        	<c:forEach var="campaign" items="${list }">
	        	 <div class="col-lg-4 col-md-6 d-flex align-items-stretch" style="width:1100x" >
		            <div class="campaign-item">
		            	<div class="campaign-img">
			              <img src="${campaign.ciFile }" class="img-fluid" alt="...">
		            	</div>
		              <div class="campaign-content">
		                <div class="d-flex justify-content-between align-items-center mb-3">
		                  <span>${campaign.category} | </span>
		                  
		                </div>
		
		                <h3><a href="${cp }/campaign/ing/detail.do?ciIdx=${campaign.ciIdx }">${campaign.ciTitle } </a></h3>
		                <p>${campaign.cGoal }</p>
		                <div class="trainer d-flex justify-content-between align-items-center">
		                  <div class="trainer-profile d-flex align-items-center">
		                    <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
		                    <span>suggested by  ${campaign.hostNickname } </span>
		                  </div>
		                  <div class="trainer-rank d-flex align-items-center">
		                    <i class="bx bx-user"></i>&nbsp;${campaign.userCount }??? ?????????
		                    &nbsp;&nbsp;
		                    
		                  </div>
		                </div>
		              </div>
		            </div>
		          </div> <!-- End Campaign Item-->
       		</c:forEach>
        </c:if>
        <c:if test="${empty list }">
        ???????????? ???????????? ???????????? ????????????.
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

</body>

</html>