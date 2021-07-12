<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
 	<link href="${contextPath}/resource/css/proposal.css" rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
	<link href="${cp}/resource/css/signup.css" rel="stylesheet">
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<!-- 서머노트 추가 -->
<script src="${cp }/resource/summernote/lang/summernote-ko-KR.js"></script>
<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css"
	rel="stylesheet">

<script>
	function postForm() {
		$('textarea[name="pDesc"]').val($('#summernote').summernote('code'));
		alert($('textarea[name="pDesc"]').val(
				$('#summernote').summernote('code')));
		console.log($('textarea[name="pDesc"]').val(
				$('#summernote').summernote('code')));
	}
</script>

<style>
.proposal-form{
 padding: 20px;
}
</style>
</head>

<body>
     <div class="main">
        <div class="container">
            <div class="proposal-content">

                <div class="proposal-form">
                    <form role="form" method="post" onsubmit="postForm()" 
                    action="${cp }/productSummer.do" class="register-form" id="register-form" enctype="multipart/form-data">
                        <h2>상품 등록</h2>
                        <p>KNOCK! 샵에 등록할 상품을 등록해주세요.</p>
     				 
                        <div class="form-row1">
                       		 <div class="form-group">
                                <label for="pName">상품이름</label>
                                <input type="text" name="pName" id="pName" required/>
                            </div>
                            <div class="form-group">
                                <label for="pcIdx">상품분류</label>
                                <select class="form-select" aria-label="Default select example" name="pcIdx">
								  <option selected>분류를 선택해주세요</option>
								  <option value="1">식품</option>
								  <option value="2">의류</option>
								  <option value="3">생활용품</option>
								</select>
                            </div>
                            <div class="form-group">
                                <label for="pPrice">가격</label>
                                <input type="number" name="pPrice" id="id" required/>
                            </div>
                             <div class="form-group" >
                                <label for="pStock">재고</label>
                                 <input type="number" name="pStock" id="pStock" required>
                            </div>
                            
                            <div class="form-group" >
                                <label for="pDesc">상품설명</label>
                                 <textarea name="pDesc" style="display: none;"></textarea>
								<div id="summernote"></div>
                            </div>
                        </div>
                        <div class="form-group" >
                                <label for="file">썸네일</label>
                        <input type="file" name="file">
                            </div>
                        
                        <div class="form-submit">
                            <input type="button" value="취소" onclick="href.location='/seller/sellerDashboard.do?sIdx=${seller.sIdx}'"/>
                            <input type="submit" value="제출" class="submit" name="submit" id="submit"/>
                        </div>
                    </form>
                </div>
            </div>
        </div>

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
													this);
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
				url :"${cp}/uploadProductSummernoteImageFile.do",
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