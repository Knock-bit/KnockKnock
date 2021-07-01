<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cp" value="${pageContext.request.contextPath }" />
<!--  -->

    <nav class="navbar navbar-expand-lg navbar-light bg-light campaign-navbar">
     <ul class="collapse navbar-collapse justify-content-start" >
      <li class="nav-item dropdown">
        <a class="navbar-brand" href="#">캠페인 전체보기</a>
        <!-- <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll"
          aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button> -->
        </li>
        </ul>
           
           <ul class="collapse navbar-collapse justify-content-end" >
            
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">
                전체
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="${cp }/campaign/ing/list.do">진행중</a></li>
                <li><a class="dropdown-item" href="${cp }/campaign/ed/list.do">종료</a></li>
              </ul>
            </li>

            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button"
                data-bs-toggle="dropdown" aria-expanded="false">
                조회기준
              </a>
              <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                <li><a class="dropdown-item" href="#">인기순</a></li>
                <li><a class="dropdown-item" href="#">최신순</a></li>
                <li><a class="dropdown-item" href="#">마감임박순</a></li>
              </ul>
            </li>
         </ul>
          
         
    </nav>