<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="cfCollected" value="${funding.cfCollected }" />
<c:set var="cp" value="${pageContext.request.contextPath }" />
<fmt:parseNumber var="now"
	value="${today.time / (1000 * 60 * 60 * 24) }" integerOnly="true" />
<fmt:parseNumber var="end"
	value="${campaign.ciEnddate.time / (1000 * 60 * 60 * 24) }"
	integerOnly="true" />
<!DOCTYPE html>

<head>
<meta charset="UTF-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>펀딩중인 캠페인</title>
<meta content="" name="description">
<meta content="" name="keywords">

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
<style>
.profile-container {
	width: 200px;
	line-height: 50px;
	height: 50px;
	text-align: center;
}

.helper {
	display: inline-block;
	width: 10%;
	height: 100%;
	vertical-align: middle;
}

.profile-pic {
	border-radius: 50%;
	overflow: hidden;
	align-items: center;
	justify-content: center;
	border: solid 1px #eef0ef;
	display: inline-block;
	width: 40px;
	height: 40px;
	vertical-align: middle;
}

.profile-pic img {
	width: 100%;
	height: 100%;
}


.close {
	display: none;
}

.detail-title {
	margin-top: 100px;
	text-align: center;
}

.modal {
	position: fixed;
	top: 35%;
	right: 50%;
}

.modal-funding {
	margin-top: 12px;
	padding: 12px;
	text-align: center;
}

.btn-secondary {
	background-color: rgb(246, 247, 246);
	color: rgb(68, 68, 68);
}

.btn-secondary:hover {
	background-color: rgb(246, 247, 246);
	color: rgb(68, 68, 68);
}

.campaign-keyword {
            margin-top: 10px;
            margin-bottom: 10px;
            color: grey;
          }
.campaign-point{
    margin: auto;
    padding-left: 10px;
    padding-right: 10px;}
    
.campaign-info{
   border-radius:10px;}

.campaign-main-info {
    margin-top: 25px;
    margin-bottom: 25px;
    padding: 15px;
}

#share{
	    width: 2.8em;
    height: 2.8em;
    border-radius: 8px;
    font-size: 1.5em;
    border: 1px solid #c1c1c1;
}

#funding-btn{
	    width: 9.7em;
    height: 2.8em;
    margin-left: 0.3em;
    border-radius: 8px;
    background-color: rgb(10, 61, 14);
    color: white;
    font-size: 1.5em;
    border: none;
}

#funding-btn2{
	    width: 9.7em;
    height: 2.8em;
    margin-left: 0.3em;
    border-radius: 8px;
    background-color: rgb(10, 61, 14);
    color: white;
    font-size: 1.5em;
    border: none;
}

.campaign-details .campaign-info {
   background: #f6f7f6;
    padding: 25px 15px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #e3e3e3;
}

	#commonDiv{
	padding-right:20px;}
	
	        @media (min-width: 768px) {
            .container {
              width: 750px;
               margin: auto;
            }
          }
          @media (min-width: 1100px) {
            .container {
              width: 1100px;
               margin: auto;
            }
          } 
   
</style>
<script>
      
      var uIdx = "${users.uIdx}";
      var cfIdx = "${funding.cfIdx}";
      var cfCollected = "${funding.cfCollected}";
      
        function cancel_funding(){
        	
            $.ajax({
                url: "cancelAjaxFund.do",
                type: "POST",
                /* data: JSON.stringify(param), */
                data: { "cfIdx": cfIdx, "uIdx": uIdx },
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                dataType: "JSON",
                success: function (data) {
                  console.log(data);
                  if(data == 1){
                	  console.log("ok");
                  $("#funding-btn").html('펀딩하기');
                  $("#funding-btn2").html('펀딩하기');
                  $("#funding-btn").attr('data-target', '#fundingModal');
                  $("#funding-btn2").attr('data-target', '#fundingModal');
                  $("#modal-content2").html("<div class='modal-funding'>취소되었습니다.</div>");
                  $("#funding-progress").attr('value', '${funding.cfCollected-250}')
                  $(".collected").html('${funding.cfCollected-250}');
                  $("#campaign-point").load(window.location.href + " #campaign-point");
                  }
                }, error: function () {
                  alert("실패");
                }

              })
        	
        	
        	
        };
      
      
      
        function do_funding() {
          
          console.log(uIdx);
          console.log(cfIdx);

          var param = { "cfIdx": cfIdx, "uIdx": uIdx }

          $.ajax({
            url: "doAjaxFund.do",
            type: "POST",
            /* data: JSON.stringify(param), */
            data: { "cfIdx": cfIdx, "uIdx": uIdx },
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "JSON",
            success: function (data) {
              console.log(data);
              if(data == 1){
            	  console.log("ok");
              $("#funding-btn").html('펀딩완료');
              $("#funding-btn").attr('data-target', '#fundingModal2');
              $("#funding-btn2").html('펀딩완료');
              $("#funding-btn2").attr('data-target', '#fundingModal2');
              $("#modal-content").html("<div class='modal-funding'>참여해주셔서 감사합니다.</div>");
              $("#funding-progress").attr('value', '${funding.cfCollected+250}')
              $(".collected").html('${funding.cfCollected+250}');
              /* $("#progress-div").load(window.location.href + " #progress-div"); */
              $("#campaign-point").load(window.location.href + " #campaign-point");
              }
            }, error: function () {
              alert("실패");
            }

          })


        }

        $(function () {
          var uIdx = "${users.uIdx}";
          if (uIdx == "") {
            $("#funding-btn").attr("onclick", "location.href='${cp}/user/login.do'");
          }

          var exceed = parseInt("${funding.cfGoalpoint}" - "${funding.cfCollected}");
          console.log("exceed : " + exceed);

          if (exceed <= 0) {
            $("#funding-btn").html("펀딩마감");
            $("#funding-btn").attr("data-target", "none");
            $("#funding-btn").attr("onclick", "location.href=#");
            $("#funding-btn2").attr("html", "목표달성으로 조기마감되었습니다.");
            $("#funding-btn2").attr("onclick", "location.href='#'");
          }


        })

        $('#myModal').on('shown.bs.modal', function () {
          $('#myInput').trigger('focus')
        })

      </script>

</head>

<body>



	<!-- ======= Header ======= -->
	<c:choose>
		<c:when test="${users.uType eq 1 }">
			<jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false' />
		</c:when>
		<c:when test="${users.uType eq 0 }">
			<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false' />
		</c:when>
		<c:otherwise>
			<jsp:include page='/layout/navbar/nav.jsp' flush='false' />
		</c:otherwise>
	</c:choose>

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->

		<section>
			<div class="detail-title">

				<h1>${funding.cfTitle}</h1>
				<div class="profile-contianer">
					<div class=profile-pic>
						<img src="/resource/img/profile/user_default.png">
					</div>
					${funding.hostNickname }
				</div>
				<div class="helper"></div>
			</div>
		</section>


		<!-- ======= Cource Details Section ======= -->
		<section id="campaign-details" class="campaign-details">
			<div class="container" data-aos="fade-up">
				<div class="row">
					<div class="col-lg-8">
						<img src="${ funding.cfFile}" class="img-fluid" alt="">
						<div>${funding.cfContent }</div>
						
					</div>
					<div class="col-lg-4" style="padding-left:0px;">
						<div class="campaign-main-info">
							<div class="campaign-left">
							<center>
								<h2>
									<b>${end - now + 1}일</b> 남았어요
								</h2>
							</div>
							<div class="campaign-point" id=""><center>
								현재까지 <span class="collected">${funding.cfCollected }</span> 포인트 모였어요<br></center>
								<p class="funding-pg">
									<progress id="funding-progress" value="${funding.cfCollected }"
										max="${funding.cfGoalpoint }"></progress>
								</p><center>
								<fmt:formatNumber var="fundingProgress" type="percent"
									value="${cfCollected / funding.cfGoalpoint}" pattern="0.0%" />
								<h2>${fundingProgress } 달성!</h2></center>
							</div>
						</div>
						
  <div class="campaign-info campaign-keyword">
                    <div>
                      <center>
                        # ${funding.cfKeyword1 } # ${funding.cfKeyword2 } # ${funding.cfKeyword3 }
                    </div>
                  </div>
						<div class="campaign-info align-items-center">
							<div class="btn-wrap funding">
							<button onclick="sendLink();" id="share" ><i class="bi bi-share"></i> </button>
								<c:if test="${empty fundingUser }">
									<%-- <button id="funding"
                        onclick="location.href='${cp}/campaign/funding/fund.do?uIdx=${users.uIdx }&cfIdx=${funding.cfIdx}'"
                        class="btn-funding"> 펀딩하기 </button> --%>
									<!-- <button id="funding" onclick="do_funding()" class="btn-funding" > 펀딩하기 </button> -->
									<button id="funding-btn" data-toggle="modal"
										data-target="#fundingModal" class="btn-funding">
										펀딩하기</button>
								</c:if>
								<c:if test="${!empty fundingUser }">
									<button id="funding-btn2" data-toggle="modal"
										data-target="#fundingModal2" class="btn-funding">
										펀딩완료</button>
								</c:if>
							</div>
						</div>




					</div>
				</div>

			</div>
		</section>
		<!-- End Cource Details Section -->


		<!-- Modal -->
		<div class="modal fade" id="fundingModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="modal-content">
					<div class="modal-funding">
						<h5>${funding.cfTitle }펀딩참여</h5>
						<br> 펀딩하기 버튼을 누르시면 250포인트로 펀딩에 참여하게 됩니다.<br>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" onclick="do_funding()"
							class="btn btn-primary">펀딩하기</button>
					</div>
				</div>
			</div>
		</div>

		<!-- modal2 -->
		<div class="modal fade" id="fundingModal2" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content" id="modal-content2">
					<div class="modal-funding">
						<br> 이미 참여하신 펀딩입니다.<br> 취소하시겠습니까?

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">닫기</button>
						<button type="button" onclick="cancel_funding()"
							class="btn btn-primary">취소하기</button>
					</div>
				</div>
			</div>
		</div>
	
	</main>
	<!-- End #main -->
	<!-- ======= Footer ======= -->
	<%@ include file="/layout/footer.jsp"%>

	<!-- End Footer -->

	<!--   <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
 -->
	<!-- Vendor JS Files -->
	<script src="${cp}/resource/vendor/aos/aos.js"></script>
	<script
		src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
	<script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
	<script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

	<!-- Template Main JS File -->
	<script src="${cp}/resource/js/main.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>

</body>

</html>