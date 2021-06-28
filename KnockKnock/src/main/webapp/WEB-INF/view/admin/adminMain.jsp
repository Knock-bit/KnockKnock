<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면연결</title>
<script>
	/* prefix : /WEB-INF/view/  , suffix : .jsp  
		main/main은 컨트롤러에서 viewResolver로 인하여
		/WEB-INF/view/main/main.jsp로 이동될 예정
	*/
	function adminUser(frm){
		frm.action="adminUserList.do";
		frm.submit();
	}
	function adminKeyword(frm){
		frm.action="adminKeywordList.do";
		frm.submit();
	}
	
	
	
</script>
</head>

<body>
	<h1>작업선택</h1>
	<form>
		<input type="button" value="adminUser" onclick="adminUser(this.form)">
		<input type="button" value="adminKeyword" onclick="adminKeyword(this.form)">
	</form>
	
</body>
</html>