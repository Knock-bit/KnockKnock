<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면연결</title>

<!-- Favicons -->
<link href="${cp}/resource/img/favicon.png" rel="icon">
<link href="${cp}/resource/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="${cp}/resource/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/remixicon/remixicon.css"
	rel="stylesheet">
<link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">

<!-- Main CSS File -->
<link href="${cp}/resource/css/main.css" rel="stylesheet">
<link href="${cp}/resource/css/nav1.css" rel="stylesheet">
<link href="${cp}/resource/css/campaign/funding.css" rel="stylesheet">

<!-- Import BootStrap -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	/* prefix : /WEB-INF/view/  , suffix : .jsp  
		main/main은 컨트롤러에서 viewResolver로 인하여
		/WEB-INF/view/main/main.jsp로 이동될 예정
	 */
	function adminUser(frm) {
		frm.action = "adminUserList.do";
		frm.submit();
	}
	function adminKeyword(frm) {
		frm.action = "adminKeywordList.do";
		frm.submit();
	}
	function adminCampaignCategory(frm) {
		frm.action = "adminCampaignCategory.do";
		frm.submit();
	}

	function adminFunding(frm) {
		frm.action = "adminFunding.do";
		frm.submit();
	}
	function adminProposal(frm) {
		frm.action = "adminProposalList.do";
		frm.submit();
	}

	function adminFunding(frm) {
		frm.action = "getFundingList.do";
		frm.submit();
	}

	function adminCampaing(frm) {
		frm.action = "adminCampaignList.do";
		frm.submit();
	}

	function adminContact(frm) {
		frm.action = "adminContactList.do";
		frm.submit();
	}
</script>
</head>

<body>
	<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
	<form>
		<input type="button" value="adminUser" onclick="adminUser(this.form)">
		<input type="button" value="adminKeyword"
			onclick="adminKeyword(this.form)"> <input type="button"
			value="adminCampaignCategory"
			onclick="adminCampaignCategory(this.form)" /> <input type="button"
			value="adminFunding" onclick="adminFunding(this.form)"> <input
			type="button" value="adminProposal"
			onclick="adminProposal(this.form)"> <input type="button"
			value="adminCampaignList" onclick="adminCampaing(this.form)">
		<input type="button" value="adminContact"
			onclick="adminContact(this.form)">


	</form>


</body>
</html>