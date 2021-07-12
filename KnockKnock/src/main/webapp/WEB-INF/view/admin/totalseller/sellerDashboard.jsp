<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Knock!Knock! Seller</title>
<!-- style css -->
<link rel="stylesheet"
	href="${cp}/resource/dashboard/css/shared/style.css">
<!-- Layout styles -->
<link rel="stylesheet"
	href="${cp}/resource/dashboard/css/demo_1/style.css">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<link href="${cp}/resource/css/main.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">
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
</head>

<body style="height:100%">
  <div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">       
   		<jsp:include page='/layout/navbar/navSeller.jsp' flush='false'/> 
    </nav>
    <!-- partial -->
    <div class="container-fluid page-body-wrapper" style="width:100%">
      <!-- partial:partials/_sidebar.html -->
      <nav class="sidebar sidebar-offcanvas" id="sidebar">
        <ul class="nav">
          <li class="nav-item nav-category"> </li>
          <li class="nav-item">
            <a class="nav-link" href="index.html">              
              <span class="menu-title">판매 Dashboard</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/forms/basic_elements.html">             
              <span class="menu-title">판매물품 관리</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="pages/tables/basic-table.html">              
              <span class="menu-title">상품 등록하기</span>
            </a>
          </li>
        </ul>
      </nav>
      <!-- partial 사이드바 끝 -->
      <div class="main-panel">
        <div class="content-wrapper">

          <div class="row">
            <div class="col-md-12 grid-margin">
              <div class="card">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-3 col-md-6">
                      <div class="d-flex">
                        <div class="wrapper">
                          <h3 class="mb-0 font-weight-semibold">32,451</h3>
                          <h5 class="mb-0 font-weight-medium text-primary">판매순위</h5>
                          <p class="mb-0 text-muted">+14.00(+0.50%)</p>
                        </div>

                      </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                      <div class="d-flex">
                        <div class="wrapper">
                          <h3 class="mb-0 font-weight-semibold">15,236</h3>
                          <h5 class="mb-0 font-weight-medium text-primary">리뷰별점평균</h5>
                          <p class="mb-0 text-muted">+138.97(+0.54%)</p>
                        </div>

                      </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                      <div class="d-flex">
                        <div class="wrapper">
                          <h3 class="mb-0 font-weight-semibold">7,688</h3>
                          <h5 class="mb-0 font-weight-medium text-primary">누적 판매건수</h5>
                          <p class="mb-0 text-muted">+57.62(+0.76%)</p>
                        </div>

                      </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mt-md-0 mt-4">
                      <div class="d-flex">
                        <div class="wrapper">
                          <h3 class="mb-0 font-weight-semibold">1,553</h3>
                          <h5 class="mb-0 font-weight-medium text-primary">누적 환불건수</h5>
                          <p class="mb-0 text-muted">+138.97(+0.54%)</p>
                        </div>

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title mb-0" style="font-weight:bolder">일간매출</h4>
                  <div class="d-flex align-items-center justify-content-between w-100">
                    <p class="mb-0">최근 1주일간의 판매금액 합계(날짜별)</p>
                    <div class="dropdown">
                      <button class="btn dropdown-toggle" type="button" id="dateSorter"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">더 보기</button>
                       <div style="display:none";>
                       <c:forEach items="${dailySales}" var="dailySales" >
                       <p class="dailySales"> ${dailySales.salesdate} </p>
                       </c:forEach>
                       </div>
                    </div>
                  </div>
                  <div class="d-flex align-items-end">
                    <h3 class="mb-0 font-weight-semibold">
                    <fmt:formatNumber value="${dailyTot }" pattern="#,###" />원 
                    </h3> 
                  </div>
                  <div style="display:none";>
                       <c:forEach items="${dailySales}" var="dailySales" >
                       <p class="dailySalesTotal"> ${dailySales.total } </p>
                       </c:forEach>
                       </div>
                  <canvas class="mt-4" height="100" id="market-overview-chart"></canvas>
                </div>
              </div>
            </div>


            <div class="col-md-4 grid-margin stretch-card">
              <div class="card">
                <div class="card-body d-flex flex-column">
                  <div class="wrapper">
                    <h4 class="card-title mb-0">Net Profit Margin</h4>
                    <p>Started collecting data from February 2019</p>
                    <div class="mb-4" id="net-profit-legend"></div>
                  </div>
                  <canvas class="my-auto mx-auto" height="250" id="net-profit"></canvas>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-8">
              <div class="row">
                <div class="col-md-6 grid-margin stretch-card">

                  <div class="card">
                    <div class="card-body">
                      <div class="row">

                        <div class="col-md-6">
                          <div class="d-flex align-items-center pb-2">
                            <div class="dot-indicator bg-danger mr-2"></div>
                            <p class="mb-0">누적 주문건수</p>
                          </div>
                          <h4 class="font-weight-semibold">${number}</h4>
                          <div class="progress progress-md">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 78%" aria-valuenow="78"
                              aria-valuemin="0" aria-valuemax="78"></div>
                          </div>
                        </div>

                        <div class="col-md-6 mt-4 mt-md-0">
                          <div class="d-flex align-items-center pb-2">
                            <div class="dot-indicator bg-success mr-2"></div>
                            <p class="mb-0">누적 환불건수</p>
                          </div>
                          <h4 class="font-weight-semibold">0</h4>
                          <div class="progress progress-md">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 45%"
                              aria-valuenow="45" aria-valuemin="0" aria-valuemax="45"></div>
                          </div>
                        </div>


                      </div>
                    </div>
                  </div>
                </div>


                <div class="col-md-6 grid-margin stretch-card average-price-card">
                  <div class="card text-white">
                    <div class="card-body">
                      <div class="d-flex justify-content-between pb-2 align-items-center">
                        <h2 class="font-weight-semibold mb-0">
                        <fmt:formatNumber value="${avgTot }" pattern="#,###" />원
                        </h2>
                        <div class="icon-holder">
                         <i class="bi bi-basket3-fill"></i>
                        </div>
                      </div>
                      <div class="d-flex justify-content-between">
                        <h5 class="font-weight-semibold mb-0">주문건당 평균 결제금액</h5>
                        <p class="text-white mb-0">판매시작 이후 현재까지</p>
                      </div>
                    </div>
                  </div>
                </div>


                <div class="col-md-12 grid-margin">
                  <div class="card">
                    <div class="card-body">
                      <div class="d-flex justify-content-between">
                        <h4 class="card-title mb-0">Invoice</h4>
                        <a href="#"><small>Show All</small></a>
                      </div>
                      <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Est quod cupiditate esse fuga</p>
                      <div class="table-responsive">
                        <table class="table table-striped table-hover">
                          <thead>
                            <tr>
                              <th>주문번호</th>
	                          <th>주문자명</th>
	                          <th>제품명</th>
	                          <th>수량</th>
	                          <th>주문상태</th>
	                          <th>주문날짜</th>
	                          <th>주문금액</th>
	                        </tr>
	                      </thead>
	                      <tbody>
	         				<c:forEach var="list" items="${list }">
					 		<tr>
	             			  <td>${list.oNumber }</td>
	                          <td>${list.uName }</td>
	                          <td>${list.pName}</td>
	                          <td>${list.oCnt }</td>
	                          <td>${list.oStatus }</td>
	                          <td><fmt:parseDate pattern="yyyy-MM-dd" value = "${list.oDate}" />
	                         </td>
	                          <td>${list.oTotprice}</td>   
	                        </tr>
	                        </c:forEach>
	                      </tbody>                         
                        </table>
                      </div>
                    </div>
                  </div>
                </div> 

              </div>
            </div>
            <div class="col-md-4">
              <div class="card">
                <div class="card-body">
                  <h4 class="card-title mb-0">가장 많이 구매한 고객</h4>
                  <div class="d-flex mt-3 py-2 border-bottom">
                    <img class="img-sm rounded-circle" src="assets/images/faces/face3.jpg" alt="profile image">
                    <div class="wrapper ml-2">
                      <p class="mb-n1 font-weight-semibold">Ray Douglas</p>
                      <small>누적 구매금액</small> 금액
                      <small class="text-muted ml-auto">총 구매 횟수</small>


                    </div>
                    <small class="text-muted ml-auto">총 구매 횟수</small>

                  </div>
                  <div class="d-flex py-2 border-bottom">
                    <span class="img-sm rounded-circle bg-warning text-white text-avatar">OH</span>
                    <div class="wrapper ml-2">
                      <p class="mb-n1 font-weight-semibold">Ora Hill</p>
                      <small>162543</small>
                    </div>
                    <small class="text-muted ml-auto">4 Hours ago</small>
                  </div>
                  <div class="d-flex py-2 border-bottom">
                    <img class="img-sm rounded-circle" src="assets/images/faces/face4.jpg" alt="profile image">
                    <div class="wrapper ml-2">
                      <p class="mb-n1 font-weight-semibold">Brian Dean</p>
                      <small>162543</small>
                    </div>
                    <small class="text-muted ml-auto">4 Hours ago</small>
                  </div>
                  <div class="d-flex pt-2">
                    <span class="img-sm rounded-circle bg-success text-white text-avatar">OB</span>
                    <div class="wrapper ml-2">
                      <p class="mb-n1 font-weight-semibold">Olive Bridges</p>
                      <small>162543</small>
                    </div>
                    <small class="text-muted ml-auto">7 Hours ago</small>
                  </div>
                </div>
              </div>

            </div>

          </div>
        </div>
      </div>

    </div>
    <!-- content-wrapper ends -->
    <!-- partial:partials/_footer.html -->
    <footer class="footer">
         <%@ include file= "/layout/footer.jsp" %>
 
    </footer>
    <!-- partial -->
  </div>
  <!-- main-panel ends -->
  </div>
  <!-- page-body-wrapper ends -->
  </div>
  
  
  	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="${cp}/resource/dashboard/vendors/js/vendor.bundle.base.js"></script>
	<script
		src="${cp}/resource/dashboard/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="${cp}/resource/dashboard/js/shared/admin-off-canvas.js"></script>
	<script src="${cp}/resource/dashboard/js/shared/admin-misc.js"></script>
	<!-- endinject -->
	<script src="${cp}/resource/dashboard/js/demo_1/adminDashboardSeller.js"></script>
 
  
  
</body>

</html>


 