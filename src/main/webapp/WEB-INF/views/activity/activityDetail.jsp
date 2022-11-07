<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
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
        <div class="sidenav bg-primary rounded p-sm-3 wow fadeIn" style="width:360px; height:400px; opacity: 0.9">
            <div class="side-box rounded">
                <h6 class="side-title-box display-5 text-center text-light">
                 	${act.activityName}
                </h6>
                <div class="side-teacher-box" style="text-align: center; color:white; margin-bottom:70px;"> 
                    <span>담당자 : ${act.activityManagerName}</span>
                </div>
          		
                <div class="side-select-box form-floating mb-4"> 
                    <div class="amount-box">
	                    <select name="amount" id="amountSelect" class="bg-white border-0" style="width:150px; padding: 0; padding-left: 30px; padding-right: 30px;">
	                        <option value="1" selected>1인</option>
	                        <option value="2">2인</option>
	                        <option value="3">3인</option>
	                        <option value="4">4인</option>
	                        <option value="5">5인</option>
	                        <option value="6">6인</option>
	                    </select>
	                    <span id="amountPrice" style="width:150px; color: white;">${act.activityPrice }</span>
	                    <script>
	                    $(function(){
	                    	const amount = $("[name=amount]").val()
	                    	const amountPrice ='${act.activityPrice }';
	                    	const amountPrice2 ='${act.activityPrice }';
	                    	console.log("amountPrice2값:::::"+amountPrice2)
	                    	const splits = amountPrice2.split(',');
	                    	let realPrice ="";
	                    	
	                    	console.log(splits);
	                    	for(let i=0;i<splits.length;i++){
	                    		realPrice += splits[i];
	                    	}
	                    	
	                  
                    		
                    		$("#realAmount").text(amount*realPrice);
	                    });
	                 
	                    
	                    
	                    	$("#amountSelect").on("change",function(){
	                    		const amount = $("[name=amount]").val()
		                    	const amountPrice ='${act.activityPrice }';
		                    	const amountPrice2 ='${act.activityPrice }';
		                    	console.log("amountPrice2값:::::"+amountPrice2)
		                    	const splits = amountPrice2.split(',');
		                    	let realPrice ="";
		                    	
		                    	console.log(splits);
		                    	for(let i=0;i<splits.length;i++){
		                    		realPrice += splits[i];
		                    	}
		                    	
		                  
	                    		
	                    		$("#realAmount").text(amount*realPrice);
	                    	})
	    					
	                    </script>
                    </div>
                </div>
                <div>
                <span style="display: flex; justify-content: center;">
                	<div style="color:white; line-height:58px"><span>총합 : </span><span id="realAmount"></span><span> 원</span></div>
                    <button class="btn btn-primary py-3 px-5" style="background-color:#9BA17B; margin-left:20px">신청하기</button>
                    </span>
                </div>
            </div>
        </div>
        <!-- sideBar End-->
        <!-- class main -->
        <div class="container-xxl py-5 mt-5">
            <div class="container">
				<div class="class-row g-4">
					<div class="col-xl-12 wow fadeInUp" data-wow-delay="0.1s" style= "display: flex">
						<div class="col-xl-6 team-item rounded class-item"
							style=" height: auto; margin: auto;">
							<img style="width:580px; height:580px;"class="img-fluid" src="/resources/upload/activity/${act.filepath }" alt="">
						</div >
						
						<div class="col-xl-6 team-item rounded class-item" style="font-size:1.1em; ">
						
						<h1>${act.activityName }</h1>
						<h3>${act.activityPrice }원</h3>
						<br><br><br><br><br>
						<p><strong style="font-size:1.3em">담당자</strong><h3>${act.activityManagerName }	님</h3></p>
						<p><span>시작일:  ${act.startDate }</span></p> 
						<p><span>종료일: ${act.endDate }</span></p>
						
						
						
						</div>
					</div>
				</div>
				<!-- scroll bar start -->
				<!-- 
				<div class="scroll-select-box" id="scroll-select" style="border:1px dotted #6c757d; width: 1250px">
                	<span>강사소개</span><span><a href="#menu2">강의소개</a></span><span><a href="#menu3">준비물</a></span><span><a href="#menu4">환불규정</a></span><span><a href="#menu5">후기</a></span>
                	  
                </div> -->
                <!-- scroll bar end -->
            </div>
            
        </div>
        <!-- class-main End -->
		<hr>


        <!-- 강의소개 -->
         
        <div class="container-xxl py-5 mt-5" id="#menu1"  >
            <div class="container">
                <div class="class-row g-5 ">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" >
                        <p class="fs-5 fw-bold text-primary">담당자 : ${act.activityManagerName }님과 함께하는</p>
                        <h1 class="display-5 mb-4">액티비티 활동!</h1>
                        
                        <c:forEach items="${act.fileList }" var="details">
                        <p class="mb-4"><img src="resources/upload/activity/${details.filepath }"/></p>
                        </c:forEach>    
                    </div>
                   
                </div>
            </div>
            
        </div>
        <hr>
        <!-- Features End -->

        <!-- 강사 소개 -->
        <div class="container-xxl py-1 mt-1" id="#menu2">
       	<div class="class-row g-5">
              
                       
                        <h4 class="display-6 mb-4"></h4>
                        <pre class="mb-4" style="font-size:1.2em; font-weight:bold;">${act.activityDetail}</pre>
              </div>
           
        </div>
        <!-- About End -->
        
        
        <!-- 클래스 준비물 -->
        
        <!-- 
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
                                    <span>바로 구매하러 가기 > </span>
                                    <a class="btn btn-square rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
         -->
        <!-- Team End -->

        <!-- 환불규정 -->
        
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
        <div class="modal-top">
            <h1>리뷰쓰기</h1>
        </div>
        <div class="modal-content">
            <div id="star-box">
                <span class="material-icons">star</span>
                <span class="material-icons">star</span>
                <span class="material-icons">star</span>
                <span class="material-icons">star</span>
                <span class="material-icons">star</span>
            </div>
            <div class="comment-box">
                <div><span class="real-score"></span>점 주셨네요</div>
                <div>클래스는 <span>어땠나요?</span></div>
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
                $(".sidenav").fadeOut(1);
            }else if(position > 250 ){ // 스크롤 위치 343보다 클 때만 보이겠다
                $(".sidenav").fadeIn(300);
                console.log(fullHeight);
            }else {
                $(".sidenav").fadeOut(1);
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
	        $("#star-box").css("visibility", "hidden");
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
	            commentSpan.text("어떤 점이 좋았나요?");
	        }else{
	            commentSpan.text("어떤 점이 아쉬웠나요?");
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
