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
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              <th> 주문날짜 </th>
              
            </tr>
          </thead>
          <tbody>
            <c:forEach var="endlist" items="${endlist }">
              <tr>
 
              <td> ${list.oIdx} </td>
              <td> ${list.pIdx} </td>
              <td> ${list.pPrice} </td>
              <td> ${list.oStatus} </td>
              <td> ${list.fCheck} </td>                
              <td> ${list.oTotprice} </td>
              <td> ${list.oFee} </td>
              <td> ${list.oNumber} </td>
              <td> ${list.uIdx} </td>
              <td> ${list.paIdx} </td>
              <td> ${list.oDate} </td>
              <td> ${list.sIdx} </td>
           
              </tr>
            </c:forEach>

          </tbody>
        </table>
      </div>
    </div>
  </div>

</body>
</html>