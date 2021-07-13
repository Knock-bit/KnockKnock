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
<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script>
   function orderstatus(event) {
      var idx = $(".form-select").index(event);
      console.log("idx = " + idx);

      var value = $(".form-select option:selected").eq(idx).val();
      console.log("selected:" + value);

      var oNumber = $(".oNumber").eq(idx).text();
      console.log("oNumber:" + oNumber);
   }

   function saveOrderStatus() {
      $(".oNumber").each(function(index) {

         var oNumber = $(".oNumber").eq(index).text();
         console.log("number:" + oNumber);

         var formselect = $("select[name=form-select]").eq(index).val();
         console.log("from-select val:" + formselect);
         let vo = {};
         vo.oNumber = oNumber;
         vo.formselect = formselect;
         console.log(vo);
         
      });

      
      var param=[];
      var length = $(".sIdx").length;
      console.log("sidx-" +$(".sIdx").text());
      var data={};
      for(var i=0; i<length; i++){
         data = {
            oNumber: $(".oNumber").eq(i).text(),
            osIdx: $("select[name=form-select]").eq(i).val(),
            sIdx: $(".sIdx").eq(i).text()               
         };
         param.push(data);
         
      }
 
      $.ajax({
            url: "/seller/saveorderstatus.do",
            type: "post",
            data: JSON.stringify(param),
            contentType: "application/json",
            success: function(data){
               alert("변경사항이 저장되었습니다.");
               location.reload();
            },
            error: function(data){
               alert("시스템 오류입니다. 관리자에게 문의해주시기 바랍니다.");
            }
         });
        
   }
</script>
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
               <li class="nav-item"><a class="nav-link"
                  href="/seller/sellerDashboard.do?sIdx=${seller.sIdx}"> <span
                     class="menu-title">판매 Dashboard</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="${cp }/productForm.do?sIdx=${seller.sIdx}"> <span class="menu-title">상품
                        등록하기</span>
               </a></li>
               <li class="nav-item"><a class="nav-link"
                  href="/seller/manageMyProducts.do"> <span class="menu-title">등록상품
                        조회</span>
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
                              <h4 class="card-title mb-0" style="fontsize: 20px;">전체
                                 주문내역</h4>
                              <small><input type="button" value="변경사항 저장하기"
                                 onclick="saveOrderStatus(this.frm)"></small>
                           </div>

                           <div class="table-responsive">
                              <table class="table table-striped table-hover">
                                 <thead>
                                    <tr>
                                       <th style="display: none">판매자</th>
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
                                          <td class="sIdx" style="display: none">${seller.sIdx}</td>
                                          <td class="oNumber">${list.oNumber }</td>
                                          <td>${list.uName }</td>
                                          <td>${list.pName}</td>
                                          <td>${list.oCnt }</td>
                                          <td>${list.osName }</td>
                                          <td><fmt:parseDate value="${list.oDate}" var="oDate"
                                                pattern="yyyy-MM-dd HH:mm:ss.S" /> <fmt:formatDate
                                                value="${oDate }" pattern="yyyy-MM-dd" /></td>
                                          <td>${list.totalwithfee}</td>
                                          <td style="display:none;">${list.osIdx }</td>
                                          <td><select class="form-select"
                                             aria-label="Default select example"
                                             onchange="orderstatus(this)" name="form-select">
                                             
                                             <c:if test="${list.osIdx eq 0}">
                                             <option selected value="0">결제완료</option>
                                             </c:if>
                                             <c:if test="${list.osIdx eq 1}">
                                             <option selected value="1">배송준비</option>
                                             </c:if>
                                             <c:if test="${list.osIdx eq 2}">
                                             <option selected value="2">배송중</option>
                                             </c:if>
                                             <c:if test="${list.osIdx eq 3}">
                                             <option selected value="3">배송완료</option>
                                             </c:if>
                                             
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