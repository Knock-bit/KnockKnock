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
  <link href="${cp}/resource/css/campaign/funding.css" rel="stylesheet">
  <link href="${cp}/resource/css/campaign/campaign.css" rel="stylesheet">
</head>
<body>



  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

     
     
        <%@ include file= "/layout/navbar/nav.jsp" %><!-- .navbar -->

      <a href="campaigns.html" class="get-started-btn">Get Started</a>

    </div>
  </header><!-- End Header -->

  <main id="main" data-aos="fade-in">

    <!-- ======= Breadcrumbs ======= -->
    
    <div class="container">
    <div class="campaigncrumbs">
      <div class="container">
      <br>
      <br>
      <br>
         <h2>funding campaign</h2>
        <p>펀딩중인 캠페인 리스트</p>
      </div></div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= Campaign Section ======= -->
    <section id="campaigns" class="campaigns">
      <div class="container" data-aos="fade-up">
       <%@ include file= "/layout/navbar/campaign/navCampaign.jsp" %> 

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

</body>

</html>