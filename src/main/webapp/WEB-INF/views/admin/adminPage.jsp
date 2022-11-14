<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
    <meta charset="utf-8">
    <title>회원관리 페이지</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/JSbtstr/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/JSbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
    
   
	
	
</head>


<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  <body>
    <!-- Layout wrapper -->
	<div class="content-wrapper" style="left: 300px; flex-direction: row;">
		<!-- Menu -->

		<%@include file="/WEB-INF/views/common/aside.jsp"%>

		<!-- / Menu -->

		<!-- Layout container -->



		<!-- Content wrapper -->

		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">


			<div style="font-size: 25px;">회원 관리</div>
			<div class="card">

				<div class="table-responsive text-nowrap">

					<table class="table table-border">
						<thead>
							<tr>
								<th style="width: 20px;"><input id="allChkBox" name="allChkBox" type="checkbox" style="width: 15px; height: 15px;"></th>
								<th style="width: 20px;">회원번호</th>
								<th>아이디</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>생년월일</th>
								<th>등급</th>
								<th>등급변경</th>
								<th>카카오유저</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${list }" var="mem">
								<tr>
									<td style="text-align: center;"><input class="chk" type="checkbox"></td>
									<td style="text-align: center;">${mem.memberNo }</td>
									<td>${mem.memberId }</td>
									<td>${mem.memberPhone }</td>
									<td>${mem.memberEmail }</td>
									<td>${mem.memberBirth }</td>
									<td style="width:10%;"><c:if test="${mem.memberGrade eq 1}">
											<select class="form-select" aria-label="Default select example">
												<option value="1" selected>회원</option>
												<option value="2">강사</option>
												<option value="3">관리자</option>
											</select>
										</c:if> <c:if test="${mem.memberGrade eq 2}">
											<select class="form-select" aria-label="Default select example">
												<option value="1">회원</option>
												<option value="2" selected>강사</option>
												<option value="3">관리자</option>
											</select>
										</c:if> <c:if test="${mem.memberGrade eq 3}">
											<select class="form-select" aria-label="Default select example">
												<option value="1">회원</option>
												<option value="2">강사</option>
												<option value="3" selected>관리자</option>
											</select>
										</c:if>
									</td>
									<td>
										<button type="button" class="btn btn-outline-primary changeLevel">등급 변경</button>
									</td>
									<c:if test="${mem.kakaoLogin == null}">
										<td style="line-height:1rem;">일반 유저</td>
									</c:if>
									<c:if test="${mem.kakaoLogin != null}">
										<td>카카오 유저</td>
									</c:if>
								</tr>
							</c:forEach>
							<tr >
								<th colspan="9" style="text-align:center;">
									<button class="btn btn-primary checkedChangeLevel">선택회원
										등급 변경</button>
										</th>
							</tr>
							

						</tbody>
					</table>
					<div id="pageNavi">${pageNavi }</div>
				</div>
			</div>


		</div>
	</div>



	<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s" style="width: 100%;">
  <div class="container py-5">
      <div class="row g-5">
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Our Office</h4>
              <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
              <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
              <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
              <div class="d-flex pt-2">
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Services</h4>
              <a class="btn btn-link" href="">Landscaping</a>
              <a class="btn btn-link" href="">Pruning plants</a>
              <a class="btn btn-link" href="">Urban Gardening</a>
              <a class="btn btn-link" href="">Garden Maintenance</a>
              <a class="btn btn-link" href="">Green Technology</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Quick Links</h4>
              <a class="btn btn-link" href="">About Us</a>
              <a class="btn btn-link" href="">Contact Us</a>
              <a class="btn btn-link" href="">Our Services</a>
              <a class="btn btn-link" href="">Terms & Condition</a>
              <a class="btn btn-link" href="">Support</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Newsletter</h4>
              <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
              <div class="position-relative w-100">
                  <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                  <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
              </div>
          </div>
      </div>
  </div>
</div>
<!-- Footer End -->
	<script>
	$(()=>{ 
		
	});
	
	
	
		$(".changeLevel").on(
				"click",
				function() {
					const memberNo = $(this).parent().parent().children().eq(1)
							.text();
					//클릭한 버튼 기준으로 선택한 등급
					const memberGrade = $(this).parent().prev().children()
							.val();
					location.href = "/changeLevel.do?memberNo=" + memberNo
							+ "&memberGrade=" + memberGrade;
				});

		$(".checkedChangeLevel").on(
				"click",
				function() {
					const check = $(".chk:checked");
					if (check.length == 0) {
						alert("선택된 회원이 없습니다");
						return;
					}
					const num = new Array();
					const level = new Array();
					check.each(function(index, item) {
						const memberNo = $(item).parent().next().text();
						num.push(memberNo);
						const memberGrade = $(item).parent().parent().find(
								"select").val();
						level.push(memberGrade);
					});
					location.href = "/checkedChangeLevel.do?num="
							+ num.join("/") + "&level=" + level.join("/");
				});

		$("#allChkBox").on("click", function() {
			if ($("input[name=allChkBox]").is(":checked")) {
				$(".chk").prop("checked", true);
			} else {
				$(".chk").prop("checked", false);
			}
		});
		
	</script>
</body>
</html>