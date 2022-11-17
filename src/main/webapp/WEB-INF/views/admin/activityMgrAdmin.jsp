<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8">
<title>Gardener - Gardening Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/JSbtstr/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="/resources/JSbtstr/lib/animate/animate.min.css"
	rel="stylesheet">
<link
	href="/resources/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="/resources/JSbtstr/lib/lightbox/css/lightbox.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
<style>
.swal2-icon {
    position: relative;
    box-sizing: content-box;
    justify-content: center;
    width: 3em;
    height: 3em;
    margin: 1.25em auto 1.875em;
    border: 0.25em solid transparent;
    border-radius: 50%;
    font-family: inherit;
    line-height: 3em;
    cursor: default;
    -webkit-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
}
.lineheightTr td{
line-height: 38px;
}
</style>
<body>
	<!-- Layout wrapper -->
	<div class="content-wrapper"
		style="left: 300px; flex-direction: row; min-height: 500px;">
		<!-- Menu -->
		<%@include file="/WEB-INF/views/common/aside.jsp"%>

		<!-- / Menu -->

		<!-- Layout container -->



		<!-- Content wrapper -->

		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">


			<!-- Examples -->
			<div style="font-size: 25px;">액티비티관리</div>
			<div class="card">

				<div class="table-responsive text-nowrap">

					<table class="table table-borderless">
						<thead>
							<tr>
								<th style="width: 5%;">번호</th>
								<th style="width: 30%;">상품명</th>
								<th style="width: 5%;">가격</th>
								<th style="width: 30%;">상품소개</th>
								<th style="width: 10%;">카테고리</th>
								<th style="padding-left: 20px; width: 10%;">수정</th>
								<th style="padding-left: 20px; width: 10%;">삭제</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${list }" var="act">
								<tr class="lineheightTr">
									<td style="text-align: center;">${act.activityNo }</td>
									<td style="cursor: pointer;"
										onclick="move(${act.activityNo });">${act.activityName }</td>
									<td>${act.activityPrice }</td>
									<td style=" overflow-x:hidden; width: 30px;">${act.activityIntroduce }</td>

									<c:choose>
										<c:when test="${act.activityCategory eq 'DG'}">
											<td>디지털</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'FU'}">
											<td>주식/재테크</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'CR'}">
											<td>공예</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'DE'}">
											<td>디자인</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'EX'}">
											<td>운동</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'FS'}">
											<td>패션</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'ME'}">
											<td>미디어/유튜브</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'SO'}">
											<td>노래/악기</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'FO'}">
											<td>외국어</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'CO'}">
											<td>요리/제과제빵</td>
										</c:when>
										<c:when test="${act.activityCategory eq 'NO'}">
											<td>기타</td>
										</c:when>
									</c:choose>
									<td><input type="button" class="btn btn-primary"
										value="수정" onclick="activityUpdate(${act.activityNo})"></td>
									<td><input type="button" class="btn btn-warning"
										value="삭제" onclick="activityDelete(${act.activityNo})"></td>
								</tr>
							</c:forEach>

						</tbody>
					</table>
					<div id="pageNavi">${pageNavi }</div>
				</div>
			</div>
		</div>
	</div>




	<!-- / Content -->
	<!-- Footer Start -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- Footer End -->



	<div class="content-backdrop fade"></div>
	</div>
	<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->



	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script
		src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->

	<script>
    $("#allChkBox").on("click", function() {
		if ($("input[name=allChkBox]").is(":checked")) {
			$(".chk").prop("checked", true);
		} else {
			$(".chk").prop("checked", false);
		}
	});
    
    function move(number){
			location.href= "/activityDetail.do?activityNo="+number;
		}
    function activityUpdate(number){
    	location.href="/activityUpdateFrm.do?activityNo="+number;
    }
    
    function activityDelete(number){
    	
    	Swal.fire({
			  title: "선택한 목록을 삭제하시겠습니까??",//제목
			  icon: "warning",//아이콘
			  imageWidth: "30",
			  imageHeight: "30",
			  showCancelButton: true,
			  confirmButtonColor: '#3085d6',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
				//result.value == true이니까 트루일때만 실행하는거
			  if (result.value) {
				  location.href="/activityDelete.do?activityNo="+number;
			  }
			})//then끝
  
    }
    </script>
	<script async defer src="https://buttons.github.io/buttons.js"></script>
</body>
</html>
