<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
   <link href="${cp}/resource/css/nav.css" rel="stylesheet">

  <!-- ======= Header ======= -->
  <meta charset=utf-8>
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="index.html"><img src="${cp }/resource/img/logo.png" id=:logo></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="active" href="index.html">Home</a></li>
          <li class="dropdown"><a href="#"><span>About</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
              <li><a href="#">녹녹은</a></li>
              <li><a href="#">녹녹 사용법</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>Campaign</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">진행중인 캠페인</a></li>
              <li><a href="#">캠페인 펀딩하기</a></li>
              <li><a href="#">지난 캠페인</a></li>
              <li><a href="#">캠페인 제안하기</a></li>
            </ul>
          </li>



          <li><a href="courses.html">Shop</a></li>
          <li><a href="trainers.html">Contact</a></li>

          <li class="dropdown"><a href="#"><span class="get-started-btn">${users.uName }님</span> <i
                class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="updateMyInfo.do">정보수정</a></li>
              <li><a href="myPoint.do">포인트 현황</a></li>
              <li><a href="myCampaignPage.do">참여중인 캠페인</a></li>
              <li><a href="myCampaignList.do">내 캠페인 목록</a></li>
              <li><a href="#">나의 문의내역</a></li>

            </ul>
          </li>



        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->



    </div>
  </header><!-- End Header -->