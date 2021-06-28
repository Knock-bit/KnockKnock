<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/owl.carousel.min.css">

<!-- Bootstrap CSS -->
<link href="${cp}/resource/css/bootstrap.min.css" rel="stylesheet">

<!-- Style -->
<link href="${cp}/resource/css/bootstrap.contact.css" rel="stylesheet">

<title>문의하기</title>
</head>

<body>
	<div class="content">

		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-10">
					<div class="row align-items-center">
						<div class="col-lg-7 mb-5 mb-lg-0">
							<h2 class="mb-5">
								내 문의사항 <br>전송하기
							</h2>
							<form class="border-right pr-5 mb-5" method="post"
								id="contactForm" name="contactForm" action="sendContact.do">
								<div class="row">
									<div class="col-md-6 form-group">
										<input type="text" class="form-control" name="ctTitle"
											id="title" placeholder="제목" maxlength="20">
									</div>
									<div class="col-md-6 form-group">
										<select name="ctCategory" id="category">
											<option selected value="문의유형">문의유형</option>
											<option name="ctCategory" value="주문상품/배송문의">주문상품/배송문의</option>
											<option name="ctCategory" value="결제/취소/환불문의">결제/취소/환불문의</option>
											<option name="ctCategory" value="캠페인 관련">캠페인 관련</option>
										</select>
									</div>
								</div>

								<div class="row">
									<div class="col-md-12 form-group">
										<textarea class="form-control" name="ctContent" id="message"
											cols="30" rows="7" placeholder="문의사항을 작성해주세요."></textarea>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<input type="submit" value="전송"
											class="btn btn-primary rounded-0 py-2 px-4"> <span
											class="submitting"></span>
									</div>
								</div>
							</form>

						</div>
						<div class="col-lg-4 ml-auto">
							<h3 class="mb-4">Knock!Knock!궁금하신 점이 있으신가요?</h3>
							<p>문의를 작성해서 보내주시면 확인 후 5일이내에 답변 보내드려요. 작성한 문의내역은 "나의 문의내역"에서도
								확인 가능합니다.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
$(function () {
	var contactForm = function () {

		if ($('#contactForm').length > 0) {
			$("#contactForm").validate({
				rules: {
					fname: "required",
					lname: "required",
					email: {
						required: true,
						email: true
					},
					message: {
						required: true,
						minlength: 5
					}
				},
				messages: {
					fname: "Please enter your first name",
					lname: "Please enter your last name",
					email: "Please enter a valid email address",
					message: "Please enter a message"
				},
				/* submit via ajax */
				submitHandler: function (form) {
					var $submit = $('.submitting'),
						waitText = 'Submitting...';

					$.ajax({
						type: "POST",
						url: "php/send-email.php",
						data: $(form).serialize(),

						beforeSend: function () {
							$submit.css('display', 'block').text(waitText);
						},
						success: function (msg) {
							if (msg == 'OK') {
								$('#form-message-warning').hide();
								setTimeout(function () {
									$('#contactForm').fadeOut();
								}, 1000);
								setTimeout(function () {
									$('#form-message-success').fadeIn();
								}, 1400);

							} else {
								$('#form-message-warning').html(msg);
								$('#form-message-warning').fadeIn();
								$submit.css('display', 'none');
							}
						},
						error: function () {
							$('#form-message-warning').html("Something went wrong. Please try again.");
							$('#form-message-warning').fadeIn();
							$submit.css('display', 'none');
						}
					});
				}

			});
		}
	};
	contactForm();

});
</script>
</body>

</html>