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

<script>
	function goWrite(frm) {
		var idx = frm.idx.value;
		var title = frm.idx.value;
		var editordata = frm.idx.editordata;
		var startDate = frm.idx.startDate;
		var startTime = frm.idx.startTime;

		if (idx.trim() == '') {
			alert("회원번호 입력");
			return false;
		}

		if (title.trim() == '') {
			alert('제목입력');
			return false;
		}
		frm.submit();
	}
</script>
</head>

<body>
	<div class="container">
		<form method="post" action="/adminFundingWrite.do">
			<label> index <input type="text" name="idx" />
			</label> <br> <label> Title <input type="text" name="title">
			</label><br>
			<textarea class="summernote" name="editordata"></textarea>
			<label> 시작일 <input type="date" name="startDate"> <input
				type="time" name="startTime">
			</label> <br> <input id="subBtn" type="Button" value="글 작성"
				style="float: right;" onclick="goWrite(this.form)">
		</form>
	</div>
	<script>
		$(document)
				.ready(
						function() {

							var toolbar = [
									// 글꼴 설정
									[ 'fontname', [ 'fontname' ] ],
									// 글자 크기 설정
									[ 'fontsize', [ 'fontsize' ] ],
									// 굵기, 기울임꼴, 밑줄,취소 선, 서식지우기
									[
											'style',
											[ 'bold', 'italic', 'underline',
													'strikethrough', 'clear' ] ],
									// 글자색
									[ 'color', [ 'forecolor', 'color' ] ],
									// 표만들기
									[ 'table', [ 'table' ] ],
									// 글머리 기호, 번호매기기, 문단정렬
									[ 'para', [ 'ul', 'ol', 'paragraph' ] ],
									// 줄간격
									[ 'height', [ 'height' ] ],
									// 그림첨부, 링크만들기, 동영상첨부
									[ 'insert', [ 'picture', 'link', 'video' ] ],
									// 코드보기, 확대해서보기, 도움말
									[
											'view',
											[ 'codeview', 'fullscreen', 'help' ] ] ];

							var setting = {
								height : 150,
								minHeight : null,
								maxHeight : null,
								focus : true,
								lang : 'ko-KR',
								toolbar : toolbar,
								callbacks : { //여기 부분이 이미지를 첨부하는 부분
									onImageUpload : function(files, editor,
											welEditable) {
										for (var i = files.length - 1; i >= 0; i--) {
											uploadSummernoteImageFile(files[i],
													this);
										}
									}
								}
							};

							$('.summernote').summernote(setting);
						});
	</script>
</body>
</html>