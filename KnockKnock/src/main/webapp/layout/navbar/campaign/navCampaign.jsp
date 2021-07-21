<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cp" value="${pageContext.request.contextPath }" />
      <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
  <link href="${cp}/resource/css/main.css" rel="stylesheet">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  <head>
  <style>
  .input-group>.form-control{
  float:right;}
  </style>
  </head>

	  <header id="header">
    <div class="container d-flex align-items-center justify-content-end">
     <div class="d-flex float-right">
      <input id="inputValue" class="form-control me-2" type="search"  aria-label="Search" required >
      <button type="submit" class="btn btn-outline-success" onclick="getInputValue()"><i class="bi bi-search"></i></button>
    </div>
      <nav id="navbar" class="navbar order-last order-lg-0 justify-content-end">
	
          <ul>
          <li class="dropdown"><a href="#"><span>전체</span> <i class="bi bi-chevron-down"></i></a>
              <ul>
              <li><a id="getIng" href="#" >진행중</a></li>
                <li><a id="getEnd" href="#">종료</a></li>
            </ul>
            </li>
            </ul>
               <ul>
          <li class="dropdown"><a href="#"><span>조회기준</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
                <li><a  id="userCount"href="#">참가자수</a></li>
                <li><a id="latest" href="#">최신순</a></li>
                <li><a  id="closest" href="#">마감임박순</a></li>
            </ul>
          </li>
          </ul>
          
        
        <!--   	<form class="navbar-form float-right" role="search">
            <div class="input-group float-right">
               <input type="text" class="form-control" placeholder="Search">
               <div class="input-group-btn">
                  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
               </div>
            </div>
         </form> -->

      </nav><!-- .navbar -->
   
    </div>
    </header>
    
            
            
            