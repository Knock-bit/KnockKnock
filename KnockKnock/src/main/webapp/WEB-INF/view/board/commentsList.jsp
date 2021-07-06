<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var bIdx='${board.bIdx}'; //게시글 번호
	 
	$('[name=commentsInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
	    var insertData = $('[name=commentsInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
	    insertComments(insertData); //Insert 함수호출(아래)
	});
 
 
 
	//댓글 목록 
	function commentsList(){
	    $.ajax({
	        url : '/board/commentsList.do',
	        type : 'get',
	        data : {'bIdx':bIdx},
	        success : function(data){
	            var a =''; 
	            $.each(data, function(key, value){ 
	                a += '<div class="commentsArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="commentsInfo'+value.mIdx+'">'+'댓글번호 : '+value.mIDX+' / 작성자 : '+value.uIdx;
	                a += '<a onclick="updateComments('+value.mIdx+',\''+value.cContent+'\');"> 수정 </a>';
	                a += '<a onclick="deleteComments('+value.mIdx+');"> 삭제 </a> </div>';
	                a += '<div class="commentsContent'+value.mIdx+'"> <p> 내용 : '+value.cContent +'</p>';
	                a += '</div></div>';
	            });
	            
	            $(".commentsList").html(a);
	        }
	    });
	}
 
	//댓글 등록
	function insertComments(insertData){
	    $.ajax({
	        url : '/board/insertComments.do',
	        type : 'post',
	        data : insertData,
	        success : function(data){
	            if(data == 1) {
	                commentsList(); //댓글 작성 후 댓글 목록 reload
	                $('[name=cContents]').val('');
	            }
	        }
	    });
	}
	 
	//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
	function updateComments(mIdx, cContent){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="cContent_'+mIdx+'" value="'+cContent+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentsUpdateProc('+mIdx+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentsContent'+mIdx).html(a);
	}
	 
	//댓글 수정
	function commentsUpdateProc(mIdx){
	    var updateContent = $('[name=cContent_'+mIdx+']').val();
	    
	    $.ajax({
	        url : '/board/updateComments.do',
	        type : 'post',
	        data : {'cContent' : updateContent, 'mIdx' : mIdx},
	        success : function(data){
	            if(data == 1) commentsList(bIdx); //댓글 수정후 목록 출력 
	        }
	    });
	}
	 
	//댓글 삭제 
	function deleteComments(mIdx){
	    $.ajax({
	        url : '/board/deleteComments.do/'+mIdx,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentsList(bIdx); //댓글 삭제후 목록 출력 
	        }
	    });
	}
	
	$(document).ready(function(){
	    commentsList(); //페이지 로딩시 댓글 목록 출력 
	});

</script>
</head>
</body>
</html>