<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
<style>
.table {
	margin-top: 250px;
	margin-left: 50px
}
</style>
<script>

function selChange() {
	var sel = document.getElementById('cntPerPage').value;
	location.href = "adminKeywordList.do?nowPage=${paging.nowPage}&cntPerPage="
			+ sel;
}

$(() => {
	$("#addButton").click(keywordAdd);
});

function keywordAdd() {
	var inputVal = $("#campaignCategoryAdd").val();
	var inputObj = {"ccName" : inputVal}
	console.log(JSON.stringify(inputObj));	
	if(inputVal !=''){
		$.ajax({
			url: "addCampaignCategory.do",
			type: "post",
			dataType: "json",
			data: JSON.stringify(inputObj),
			contentType: 'application/json; charset=utf-8',
			success: function(result) {
				if(result != 0){
					alert("입력하신 데이터가 추가되었습니다.");
					location.reload();
					
				} else{
					alert("이미 존재하는 키워드입니다.");
				}
		
			}
		}) 
	} else{
		alert("다시 입력해주세요.")
	}
}


$(() => {
    $("#delButton").click(keywordDel);
});
function keywordDel() {
	var confirm_val =confirm("정말 삭제하시겠습니까?");

    var rowData = new Array();
    var tdArr = new Array();
    var list = [];
    if(confirm_val){
    // 체크된 체크박스 확인
    var checkBox = $("input[name=categoryName]:checked");
    // 체크된 체크박스 값을 가져온다, 체크된 박스가 존재할때 실행
    checkBox.each(function (i) {
        // checkbox.parent() : 부모는 <td>
        // checkbox.parent().parent() : <td>의 부모는 <tr>
        var tr = checkBox.parent().parent().eq(i);
        var td = tr.children();

        // 체크된 데이터의 value를 list 배열에 넣기
        list.push(td.eq(0).text());
    });
   	 if (list.length == 0) {
	        alert("선택된 데이터가 없습니다.");
	    } else {
	        $.ajax({
	            url: "deleteCampaignCategory.do",
	            type: "post",
	            data: {chbox : list},
	            success: function(result){
	            	if(result != 0){
						alert("선택한 키워드가 삭제되었습니다.");
						location.reload();
						
					} else{
						alert("키워드 삭제에 실패했습니다.");
					}
	            }
	        });
    	} 
    }
}

</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div style="float: right;">
						<select id="cntPerPage" name="sel" onchange="selChange()">
							<option value="5"
								<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄
								보기</option>
							<option value="10"
								<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄
								보기</option>
							<option value="15"
								<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄
								보기</option>
							<option value="20"
								<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄
								보기</option>
						</select>
					</div>
					<form id="keywordForm" method="post"
						style="margin-top: 300px; margin-left: 100px;">
						<table class="table table-bordered table-striped"
							style="margin-top: 0px;">
							<h3 class="text-center">키워드관리창</h3>

							<c:if test="${empty viewAll }">
								<tr>
									<td>등록된 키워드가 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty viewAll }">
								<thead>
									<tr>
										<td>카테고리 이름</td>
										<td>카테고리 선택</td>
									</tr>
								</thead>
								<tbody id="tableList">
									<c:forEach var="campaign" items="${viewAll }">
										<tr>
											<td>${campaign.ccName }</td>
											<td><input type="checkbox" name="categoryName" /></td>
										</tr>
									</c:forEach>
									<!-- 									<tr>
										<td><input type="text" name="campaignCategoryAdd" id="campaignCategoryAdd" /></td>
										<td><input type="button" value="추가하기" id="addButton" />&nbsp&nbsp<input
											type="button" value="삭제하기" id="delButton" class="delButton" /></td>
									</tr> -->
								</tbody>
							</c:if>
						</table>
						<input type="text" name="campaignCategoryAdd"
							id="campaignCategoryAdd" /> <input type="button" value="추가하기"
							id="addButton" />&nbsp&nbsp<input type="button" value="삭제하기"
							id="delButton" class="delButton" />
					</form>
					<div style="display: block; text-align: center;">
						<c:if test="${paging.startPage != 1 }">
							<a
								href="/adminCampaignCategory.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
						</c:if>
						<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
							var="p">
							<c:choose>
								<c:when test="${p == paging.nowPage }">
									<b>${p }</b>
								</c:when>
								<c:when test="${p != paging.nowPage }">
									<a
										href="/adminCampaignCategory.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
								</c:when>
							</c:choose>
						</c:forEach>
						<c:if test="${paging.endPage != paging.lastPage}">
							<a
								href="/adminCampaignCategory.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>