<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>How to use...</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="${cp}/resource/img/favicon.png" rel="icon">
  <link href="${cp}/resource/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
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
	
  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>

<body>

   <!-- ======= Header ======= -->
     <c:choose>
     <c:when test="${!empty seller}">
   		<jsp:include page='/layout/navbar/navSeller.jsp' flush='false'/>   	
  	</c:when>
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
  <!-- ======= Hero Section ======= -->

    <main id="main">
        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" data-aos="fade-in">
            <div class="container">
                <h2>綠!Knock!</h2>
                <p>아릅답고 더 푸른 지구를 만들기 위하여<br>아픈 지구가 당신에게 하는 노크</p>
            </div>
        </div><!-- End Breadcrumbs -->

        </section><!-- End About Section -->
        <!-- ======= About Section ======= -->
        <section id="about" class="about">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                        <img src="${cp}/resource/img/about/plasticpollution.jpg" class="img-fluid" style="width:620px; height:400px;">
                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                        <h3>지금 지구는...</h3><br>
                        <p class="fst-italic">
                            탄소배출·지구온난화·기후위기...<br>
                            멸종 없는 인류를 위한 문제
                        </p>
                        <ul>
                            <li><i class="bi bi-check-circle"></i>아열대 기후의 한반도</li>
                            <li><i class="bi bi-check-circle"></i>석탄 화력발전소의의 재등장</li>
                            <li><i class="bi bi-check-circle"></i>수량/수질 모두 악화된 물 부족국가</li>
                        </ul>
                        <p>
                            국회미래연구원의 중장기 미래예측을 바탕으로 볼 때, 현재와 같은 추이로 환경이 지속될 경우 2050년 한반도는 환경
                            재앙수준이 될 것이라고 해요.
                            40도가 넘는 기온, 미세먼지 악화..거주불능의 지구. OECD국가 중 인당 탄소배출의 1위인 대한민국. <br>
                        <h5>이대로 괜찮을까요?</h5>
                        </p>

                    </div>
                </div>

            </div>
        </section><!-- End About Section -->

        <!-- ======= Counts Section ======= -->
        <section id="counts" class="counts section-bg">
            <div class="container">

                <div class="row counters">

                    <div class="col-lg-3 col-6 text-center">
                        <span data-purecounter-start="0" data-purecounter-end="7000" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>연평균 사라지는 산림면적(ha)</p>
                    </div>

                    <div class="col-lg-3 col-6 text-center">
                        <span data-purecounter-start="0" data-purecounter-end="20" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>이산화탄소 증가량(%)</p>
                    </div>

                    <div class="col-lg-3 col-6 text-center">
                        <span data-purecounter-start="0.00" data-purecounter-end="10.48" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>1인당 온실가스 배출량(t)</p>
                    </div>

                    <div class="col-lg-3 col-6 text-center">
                        <span data-purecounter-start="0" data-purecounter-end="6500000" data-purecounter-duration="1"
                            class="purecounter"></span>
                        <p>연 평균 환경오염으로 사망하는 인구 수</p>
                    </div>

                </div>

            </div>
        </section><!-- End Counts Section -->


        <section id="about" class="about">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                        <img src="${cp}/resource/img/about/deforestation.jfif" class="img-fluid" style="width:680px; height:460px;">
                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                        <h3>지구가 당신에게 하는 노크</h3><br>
                        <p class="fst-italic">당신의 환경인식에 대한 노크<br>
                            환경을 위한 라이프스타일의 변화
                        </p>
                        <ul>
                            <li><i class="bi bi-check-circle"></i>환경을 위한 캠페인 참여</li>
                            <li><i class="bi bi-check-circle"></i>지속가능한 소비</li>
                            <li><i class="bi bi-check-circle"></i>생활속에서 지킬 수 있는 환경보호</li>
                        </ul>
                        <p>
                            환경보호를 위한 실천. 아주 쉽게 즐기도록 Knock!Knock!이 옆에서 도와드릴게요!<br>

                            힘들어하는 지구를 위해 우리가 지켜야할 것들을 라이프스타일에 자연스럽게 녹아들도록 환경에 노크해봐요!
                            녹녹과 함께 현재 당신의 삶에서 쉽게 실천할 수 있는 캠페인에 참여하고, 환경에 알맞은 소비를 하면 되는거에요.
                        </p>

                    </div>
                </div>

            </div>
        </section><!-- End About Section -->




        <section id="about" class="about">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                        <img src="${cp}/resource/img/about/green.jpg" class="img-fluid" style="width:680px; height:460px;">
                    </div>
                    <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                        <h3>지구를 더 푸르게</h3>
                        <br>
                        <p class="fst-italic">
                            지구를 더욱 푸르게<br>
                            우리 모두를 위한 변화
                        </p>
                        <ul>
                            <li><i class="bi bi-check-circle"></i>함께 만들어가는 아름다운 환경</li>
                            <li><i class="bi bi-check-circle"></i>어렵지 않게 당신의 환경보호를 도와줄 파트너 綠!Knock!</li>
                        </ul>
                        <p>
                            세상의 변화는 아주 작은것부터 시작된다고 해요.<br>생활속에서 지켜가는 작은 변화가 우리 지구를 다시
                            푸르게, 아름다운 지구로 바꿔나갈 수 있어요.<br>
                            환경을 위한 작은 변화, 녹녹과 함께 시작해봐요.<br>
                            지금 바로! 함께 아름다운 지구를 위해 환경에 노크해보러 가볼까요?
                        </p>

                    </div>
                </div>

            </div>
        </section><!-- End About Section -->
        <!-- ======= Counts Section ======= -->


        <!-- ======= Testimonials Section ======= -->

        </section><!-- End Testimonials Section -->

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