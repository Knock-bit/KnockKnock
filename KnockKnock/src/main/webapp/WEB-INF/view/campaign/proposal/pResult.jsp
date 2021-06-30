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

      <div class="wrapper">
         <div class="inner">
            <div id="campaignForm"">
               <h1 text-align="center">제안서 제출이 완료 되었습니다.</h1>
               <h3>오늘도 아름다운 환경을 위해 KNOCK!KNOCK! 해주셔서 감사합니다.</h3>
               <p>보내주신 제안서는 운영진의 검토 후 펀딩 진행여부를 이메일로 알려 드리도록 하겠습니다. 답변을 받기까지 통상 10-14일 정도 소요가 됩니다.</p>
               
               <button class="button" onclick="location.href='campaign?type=ingList'">&nbsp;&nbsp;나의 제안서 확인
                  <i class="zmdi zmdi-arrow-right"></i>
               </button>
               <button class="button" onclick="location.href='${cp}/main.do'">&nbsp;&nbsp;캠페인 메인화면 
                  <i class="zmdi zmdi-arrow-right"></i>
               </button>
          </div>
         </div>
      </div>
   </body> 
</html>
