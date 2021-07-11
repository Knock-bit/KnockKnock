<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Suggest Campaign</title>
      <!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
      <!-- STYLE CSS -->
      <link rel="stylesheet" href="${cp }/resource/css/contactConfirm.css">
   </head>

   <body>

      <section id="courses" class="courses">
         <div class="container" data-aos="fade-up">

            <div class="row" data-aos="zoom-in" data-aos-delay="100">

               <c:if test="${!empty myproducts }">
                  <c:forEach var="myproducts" items="${myproducts }">
 						${myproducts.pcName } <br>
 						${myproducts.pName }<br>
 						${myproducts.pPrice}<br>
 						${myproducts.pDesc }<br>
 						${myproducts.pRegdate }<br>
						${myproducts.pImg }<br>
 						${myproducts.pStock }<br><br>
 						
                  </c:forEach>
               </c:if>

            </div>

         </div>
      </section>

   </body> 
</html>
