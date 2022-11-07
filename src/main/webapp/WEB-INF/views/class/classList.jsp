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
        <div class="container-fluid page-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
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
                        <li class="mx-2" data-filter="*"><a href="/classList.do?classCategory=ALL&reqPage=1">ALL</a></li>
                        <li class="mx-2 DG" data-filter=".first"><a href="/classList.do?classCategory=DG&reqPage=1">디지털</a></li>
                        <li class="mx-2 FU" data-filter=".second"><a href="/classList.do?classCategory=FU&reqPage=1">주식/재테크</a></li>
                        <li class="mx-2 CR" data-filter=".second"><a href="/classList.do?classCategory=CR&reqPage=1">공예</a></li>
                        <li class="mx-2 DE" data-filter=".second"><a href="/classList.do?classCategory=DE&reqPage=1">디자인</a></li>
                        <li class="mx-2 EX" data-filter=".second"><a href="/classList.do?classCategory=EX&reqPage=1">운동/건강</a></li>
                        <li class="mx-2 FS" data-filter=".second"><a href="/classList.do?classCategory=FS&reqPage=1">패션</a></li>
                        <li class="mx-2 ME" data-filter=".second"><a href="/classList.do?classCategory=ME&reqPage=1">미디어</a></li>
                        <li class="mx-2 SO" data-filter=".second"><a href="/classList.do?classCategory=SO&reqPage=1">악기/노래</a></li>
                        <li class="mx-2 FO" data-filter=".second"><a href="/classList.do?classCategory=FO&reqPage=1">외국어</a></li>
                        <li class="mx-2 CO" data-filter=".second"><a href="/classList.do?classCategory=CO&reqPage=1">요리/제과제빵</a></li>
                    </ul>
                    <div style="display: none;" class="category">${classCategory }</div>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
            <c:forEach items="${clist }" var="cla" varStatus="i">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" onclick="classDetail(${cla.classNo });">
                        <img class="img-fluid class-img" src="/resources/upload/class/${cla.filepath }" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">${cla.className }</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="/resources/upload/class/${cla.filepath }" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-lg-square rounded-circle mx-2" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
    </div>
    <!-- Projects End -->


	<div>
		${pageNavi }
	</div>
	
	
   
	</div> <!--page-content End-->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	
	<script>

	$(document).ready(function(){
		const category = $(".category").text();
		const ul = $("#portfolio-flters");
		ul.children().removeClass("active");
		if(category == "ALL"){
			ul.children().eq(0).addClass("active");
		}else{
			$("."+category).addClass("active");
		}
	});

	function classDetail(classNo) {
		location.href = "classDetail.do?classNo="+classNo;
	}
		
	</script>
</body>
</html>