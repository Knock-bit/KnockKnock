<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>    
<!DOCTYPE html>
<html>
<c:if test="${!empty list  }">
        <c:forEach var="campaign" items="${list }">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" >
            <div class="campaign-item campaign-wrapper" >
            <div class="wrapper-item">
              <div class= img-campaign>
              <div class=scale><a href="${cp }/campaign/ing/detail.do?ciIdx=${campaign.ciIdx }">
              <img src="${campaign.ciFile }" class="img-fluid" alt="..."></a></div></div>
              <div class="campaign-content">
                <div class="d-flex justify-content-between align-items-center mb-3">
                  <h4>${campaign.ccName}</h4>
                </div>

                <h3><a class="none-deco" href="${cp }/campaign/ing/detail.do?ciIdx=${campaign.ciIdx }">${campaign.ciTitle } </a></h3>
                <p><a class="none-deco" href="${cp }/campaign/ing/detail.do?ciIdx=${campaign.ciIdx }">${campaign.ciGoal }</a></p>
                <div class="trainer d-flex justify-content-between align-items-center">
                  <div class="trainer-profile d-flex align-items-center">
                    <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                    <span>suggested by  ${campaign.hostNickname } </span>
                  </div>
                  <div class="trainer-rank d-flex align-items-center">
                    <i class="bx bx-user"></i>&nbsp;<a class="none-deco" href="${cp }/campaign/ing/detail.do?ciIdx=${campaign.ciIdx }">${campaign.userCount }명 참가중</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> <!-- End Course Item-->
          </c:forEach>
        </c:if>
        <c:if test="${empty list  }">
        <div class="search-none">
         조회결과가 없습니다.

        </div>
        </c:if>
</html>