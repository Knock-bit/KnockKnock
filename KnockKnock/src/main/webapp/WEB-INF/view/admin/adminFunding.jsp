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
<%-- <script src="${cp }/resource/summernote/lang/summernote-ko-KR.js"></script> --%>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.6/lang/summernote-ko-KR.min.js"></script>
<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css"
	rel="stylesheet">

<script>
	function postForm(frm) {
		$('textarea[name="content"]').val($('#summernote').summernote('code'));
		frm.action="insertFunding.do";
		frm.submit();
	}
</script>
<body>	
	<div class="container">
		<form role="form" method="post" onsubmit="postForm()"
			action="../adminSummerTest.do">
			<!-- 제안서 데이터 썸머노트에 보내기 위한 input -->
			<input type="text" id="propContent" value="${proposal.cpContent }" style="display:none">
			<!-- 제안서 번호 넘기기 -->
			<input type="text" name="cpIdx" value="${proposal.cpIdx }" style="display:none">
			<!-- 제안서 작성자 넘기기 -->
			<input type="text" name="uIdx" value="${proposal.uIdx }" style="display:none">			
			<!-- 파일경로 넘기기 -->
			<input type="text" name="cfFile" value="${proposal.cpFile }" style="display:none">
			<!-- 펀딩 상태 넘기기 -->
			<input type="text" name="cfStatus" value="0" style="display:none">
			 <label> Title <input type="text" name="cfTitle" value="${proposal.cpTitle }">
			</label><br>
			<!-- 썸머노트 에디터에 작성한 내용 저장시킬 textarea display:none -->
			<textarea name="cfContent" style="display: none;"></textarea>
			<label>
				캠페인 목표 <input type="text" name="cfGoal" value="${proposal.cpGoal }">
			</label>
			<div id="summernote"></div>
			<label> 시작일 <input type="date" name="cfStartdate"> 
			</label> <br>
			<label>
				종료일 <input type="date" name="cfEnddate">
			</label> <br>
			<label>
				목표 포인트 <input type="text" name="cfGoalpoint" value="${proposal.cpGoalpoint }">
			</label> <br>
			<h5 style="display:inline"> 키워드 선택 - </h5>
			<c:forEach var="i" begin="1" end="3">
			${i }
					<select name="cfKeyword${i }">
						<c:forEach var="keyword" items="${keyword }">
							<option>${keyword.kContent }</option>
						</c:forEach>				
					</select>	
					
			</c:forEach>
			 <input id="subBtn" type="Button" value="글 작성"
				style="float: right;" onclick="goWrite(this.form)">
			<!-- <input type="submit" value="전송"> -->
			<div name="text"></div>
		</form>
	</div>
	<script>
		$(document)
				.ready(
						function() {
						console.log($("#propContent").text());
						console.log($("#propContent").val());
						 
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
							// 툴바생략
							var setting = {
								height : 300,
								minHeight : null,
								maxHeight : null,
								focus : true,
								lang : 'ko-KR',
								toolbar : toolbar,
								//콜백 함수
								callbacks : {
									onImageUpload : function(files, editor,
											welEditable) {
										// 파일 업로드(다중업로드를 위해 반복문 사용)
										for (var i = files.length - 1; i >= 0; i--) {
											uploadSummernoteImageFile(files[i],
													this, count++);
										}
									}
								}
							};
							var propContent = $("#propContent").val();
							text = propContent.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, "");
							alert(text);
						$('#summernote').summernote('editor.insertText',text);	
						$('#summernote').summernote(setting);
						});
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "../uploadSummernoteImageFile.do",
				contentType : false,
				enctype : 'multipart/form-data',
				processData : false,
				success : function(data) {
					$(el).summernote('editor.insertImage', data.url);
				}
			});
		}
	</script>
</body>
</html>