<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<!-- 서머노트 추가 -->
<script src="${cp }/resource/summernote/summernote-ko-KR.js"></script>
<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css"
	rel="stylesheet">
</head>

<body>
	<div class="container">
		<form method="post" action="/adminFundingWrite">
		<label> 
		index <input type="text" name="idx" />
		</label>
			<br>
		<label>
			Title <input type="text" name="title">
		</label><br>
	
		<textarea class="summernote" name="editordata"></textarea>
		<label>
			시작일 <input type="date" name="startDate"> 
		<input type="time" name="startTime"	>
		</label> <br>
		<label>
			종료일 <input type="date" name="startDate"> 
		<input type="time" name="startTime"	>
		</label>
		<label>
			카테고리 <input type="text" name="category">
		</label> <br>
		<label>
			목표포인트<input type="text" name="goal">
		</label>
		</form>
	</div>
	<script>
		$('.summernote').summernote(
				{
					toolbar : [
							// [groupName, [list of button]]
							[ 'fontname', [ 'fontname' ] ],
							[ 'fontsize', [ 'fontsize' ] ],
							[
									'style',
									[ 'bold', 'italic', 'underline',
											'strikethrough', 'clear' ] ],
							[ 'color', [ 'forecolor', 'color' ] ],
							[ 'table', [ 'table' ] ],
							[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
							[ 'height', [ 'height' ] ],
							[ 'insert', [ 'picture', 'link', 'video' ] ],
							[ 'view', [ 'fullscreen', 'help' ] ] ],
					fontNames : [ 'Arial', 'Arial Black', 'Comic Sans MS',
							'Courier New', '맑은 고딕', '궁서', '굴림체', '굴림', '돋움체',
							'바탕체' ],
					fontSizes : [ '8', '9', '10', '11', '12', '14', '16', '18',
							'20', '22', '24', '28', '30', '36', '50', '72' ],
					height : 150,
					lang : "ko-KR"
				});
	</script>
</body>
</html>