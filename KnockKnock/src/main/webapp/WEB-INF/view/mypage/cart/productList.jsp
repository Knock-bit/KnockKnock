<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mypage</title>
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

 
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
  
  <style>
  .main-content{
        flex: 1;
        min-height:100vh;
        margin-top:100px;
        
   }
   .pgrid{
   		width:80%;
   		display : grid;
   		grid-template-columns: repeat(3, 30%);
		grid-auto-rows: minmax(80px, auto);
		margin:0 auto;
		grid-gap:10px;
   }
   .it1 {
   		width:90%;
   		
   }
   
  /*  .it1, .it2, .it3 {
   		grid-column: 1/2, 2/3, 3/4;
	
		margin : 5%;
   }
   .it1 p, .it2 p, .it3 p{
   		display:none;
   } */
   .pimg {
   	overflow: hidden;
	align-items: center;
	justify-content: center;
	}
	.pimg img {
   		object-fit: cover;
		width: 100%;
   
   }
  </style>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	<h1>임시 상품 목록 화면</h1>
	<div class="ct">
		
		<div class="pgrid">
		<c:forEach var="product" items="${plist }">
			<div class="it1">
				<div class="pimg">
					<a href="productDetail.do?pIdx=${product.pIdx}"><img src="/resource/img/product/${product.pImg }"></a>
				</div>
			</div>
		</c:forEach>
		</div>
		
	
	</div>

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
</html>