<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 관리창</title>
</head>
<body>
	
  <div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">전체 주문내역</h4>
        <table class="table table-bordered">
          <thead>
            <tr>
              <th> 주문번호 </th>
              <th> 주문자명 </th>
              <th> 주문상태</th>
              <th> 주문금액 </th>
              <th> 주문날짜 </th>
            </tr>
          </thead>
          <tbody>
          <c:if test="${!empty orders }">
          
            <c:forEach var="list" items="${orders }">
              <tr>
                <td> ${orders.oNumber} </td>
                <td> ${orders.uName} </td>
                <td> ${orders.pName} </td>
                <td> ${orders.oCnt} </td>
	            <td> ${orders.oStatus} </td>                
                <td> ${orders.oTotprice} </td>
                <td> ${orders.oDate} </td>
              </tr>
            </c:forEach>
            </c:if>

          </tbody>
        </table>
      </div>
    </div>
  </div>

</body>
</html>