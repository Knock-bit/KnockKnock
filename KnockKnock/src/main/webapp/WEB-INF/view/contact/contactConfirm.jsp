<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<% String cp = request.getContextPath(); %>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="utf-8">
      <title>Thank you</title>
      <!-- 구글폰트 넣어보기-->
      <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">      <!-- STYLE CSS -->
   	<link href="${cp}/resource/css/contactConfirm.css" rel="stylesheet">
   </head>

   <body>

      <div class="wrapper">
         <div class="inner">
            <div>
               <h1 text-align="center">제안서 제출이 완료 되었습니다.</h1>
               <h3>오늘도 아름다운 환경을 위해 KNOCK!KNOCK! 해주셔서 감사합니다.</h3>
               <p>보내주신 제안서는 운영진의 검토 후 펀딩 진행여부를 이메일로 알려 드리도록 하겠습니다. 답변을 받기까지 통상 10-14일 정도 소요가 됩니다.</p>
               
               <button class="button" onclick = "location.href='/mypage/myrequest.do'">&nbsp;&nbsp;나의 문의내역
                  <i class="zmdi zmdi-arrow-right"></i><!-- 마이페이지 내 문의내역보기로 보여주는거. 추후 href 달라지면 controller에서도 바꿔줘야 함. -->
               </button>
               <button class="button" onclick = "location.href='/main.do'">&nbsp;&nbsp;메인으로 돌아가기
                  <i class="zmdi zmdi-arrow-right"></i>
               </button>
          </div>
         </div>
      </div>
   </body> 
</html>







</body>
</html>