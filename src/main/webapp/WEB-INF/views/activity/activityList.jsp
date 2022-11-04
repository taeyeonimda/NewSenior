<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
<title>class</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLASS</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="">Pages</a></li>
                        <li class="breadcrumb-item active" aria-current="page">클래스</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->

    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">새로운 나를 발견하는 재미</p>
                <h1 class="display-5 mb-5">Enjoy My Life!</h1>
            </div>
            
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <li class="mx-2 active" data-filter="*">All</li>
                        <li class="mx-2" data-filter=".first">디지털</li>
                        <li class="mx-2" data-filter=".second">주식/재테크</li>
                        <li class="mx-2" data-filter=".second">공예</li>
                        <li class="mx-2" data-filter=".second">운동/건강</li>
                        <li class="mx-2" data-filter=".second">디자인</li>
                        <li class="mx-2" data-filter=".second">패션</li>
                        <li class="mx-2" data-filter=".second">미디어</li>
                        <li class="mx-2" data-filter=".second">악기/노래</li>
                        <li class="mx-2" data-filter=".second">외국어</li>
                        <li class="mx-2" data-filter=".second">요리/제과제빵</li>
                    </ul>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
            <a href="/activity2.do">이동~</a>
            <c:forEach items="${list }" var="act">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" >
                        <img class="img-fluid class-img" src="/resources/upload/activity/${act.filepath }" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">${act.activityName }</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="/resources/upload/activity/${act.filepath }" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-lg-square rounded-circle mx-2" onclick="activityDetail(${act.activityNo });"><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
    <!-- Projects End -->
 	<!--page-start-->
 	${pageNavi }
 	<!--page-end-->
    <!--page-content End-->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>

		function activityDetail(activityNo) {
			location.href = "activityDetail.do?activityNo="+activityNo;
		}
		
	</script>
</body>
</html>