<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="cp" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>키워드 카테고리</title>

<!-- js link , table css -->
<jsp:include page='${cp}/layout/admin/adminLink.jsp' flush='false' />
<link href='${cp}/resource/css/admin/adminCss.css' rel="stylesheet" type="text/css">

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
	var inputVal = $("#keyadd").val();
	var inputObj = {"kContent" : inputVal}
	console.log(JSON.stringify(inputObj));	
	if(inputVal !=''){
		$.ajax({
			url: "getJsonKeyword.do",
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
    var checkBox = $("input[name=keyname]:checked");
    // 체크된 체크박스 값을 가져온다, 체크된 박스가 존재할때 실행
    checkBox.each(function (i) {
        // checkbox.parent() : 부모는 <td>
        // checkbox.parent().parent() : <td>의 부모는 <tr>
        var tr = checkBox.parent().parent().eq(i);
        var td = tr.children();

        // 체크된 데이터의 value를 list 배열에 넣기
        list.push(td.eq(1).text());
    });
   	 if (list.length == 0) {
	        alert("선택된 데이터가 없습니다.");
	    } else {
	        $.ajax({
	            url: "deleteKeyword.do",
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
	<!-- 상단, 좌측 네비바 추가1 -->
	<nav
		class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
	</nav>
	<div class="container-fluid page-body-wrapper">
		<jsp:include page='${cp}/layout/admin/adminSideNav.jsp' flush='false' />
		<div class="content-wrapper"style="background: white;">
	<!-- 상단, 좌측 네비바 추가1 -->	
			<div class="row">
				<div class="col-md-12">
					<h3 class="text-center">키워드 관리창</h3>
					<div style="float: right;">
						<a href="/adminKeywordList.do?sort=이름">이름순</a> <a
							href="/adminKeywordList.do?sort=이름역">이름역순</a> <select
							id="cntPerPage" name="sel" onchange="selChange()">
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

					<!-- 검색기능추가 -->
					<form action="adminKeywordList.do" method="get">
						<table class="border-none">
							<tr>
								<td><select name="searchCondition">
										<c:forEach var="option" items="${conditionMapOnlyContent }">
											<option value="${option.value}">${option.key }</option>
										</c:forEach>
								</select> <input type="text" name="searchKeyword"> <input
									type="submit" value="검색"></td>
							</tr>
						</table>
					</form>

					<form id="keywordForm" method="post">
						<table class="table table-bordered table-striped" id="list-table">

							<c:if test="${empty viewAll }">
								<tr>
									<td>등록된 키워드가 없습니다.</td>
								</tr>
							</c:if>

							<c:if test="${!empty viewAll }">
								<thead>
									<tr>
										<td>번호</td>
										<td>키워드 이름</td>
										<td>키워드 선택</td>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="keyword" items="${viewAll }">
										<tr>
											<td>${keyword.RN }</td>
											<td>${keyword.kContent }</td>
											<td><input type="checkbox" name="keyname" /></td>
										</tr>
									</c:forEach>
									<!-- 									<tr>
										<td><input type="text" name="keyadd" id="keyadd" /></td>
										<td><input type="button" value="추가하기" id="addButton" />&nbsp&nbsp<input
											type="button" value="삭제하기" id="delButton" class="delButton" /></td>
									</tr> -->
								</tbody>
							</c:if>
						</table>
						<input type="text" name="keyadd" id="keyadd" /> <input
							type="button" value="추가하기" id="addButton" />&nbsp&nbsp<input
							type="button" value="삭제하기" id="delButton" class="delButton" />

					</form>
				</div>
				<div style="display: block; text-align: center;">
					<c:if test="${paging.startPage != 1 }">
						<a
							href="/adminKeywordList.do?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
					</c:if>
					<c:forEach begin="${paging.startPage }" end="${paging.endPage }"
						var="p">
						<c:choose>
							<c:when test="${p == paging.nowPage }">
								<b>${p }</b>
							</c:when>
							<c:when test="${p != paging.nowPage }">
								<a
									href="/adminKeywordList.do?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
							</c:when>
						</c:choose>
					</c:forEach>
					<c:if test="${paging.endPage != paging.lastPage}">
						<a
							href="/adminKeywordList.do?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>