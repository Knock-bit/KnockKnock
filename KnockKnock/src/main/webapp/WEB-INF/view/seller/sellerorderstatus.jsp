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

<body style="height: 100%">
	<div class="container-scroller">
		<!-- partial:partials/_navbar.html -->
		<nav
			class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
			<jsp:include page='/layout/navbar/navSeller.jsp' flush='false' />
		</nav>
		<!-- partial -->
		<div class="container-fluid page-body-wrapper" style="width: 100%">
			<!-- partial:partials/_sidebar.html -->
			<nav class="sidebar sidebar-offcanvas" id="sidebar">
				<ul class="nav">
					<li class="nav-item nav-category"></li>
					<li class="nav-item"><a class="nav-link" href="/seller/sellerDashboard.do?sIdx=${seller.sIdx}">
							<span class="menu-title">판매 Dashboard</span>
					</a></li> 
					<li class="nav-item"><a class="nav-link"
						href="/seller/submitproduct.do"> <span class="menu-title">상품
								등록하기</span>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/seller/manageMyProducts.do"> <span
							class="menu-title">등록상품 조회</span>
					</a></li>
				</ul>
			</nav>
			<!-- partial 사이드바 끝 -->
			<div class="main-panel">
				<div class="content-wrapper">
					<div class="col-md-12 grid-margin">
						<div class="card">
							<div class="card-body">
								<form action="saveorderstatus.do" method="POST">
									<div class="d-flex justify-content-between">
										<h4 class="card-title mb-0">최근 주문내역</h4>
										<small><input type="submit" value="변경사항 저장하기"></small>
									</div>

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
													<th>주문상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${list }">
													<tr>
														<td>${list.oNumber }</td>
														<td>${list.uName }</td>
														<td>${list.pName}</td>
														<td>${list.oCnt }</td>
														<td>${list.osName }</td>
														<td><fmt:parseDate pattern="yyyy-MM-dd"
																value="${list.oDate}" /></td>
														<td>${list.totalwithfee}</td>														
														<td>
														<select class="form-select"
															aria-label="Default select example">													
														<option selected>주문상태</option>
														<option value="0">결제완료</option>
														<option value="1">배송준비</option>
														<option value="2">배송중</option>
														<option value="3">배송완료</option>
														</select></td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- content-wrapper ends -->

	</div>
	<!-- main-panel ends -->
	<!-- page-body-wrapper ends -->
	<!-- partial:partials/_footer.html -->
	<footer class="footer">
		<%@ include file="/layout/footer.jsp"%>

	</footer>
	<!-- partial -->

	<!-- container-scroller -->
	<!-- plugins:js -->
	<script src="${cp}/resource/dashboard/vendors/js/vendor.bundle.base.js"></script>
	<script
		src="${cp}/resource/dashboard/vendors/js/vendor.bundle.addons.js"></script>
	<!-- endinject -->
	<!-- inject:js -->
	<script src="${cp}/resource/dashboard/js/shared/off-canvas.js"></script>
	<script src="${cp}/resource/dashboard/js/shared/misc.js"></script>
	<!-- endinject -->
	<script src="${cp}/resource/dashboard/js/demo_1/dashboardSeller.js"></script>
</body>

</html>