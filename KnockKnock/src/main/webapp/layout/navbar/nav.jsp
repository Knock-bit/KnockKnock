<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
  <!-- ======= Header ======= -->
     <link href="${cp}/resource/css/nav.css" rel="stylesheet">
  
  <meta charset=utf-8>
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="${cp }/main.do"><img src="${cp }/resource/img/logo.png" id=:logo></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="active" href="index.html">Home</a></li>
          <li class="dropdown"><a href="#"><span>About</span> <i class="bi bi-chevron-down"></i></a>
          <ul>
              <li><a href="${cp }/layout/about/whatisknock.jsp">녹녹은</a></li>
              <li><a href="${cp }/layout/about/manual.jsp">녹녹 사용법</a></li>
            </ul>
          </li>
          <li class="dropdown"><a href="#"><span>Campaign</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${cp }/campaign/ing/list.do">진행중인 캠페인</a></li>
              <li><a href="${cp }/campaign/funding/list.do">캠페인 펀딩하기</a></li>
              <li><a href="${cp }/campaign/ed/list.do">지난 캠페인</a></li>
              <li><a href="${cp }/campaign/proposal.do">캠페인 제안하기</a></li>
            </ul>
          </li>


          <li><a href="courses.html">Shop</a></li>
          <li><a href="${cp }/contact/contact.do">Contact</a></li>

        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <a href="${cp }/user/login.do" class="get-started-btn">로그인</a>
      <a href="${cp }/user/signup.do" class="get-started-btn">회원가입</a>

    </div>
  </header><!-- End Header -->