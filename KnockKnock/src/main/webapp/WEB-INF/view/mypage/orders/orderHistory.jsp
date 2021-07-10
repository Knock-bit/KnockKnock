<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap"
	rel="stylesheet">

  <!-- Import BootStrap -->
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- page CSS -->
   <link href="${cp}/resource/css/orderHistory.css" rel="stylesheet">

</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">

	
	<div class="orderHistoryMain">
	<h3 style="margin-bottom:30px;">나의 주문 내역</h3>
		<div>
			<input type="button" value="전체 조회" onclick="location.href='orderHistory.do'";>
			<p class="calText">기간별 조회</p>
			<div class="searchCal">
				<input type="text" name="cal1" id="cal1"> ~ <input type="text" name="cal2" id="cal2">
				<input type="button" name="canBtn" id="canBtn" value="조회하기" onclick="goSearch()" >	
			</div>		
		</div>
		<div class="orderhm">
			<div class="ohm">
				<p class="ohm-1">주문번호</p>
				<p class="ohm-2">주문상품</p>
				<p class="ohm-3">결제</p>
				<p class="ohm-4">상태</p>
			</div>
			<c:forEach var ="item" items="${ohList }">
				<div class="ohmcontent">
					<p class="ohm-1-1">${item.oTempnum}</p>
					<div class="ohm-1-2">
						<div class="ohm1-1-1">
							<p class="ohmimg"><img src="/resource/img/product/${item.pImg }" />
						</div>
						<div class="ohm1-1-2">
							<p style="font-weight:bold; font-size:14px; color:rgb(10, 61, 14);">[ ${item.pName } ]</p>
							<p style="color:black; height:60%;" >${item.pDesc }</p>
							<br>
							<p style="border-top:1px solid gray; padding-top:5px; padding-bottom:5px;">수량 : ${item.oCnt }</p>
							
						</div>
					</div>
					<div class="ohm-1-3">
						<div style="height:80%;">
							<fmt:formatNumber value="${item.pPrice }" var="price" pattern="#,###" />
							<p>판매가 : ${price }원</p>
							<p>쿠폰 할인 :  </p>
							<p >포인트 할인 : </p>
							<p style="margin-bottom:3%;">
							<fmt:formatNumber value="${item.pFee }" var="pFee" pattern="#,###" />
							배송비 : ${pFee }원
							</p>
							<p><span style="font-weight:bold;">총 결제 금액 :</span><span class="totpp">
							<fmt:formatNumber value="${item.pPrice * item.oCnt + item.pFee }" var="tot" pattern="#,###" />
							${tot }</span>원 </p>
						</div>
						<p style="color:#8c8c8c; border-top:1px solid gray; margin-top:5px; padding:5px; font-size:13px;">
						결제일 : 
						<fmt:parseDate value="${item.oDate }" var="oDate" pattern ="yyyy-MM-dd HH:mm:ss.S"/>
						<fmt:formatDate value="${oDate }" pattern="yyyy-MM-dd HH:mm:ss"/></p>	
					</div>
					<div class="ohm-1-4">
					<c:if test="${item.oStatus == 0 }">
						<p class="ohm-1-4-1">결제 대기 중</p>
					</c:if>
					<c:if test="${item.oStatus == 1 }">
						<p class="ohm-1-4-1">결제 완료</p>
					</c:if>
					<c:if test="${item.oStatus == 2 }">
						<p class="ohm-1-4-1">배송 준비 중</p>
					</c:if>
					<c:if test="${item.oStatus == 3 }">
						<p class="ohm-1-4-1">배송 중 </p>
					</c:if>
					<c:if test="${item.oStatus == 4 }">
						<p class="ohm-1-4-1">배송 완료</p>
					</c:if>
					<c:if test="${item.oStatus == 5 }">
						<p class="ohm-1-4-1">환불 진행 중 </p>
					</c:if>
					<p style="font-size:13px; color:#8c8c8c;">[ 녹녹 택배 ]</p>
					</div>
					
				</div>
				
				
			</c:forEach>
			<div class=pagingNum>
					<div class="paginging">
						<ol class="paging">
							<c:if test="${pvo.startPage == 1 }">
								<li id='disable' style="font-size: 13px;">이전으로</li>
							</c:if>
							<c:if test="${pvo.startPage != 1 }">
								<li><a
									href="/orderHistory.do?nowPage=${pvo.startPage-1 }&cntPerPage=${pvo.cntPerPage}">이전으로</a>
									<!-- 현재페이지에서 -1페이지 --></li>
							</c:if>
							<%-- 블록 내 표시할 페이지 태그 작성 --%>
							<c:forEach var="pageNo" begin="${pvo.startPage}"
								end="${pvo.endPage}">
								<c:choose>
									<c:when test="${pageNo == pvo.nowPage}">
										<li class="now">${pageNo }</li>
									</c:when>
									<c:otherwise>
										<li><a style="font-weight: 500;"
											href="/orderHistory.do?nowPage=${pageNo }&cntPerPage=${pvo.cntPerPage}">${pageNo }</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<%-- [다음으로] 사용여부 처리 --%>
							<c:if test="${pvo.endPage == pvo.lastPage }">
								<li class="disale" style="font-size: 13px;">다음으로</li>
							</c:if>
							<c:if test="${pvo.endPage != pvo.lastPage }">
								<span><a
									href="/orderHistory.do?nowPage=${pvo.endPage+1 }&cntPerPage=${pvo.cntPerPage}">다음으로</a></span>
							</c:if>
						</ol>
					</div>
				</div>
		</div>
	</div>	
	

</div>	
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->
</body>
<script>
$(function(){
	$("#cal1").datepicker();
	$("#cal2").datepicker();
	
	/* $("#cal1").datepicker('setDate','today');
	$("#cal2").datepicker('setDate','today'); */
});
$.datepicker.setDefaults({
    dateFormat: 'yy-mm-dd' // Input Display Format 변경
    ,showOtherMonths: true // 빈 공간에 현재월의 앞뒤월의 날짜를 표시
    ,showMonthAfterYear: true // 년도 먼저 나오고, 뒤에 월 표시
    ,changeYear: true // 콤보박스에서 년 선택 가능
    ,changeMonth: true // 콤보박스에서 월 선택 가능
    ,showOn: "both" // button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
    ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" // 버튼 이미지 경로       ,buttonImageOnly: true // 기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
    ,buttonText: "선택" // 버튼에 마우스 갖다 댔을 때 표시되는 텍스트
    ,yearSuffix: "년" // 달력의 년도 부분 뒤에 붙는 텍스트
    ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] // 달력의 월 부분 텍스트
    ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] // 달력의 월 부분 Tooltip 텍스트
    ,dayNamesMin: ['일','월','화','수','목','금','토'] // 달력의 요일 부분 텍스트
    ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] // 달력의 요일 부분 Tooltip 텍스트
    ,minDate: "-1Y" // 최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
    ,maxDate: "+1Y" // 최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
});

function goSearch(){
	var cal1 = $("#cal1").val();
	var cal2 = $("#cal2").val();
	console.log("cal1:"+cal1+",cal2:"+cal2);
	
	location.href="orderHistoryCal.do?cal1="+cal1+"&cal2="+cal2;
	
}
</script>
</html>