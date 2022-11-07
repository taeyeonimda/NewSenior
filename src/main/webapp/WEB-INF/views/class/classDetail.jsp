<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <!-- 구글아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>클래스 상세</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" stydata-wow-delay="0.1s" style="background: linear-gradient(rgba(15, 66, 41, .6), rgba(15, 66, 41, .6)), url(/img/다운로드\ \(2\).jpg) center center no-repeat; background-size: cover;">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">${cla.className }</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href="/class-list.html">class</a></li>
                        <li class="breadcrumb-item active" aria-current="page">About</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
    <div class="page-content rounded">


        <!-- sideBar-->
        <div class="sidenav bg-light rounded p-sm-3 wow fadeIn">
            <div class="side-box rounded">
                <h1 class="side-title-box text-center text-dark">
                    ${cla.className }
                </h1>
                <div class="side-teacher-box text-secondary fs-5 fw-bold">
                    <span>${cla.teacherName }</span> 강사
                </div>
                <div class="side-info-box">
                    <ul>
                        <li><span class="fs-5 text-secondary">초급자 대상</span></li>
                        <li><span class="fs-5 text-secondary">${cla.startDate } ~ ${cla.endDate }</span></li>
                        <c:choose>
                        	<c:when test="${cla.products eq 0 }">
                        		<li><span class="fs-5 text-secondary">준비물 없음</span></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li><span class="fs-5 text-secondary">준비물 필요</span></li>
                        	</c:otherwise>
                        </c:choose>
                        
                    </ul>
                </div>
                <div class="side-select-box form-floating mb-4">
                    <div class="amount-box">
	                    <select name="amount" class="bg-white border-0" style="padding: 0; padding-left: 30px; padding-right: 30px;">
	                        <option value='' selected>인원수</option>
	                        <option value="1">1인</option>
	                        <option value="2">2인</option>
	                        <option value="3">3인</option>
	                        <option value="4">4인</option>
	                        <option value="5">5인</option>
	                        <option value="6">6인</option>
	                    </select>
	                    <span>${cla.classPrice }원</span>
                    </div>
                </div>
                <div>
                    <button class="btn btn-primary py-3 px-5">신청하기</button>
                </div>
            </div>
        </div>


        <!-- class main -->
        <div class="container-xxl py-5 mt-5">
            <div class="container">
                <div class="class-row g-4">
                    <div class="col-md-8 wow fadeInUp" data-wow-delay="0.1s">
                    	<img class="img-fluid" src="/resources/upload/class/${cla.filepath }" alt="">
                    </div>
                </div>
                <div class="scroll-select-box" id="scroll-select">
                	<span>강의소개</span><span><a href="#menu2">강사소개</a></span><span><a href="#menu3">준비물</a></span><span><a href="#menu4">환불규정</a></span><span><a href="#menu5">후기</a></span>
                </div>
            </div>
        </div>
        <!-- class-main End -->



        <!-- 강의소개 -->
        <div class="container-xxl py-5 mt-5" id="#menu1">
            <div class="container">
                <div class="class-row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">${cla.teacherName } 강사와 함께하는 ${cla.className }</p>
                        <h1 class="display-5 mb-4">WE ARE NEW SENIOR!</h1>
                        <p class="mb-4">${cla.curriculum }</p>
                        <a class="btn btn-primary py-3 px-4" href="">Explore More</a>
                    </div>
                    <div class="product-title mt-5">
                        <div class="product-img-div">
                        	<c:forEach items="${cla.fileList }" var="cf">
                        		<img class="product-img" src="/resources/upload/class/${cf.filepath }">
                        	</c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features End -->

        <!-- 강사 소개 -->
        <div class="container-xxl py-5 mt-5" id="#menu2">
            <div class="container class-container">
                <div class="class-row g-5 align-items-end">
                    <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">강사소개</p>
                        <img class="img-fluid rounded" data-wow-delay="0.1s" src="/resources/MAINbtstr/img/모델클래스 (1).jpg">
                    </div>
                    <div class="col-lg-6 col-md-7 wow fadeInUp" data-wow-delay="0.3s" style="margin-left: 30px;">
                        <h4 class="display-3 text-primary mb-0">${cla.teacherName }</h4>
                        <p class="text-primary mb-4">Year of Experience</p>
                        <h4 class="display-6 mb-4">"당당하게 걸어요"</h4>
                        <textarea>${cla.teacherIntroduce }</textarea>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->
        
        
        <!-- 클래스 준비물 -->
        <div class="container-xxl py-5 mt-5" id="#menu3">
            <div class="container">
                <div class="class-row g-5 align-items-end">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                        <p class="fs-5 fw-bold text-primary">클래스 준비물</p>
                        <h1 class="display-5 mb-5"><span>1</span> 건 있어요</h1>
                    </div>
                </div>
                <div class="row g-4">
                    <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.5s">
                        <div class="team-item rounded class-item">
                            <img class="img-fluid class-img" src="/resources/MAINbtstr/img/person_1.jpg" alt="">
                            <div class="team-text">
                                <h4 class="mb-0">왕 밝은 미소</h4>
                                <p class="text-primary">20000</p>
                                <div class="team-social d-flex">
                                    <span>장바구니 담기 > </span>
                                    <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Team End -->

        <!-- 환불규정 -->
        <div class="container-xxl py-5 mt-5" id="#menu4">
            <div class="container">
                <div class="class-row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">환불규정</p>
                        <h6 class="display-5 mb-4">시작 8일 전까지 100% 환불</h6>
                        <p class="mb-4">
                            ㆍ모임시작 7일 ~ 2일 전까지 : 취소수수료 20% 공제 후 환불 <br>
                            ㆍ모임 시작일 1일 전 : 환불이 불가합니다. </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features End -->
        <hr>
        <!-- 후기 -->
        <div class="container-xxl py-5 mt-5" id="#menu5">
            <div class="container">
                <div class="row g-5">
                    <div class="flex-space-between">
                        <div id="total-star">총 별점 : <span>★★★★★</span></div>
                        <div>
                            <button id="review-btn" class="btn btn-primary py-3 px-5">후기작성</button>
                        </div>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <div class="profil-title">
                        <div class="profil-img-div">
                            <img src="img/person_1.jpg" class="profil-img">
                        </div>
                        <div class="profil-info-div">
                            <div>★★★★★</div>
                            <div>닉네임</div>
                            <div>작성일</div>
                        </div>
                    </div>
                    <div>
                        <div>컨텡층ㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
                        <div>수정 / 삭제</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--page-content End-->
<div class="rmodal-wrap">
    <div class="modal-review">
    	<div class="modal-review-info">
    		<div>
    			<h1 class="display-5 mb-4">WE ARE NEW SENIOR!</h1>
    			<div class="review-title">
    				<div class="review-img-div">
    					<img src="/resources/upload/class/New_Year.png" class="review-img">
    				</div>
    			</div>
    			<p class="fs-5 fw-bold text-primary mt-2">[ ${cla.className } ]를 수강하셨습니다</p>
    		</div>
    	</div>
        <div class="review-content">
	        <div class="modal-top">
	            <h1>리뷰쓰기</h1>
	        </div>
            <div id="star-box">
                <span class="material-symbols-outlined">hotel_class</span>
                <span class="material-symbols-outlined">hotel_class</span>
                <span class="material-symbols-outlined">hotel_class</span>
                <span class="material-symbols-outlined">hotel_class</span>
                <span class="material-symbols-outlined">hotel_class</span>
            </div>
            <div class="comment-box">
                <div><span class="real-score"></span>점 주셨네요</div>
                <div>클래스<span>는 어떠셨나요?</span></div>
            </div>
            <form action="/insertDoctorReview.do" method="post" autocomplete="off" id="review-form">
                <input type="hidden" name="star" id="star">
                <input type="hidden" name="doctorId">
                <input type="hidden" name="bookNo">
                <input type="hidden" name="memberNo">
                <textarea name="review" id="review-textarea"></textarea>
                <div id="modal-btn-box">
                    <button type="button" id="review-cancel" class="btn bc5">취소</button>
                    <button type="submit" id="review-submit" class="btn bc5">등록</button>
                </div>
            </form>
        </div>
    </div>
</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>



    <!-- side-bar script-->
    <script>
        function showSide(){
            const position  = $(window).scrollTop();
            console.log(position);
            let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	        let windowHeight = window.innerHeight; // 스크린 창
            let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x, footer제외
            if(position > 3800){
                $(".sidenav").fadeOut(0);
            }else if(position > 250 ){ // 스크롤 위치 343보다 클 때만 보이겠다
                $(".sidenav").fadeIn(300);
                console.log(fullHeight);
            }else {
                $(".sidenav").fadeOut(0);
            }

            if(position > 4000 || 905 > position){
                $("#scroll-select").removeClass("scroll-select-box-fixed");
            }else if(position > 905){
                $("#scroll-select").addClass("scroll-select-box-fixed");
            }
        }
        
        $(window).on("scroll",function(){
            showSide();
	        // let fullHeight = document.body.scrollHeight-1000; //  margin 값은 포함 x, footer제외
        });

        $(function(){
            showSide();
        });

       
        
        // 리뷰 script
	    $("#review-btn").on("click", function(){
	        $(".rmodal-wrap").css("display", "flex");
	    })
		
	    $("#modal-btn-box>button:first-child").on("click",function(){
	        $(".rmodal-wrap").css("display", "none");
	        $(".comment-box>div:last-child>span").css("visibility", "hidden");
	        $("#star-box").children().css("color", "lightgrey");
	    })
		
	    const starBox = $(".comment-box>div:first-child");
	    const stars = $("#star-box>span"); // star아이콘모음
	    stars.on("mouseover", function(){
	        const idx = stars.index(this);
	        stars.each(function(index, item){
	            if(idx>=index){ //마우스가 올라간 인덱스보다 작거나 같으면
	                $(item).css("color", "rgb(255, 197, 0)");
	            }else{
	                $(item).css("color", "lightgrey");
	            }
	        })
	    });
		
	    stars.on("mouseleave", function(){
	        const realScore = Number($(".real-score").text());
	        const starInput = $("#star");
	        starInput.val(realScore);
	        stars.each(function(index, item){
	            if(realScore>index){
	                $(item).css("color", "rgb(255, 197, 0)");
	            }else{
	                $(item).css("color", "lightgrey");
	            }
	        })
	    })
	
	    stars.on("click", function(){
	        const idx = stars.index(this);
	        $(".real-score").text(idx+1);
	        starBox.css("visibility", "visible");
	        const commentSpan = $(".comment-box>div:last-child>span");
	        if(idx>1){
	            commentSpan.text("의 어떤 점이 좋았나요?");
	        }else{
	            commentSpan.text("의 어떤 점이 아쉬웠나요?");
	        }
	    })

    </script>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>
    <script src="lib/isotope/isotope.pkgd.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <!-- Template Javascript -->

    <script src="js/main.js"></script>
</body>
</html>
