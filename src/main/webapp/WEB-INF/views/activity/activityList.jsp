<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <link rel="icon" href="/resources/img/favicon-32x32.png">
<title>뉴시니어스 ACTIVITY</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">ACTIVITY</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0" style="width:270px; background-color: #fff; border-radius: 30px; margin: 0 auto; padding: 10px;">
                        <li class="breadcrumb-item" ><a href="/" style="cursor: pointer; color:#ffc107 !important;">Home</a></li>
                        <!-- 
                         <li class="breadcrumb-item"><a href="#" style="color:#6c757d;  cursor: pointer;">Pages</a></li>
                         -->
                        <li class="breadcrumb-item active" aria-current="page" style="color:#348E38;  cursor: pointer;">ACTIVITY</li>
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
                        <c:forEach items="${cateList}" var="cateList">
                        	<li class="mx-2 ${cateList.categoryCode } " data-filter="*"><a href="/activityList.do?activityCategory=${cateList.categoryCode }&reqPage=1" >${cateList.categoryName }</a></li>
                        </c:forEach>   
                    </ul>
                </div>
                     <div style="display: none;" class="category">${activityCategory }</div>
            </div>
            
            <div class="row g-4 portfolio-container">
            <c:forEach items="${list }" var="act">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" >
                        <img class="img-fluid class-img" src="resources/upload/activity/${act.filepath }" >
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
	$(document).ready(function(){
		const category = $(".category").text();
		const ul = $("#portfolio-flters");
		ul.children().removeClass("active");
		if(category == "AL"){
			ul.children().eq(0).addClass("active");
		}else{
			$("."+category).addClass("active");
		}
	});
		function activityDetail(activityNo) {
			location.href = "activityDetail.do?activityNo="+activityNo;
		}
		
	</script>
</body>
</html>