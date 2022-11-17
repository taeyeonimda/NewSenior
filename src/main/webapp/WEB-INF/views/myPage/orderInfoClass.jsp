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

<style>
.forTr input,td{
	text-align : center;
}
</style>

<head>
    <meta charset="utf-8">
    <title>클래스 결제</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  <body>
    <!-- Layout wrapper -->
	<div class="page-content" style="left: 300px; flex-direction: row; border: none;">
		<!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" style="background: linear-gradient(rgba(15, 66, 41, .6), rgba(15, 66, 41, .6)), url(../MAINbtstr/img/은비(5).jpg) center center no-repeat; background-size: cover;">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLASS</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item active" aria-current="page">클래스 결제</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
		<div class="container-xxl flex-grow-1 container-p-y">
			<div class="table-responsive text-nowrap">
				<div style="width: 60%; margin: 0 auto;">
					<h3 class="mb-5">수강내역 확인</h3>
					<div style="width: 100%; margin: 0 auto; display: flex; justify-content: space-between;">
						<div style="width: 300px; height: 500px;">
							<img alt="" src="/resources/upload/class/${cla.filepath }" width="300px;" height="400px;" style="object-fit:cover;">
						</div>
						<div class="mt-5">
							<h5 class="mb-4">${cla.className } (${cla.startDate } ~ ${cla.endDate })</h5>
							<p>수강 시작일 : ${cla.startDate }</p>
							<p>수강 인원 : <span id="amount">${clh.amount }</span> 인</p>
							<p>수강 장소 : 시니어 클럽 잠실점</p>
							<p>결제할 총 금액</p>
							<p class="lastPrice" style="display: none;">${clh.payPrice }</p>
							<p class="showPrice"></p>
						</div>
					</div>
				</div>
				
				<div style="width: 60%; margin: 0 auto;" class="">
					<h3 class="mb-5">신청인 정보</h3>
					<table class="table table-borderless" style="width: 100%;">
						<tr class="mb-5">
							<th>신청인 이름</th><td>${sessionScope.m.memberName }</td>
						</tr>
						<tr class="mb-5">
							<th>전화번호</th><td>${sessionScope.m.memberPhone }</td>
						</tr>
						<tr class="mb-5">
							<th>이메일</th><td>${sessionScope.m.memberEmail }</td>
						</tr>
					</table>
				</div>
				
				<div style="margin: 10px; border-top: 1px solid #ddd;">
                    <button type="button" style="float: right; width:250px; height:40px; margin: 10px;" class="btn btn-outline-primary" id="payBtn">결제하기</button>
                    <div style="display: none;">${cla.classNo }</div>
                    <div style="display: none;">${sessionScope.m.memberNo }</div>
                </div>
			</div>
		</div>
	</div>
<!-- / Content -->



            <div class="content-backdrop fade"></div>

      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
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
    <script async defer src="https://buttons.github.io/buttons.js"></script>
   	<script>

		function showPriceSet() {
			const lastPrice = $(".lastPrice").text();
			const showPrice = lastPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
			$(".lastPrice").next().text(showPrice);
			$("#payBtn").text(showPrice+"원 결제");
		}

        $(function(){
        	showPriceSet();
        });

        
		$("#payBtn").on("click",function(){
			let amountNum = 0;
			const price = $(".lastPrice").text();
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			const classNo = $("#payBtn").next().text();
			const memberNo = $("#payBtn").next().next().text();
			const amountText =$("#amount").text();
			amountNum = Number(amountText);
			console.log(amountText);
			console.log(typeof amountNum);
			IMP.init("imp10385324");
			IMP.request_pay({
				pg: "html5_inicis",
				merchat_uid : "상품코드_"+date, 			// 거래 ID
				name : "결제 테스트",			  			// 결제 이름
				amount : price,							// 결제 금액
				buyer_email : "wnstjr5558@naver.com",	// 구매자 이메일
				buyer_name : "구매자",					// 구매자
				buyer_tel : "010-1234-1234",			// 구매자 전화번호
				buyer_addr : "서울시 영등포구 당산동",			// 구매자 주소
				buyer_postcode : "12345"				// 구매자 우편변호
			},function(rsp){
				if(rsp.success){
					location.href="/insertClassHistory.do?classNo="+classNo+"&memberNo="+memberNo+"&amount="+amountNum;
				}else{
					alert("결제 실패");
				}
			});
		});

	</script>
  </body>
</html>
