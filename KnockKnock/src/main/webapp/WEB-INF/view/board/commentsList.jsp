<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	var bIdx='${board.bIdx}'; 
	 
	$('[name=commentsInsertBtn]').click(function(){ 
	    var insertData = $('[name=commentsInsertForm]').serialize();
	    insertComments(insertData); 
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
	                a += '<div class="areaComments" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
	                a += '<div class="infoComments'+value.mIdx+'">'+'댓글번호 : '+value.mIdx+' / 작성자 : '+value.uIdx;
	                a += '<a onclick="updateComments('+value.mIdx+',\''+value.cContent+'\');"> 수정 </a>';
	                a += '<a onclick="deleteComments('+value.mIdx+',\''+value.mIdx+'\');"> 삭제 </a> </div>';
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
	                commentsList();
	                $('[name=cContents]').val('');
	            }
	        }
	    });
	}
	 
	//댓글 수정
	function updateComments(mIdx, cContent){
	    var a ='';
	    
	    a += '<div class="input-group">';
	    a += '<input type="text" class="form-control" name="cContent_'+mIdx+'" value="'+cContent+'"/>';
	    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="UpdateCommentsProc('+mIdx+');">수정</button> </span>';
	    a += '</div>';
	    
	    $('.commentsContent'+mIdx).html(a);
	}
	 
	//댓글 수정
	function UpdateCommentsProc(mIdx){
	    var updateComments = $('[name=cContent_'+mIdx+']').val();
	    
	    $.ajax({
	        url : '/board/updateComments.do',
	        type : 'post',
	        data : {'cContent' : updateComments, 'mIdx' : mIdx},
	        success : function(data){
	            if(data == 1) commentsList(bIdx);
	        }
	    });
	}
	 
	//댓글 삭제 
	function deleteComments(mIdx){
	    $.ajax({
	        url : '/board/deleteComments.do/'+mIdx,
	        type : 'post',
	        success : function(data){
	            if(data == 1) commentsList(bIdx); 
	        }
	    });
	}
	$(document).ready(function(){
	    commentsList(); 
	}); 

</script>
</head>
</body>
</html>