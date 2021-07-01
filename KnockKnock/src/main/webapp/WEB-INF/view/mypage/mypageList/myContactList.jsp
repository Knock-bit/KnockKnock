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
   <link href="${cp}/resource/css/nav.css" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
  <!-- Import BootStrap -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
  
  <!-- page css -->
  <link href="${cp}/resource/css/myContactList.css" rel="stylesheet">
  
  <!--  page script -->
   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
  $(function () {
	  
      $(".ctTitles").each(function(){
    	  
    	  $(this).click(function() {
    		  var idx = $(this).rowIndex();
        	  alert(idx);
        	  $(".ctContent").eq(idx).slideToggle(1000);
          });
    	  
      });
    	 
     
  });

  
  </script>
</head>
<body>
  <!-- ======= Header ======= -->
   <%@ include file= "/layout/navbar/navLoggedin.jsp" %>
  <!-- ======= Header 끝  === -->
<div class="main-content">
	
	<div class="list">
	<div id="content" class="p-4 p-md-5">
             
            <div class="container">
            <p style="font-size:22px;">나의 문의내역</p>
                 <p>[ my contact list ]</p>  
                  <div class="table-responsive">  
                    <table class="table">
                     <thead>
                         <tr class="title" style="background-color:gray; color:white;" >
                             <th class="no">NO</th>
                             <th class="category">제목</th>
                             <th class="end_date">작성일</th>
                             <th class="reply">&nbsp;</th>
                         </tr>
                     </thead>
                  <tbody>
                         <c:if test="${empty contactList }">
                             <tr>
                                 <td colspan="4">
                                     <p style="text-align:center; font-size:15px;">문의 내역이 없습니다.</p>
                                 </td>
                             </tr>
                         </c:if>
                         <c:if test="${not empty contactList }">
                             <c:forEach var="list" items="${contactList }" varStatus="status">
                             <tr>
                                 <td>${(pvo.total - status.index)-((pvo.nowPage-1) * pvo.cntPerPage) }</td>
                                 <td class="ctTitles"><a href="/myQuestion.do?ctIdx=${list.ctIdx}">${list.ctTitle }</a></td> 	
                                 <td style="font-size:14px;">${list.ctWriteDate}</td>
                                 <td class="ctresp">답변 : ${list.ctResp }</td>
                             </tr>
           
                             </c:forEach>
                         </c:if>
                     </tbody>
               </table>
               </div>
            </div>      
                 
             <div class=pagingNum>
                <div class="paginging">
                        <ol class="paging">
	                        <c:if test="${pvo.startPage == 1 }">
	                           <li id='disable'>이전으로</li>
	                        </c:if>
	                        <c:if test="${pvo.startPage != 1 }">
	                           <li>
	                              <a href="/myContactList.do?nowPage=${pvo.startPage-1 }&cntPerPage=${pvo.cntPerPage}">이전으로</a> <!-- 현재페이지에서 -1페이지 -->
	                           </li>
	                        </c:if>
	                        <%-- 블록 내 표시할 페이지 태그 작성 --%>
	                        <c:forEach var="pageNo" begin="${pvo.startPage}" end="${pvo.endPage}">
	                           <c:choose>
		                           <c:when test="${pageNo == pvo.nowPage}">
		                              <li class="now">${pageNo }</li>
		                           </c:when>
	                           <c:otherwise>
	                              <li>
	                                 <a href="/myContactList.do?nowPage=${pageNo }&cntPerPage=${pvo.cntPerPage}">${pageNo }</a>
	                              </li>
	                           </c:otherwise>
	                           </c:choose>
	                        </c:forEach>      
	                        <%-- [다음으로] 사용여부 처리 --%>
	                        <c:if test="${pvo.endPage == pvo.lastPage }">
								<li class="disale">다음으로</li>
							</c:if>
	                        <c:if test="${pvo.endPage != pvo.lastPage }">
	                           <span><a href="/myContactList.do?nowPage=${pvo.endPage+1 }&cntPerPage=${pvo.cntPerPage}">다음으로</a></span>
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
</html>