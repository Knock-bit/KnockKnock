<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
  <!-- ======= Header ======= -->
   <meta charset=utf-8>
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="${cp }/layout/main.jsp"><img src="${cp }/resource/img/logo2.png" id=:logo></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="${cp }/run.jsp">Home</a></li>
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
          <li><a href="trainers.html">Contact</a></li>

          <li class="dropdown"><a href="#"><button type="button" class="btn btn-dark">관리자모드</button> <i
                class="bi bi-chevron-down"></i></a>

            <ul>
              <li><a href="${cp }/adminKeywordList.do">키워드 관리</a></li>
              <li><a href="${cp }/adminProposalList.do">제안 관리</a></li>
              <li><a href="${cp }/adminUserList.do">회원 관리</a></li>
              <li><a href="${cp }/adminSummer.do">써머노트</a></li>
              <li><a href="#">[coming soon]문의내역 확인</a></li>
              <li><a href="${cp }/user/logout.do">로그아웃</a></li>
            </ul>
          </li>


        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->



    </div>
  </header><!-- End Header -->