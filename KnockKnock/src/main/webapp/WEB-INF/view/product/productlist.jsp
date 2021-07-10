<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>綠!Knock! - SHOP</title>

<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
   rel="apple-touch-icon">

<!-- Google Fonts -->
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${cp}/resource/vendor/animate.css/animate.min.css"
   rel="stylesheet">
<link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css"
   rel="stylesheet">
<link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="${cp}/resource/vendor/remixicon/remixicon.css"
   rel="stylesheet">
<link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css"
   rel="stylesheet">

<!-- Main CSS File -->
<link href="${cp}/resource/css/main.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">

<!-- Import BootStrap -->
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<body>
   <!-- ======= Header ======= -->
   <c:choose>
      <c:when test="${users.uType eq 1 }">
         <jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false' />
      </c:when>
      <c:when test="${users.uType eq 0 }">
         <jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
      </c:when>
      <c:otherwise>
         <jsp:include page='/layout/navbar/nav.jsp' flush='false' />
      </c:otherwise>
   </c:choose>

   <!-- ======= Hero Section ======= -->
   <main id="main" data-aos="fade-in">
   <!-- ======= Breadcrumbs ======= -->
   <div class="breadcrumbs" style="background-color: rgb(10, 61, 14);">
      <div class="container">
         <h2>SHOP</h2>
         <p>綠!Knock!과 함께하는 친환경 상품들을 만나보세요!</p>
      </div>
   </div>
   <!-- End Breadcrumbs -->
   <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
         <ul class="navbar-nav mr-auto">
            <li class="nav-item active"><a class="nav-link" href="/productlist.do?pcIdx=0">전체상품보기</a></li>
            <li class="nav-item"><a class="nav-link" href="/productlist.do?pcIdx=1">식품</a></li>            
            <li class="nav-item dropdown"><a class="nav-link" href="/productlist.do?pcIdx=2">의류</a></li>
            <li class="nav-item dropdown"><a class="nav-link" href="/productlist.do?pcIdx=3">생활용품</a></li>
         </ul>
      </div>
         <form action="" method="post">
            <input type="search" placeholder="Search" aria-label="Search"><input type="submit" value="검색">
         </form>
    </nav>


      <!-- ======= ProductList Section ======= -->
      <section id="courses" class="courses">
         <div class="container" data-aos="fade-up">

            <div class="row" data-aos="zoom-in" data-aos-delay="100">

               <c:if test="${!empty plist }">
                  <c:forEach var="product" items="${plist }">

                     <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                        <div class="course-item">
                           <a href="productDetail.do?pIdx=${product.pIdx}"><img src="/resource/img/product/${product.pImg }"
                              class="img-fluid" style="width:370px; height:250px"></a>
                           <div class="course-content">
                              <div
                                 class="d-flex justify-content-between align-items-center mb-3">
                                 <h4>${product.pcIdx}</h4>
                                 <p class="price">${product.pPrice}</p>
                              </div>

                              <h3>
                                 <a href="productDetail.do?pIdx=${product.pIdx}">${product.pName}</a>
                              </h3>
                              <p>${product.pPrice}</p>
                              <div
                                 class="trainer d-flex justify-content-between align-items-center">
                                 <div class="trainer-profile d-flex align-items-center">
                                    <span>${product.sIdx}판매자</span>
                                 </div>
                                 <div class="trainer-rank d-flex align-items-center">
                                    ${product.pViews }</div>
                              </div>
                           </div>

                        </div>
                     </div>
                  </c:forEach>
               </c:if>

            </div>

         </div>
      </section>
      <!-- End Courses Section -->

   </main>
   <!-- End #main -->

   <!-- ======= Footer ======= -->
   <%@ include file="/layout/footer.jsp"%>

   <!-- Vendor JS Files -->
   <script src="${cp}/resource/vendor/aos/aos.js"></script>
   <script
      src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
   <script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
   <script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

   <!-- Template Main JS File -->
   <script src="${cp}/resource/js/main.js"></script>

</body>
</html>