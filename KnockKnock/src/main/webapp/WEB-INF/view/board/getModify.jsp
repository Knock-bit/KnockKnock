<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 로그인이 되어있고, 본인 글이 아닐경우에만 추천할 수 있도록 버튼을 출력 
 
    <c:if test = "${sessionScope.uIdx != null and sessionScope.uIdx != userVO.uIdx
    or sessionScope.kakaonickname != null and sessionScope.kakaonickname != userVO.uIdx
    or sessionScope.googlename != null and sessionScope.facebookname != userVO.uIdx}">
    
    </c:if>  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세보기</title>
<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
<script src="${cp }/resource/summernote/lang/summernote-ko-KR.js"></script>
<script src="${cp }/resource/summernote/summernote-lite.js"></script>
<link href="${cp}/resource/summernote/summernote-lite.css" rel="stylesheet">
<script>	

	
	$(function () {
		
		$("#update-btn").click(function(){
			$("#boardUpdateForm").submit();
		});
		
	});
	
	function update(){
		
	}
	
	//게시판 목록으로..
	function list_board(){
		$("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=${board.ciIdx}");
	}
	
	function postForm() {
		$('textarea[name="bContent"]').val($('#summernote').summernote('code'));
		/* alert($('textarea[name="bContent"]').val(
				$('#summernote').summernote('code'))); */
		console.log($('textarea[name="bContent"]').val(
				$('#summernote').summernote('code')));
	}
</script>


<style type="text/css">
   .board-cont > div {display: flex;}
   .board-cont > div span {flex: 1 1 85%;}
   .board-cont > div span:first-child {flex: 1 1 15%;}
   
   .btn-style {
      width: 100px; color:white; background-color: #0a3a18; border-radius: 35px;
   }
</style>

</head>
<body>

<div id="container">
	<h1>글수정</h1>
	<hr>
         <form role="form" method="post" onsubmit="postForm()"
         action="${cp}/board/boardSummer.do" id="boardForm" >
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
				 ${users.uNickname }
            	<input type="hidden" value="${users.uIdx }" name="uIdx">
			</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>
				<textarea name="bContent">${bContent }</textarea>
                       
            </td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input type="button" id="update-btn" value="글 등록">
			</td>
		</tr>
	</table>
	</form>
	
	<p><button onclick="list_board()">글 목록으로..</button></p>
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
            url :"${cp}/uploadBoardSummernoteImageFile.do",
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