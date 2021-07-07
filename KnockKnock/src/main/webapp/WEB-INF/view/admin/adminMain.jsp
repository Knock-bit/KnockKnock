<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면연결</title>
<script>
	/* prefix : /WEB-INF/view/  , suffix : .jsp  
		main/main은 컨트롤러에서 viewResolver로 인하여
		/WEB-INF/view/main/main.jsp로 이동될 예정
	*/
	function adminUser(frm){
		frm.action="adminUserList.do";
		frm.submit();
	}
	function adminKeyword(frm){
		frm.action="adminKeywordList.do";
		frm.submit();
	}
	function adminCampaignCategory(frm){
		frm.action="adminCampaignCategory.do";
		frm.submit();
	}
	
	function adminFunding(frm){
		frm.action="adminFunding.do";
		frm.submit();
	}
	function adminProposal(frm){
		frm.action="adminProposalList.do";
		frm.submit();
	}
	
	function adminFunding(frm){
	frm.action ="getFundingList.do";
	frm.submit();
	}
	
	function adminCampaing(frm){
		frm.action = "adminCampaignList.do";
		frm.submit();
	}
	
</script>
</head>

<body>
	<h1>작업선택</h1>
	<form>
		<input type="button" value="adminUser" onclick="adminUser(this.form)">
		<input type="button" value="adminKeyword" onclick="adminKeyword(this.form)">
		<input type="button" value="adminCampaignCategory" onclick="adminCampaignCategory(this.form)"/>
		<input type="button" value="adminFunding" onclick="adminFunding(this.form)">
		<input type="button" value="adminProposal" onclick="adminProposal(this.form)">
		<input type="button" value="adminFunding" onclick="adminFunding(this.form)">
		<input type="button" value="adminCampaignList" onclick="adminCampaing(this.form)">
		
		
	</form>
	
	
</body>
</html>