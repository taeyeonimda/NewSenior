<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
    <title>내 동호회</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">


   	<link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <script src="https://unpkg.com/mathjs/lib/browser/math.js"></script> <!-- math 사용 위한 라이브러리 -->

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

			<br>
			<br>
			<br>
			<div>
				<div style="font-size: 40px; font-weight: 900; 
				display: inline-block;">내동호회</div>
			</div>
			<div class="card">
			 <c:choose>
	        	<c:when test="${not empty myList }">
			        <div class="mb-5 row my-list-page" style="flex-wrap: wrap;">
			<c:forEach items="${myList }" var="ml">
			        	<c:if test="${ml.clubNo ne newClub }">
						<div class="mb-5">
							<div class="card shadow" style="border: 5px solid #E8F5E9;">
								<div class="card-img">
									<img src="/resources/upload/club/${ml.clubMainImg }" width="100%">
								</div>
			      				<div class="card-body" style="height: 66%;">
					        		<h5 class="card-title">${ml.clubName }</h5>
					        		<p class="card-text clubIntro">${ml.clubIntro }</p>
					        		<p class="card-text">${ml.clubMemberCnt }/${ml.clubLimit }</p>
					        		<a href="/clubDetail.do?clubNo=${ml.clubNo }" class="btn btn-outline-primary">입장하기</a>
					        		<a class="btn btn-outline-danger" onclick="quitClub(${ml.clubNo}, ${sessionScope.m.memberNo });">동호회 탈퇴하기</a>
					        		
				      			</div>
			    			</div>
			  			</div>
			  			</c:if>
			  			</c:forEach>
					</div>
	        	</c:when>
	        	<c:otherwise>
	        		<div class="fs-5 fw-bold text-primary text-center">가입한 동호회가 없습니다 동호회를 가입해보세요!</div>
	        	</c:otherwise>
	        </c:choose>
			</div>
		</div>
	</div>

	<!-- / Content -->

    <!-- / Layout wrapper -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>


    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="../assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    
    <script>
	function quitClub(clubNo, memberNo) {
		Swal.fire({
			title: "동호회 탈퇴",//제목
			text: "정말 탈퇴하시겠습니까?",
			imageUrl: "/resources/img/제목없음.png",
			showCancelButton: true,
			cancelButtonColor: '#525368',
			confirmButtonColor: '#348E38',
			cancelButtonText: '취소',
			confirmButtonText: '탈퇴하기'
		}).then((result) => {
			//result.value == true이니까 트루일때만 실행하는거
		  if (result.value) {
			  location.href="/quitClub.do?clubNo="+clubNo+"&memberNo="+memberNo;
		  }
		})//then끝
	}
    </script>

  </body>
</html>
