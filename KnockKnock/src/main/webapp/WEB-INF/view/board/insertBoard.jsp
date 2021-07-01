<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글등록</title>
</head>
<body>

<div id="container">
	<h1>글등록</h1>
	<hr>
	<form action="insertBoard.do" method="post" enctype="multipart/form-data">
	<table>
		<tr>
			<th>제목</th>
			<td>
				<input type="text" name="bSubject">
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
				<input type="text" name="uIdx">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="bContent" rows="10" cols="50"></textarea>
			</td>
		</tr>
		<tr>
			<th>파일업로드</th>
			<td>
				<input type="file" name="uploadFile">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="글 등록">
			</td>
		</tr>
	</table>
	</form>
	
	<p><a href="getBoardList.do">글 목록으로..</a></p>

</div>

</body>
</html>