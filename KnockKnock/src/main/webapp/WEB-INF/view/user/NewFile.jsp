<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
function loginFail(frm) {
	alert('로그인을 할 수 없어');
	frm.action = "user/login.do";
	frm.submit();
}
</script>
<meta charset="UTF-8">
<title>Unable to login</title>
</head>
<body>
	<form action="loginFail();" method="post" location.href="history.go(-1)">
		
		
	</form>
	
</body>
</html>