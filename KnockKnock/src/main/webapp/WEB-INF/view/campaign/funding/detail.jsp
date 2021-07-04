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

      <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
      <!-- Import BootStrap -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

        .detail-title {
          margin-top: 100px;
          text-align: center;
        }
      </style>
      <script>
        function do_funding() {
          alert("얍");
          var uIdx = "${users.uIdx}";
          var cfIdx = "${funding.cfIdx}";
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
              $("#funding").html('펀딩완료');
              $("")
            	  
              }
            }, error: function () {
              alert("실패");
            }

          })


        }

        $(function () {
          var uIdx = "${users.uIdx}";
          if (uIdx == "") {
            $("#funding").attr("onclick", "location.href='${cp}/user/login.do'");
          }

          var exceed = parseInt("${funding.cfGoalpoint}" - "${funding.cfCollected}");
          console.log("exceed : " + exceed);

          if (exceed <= 0) {
            $("#funding").attr("html", "목표달성으로 조기마감되었습니다.");
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
                <h2>Et enim incidunt fuga tempora</h3>
                  <p>
                    Qui et explicabo voluptatem et ab qui vero et voluptas. Sint voluptates temporibus quam autem. Atque
                    nostrum voluptatum laudantium a doloremque enim et ut dicta. Nostrum ducimus est iure minima totam
                    doloribus nisi ullam deserunt. Corporis aut officiis sit nihil est. Labore aut sapiente aperiam.
                    Qui voluptas qui vero ipsum ea voluptatem. Omnis et est. Voluptatem officia voluptatem adipisci et
                    iusto provident doloremque consequatur. Quia et porro est. Et qui corrupti laudantium ipsa.
                    Eum quasi saepe aperiam qui delectus quaerat in. Vitae mollitia ipsa quam. Ipsa aut qui numquam eum
                    iste est dolorum. Rem voluptas ut sit ut.
                  </p>
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
                        <button id="funding" onclick="do_funding()" class="btn-funding" > 펀딩하기 </button>
                    </c:if>
                    <c:if test="${!empty fundingUser }">
                      <button id="funding" class="btn-funding"> 펀딩완료 </button>
                    </c:if>
                  </div>
                </div>


                <div class="campaign-info d-flex justify-content-between align-items-center">
                  <h5>Available Seats</h5>
                  <p>30</p>
                </div>

                <div class="campaign-info d-flex justify-content-between align-items-center">
                  <h5>Schedule</h5>
                  <p>5.00 pm - 7.00 pm</p>
                </div>

              </div>
            </div>

          </div>
        </section><!-- End Cource Details Section -->

        <!-- ======= Cource Details Tabs Section ======= -->
        <section id="cource-details-tabs" class="cource-details-tabs">
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
                        <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata
                          raqer a videna mareta paulona marka</p>
                        <p>Et nobis maiores eius. Voluptatibus ut enim blanditiis atque harum sint. Laborum eos ipsum
                          ipsa odit magni. Incidunt hic ut molestiae aut qui. Est repellat minima eveniet eius et quis
                          magni nihil. Consequatur dolorem quaerat quos qui similique accusamus nostrum rem vero</p>
                      </div>
                      <div class="col-lg-4 text-center order-1 order-lg-2">
                        <img src="#" alt="" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-2">
                    <div class="row">
                      <div class="col-lg-8 details order-2 order-lg-1">
                        <h3>Et blanditiis nemo veritatis excepturi</h3>
                        <p class="fst-italic">Qui laudantium consequatur laborum sit qui ad sapiente dila parde sonata
                          raqer a videna mareta paulona marka</p>
                        <p>Ea ipsum voluptatem consequatur quis est. Illum error ullam omnis quia et reiciendis sunt
                          sunt est. Non aliquid repellendus itaque accusamus eius et velit ipsa voluptates. Optio
                          nesciunt eaque beatae accusamus lerode pakto madirna desera vafle de nideran pal</p>
                      </div>
                      <div class="col-lg-4 text-center order-1 order-lg-2">
                        <img src="#" alt="" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-3">
                    <div class="row">
                      <div class="col-lg-8 details order-2 order-lg-1">
                        <h3>Impedit facilis occaecati odio neque aperiam sit</h3>
                        <p class="fst-italic">Eos voluptatibus quo. Odio similique illum id quidem non enim fuga. Qui
                          natus non sunt dicta dolor et. In asperiores velit quaerat perferendis aut</p>
                        <p>Iure officiis odit rerum. Harum sequi eum illum corrupti culpa veritatis quisquam. Neque
                          necessitatibus illo rerum eum ut. Commodi ipsam minima molestiae sed laboriosam a iste odio.
                          Earum odit nesciunt fugiat sit ullam. Soluta et harum voluptatem optio quae</p>
                      </div>
                      <div class="col-lg-4 text-center order-1 order-lg-2">
                        <img src="#" alt="" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-4">
                    <div class="row">
                      <div class="col-lg-8 details order-2 order-lg-1">
                        <h3>Fuga dolores inventore laboriosam ut est accusamus laboriosam dolore</h3>
                        <p class="fst-italic">Totam aperiam accusamus. Repellat consequuntur iure voluptas iure porro
                          quis delectus</p>
                        <p>Eaque consequuntur consequuntur libero expedita in voluptas. Nostrum ipsam necessitatibus
                          aliquam fugiat debitis quis velit. Eum ex maxime error in consequatur corporis atque. Eligendi
                          asperiores sed qui veritatis aperiam quia a laborum inventore</p>
                      </div>
                      <div class="col-lg-4 text-center order-1 order-lg-2">
                        <img src="#" alt="" class="img-fluid">
                      </div>
                    </div>
                  </div>
                  <div class="tab-pane" id="tab-5">
                    <div class="row">
                      <div class="col-lg-8 details order-2 order-lg-1">
                        <h3>Est eveniet ipsam sindera pad rone matrelat sando reda</h3>
                        <p class="fst-italic">Omnis blanditiis saepe eos autem qui sunt debitis porro quia.</p>
                        <p>Exercitationem nostrum omnis. Ut reiciendis repudiandae minus. Omnis recusandae ut non quam
                          ut quod eius qui. Ipsum quia odit vero atque qui quibusdam amet. Occaecati sed est sint aut
                          vitae molestiae voluptate vel</p>
                      </div>
                      <div class="col-lg-4 text-center order-1 order-lg-2">
                        <img src="#" alt="" class="img-fluid">
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
        </section><!-- End Cource Details Tabs Section -->
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
          aria-hidden="true">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                ...
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
          </div>
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

    </body>

    </html>