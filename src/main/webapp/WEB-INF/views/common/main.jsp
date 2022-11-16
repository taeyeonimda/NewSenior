<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Gardener - Gardening Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
   
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">
    
    <!-- googleIcon -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">
    
    <!-- 폰트추가 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
	
    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/MAINbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/MAINbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/MAINbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/MAINbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/MAINbtstr/css/style.css" rel="stylesheet">
</head>
<style>
.speech-bubble {
	position: relative;
	background: #E8F5E9;
	border-radius: .4em;
	width: 450px;
	margin-right: 20px;
	padding: 30px;
	display: flex;
	flex-direction: column;
	justify-content: center;
}
.speech-bubble:after {
	content: '';
	position: absolute;
	right: 50;
	top: 50%;
	width: 0;
	height: 0;
	border: 54px solid transparent;
	border-right-color: #E8F5E9;
	border-left: 0;
	border-top: 0;
	margin-top: -27px;
	margin-left: -54px;
}


</style>
<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->

	<%@include file="/WEB-INF/views/common/header.jsp" %>


 <!-- Carousel Start -->
    <div class="container-fluid p-0 wow fadeIn" data-wow-delay="0.1s">
        <div id="header-carousel" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="w-100" src="/resources/MAINbtstr/img/yellowbackground.jpg" style="width:800px; height:800px;">
                    <div class="carousel-caption" style="background-color: rgba(15, 66, 41, .2);">
                        <div class="container">
                            <div class="row justify-content-center">
                            	<div style="width:86%;">
                                    <h1 class="display-5 text-white mb-5 animated slideInDown" style="text-align: left;">Not living young</h1>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                            	<div style="width: 96%;">
                                    <h1 class="display-5 text-white mb-5 animated slideInDown" style="text-align: right; padding-bottom: 20px;">but living as I am</h1>
                                </div>
                            </div>
                            <div class="row justify-content-center">
                                <div class="col-lg-8" style="height: 400px;">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="carousel-item">
                    <img class="w-100" src="/resources/img/은비7.jpg"  alt="Image" style="height:800px; object-fit:cover;">
                    <div class="carousel-caption" style="background-color: rgba(15, 66, 41, .2);">
                        <div class="container">
                            <div class="row justify-content-center">
                                <div class="col-lg-7">
                                	<h4 class="text-light">시니어 라이프 스타일 큐레이션</h4>
                                    <hr>
                                    <h1 class="display-1 text-white mb-5 animated slideInDown">NewSeniors</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#header-carousel"
                data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#header-carousel"
                data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
    </div>
    <!-- Carousel End -->

    <!-- Top Feature Start -->
    <div class="container-fluid top-feature py-5 pt-lg-0">
        <div class="container py-5 pt-lg-0">
            <div class="row gx-0">
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.1s">
                    <div class="bg-white shadow d-flex align-items-center h-100 px-5" style="min-height: 160px;">
                        <div class="d-flex">
                            <div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
                            	<i class="fa fa-users text-primary"></i>
                            </div>
                            <div class="ps-3">
                                <h4 class="loginCheck">온라인 동호회</h4>
                                <span>누구나 가입 가능한<br> 다양한 종류의 동호회가 가득!</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.3s">
                    <div class="bg-white shadow d-flex align-items-center h-100 px-5" style="min-height: 160px;">
                        <div class="d-flex">
                            <div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
                                <span class="material-symbols-outlined" style="font-weight : 900; color:#348e38;">directions_run</span>
                            </div>
                            <div class="ps-3">
                                <h4>클래스</h4>
                                <span>배움에는 끝이 없다! <br> 잘 배우고, 잘 늙어가는 뉴 시니어</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 wow fadeIn" data-wow-delay="0.5s">
                    <div class="bg-white shadow d-flex align-items-center h-100 px-5" style="min-height: 160px;">
                        <div class="d-flex">
                            <div class="flex-shrink-0 btn-lg-square rounded-circle bg-light">
                                <span class="material-symbols-outlined" style="font-weight : 900; color:#348e38;">school</span>
                            </div>
                            <div class="ps-3">
                                <h4>액티비티</h4>
                                <span>지루한 모임은 그만!<br> 활발한 활동을 좋아한다면 여기로!</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Top Feature End -->


    <!-- About Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-end">
                <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                    <img class="/resources/MAINbtstr/img-fluid rounded" data-wow-delay="0.1s" src="/resources/MAINbtstr/img/activeSenior.png" style="width:400px; height:564px;">
                </div>
                <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s" style="padding-left:130px;">
                    <h2 class="display-1 text-primary mb-0">NewSeniors</h2>
                    <p class="text-primary mb-4">─────────────────────────────</p>
                    <h1 class="display-5 mb-4">이달의 <br> 인기 동호회 TOP3</h1>
                    <p class="text-primary mb-4">─────────────────────────────</p>
                    <p class="mb-4">다양한 사람들과 다양한 활동을 즐겨보세요!</p>
                    <a class="btn btn-primary py-3 px-4" href="">자세히보기</a>
                </div>
                <div class="col-lg-3 col-md-12 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="row g-5">
                    <c:forEach items="${clubList }" var="cl" varStatus="i">
                        <div class="col-12 col-sm-6 col-lg-12">
                            <div class="border-start ps-4">
                                <div style="color:#348e38; font-size:45px; font-weight:900">${i.count }</div>
                                <h4 class="mb-3">${cl.clubName }</h4>
                                <p style="color:#0f4229; max-height:50px; text-overflow: ellipsis; overflow: hidden;">${cl.clubIntro }</p>
                            </div>
                        </div>
                    </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->

	<!-- Quote Start -->
    <div class="container-fluid my-5 py-5" data-parallax="scroll" data-image-src="/resources/MAINbtstr/img/various.jpg" style="height: 360px;">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->
    
    <!-- Features Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5 align-items-center">
                <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="fs-5 fw-bold text-primary">국내부터 해외까지!!</p>
                    <h1 class="display-5 mb-4">원하는곳 어디든!</h1>
                    <p class="mb-4">항공/숙박/관광까지 모두 포함!<br> 처음부터 끝까지 편하게 모시겠습니다</p>
                    <a class="btn btn-primary py-3 px-4" href="">자세히 보기</a>
                </div>
                <div class="col-lg-6">
                    <div class="row g-4 align-items-center">
                        <div class="col-md-6">
                            <div class="row g-4">
                                <div class="col-12 wow fadeIn" data-wow-delay="0.3s">
                                <a href="">
                                    <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                        <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                            <img src="/resources/MAINbtstr/img/jeju.jfif" style="width:200px;height:100px;">
                                        </div>
                                        <h4 class="mb-0">제주도 2박3일 패키지</h4>
                                    </div>
                                </a>
                                </div>
                                <div class="col-12 wow fadeIn" data-wow-delay="0.5s">
                                <a href="">
                                    <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                        <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                            <img src="/resources/MAINbtstr/img/japan.jpg" style="width:200px;height:100px;">
                                        </div>
                                        <h4 class="mb-0">일본 3박4일 패키지</h4>
                                    </div>
                                </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6 wow fadeIn" data-wow-delay="0.7s">
                        <a href="">
                            <div class="text-center rounded py-5 px-4" style="box-shadow: 0 0 45px rgba(0,0,0,.08);">
                                <div class="btn-square bg-light rounded-circle mx-auto mb-4" style="width: 90px; height: 90px;">
                                    <img src="/resources/MAINbtstr/img/thailand.jpg" style="width:200px;height:100px;">
                                </div>
                                <h4 class="mb-0">태국 4박5일 패키지</h4>
                            </div>
                        </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Features End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->
    
    <!-- Service Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                <p class="fs-5 fw-bold text-primary">NewSenior's Class</p>
                <h1 class="display-5 mb-5">클래스 5060의 모든것</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded d-flex h-100">
                        <div class="service-img rounded">
                            <img class="img-fluid" src="/resources/MAINbtstr/img/culture.png" alt="">
                        </div>
                        <div class="service-text rounded p-5">
                            <div class="btn-square rounded-circle mx-auto mb-3">
                                <img class="img-fluid" src="/resources/MAINbtstr/img/icon/icon-3.png" alt="Icon">
                            </div>
                            <h4 class="mb-3">문화·강연</h4>
                            <a class="btn btn-sm" href=""><i class="fa fa-plus text-primary me-2"></i>자세히보기</a><hr>
                            <h5 class="mb-3" style="font-weight:900; color:white;">지금은 뉴 시니어 세대!</h4>
                            <p class="mb-4" style="font-weight:900; color:white;">유명 시니어들에게 직접 듣는 인생 2막을 맞이한 그들의 이야기</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded d-flex h-100">
                        <div class="service-img rounded">
                            <img class="img-fluid" src="/resources/MAINbtstr/img/artclass2.jpg" alt="">
                        </div>
                        <div class="service-text rounded p-5">
                            <div class="btn-square rounded-circle mx-auto mb-3">
                                <img class="img-fluid" src="/resources/MAINbtstr/img/icon/icon-3.png" alt="Icon">
                            </div>
                            <h4 class="mb-3">취미·교육</h4>
                            <a class="btn btn-sm" href=""><i class="fa fa-plus text-primary me-2"></i>자세히보기</a><hr>
                            <h5 class="mb-3" style="font-weight:900; color:white;">청바지! 청춘은! 바로! 지금!</h4>
                            <p class="mb-4" style="font-weight:900; color:white;">나의 시간을 더 사랑하게 만드는 취미 클래스</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="service-item rounded d-flex h-100">
                        <div class="service-img rounded">
                            <img class="img-fluid" src="/resources/MAINbtstr/img/phone.jpg" alt="">
                        </div>
                        <div class="service-text rounded p-5">
                            <div class="btn-square rounded-circle mx-auto mb-3">
                                <img class="img-fluid" src="/resources/MAINbtstr/img/icon/icon-3.png" alt="Icon">
                            </div>
                            <h4 class="mb-3">커뮤니티</h4>
                            <a class="btn btn-sm" href=""><i class="fa fa-plus text-primary me-2"></i>자세히보기</a><hr>
                            <h5 class="mb-3" style="font-weight:900; color:white;">비슷한 성향을 가진 친구들</h4>
                            <p class="mb-4" style="font-weight:900; color:white;">비슷한 관심사를 가진 사람들과 교류하는 온라인 동호회</p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- Service End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->

    <!-- Quote Start -->
    <div class="container-fluid my-5 py-5" data-parallax="scroll" data-image-src="/resources/img/bgImg.png" style="height: 400px;">
        <div class="container py-5">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Quote End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->

    <!-- Team Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px; height:200px;">
                <p class="fs-5 fw-bold text-primary">NewSenior</p>
                <h1 class="display-5">이 달의 우수 강사</h1>
            </div>
            <div class="row g-4">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="/resources/MAINbtstr/img/team-1.jpg" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">이은비 강사님</h4>
                            <p class="text-primary">라떼 산책시키기 클래스</p>
                            <div class="team-social d-flex">
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.3s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="/resources/MAINbtstr/img/team-2.jpg" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">박현주 강사님</h4>
                            <p class="text-primary">소맥말기 액티비티</p>
                            <div class="team-social d-flex">
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="team-item rounded">
                        <img class="img-fluid" src="/resources/MAINbtstr/img/team-3.jpg" alt="">
                        <div class="team-text">
                            <h4 class="mb-0">박혜진 강사님</h4>
                            <p class="text-primary">포켓몬 뽑기 동호회</p>
                            <div class="team-social d-flex">
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                                <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-instagram"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->
    

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->

    <!-- Testimonial Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-5 wow fadeInUp" data-wow-delay="0.1s">
                    <p class="fs-5 fw-bold text-primary">interview</p>
                    <h2 class="display-5 mb-5">인생 2막을 즐기는<br> 진정한 NewSeinor!</h2>
                    <p class="mb-4">유명 시니어들에게 직접 듣는 인생 2막을 맞이한 그들의 이야기</p>
                    <a class="btn btn-primary py-3 px-4" href="">자세히보기</a>
                </div>
                <div class="col-lg-7 wow fadeInUp" data-wow-delay="0.5s">
                    <div class="owl-carousel testimonial-carousel">
                        <div class="testimonial-item" style="display: flex; justify-content: space-between;">
                        	<div>
                        		<img class="img-fluid rounded mb-3" src="/resources/MAINbtstr/img/시니모델3.jpg" alt="">
	                            <p class="fs-5">무신사의 시니어 모델</p>
	                            <h4>모델</h4>
	                            <span>김칠두</span>
                        	</div>
                        	<div class="speech-bubble">
                        		<p style="font-family: 'Nanum Brush Script', cursive; font-size: 30px; text-align: center;">"간절함은 모든 것을 이겨요.<br>마음속에 품은 꿈이나 희망이 있다면 뭐든 도전하기를 바라요."</p>
                        	</div>
                        </div>
                        <div class="testimonial-item" style="display: flex; justify-content: space-between;">
                        	<div>
                        		<img class="img-fluid rounded mb-3" src="/resources/MAINbtstr/img/시니모델2.PNG" alt="">
	                            <p class="fs-5">78살에 데뷔</p>
	                            <h4>시니어 모델</h4>
	                            <span>최순화</span>
                        	</div>
                        	<div class="speech-bubble">
                        		<p style="font-family: 'Nanum Brush Script', cursive; font-size: 30px; text-align: center;">"나를 보면서<br>'70대 노인도 하는데 나는 왜 못 해?'라는<br>생각을 하고 용기 내서 나아가길 바랍니다."</p>
                        	</div>
                        </div>
                        <div class="testimonial-item" style="display: flex; justify-content: space-between;">
                        	<div>
                        		<img class="img-fluid rounded mb-3" src="/resources/MAINbtstr/img/시니모델1.jpg" alt="">
	                            <p class="fs-5">127만 구독자 달성</p>
	                            <h4>유튜버</h4>
	                            <span>박막례</span>
                        	</div>
                        	<div class="speech-bubble">
                        		<p style="font-family: 'Nanum Brush Script', cursive; font-size: 30px; text-align: center;">"뼈만 안 다치면 추억이다."</p>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Testimonial End -->

	<!-- 여백 -->
    <div class="container-xxl py-4">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-7">
                    <div></div>
                </div>
            </div>
        </div>
    </div>
    <!-- 여백 End -->
    
    <!-- Footer Start -->
    <div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s">
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


    <!-- Copyright Start -->
    <div class="container-fluid copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">Your Site Name</a>, All Right Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a class="border-bottom" href="https://htmlcodex.com">HTML Codex</a> Distributed By <a href="https://themewagon.com">ThemeWagon</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Copyright End -->


    <!-- Back to Top -->
    
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/MAINbtstr/lib/wow/wow.min.js"></script>
    <script src="/resources/MAINbtstr/lib/easing/easing.min.js"></script>
    <script src="/resources/MAINbtstr/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/MAINbtstr/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/MAINbtstr/lib/counterup/counterup.min.js"></script>
    <script src="/resources/MAINbtstr/lib/parallax/parallax.min.js"></script>
    <script src="/resources/MAINbtstr/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="/resources/MAINbtstr/lib/lightbox/js/lightbox.min.js"></script>
    <!-- Template Javascript -->
    <script src="/resources/MAINbtstr/js/main.js"></script>
    <c:if test="${param.login ==1}">
    <script>
    	  $(".popup_bg00").stop().fadeIn();
          $(".popup00.personal_pop00").stop().fadeIn();
          $("body").addClass("bg_g");
          
		$(".loginCheck").on("click", function() {
			$(".loginBtn").click();
		})
    </script>
    </c:if>
    
</body>

</html>