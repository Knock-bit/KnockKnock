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
	function main_connect(frm){
		frm.action="main.do";
		frm.submit();
	}
	function admin_connect(frm){
		frm.action="adminUserList.do";
		frm.submit();
	}
	function board_connect(frm){
		frm.action="board/board";
		frm.submit();
	}
	function campaign_connect(frm){
		frm.action="campaign/tempIndex.do";
		frm.submit();
	}
	function mypage_connect(frm){
		frm.action="myPage.do";
		frm.submit();
	}
	function user_connect(frm){
		frm.action="user/login.do";
		frm.submit();
	}
	
	
	
</script>
</head>

<body>
	<h1>작업선택</h1>
	<form>
		<input type="button" value="main" onclick="main_connect(this.form)">
		<input type="button" value="admin" onclick="admin_connect(this.form)">
		<input type="button" value="board" onclick="board_connect(this.form)">
		<input type="button" value="campagin" onclick="campaign_connect(this.form)">
		<input type="button" value="mypage" onclick="mypage_connect(this.form)">
		<input type="button" value="user" onclick="user_connect(this.form)">
	</form>
	
</body>
</html>