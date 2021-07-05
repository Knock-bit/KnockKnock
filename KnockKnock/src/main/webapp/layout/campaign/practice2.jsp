<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<!-- 서머노트 추가 -->
<script src="${cp }/resource/summernote/lang/summernote-ko-KR.js"></script>
<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css"
	rel="stylesheet">

<script>
	function postForm() {
		$('textarea[name="cpContent"]').val($('#summernote').summernote('code'));
		alert($('textarea[name="cpContent"]').val(
				$('#summernote').summernote('code')));
		console.log($('textarea[name="cfContent"]').val(
				$('#summernote').summernote('code')));
	}
</script>
<body>
	<div class="container">
		<form role="form" method="post" onsubmit="postForm()"
			action="${cp }/proposalSummer.do">
			
			<!-- <textarea id="summerTest" class="summernote" name="content"></textarea> -->
			
			<div class="form-row1">
                            <div class="form-group">
                                <label for="cpTitle">캠페인 이름</label>
                                <input type="text" name="cpTitle" id="name" required/>
                            </div>
                            <div class="form-group">
                                <label for="cpGoal">캠페인 목표</label>
                                <input type="text" name="cpGoal" id="id" required/>
                            </div>
                             <div class="form-group" >
                                <label for="cpContent">캠페인 내용</label>
                                 <textarea name="cpContent" style="display: none;"></textarea>
								<div id="summernote"></div>
                            </div>
                        </div>
                        <div class="form-row1">
                           <div class="form-group">
                                <label for="cpTitle">목표포인트</label>
                                <input type="number" name="cpTitle" id="cpGoalPoint" min="2500" required/>
                            </div>
                        </div>

                        <div class="form-row">
                            <div class="form-group">
                                <label for="keyword1">키워드1</label>
                                <input type="text" name="keyword" id="pKeyword1" />
                            </div>
                            <div class="form-group">
                                <label for="keyword2">키워드2</label>
                                <input type="text" name="keyword" id="pKeyword2" />
                            </div>
                            <div class="form-group">
                                <label for="keyword3">키워드3</label>
                                <input type="text" name="keyword" id="pKeyword3" />
                            </div>
                        </div>


                     
			
			
			
			
			
			
			
			
			
			<br>
			   <div class="form-submit">
                            <input type="reset" value="취소" class="submit" name="reset" id="reset" />
                            <input type="submit" value="제출" class="submit" name="submit" id="submit" />
                        </div>
			<div name="text"></div>
		</form>
		${proposal }
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
							$('#summernote').summernote(setting);
						});
		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "../uploadProposalSummernoteImageFile.do",
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