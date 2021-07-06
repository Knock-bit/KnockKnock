<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <c:set var="cp" value="${pageContext.request.contextPath }" />

    <!DOCTYPE html>

    <head>
      <meta charset="UTF-8">
      <meta content="width=device-width, initial-scale=1.0" name="viewport">

      <title>펀딩중인 캠페인</title>
      <meta content="" name="description">
      <meta content="" name="keywords">

      <!-- Favicons -->
      <link href="${cp}/resource/img/favicon.png" rel="icon">
      <link href="${cp}/resource/img/apple-touch-icon.png" rel="apple-touch-icon">

      <!-- Google Fonts -->
      <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

      <!-- Vendor CSS Files -->
      <link href="${cp}/resource/vendor/animate.css/animate.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/aos/aos.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/remixicon/remixicon.css" rel="stylesheet">
      <link href="${cp}/resource/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

      <!-- Main CSS File -->
      <link href="${cp}/resource/css/main.css" rel="stylesheet">
      <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
      <link href="${cp}/resource/css/campaign/funding.css" rel="stylesheet">

      <!-- Import BootStrap -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

        @media (min-width: 768px) {
          .container {
            width: 750px;
          }
        }

        @media (min-width: 1100px) {
          .container {
            width: 1080px;
          }
        }
        
        .close{
          display:none;
        }
        .detail-title {
          margin-top: 100px;
          text-align: center;
        }
        
        .modal{
        position: fixed;
        top:35%;
        right:50%;}
        
        .modal-funding{
        margin-top:12px;
        padding: 12px;
        text-align: center;

        }
        
        .btn-secondary{
        background-color: rgb(246, 247, 246);
        color:rgb(68, 68, 68);
        }
        
        .btn-secondary:hover{
          background-color: rgb(246, 247, 246);
        color:rgb(68, 68, 68);
        }
        
      </style>
     
     
     <script>
     $(() => {
    		$("#fundingStartBtn").click(keywordAdd);
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
              </div> ${funding.hostNickname }
            </div>
            <div class="helper"></div>
          </div>
        </section>


        <!-- ======= Cource Details Section ======= -->
        <section id="campaign-details" class="campaign-details">
          <div class="container" data-aos="fade-up">

            <div class="row">
              <div class="col-lg-7">
                <img src="${ funding.cfFile}" class="img-fluid" alt="">
                <div>펀딩하기</div>
                	${funding.cfContent }
              </div>
              <div class="col-lg-5">

                <div class="campaign-info align-items-center">
                  <div>
                    펀딩 진행도
                    <p class="funding-pg">
                      <progress value="${funding.cfCollected }" max="${funding.cfGoalpoint }"></progress>
                    </p>
						<fmt:formatNumber var="fundingProgress" type="percent" value="${funding.cfCollected / funding.cfGoalpoint}" pattern="0.0%"/>
						${fundingProgress } 달성
                  </div>
                </div>

                <div class="campaign-info align-items-center">
                  <div class="btn-wrap funding">
                    <c:if test="${empty fundingUser }">
                      <%-- <button id="funding"
                        onclick="location.href='${cp}/campaign/funding/fund.do?uIdx=${users.uIdx }&cfIdx=${funding.cfIdx}'"
                        class="btn-funding"> 펀딩하기 </button> --%>
                        <!-- <button id="funding" onclick="do_funding()" class="btn-funding" > 펀딩하기 </button> -->
                        <button id="funding-btn" data-toggle="modal" data-target="#fundingModal" class="btn-funding" > 펀딩하기 </button>
                    </c:if>
                    <c:if test="${!empty fundingUser }">
                      <button id="funding-btn2" data-toggle="modal" data-target="#fundingModal2" class="btn-funding"> 펀딩완료 </button>
                    </c:if>
                  </div>
                </div>

                <div class="campaign-info d-flex justify-content-between align-items-center">
                  <h5>펀딩 종료시간</h5>
                  <p>${funding.cfEnddate }</p>
                </div>
                <div class="campaign-info d-flex justify-content-between align-items-center">
                  <h5>펀딩 목표 포인트</h5>
                  <p>${funding.cfGoalpoint }</p>
                </div>
                <div class="campaign-info d-flex justify-content-between align-items-center">
                  <h5>카테고리</h5>
                  <p>${funding.ccName}</p>
                </div>
                <div class="campaign-info d-flex justify-content-between align-items-center">
					<p> #${funding.cfKeyword1 } #${funding.cfKeyword2 } #${funding.cfKeyword3 }
				</div>
              </div>
            </div>

          </div>
        </section><!-- End Cource Details Section -->

      
              <div class="modal-footer">
                  <button type="button"  class="btn btn-secondary" data-dismiss="modal" name="fundingStartBtn">펀딩 진행하기</button>
              </div>

      </main><!-- End #main -->
      <!-- ======= Footer ======= -->
      <%@ include file="/layout/footer.jsp" %>

        <!-- End Footer -->

        <!--   <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
 -->
        <!-- Vendor JS Files -->
        <script src="${cp}/resource/vendor/aos/aos.js"></script>
        <script src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
        <script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
        <script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

        <!-- Template Main JS File -->
        <script src="${cp}/resource/js/main.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    </body>

    </html>