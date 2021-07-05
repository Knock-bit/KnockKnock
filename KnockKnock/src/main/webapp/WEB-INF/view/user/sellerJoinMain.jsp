<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<!-- Main CSS File -->
<link href="${cp}/resource/css/main.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">

<!-- Import BootStrap -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<title>join as Seller</title>
</head>
<body>
<!-- ======= Header ======= -->
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
  <!-- ======= Header 끝  === -->
<div class="breadcrumbs" style="background-color: rgb(10, 61, 14);" data-aos="fade-in">
      <div class="container">
        <h2>KNOCK!綠! 판매자 등록</h2>
        <p> KNOCK!綠!은 지속가능한 소비를 추구하는 쇼핑 플랫폼을 운영하고 있습니다.</p>
      </div>
    </div><!-- End Breadcrumbs -->

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
      <div class="container" data-aos="fade-up">

        <div class="row">
          <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
            <img src="${cp}/resource/img/user/seller.jpg" class="img-fluid" alt="">
          </div>
          <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
            <h3>환경을 위한 바른 소비를 돕는 綠!KNOCK!의 판매자</h3>
            <ul>
              <li><i class="bi bi-check-circle"></i>친환경 인증제품을 판매하시나요?</li>
              <li><i class="bi bi-check-circle"></i>친환경 정책에 맞는 판매를 추구하시나요?</li>
            </ul>
            <p>KNOCK!綠!은 친환경 제품을 판매하는 판매자분들이 자유롭게 물건을 파실 수 있도록 SHOP페이지를 운영하고 있습니다.</p>
			<p>다만 판매자분들은 반드시 친환경 인증제품을 파셔야 하며 배송포장 또한 친환경 포장재를 이용하셔야 합니다.</p>
			<p>환경을 위한 녹색소비를 추구하시는 판매자시라면 지금 KNOCK!綠!에 판매자로 등록해주세요!</p><br>
            <a href="#" onclick="location.href='/user/tncSeller.do'" class="sellerGo">판매자로 가입하기</a>
             </div>
        </div>
        <style>
        
        
.sellerGo {
  padding: 8px 25px;
  background: #003510;
  border-radius: 50px;
  color: #fff;
  white-space: nowrap;
  transition: 0.3s;
  font-size: 16px;
  display: inline-block;
  
  }
  .sellerGo:hover{
  font-weight: bolder;
  color: white;
  }
  </style>

      </div>
    </section><!-- End About Section -->

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