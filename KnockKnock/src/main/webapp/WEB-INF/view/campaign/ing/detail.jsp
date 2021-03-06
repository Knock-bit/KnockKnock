<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
      <c:set var="cp" value="${pageContext.request.contextPath }" />
      <jsp:useBean id="today" class="java.util.Date" />
      <fmt:parseNumber var="now" value="${today.time / (1000 * 60 * 60 * 24) }" integerOnly="true" />
      <fmt:parseNumber var="end" value="${campaign.ciEnddate.time / (1000 * 60 * 60 * 24) }" integerOnly="true" />

      <!DOCTYPE html>

      <head>
        <meta charset="UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Mentor Bootstrap Template - Index</title>
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
        <link href="${cp}/resource/css/campaign/campaign.css" rel="stylesheet">
        <link href="${cp}/resource/css/nav1.css" rel="stylesheet">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <!-- Import BootStrap -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
        <!-- Import Kakao -->
        <script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<script src="${cp}/resource/js/jquery/jquery-3.6.0.min.js"></script>
		<!-- SWEET ALERT -->
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>
 	$(function(){
		$("#input-btn").click(function(){
			$("#boardForm").submit();
		});
	}); 
 	
 	$('#myModal').on('shown.bs.modal', function () {
        $('#myInput').trigger('focus')
      })

   function postForm() {
      $('textarea[name="bContent"]').val($('#summernote').summernote('code'));
      /* alert($('textarea[name="bContent"]').val(
            $('#summernote').summernote('code'))); */
      console.log($('textarea[name="bContent"]').val(
            $('#summernote').summernote('code')));
   }
 	
	
		  
</script>
		
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
          .campaign-main-info {
            display: inline-block;
            margin: 0 auto;
          }
          .detail-title {
            margin-top: 100px;
            text-align: center;
          }
          @media (min-width: 768px) {
            .container {
              width: 750px;
            }
          }
          @media (min-width: 1100px) {
            .container {
              width: 1100px;
            }
          }
          .ci-emblem {
            float: left;
            margin-left: 0.3em;
          }
          .certification {
          	margin-top:10px;
            font-size: 1em;
          }
          .campaign-keyword {
            margin-top: 10px;
            margin-bottom: 10px;
            color: grey;
          }
          .campaign-main-info {
            margin-top: 25px;
            margin-bottom: 25px;
            padding: 15px;
          }
          .sticky-parent {
            overflow-x: hidden;
            overflow-y: hidden;
          }
          .sticky {
            position: -webkit-sticky;
            position: sticky;
            top: 0;
          }
          
          .campaign-info{
          	border-radius:10px;}
          	
          .buttons{
          display:block;
          margin-top:1.5em;}
          
          
#share{
	    width: 2.8em;
    height: 2.8em;
    border-radius: 8px;
    font-size: 1.5em;
    border: 1px solid #c1c1c1;
}
#participate{
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

	.inner-nav{
	margin-bottom:10px;}
	
	#commonDiv{
	padding-right:20px;}
        </style>

        <script>
    
  	  
        
          var ciIdx = "${campaign.ciIdx}";
          var cfIdx = "${campaign.cfIdx}";
        
          function list_board(){
      		$("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=${board.ciIdx}");
      		}
          
      
          
      	  function modify(bIdx){
      		$("#commonDiv").load("${cp}/board/modifyBoard.do?bIdx=" + bIdx ); 
      	  }
          function getBoardView(bIdx) {
            $("#commonDiv").load("${cp}/board/getBoard.do?bIdx=" + bIdx);
          }
          
          function participate(){
        	  $("#commonDiv").load("${cp}/board/moveInsert.do?ciIdx=" + ciIdx + "&cfIdx=" + cfIdx);
          }
          
          function insertBoard(){
        	  alert("??? ????????? ?????????????????????.");
        	  $("#commonDiv").load("${cp}/board/getBoardList.do");
          }
          
          function getBoard(ciIdx){
        	  $("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=" + ciIdx);
          }
          
          function myBoardList(){
        	  $("#commonDiv").load("${cp}/board/myBoardList.do?uIdx=${users.uIdx }&ciIdx=" + ciIdx);
          }
          
          
          $(function () {
        	 
        	 
        	  var uIdx = "${users.uIdx}";
              if (uIdx == "") {
                  $("#participate").attr("onclick", "location.href='${cp}/user/login.do'");
                  $("#participate2").attr("onclick", "location.href='${cp}/user/login.do'");
                  $("#participate3").attr("onclick", "location.href='${cp}/user/login.do'");
              }
              

            $("#moveInsert").click(function () {
            	$("#commonDiv").load("${cp}/board/moveInsert.do?ciIdx=" + ciIdx + "&cfIdx=" + cfIdx);
             });
            
            $("#getBoard").click(function () {
              $("#commonDiv").load("${cp}/board/getBoardList.do?ciIdx=${campaign.ciIdx }");
            });
            $("#getContent").click(function () {
              $("#commonDiv").load("${cp}/campaign/getDetailContent.do?ciIdx=${campaign.ciIdx }")
            })
            
             $("#participate").click(function () {
            	 $("#commonDiv").load("${cp}/board/moveInsert.do?ciIdx=" + ciIdx + "&cfIdx=" + cfIdx);
            }) 
            
            $("#insertBoard").click(function () {
              /* $("#commonDiv").load("${cp}/board/getBoard.do?bIdx=${board.bIdx }"); */
              $("#commonDiv").load("${cp}/board/getBoard.do?bIdx=${board.bIdx }")
            });
            
            $("#input-btn").click(function(){
    			$("#boardForm").submit();
    		});
            
           
		
	});
          // ??? ??? ??????
          Kakao.init('24f056f59d439e22eab3d1d0b80755f1');
          try {
            function sendLink() {
              Kakao.Link.sendDefault({
                objectType: 'feed',
                content: {
                  title: '${campaign.ciTitle}',
                  description: '#${campaign.ciKeyword1} #${campaign.ciKeyword2} #${campaign.ciKeyword3}',
                  imageUrl:
                    '${campaign.ciFile}',
                  link: {
                	// ?????? ???????????? ????????? ??????
                    mobileWebUrl: document.location.href,
                    webUrl: document.location.href,
                  },
                },
                buttons: [
                  {
                    title: '????????? ??????',
                    link: {
                      mobileWebUrl: document.location.href,
                      webUrl: document.location.href,
                    },
                  },
                 
                ],
              })
            }
            ; window.kakaoDemoCallback && window.kakaoDemoCallback()
          }
          catch (e) { window.kakaoDemoException && window.kakaoDemoException(e) }
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

              <h1><a onClick="window.location.reload()" style="cursor: pointer;">${campaign.ciTitle}</a></h1>
              <div class="profile-contianer">
                <div class=profile-pic>
                  <img src="/resource/img/profile/user_default.png">
                </div> ${campaign.hostNickname }
              </div>
              <div class="helper"></div>
            </div>


            <!-- ???????????? 
	      	<div class="img-box">
	      		<div class="detail-title">
			     <h1>${campaign.ciTitle}</h1>
			 	suggested by <div class=profile-pic>
             	 <img src="/resource/img/profile/user_default.png"> ${campaign.hostNickname } </div> 
      		<img src="/resource/img/campaign/ex1.jpg" >
      	    </div></div>
      	     -->
            <!-- End Breadcrumbs -->

          </section><!-- End Hero -->


          <!-- ======= Cource Details Section ======= -->
          <section id="campaign-details" class="campaign-details">
            <div class="container" data-aos="fade-up">
            <div class="inner-nav">
              <%@ include file="/layout/navbar/campaign/navCampaignDetail.jsp" %>
              </div>
                <div class="row sticky-parent">
                  <div class="col-lg-8" id="commonDiv">
                    <img src="${campaign.ciFile }" class="img-fluid" alt="">
                    <p>${campaign.ciContent } </p>
                     
                      
                      
                  </div>







                  <div class="col-lg-4" style="padding-left:0px;">
                    <center>
                      <div class="campaign-main-info">
                        <div class="campaign-left">

                          <h2><b>${end - now + 1}???</b> ????????????</h2>
                        </div>
                        <div class="campaign-point">
                        
                          ??? ${campaign.cTotpoint } ????????????<br>
                          ?????????????????? ???????????????.
                        </div>
                      </div>

    

                  <div class="campaign-info campaign-keyword">
                    <div>
                      <center>
                        # ${campaign.ciKeyword1 } # ${campaign.ciKeyword2 } # ${campaign.ciKeyword3 }
                    </div>
                  </div>
                  <div class="campaign-info justify-content-between align-items-center">

                    <p><img class="ci-emblem" src="${campaign.ciEmblem }" width=70px;>
                    <div class="certification"><span>????????????</span><br>
                      ${campaign.ciGoal }</p>
                    </div>
                    <div class="buttons">
                    <div class="btn-wrap funding">
                      <button onclick="sendLink();" id="share" class="btn-funding"><i class="bi bi-share"></i> </button>
                      <button onclick="participate()" id="participate" class="btn-funding"> ???????????? </button>
                    </div>
                    </div>
                  </div>

                </div>
            </div>
        <div class="row">
<c:if test="${!empty recommendList  }">
            <h3> ?????? ???????????? ?????????? </h3>
        <c:forEach var="recommend" items="${recommendList }" begin="1" end="3">
          <div class="col-lg-4 col-md-6 d-flex align-items-stretch" >
            <div class="campaign-item campaign-wrapper" >
            <div class="wrapper-item">
            <div class= img-campaign>
              <div class=scale><a href="${cp }/campaign/ing/detail.do?ciIdx=${recommend.ciIdx }"><img src="${recommend.ciFile }" class="img-fluid" alt="..."></a></div></div>
              <div class="campaign-content">
                <div class="d-flex justify-content-between align-items-center mb-3">
                </div>

                <h3><a href="${cp }/campaign/ing/detail.do?ciIdx=${recommend.ciIdx }">${recommend.ciTitle } </a></h3>
                <p><a href="${cp }/campaign/ing/detail.do?ciIdx=${recommend.ciIdx }">${recommend.ciGoal }</a></p>
                <div class="trainer d-flex justify-content-between align-items-center">
                  <div class="trainer-profile d-flex align-items-center">
                    <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                  </div>
                  <div class="trainer-rank d-flex align-items-center">
           
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div> <!-- End Course Item-->
          </c:forEach>
        </c:if>
            
</div>
            </div>
            <div>





</div>
            
          </section><!-- End Cource Details Section -->

                  <%-- <div class="campaign-info d-flex justify-content-between align-items-center">
                        <h5>???????????? ?????? ??????</h5>
                        <p>
                          <!-- <div class=profile-container>
              <div class=profile-pic-1>
              <img src="/resource/img/profile/user_default.png">
              </div>
              <div class=profile-pic-2>
              <img src="/resource/img/profile/user_default.png">
              </div></div> -->
                          <c:if test="${!empty userList }">
                            ${userList.size() }??? ?????????<br>
                            <c:forEach var="user" items="${userList }">
                              ${user.getNickname() }<br>
                            </c:forEach>
                          </c:if>
                          <c:if test="${empty userList }">
                            ?????? ??????????????????!
                          </c:if>
                        </p>
                  </div> --%>

        </main><!-- End #main -->
        <!-- modal -->

        
        
        
        
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
		
      </body>

      </html>