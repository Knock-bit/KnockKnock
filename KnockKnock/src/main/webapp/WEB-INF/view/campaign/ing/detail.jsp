
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="cp" value ="${pageContext.request.contextPath }"/>
<jsp:useBean id="today" class="java.util.Date"/>
<%-- <fmt:formatDate var="nowDate" value="${today }" pattern ="yyyy-MM-dd" /> --%>
<fmt:parseNumber var = "now" value="${today.time / (1000 * 60 * 60 * 24) }" integerOnly="true"/>
<fmt:parseNumber var="end" value="${campaign.ciEnddate.time / (1000 * 60 * 60 * 24) }" integerOnly="true"/>
<%-- <fmt:parseNumber var = "end" value="${endDate.time() }" integerOnly="true"/>
 --%>
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
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
<style>
.profile-container{
	width: 200px;
	line-height:50px;
	height:50px;
	text-align:center;}
.helper{
display:inline-block;
width:10%;
height:100%;
vertical-align:middle;}
.profile-pic{
	 border-radius: 50%;
	 overflow: hidden;
     align-items: center;
     justify-content: center;
     border : solid 1px #eef0ef;
     display: inline-block;
	 width: 40px;
	 height: 40px;
	 vertical-align:middle;
	}
.profile-pic img {
   	width:100%;
   	height:100%;
   }
/* .img-box {
   width:100%;
    height:30vh;
    overflow:hidden;
}
.img-box img {
	width:100%; 
	height:100%; 
	object-fit:cover;
	-webkit-filter: blur(20px); 
	filter:blur(20px);
	opacity: 70%;
	position:relative;
	z-index:-1;
	}
 .detail-title {
 	position:relative;
 	top:50%;
 	left:40%;
 	width:500px;
	}  */
	
	.campaign-main-info{
	display:inline-block;
	margin: 0 auto;
	
	}
	 .detail-title {
	margin-top:100px;
	text-align:center;
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
	.ci-emblem{
	float:left;
	}
	.certification{
	font-size: 1em;
	}
	.campaign-keyword{
	margin-top:10px;
	margin-bottom:10px;
	color: grey;}
	.campaign-main-info{
	margin-top: 25px;
	margin-bottom: 25px;
	padding:15px;}
	

	.sticky-parent{
 block; overflow-x: hidden; overflow-y: hidden;
	}
	.sticky {
    position: -webkit-sticky;
    position: sticky;
    top: 0;
}
		
</style>

<script>
	$(function(){
		$("#getBoard").click(function(){
			$("#commonDiv").load("${cp}/board/getBoardList.do");
		});
	
		$("#getContent").click(function(){
			$("#commonDiv").load("${cp}/campaign/getDetailContent.do?ciIdx=${campaign.ciIdx }")
		})
		
		$("#participate").click(function(){
			$("#commonDiv").load("${cp}/board/moveInsert.do")
		})
		
		$("#")
		
	});
	
		    Kakao.init('24f056f59d439e22eab3d1d0b80755f1');
	try {
		  function sendLink() {
		    Kakao.Link.sendDefault({
		      objectType: 'feed',
		      content: {
		        title: '${campaign.ciTitle}',
		        description: '#케익 #녹차 #백범로 #학원 #비트캠프 #분위기',
		        imageUrl:
		          '/resource/img/campaign/recycle.png',
		        link: {
		          mobileWebUrl: document.location.href,
		          webUrl: document.location.href,
		        },
		      },
		      buttons: [
		        {
		          title: '웹으로 보기',
		          link: {
		            mobileWebUrl: document.location.href,
		            webUrl: document.location.href,
		          },
		        },
		        {
		          title: '앱으로 보기',
		          link: {
		            mobileWebUrl: document.location.href,
		            webUrl: document.location.href,
		          },
		        },
		      ],
		    })
		  }
		; window.kakaoDemoCallback && window.kakaoDemoCallback() }
		catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
	
</script>






</head>
<body>

  

  <!-- ======= Header ======= -->
        <c:choose>
  	<c:when test="${users.uType eq 1 }">
   		<jsp:include page='/layout/navbar/navLoggedin.jsp' flush='false'/>   	
  	</c:when>
  	<c:when test="${users.uType eq 0 }">
   		<jsp:include page='/layout/navbar/navAdmin.jsp' flush='false'/>   	  	
  	</c:when>
  	<c:otherwise>
	   <jsp:include page='/layout/navbar/nav.jsp' flush='false'/>
  	</c:otherwise>
  	</c:choose>
  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    
         <section>
         
	      		<div class="detail-title">
	      		              
			     <h1>${campaign.ciTitle}</h1><div class="profile-contianer"><div class=profile-pic>
             	 <img src="/resource/img/profile/user_default.png"></div> ${campaign.hostNickname }
      	   </div><div class="helper"></div></div>
      	
      	
     <!-- 흐린배경 
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
		 <%@ include file= "/layout/navbar/campaign/navCampaignDetail.jsp" %>
        <div class="row sticky-parent">
          <div class="col-lg-8" id="commonDiv">
            <img src="${campaign.ciFile }" class="img-fluid" alt="">
            <h2>${campaign.ciContent }  </h3>
            <p>
              Qui et explicabo voluptatem et ab qui vero et voluptas. Sint voluptates temporibus quam autem. Atque nostrum voluptatum laudantium a doloremque enim et ut dicta. Nostrum ducimus est iure minima totam doloribus nisi ullam deserunt. Corporis aut officiis sit nihil est. Labore aut sapiente aperiam.
              Qui voluptas qui vero ipsum ea voluptatem. Omnis et est. Voluptatem officia voluptatem adipisci et iusto provident doloremque consequatur. Quia et porro est. Et qui corrupti laudantium ipsa.
              Eum quasi saepe aperiam qui delectus quaerat in. Vitae mollitia ipsa quam. Ipsa aut qui numquam eum iste est dolorum. Rem voluptas ut sit ut.
            
            내용 
            </p>
            
              <p>
              Qui et explicabo voluptatem et ab qui vero et voluptas. Sint voluptates temporibus quam autem. Atque nostrum voluptatum laudantium a doloremque enim et ut dicta. Nostrum ducimus est iure minima totam doloribus nisi ullam deserunt. Corporis aut officiis sit nihil est. Labore aut sapiente aperiam.
              Qui voluptas qui vero ipsum ea voluptatem. Omnis et est. Voluptatem officia voluptatem adipisci et iusto provident doloremque consequatur. Quia et porro est. Et qui corrupti laudantium ipsa.
              Eum quasi saepe aperiam qui delectus quaerat in. Vitae mollitia ipsa quam. Ipsa aut qui numquam eum iste est dolorum. Rem voluptas ut sit ut.
            
            내용 
            </p>  <p>
              Qui et explicabo voluptatem et ab qui vero et voluptas. Sint voluptates temporibus quam autem. Atque nostrum voluptatum laudantium a doloremque enim et ut dicta. Nostrum ducimus est iure minima totam doloribus nisi ullam deserunt. Corporis aut officiis sit nihil est. Labore aut sapiente aperiam.
              Qui voluptas qui vero ipsum ea voluptatem. Omnis et est. Voluptatem officia voluptatem adipisci et iusto provident doloremque consequatur. Quia et porro est. Et qui corrupti laudantium ipsa.
              Eum quasi saepe aperiam qui delectus quaerat in. Vitae mollitia ipsa quam. Ipsa aut qui numquam eum iste est dolorum. Rem voluptas ut sit ut.
            
            내용 
            </p>
          </div>
          
          
          
          
          
          
          
          <div class="col-lg-4 sticky" style="padding-left:0px;">
          <center>
          	  <div class="campaign-main-info">
              <div class="campaign-left">
          		
              <h2><b>${end - now + 1}일</b> 남았어요</h2></div>
              <div class="campaign-point">
              총 ${campaign.cTotpoint } 포인트가<br>
              참여자들에게 나눠집니다.
              </div>
              </div>

           <%--  <div class="campaign-info d-flex justify-content-between align-items-center">
              <h5>참여중인 사람 목록</h5>
              <p>
              <!-- <div class=profile-container>
              <div class=profile-pic-1>
              <img src="/resource/img/profile/user_default.png">
              </div>
              <div class=profile-pic-2>
              <img src="/resource/img/profile/user_default.png">
              </div></div> -->
              <c:if test="${!empty userList }">
              ${userList.size() }명 참여중<br>
	              <c:forEach var="user" items="${userList }">
		              	${user.getNickname() }<br>
		           </c:forEach>
              </c:if>
              <c:if test="${empty userList }">
               먼저 참여해보세요!
              </c:if>
              </p>
            </div> --%>

			<div class="campaign-info">
			<div class="campaign-keyword"><center>
			# ${campaign.ciKeyword1 }    # ${campaign.ciKeyword2 } # ${campaign.ciKeyword3 }</div>
			</div>
            <div class="campaign-info justify-content-between align-items-center">
              
              <p><img class="ci-emblem" src="${campaign.ciEmblem }" width=70px;>
              <div class="certification"><span>인증방법</span><br>
              ${campaign.ciGoal }</p>
              </div>
              
              <div class="btn-wrap funding">
              <button onclick="sendLink();" id="share" class = "btn-funding"> 공유하기 </button>
              </div>
                <div class="btn-wrap funding">
              <button onclick="funding()" id="participate" class="btn-funding"> 참여하기 </button>
              </div>
            </div>

            
         

          </div>
        </div>

      </div>
    </section><!-- End Cource Details Section -->

    <!-- ======= Cource Details Tabs Section ======= -->
    <!-- <section id="cource-details-tabs" class="cource-details-tabs">
      <div class="container" data-aos="fade-up">
        <div class="row">
          <div class="col-lg-3">
            <ul class="nav nav-tabs flex-column">
              <li class="nav-item">
                <a class="nav-link active show" data-toggle="tab" href="#tab-1">Modi sit est</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-2">Unde praesentium sed</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-3">Pariatur explicabo vel</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-4">Nostrum qui quasi</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#tab-5">Iusto ut expedita aut</a>
              </li>
            </ul>
          </div>
          <div class="col-lg-9 mt-4 mt-lg-0">
            <div class="tab-content">
              <div class="tab-pane active show" id="tab-1">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Architecto ut aperiam autem id</h3>
                    <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/campaign-details-tab-1.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-2">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Et blanditiis nemo veritatis excepturi</h3>
                    <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata raqer a videna mareta paulona marka</p>
                    <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/campaign-details-tab-2.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-3">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                    <p class="fst-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                    <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio. Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/campaign-details-tab-3.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-4">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                    <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro quis delectus</p>
                    <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/campaign-details-tab-4.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
              <div class="tab-pane" id="tab-5">
                <div class="row">
                  <div class="col-lg-8 details order-2 order-lg-1">
                    <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                    <p class="fst-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                    <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut vitae molestiae voluptate vel</p>
                  </div>
                  <div class="col-lg-4 text-center order-1 order-lg-2">
                    <img src="assets/img/campaign-details-tab-5.png" alt="" class="img-fluid">
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section> --><!-- End Cource Details Tabs Section -->

  </main><!-- End #main -->
<!-- ======= Footer ======= -->
   <%@ include file= "/layout/footer.jsp" %>
 
 <!-- End Footer -->

<!--   <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>
 -->  <!-- Vendor JS Files -->
  <script src="${cp}/resource/vendor/aos/aos.js"></script>
  <script src="${cp}/resource/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${cp}/resource/vendor/php-email-form/validate.js"></script>
  <script src="${cp}/resource/vendor/purecounter/purecounter.js"></script>
  <script src="${cp}/resource/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${cp}/resource/js/main.js"></script>

</body>

</html>