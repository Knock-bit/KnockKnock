<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="cp" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<!-- 썸머노트 js보다 jquery가 먼저 호출되야한다. jquery 버전과 썸머노트 버전 호환 확인 -->
<!-- js link , table css -->
<jsp:include page='${cp}/layout/admin/adminLink.jsp' flush='false' />
<link href='${cp}/resource/css/admin/adminCss.css' rel="stylesheet"
	type="text/css">


<script src="${cp }/resource/summernote/lang/summernote-ko-KR.js"></script>

<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css"
	rel="stylesheet">


<script>
	function postForm(frm) {
		$('textarea[name="ciContent"]')
				.val($('#summernote').summernote('code'));
		frm.action = "insertCampaign.do";
		frm.setAttribute('method', 'post');
		frm.encoding="multipart/form-data";
		frm.submit();
	}
	  // 사진 업로드
	  $("#btn-upload").click(function(e){
	  		e.preventDefault();
	  		$("#fileBtn").click();
	  });
	  
	

</script>
<body>
	<!-- 상단, 좌측 네비바 추가1 -->
	<nav
		class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
	</nav>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
		<div class="content-wrapper" style="background: white;">
			<!-- 상단, 좌측 네비바 추가1 -->
			<form>
				<!-- 펀딩 번호 넘기기 -->
				<input type="text" id="cfIdx" value="${funding.cfIdx }" style="display:none"/>
				<!-- 제안서 데이터 썸머노트에 보내기 위한 input -->
				<input type="text" id="propContent" value="${funding.cfContent }"
					style="display: none">
				<!-- 제안서 작성자 넘기기 -->
				<input type="text" name="uIdx" value="${funding.uIdx }"
					style="display: none">
				<!-- 파일경로 넘기기 -->
				<input type="text" name="ciFile" value="${funding.cfFile }"
					style="display: none">
				<!-- 펀딩 상태 넘기기 -->
				<input type="text" name="ciStatus" value="0" style="display: none">
				<label> Title <input type="text" name="ciTitle"
					value="${funding.cfTitle }">
				</label><br>
				<!-- 썸머노트 에디터에 작성한 내용 저장시킬 textarea display:none -->
				<textarea name="ciContent" style="display: none;"></textarea>
				<label> 캠페인 목표 <input type="text" name="ciGoal"
					value="${funding.cfGoal }">
				</label>
				<div id="summernote"></div>
				<label>인증 시 지급 포인트</label> <input type="text" name="ciEstimatedpoint"/> <br>
				<label>엠블럼 추가</label>
	            <input id="fileBtn" type="file" name="file" onchange="readURL(this);" >
	            <button type="button" id="btn-upload">엠블럼 이미지 업로드</button>
				<label> 시작일 <input type="date" name="ciStartdate">
				</label> <br> <label> 종료일 <input type="date" name="ciEnddate">
				</label> <br> 
				<h5 style="display: inline">키워드 선택</h5>
				<c:forEach var="i" begin="1" end="3">
					<select name="cKeyword${i }">
						<c:forEach var="keyword" items="${keyword }">
							<option>${keyword.kContent }</option>
						</c:forEach>
					</select>

				</c:forEach>
				<br>
				<h5 style="display: inline">카테고리 선택 -</h5>
				<select name="ccName">
					<c:forEach var="campaignCategory" items="${campaignCategory }">
						<option>${campaignCategory.ccName }</option>
					</c:forEach>
				</select> <input id="subBtn" type="Button" value="글 작성" style="float: right;"
					onclick="postForm(this.form)">
				<!-- <input type="submit" value="전송"> -->
				<div name="text"></div>
			</form>
		</div>
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
								height : 1500,
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
							var propContent = $("#propContent").val();
							$('#summernote').append(propContent);
							$('#summernote').summernote(setting);
						});

		function uploadSummernoteImageFile(file, el) {
			data = new FormData();
			data.append("file", file);
			$.ajax({
				data : data,
				type : "POST",
				url : "uploadSummernoteImageFile.do",
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