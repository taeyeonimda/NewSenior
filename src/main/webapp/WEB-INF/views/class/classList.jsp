<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <link rel="icon" href="/resources/img/favicon-32x32.png">
<title>뉴시니어스 CLASS</title>
</head>
<style>
.classHover:hover{
	cursor: pointer;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid club-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLASS</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0" style="width:150px; background-color: #fff; border-radius: 30px; margin: 0 auto; padding: 10px;">
                        <a href="/"><li class="breadcrumb-item text-light home"  style="color:#ffc107 !important;">Home</li></a>/
                       <a onclick="location.href='/classList.do?classCategory=AL&reqPage=1'" style="cursor: pointer;"><li class="breadcrumb-item active  text-light cls" aria-current="page" style="color:#0F4229 !important;">클래스</li></a>
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
                        	<li class="mx-2 ${cateList.categoryCode }" data-filter="*"><a href="/classList.do?classCategory=${cateList.categoryCode }&reqPage=1">${cateList.categoryName }</a></li>
                        </c:forEach>   
                    </ul>
        	   </div>
                    <div style="display: none;" class="category">${classCategory }</div>
                </div>
            </div>
            
            
            
            <div class="row g-4 portfolio-container">
            <c:forEach items="${clist }" var="cla" varStatus="i">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded classHover" onclick="classDetail(${cla.classNo });">
                        <img class="img-fluid class-img" style="width:408px; height:408px;" src="/resources/upload/class/${cla.filepath }" alt="">
                        <div class="portfolio-text">
                        	<hr>
                            <h3 class="display-6 text-white mb-4">${cla.className }</h3>
                            <h5 class="text-light mb-4 fw-bold">${cla.classPrice } 원</h5>
                            <hr>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
            
            
            
        </div>

    <!-- Projects End -->
	<div class="container-xxl">
        <div class="container">
        ${pageNavi }
        </div>
    </div>



	</div> <!--page-content End-->
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

	function classDetail(classNo) {
		location.href = "classDetail.do?classNo="+classNo;
	}
	
	
	</script>
</body>
</html>