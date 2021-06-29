<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>

<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 
 
    <c:if test = "${sessionScope.uId != null and sessionScope.uId != userVO.uId
    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != userVO.uId
    or sessionScope.googlename != null and sessionScope.facebookname != userVO.uId}">
    
    </c:if>  -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

//추천하기 버튼
$("#btnHit").click(function(){
    if(confirm("해당 글을 추천하시겠습니까?")){
        document.form1.action="hitBoard.do";
        document.form1.submit();
        
        alert("해당 글을 추천하였습니다.")
        
        }
    });
</script>
</head>
<body>

<button type = "button" id = "btnHit">추천하기</button>
</body>
</html>