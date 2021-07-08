<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
   <link href="${cp}/resource/css/nav.css" rel="stylesheet">

  <!-- ======= Header ======= -->
  <meta charset=utf-8>
  <header id="header" class="fixed-top">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="${cp }/main.do"><img src="${cp }/resource/img/logo2.png" id=:logo></a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a href="${cp }/run.jsp">Home</a></li>
        <li class="dropdown"><a href="#"><span>About</span> <i class="bi bi-chevron-down"></i></a>
			<ul>
				<li><a href="${cp }/layout/about/whatisknock.jsp">綠!Knock은?</a></li>
				<li><a href="${cp }/layout/about/manual.jsp">綠!Knock!이용법</a></li>
			</ul></li>
          <li class="dropdown"><a href="#"><span>Campaign</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${cp }/campaign/ing/list.do">진행중인 캠페인</a></li>
              <li><a href="${cp }/campaign/funding/list.do">캠페인 펀딩하기</a></li>
              <li><a href="${cp }/campaign/ed/list.do">지난 캠페인</a></li>
              <li><a href="${cp }/campaign/proposal.do">캠페인 제안하기</a></li>
            </ul>
          </li>



          <li><a href="${cp }/productlist.do">Shop</a></li>
          <li><a href="${cp }/contact/contact.do">Contact</a></li>

          <li class="dropdown"><a href="#"><span class="get-started-btn">${users.uName }님</span> <i
                class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${cp}/updateMyInfo.do">정보수정</a></li>
              <li><a href="${cp}/myPoint.do">포인트 현황</a></li>
              <li><a href="${cp}/myCampaignPage.do">참여중인 캠페인</a></li>
              <li><a href="${cp}/myCampaignList.do">내 캠페인 목록</a></li>
              <li><a href="${cp}/myContactList.do">나의 문의내역</a></li>
              <li><a href="${cp}/myActive.do">나의 활동</a></li>
              <li><a href="${cp}/moveCart.do">내 장바구니</a></li>
              
              
              <li><a href="${cp }/user/logout.do">로그아웃</a></li>
              
              <!-- 로그아웃 UserController에 들어있음 -->

            </ul>
          </li>



        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->



    </div>
  </header><!-- End Header -->