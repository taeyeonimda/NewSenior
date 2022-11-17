<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <!-- 구글아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <title>클래스 상세</title>
</head>
<style>
.changeFont{
	margin-left: 20px;
}
.changeFont>button:last-child{
	margin-left: 5px;
}
.amount-box{
	width: 82%;
	margin: 0 auto;
}
#priceBox>span{
	display: inline-block;
	height: 58px;
	line-height: 58px;
}

.product-title{
    text-align:center;
    display:table;
    border:1px solid #cecece;
    width: 460px;
    height: 1200px;
}
.product-img-div{
    display: table-cell;
    vertical-align: middle;
}
.product-img{
    width: 824px;
}

</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" style="background: linear-gradient(rgba(15, 66, 41, .6), rgba(15, 66, 41, .6)), url(../MAINbtstr/img/은비(5).jpg) center center no-repeat; background-size: cover;">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">${cla.className }</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item"><a href="#">Home</a></li>
                        <li class="breadcrumb-item"><a href=#">class</a></li>
                        <li class="breadcrumb-item active" aria-current="page">About</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
    <div class="page-content rounded">


        <!-- sideBar-->
        <div class="sidenav bg-light rounded p-sm-3 wow fadeIn">
            <div class="side-box rounded mt-3">
                <h3 class="side-title-box text-center text-dark">
                    ${cla.className }
                </h3>
                <div class="side-teacher-box text-secondary fs-5 fw-bold mb-4">
                    <span>${cla.teacherName }</span> 강사
                    <div style="display: none;" id="classTeacher">${cla.classTeacher }</div>
                    <div style="display: none;" id="classLimit">${cla.classLimit }</div>
                </div>
                <div class="side-info-box">
                    <ul>
                        <li class="mb-2"><span class="text-secondary fw-change">시작일 : ${cla.startDate }</span></li>
                        <li class="mb-2"><span class="text-secondary fw-change">종료일 : ${cla.endDate }</span></li>
                        <li class="mb-2"><span class="text-secondary fw-change">초급자 대상</span></li>
                        <c:choose>
                        	<c:when test="${cla.products eq 0 }">
                        		<li class="mb-4 fw-change"><span class="text-primary">준비물 없음</span></li>
                        	</c:when>
                        	<c:otherwise>
                        		<li class="mb-4 fw-change"><span class="text-primary">준비물 필요</span></li>
                        	</c:otherwise>
                        </c:choose>
                    </ul>
                </div>
                <c:choose>
                	<c:when test="${not empty sessionScope.m }">
                	<div class="side-select-box form-floating mb-4">
	                    <div class="amount-box">
		                    <select name="amount" class="bg-white border-0 fw-change" style="padding: 10px; padding-left: 30px; padding-right: 30px;" onchange="changePrice();">
		                        <option value='' selected>인원수</option>
		                        <option value=1>1인</option>
		                        <option value=2>2인</option>
		                        <option value=3>3인</option>
		                        <option value=4>4인</option>
		                        <option value=5>5인</option>
		                        <option value=6>6인</option>
		                    </select>
		                    <div id="priceBox" class="fw-change">
			                    <span>${cla.classPrice }</span>
			                    <span>원</span>
		                    </div>
		                    <span id="originalPrice" style="display: none;">${cla.classPrice }</span>
	                    </div>
	                </div>
	                <div class="mb-2">
	                	<button onclick="openConfirm('${cla.className }', ${cla.classNo }, ${sessionScope.m.memberNo });" class="btn btn-primary py-3 px-5 fw-change">신청하기</button>
	                </div>
                	</c:when>
                	<c:otherwise>
                	<div class="mb-2">
	                	<button class="btn btn-primary py-3 px-5" type="button">로그인이 필요한 서비스입니다</button>
	                </div>
                	</c:otherwise>
                </c:choose>
                
            </div>
        </div>
			

        <!-- class main -->
        <div class="container-xxl py-5 mt-5">
            <div class="container">
            	<div class="bg-white changeFont">
	            	<button class="btn btn-outline-secondary py-2 px-3" id="bigFont" onclick="bigger();">글씨크게</button><button class="btn btn-secondary py-2 px-3" onclick="smaller();" id="smallFont">글씨작게</button>
	            </div>
                <div class="class-row g-4">
                    <div class="col-md-8 wow fadeInUp" data-wow-delay="0.1s">
                    	<img class="img-fluid" src="/resources/upload/class/${cla.filepath }" alt="">
                    </div>
                </div>
                <div class="scroll-select-box" id="scroll-select">
                	<span><a href="#menu1" class="fw-change">커리큘럼</a></span><span><a href="#menu2" class="fw-change">강의소개</a></span><span><a href="#menu3" class="fw-change">강사소개</a></span><span><a href="#menu" class="fw-change">위치</a></span><span><a href="#menu4" class="fw-change">환불규정</a></span>
                </div>
            </div>
        </div>
        <!-- class-main End -->



        <!-- 강의소개 -->
        <div class="mb-5" id="menu1"></div>
        <div class="container-xxl py-5 mt-5">
            <div class="container">
                <div class="class-row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">${cla.teacherName } 강사와 함께하는 ${cla.className }</p>
                        <h1 class="display-5 mb-4">WE ARE NEW SENIOR!</h1>
                        <pre class="mb-4 font-set fw-change">${cla.curriculum }</pre>
                    </div>
                    <div class="product-title mt-5"  id="menu2">
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
        <div class="mb-5" id="menu3"></div>
        <div class="container-xxl py-5 mt-5">
            <div class="container class-container">
                <div class="class-row g-5 align-items-end">
                    <div class="col-lg-3 col-md-5 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">강사소개</p>
                        <img class="img-fluid rounded" data-wow-delay="0.1s" src="/resources/MAINbtstr/img/모델클래스 (1).jpg">
                    </div>
                    <div class="col-lg-7 col-md-7 wow fadeInUp" data-wow-delay="0.3s" style="margin-left: 30px;">
                        <h4 class="display-3 text-primary">${cla.teacherName }</h4>
                        <pre style="width: 70%;" class="fw-change">${cla.teacherIntroduce }</pre>
                    </div>
                </div>
            </div>
        </div>
        <!-- About End -->

      	
      	<!-- ajax로 가져옴 -->
      	<div class="container class-container">
      		<p class="fs-5 fw-bold text-primary">강사후기</p>
      		<div id="reviewBox">
      		<div>아직 후기가 없습니다</div>
        	</div>
      	</div>
      	
      	<div id="menu4" class="mb-5"></div>
      	<div class="container class-container">
      	<p class="fs-5 fw-bold text-primary">강의 장소</p>
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3161.85231936181!2d126.97964921507814!3d37.582095079794904!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca3f276c01ad9%3A0x4ecb88455e87f387!2z7Jik64m07ZWY7Jqw7Iqk!5e0!3m2!1sko!2skr!4v1668672793473!5m2!1sko!2skr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
		</div>
		
		<div id="menu5" class="mb-5"></div>
        <!-- 환불규정 -->
        <div class="container-xxl py-5 mt-5">
            <div class="container">
                <div class="class-row g-5 align-items-center">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s">
                        <p class="fs-5 fw-bold text-primary">환불규정</p>
                        <h6 class="display-5 mb-4 fw-change">시작 8일 전까지 100% 환불</h6>
                        <p class="mb-4 fw-change">
                            ㆍ모임시작 7일 ~ 2일 전까지 : 취소수수료 20% 공제 후 환불 <br>
                            ㆍ모임 시작일 1일 전 : 환불이 불가합니다. </p>
                    </div>
                </div>
            </div>
        </div>
        <!-- Features End -->
        <hr>


        <!-- 후기 -->
		<button id="review-btn" class="btn btn-primary py-3 px-5" style="display: none;">후기작성</button>
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
    			<p class="fs-5 fw-bold text-primary mt-2">[ ${cla.className } ]를 수강하셨습니다.</p>
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
            <form action="/insertClassReview.do" method="post" autocomplete="off" id="review-form">
                <input type="hidden" name="reviewRate" id="star">
                <input type="hidden" name="classTeacher" value="${cla.classTeacher }">
                <input type="hidden" name="classNo" value="${cla.classNo }">
                <input type="hidden" name="reviewWriter" value="${sessionScope.m.memberId }">
                <textarea name="reviewContent" id="review-textarea"></textarea>
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
    
    	// 글씨 크기 script
    	function bigger() {
			$("#bigFont").addClass("btn-secondary");
			$("#smallFont").removeClass("btn-secondary");
			$("#bigFont").removeClass("btn-outline-secondary");
			$("#smallFont").addClass("btn-outline-secondary");
			$(".fw-change").addClass("fs-5").addClass("fw-bold");
		}
    	function smaller() {
			$("#smallFont").addClass("btn-secondary");
			$("#bigFont").removeClass("btn-secondary");
			$("#smallFont").removeClass("btn-outline-secondary");
			$("#bigFont").addClass("btn-outline-secondary");
			$(".fw-change").removeClass("fs-5").removeClass("fw-bold");
		}

    	
    	
		$(document).ready(function($) {
		       $(".scroll_move").click(function(event){         
		               event.preventDefault();
		               $('html, body').animate({scrollTop:$(this.hash).offset().top}, 500);
		       })
		});
		
		
		
		
    	const classLimit = Number($("#classLimit").text());
    	
	    function openConfirm(className, classNo, memberNo){
	    	const amount = $("select[name=amount]").val();
	    	if(amount==''){
	    		alert("인원수를 선택하세요");
	    	}else{
	    		$.ajax({
	    			url : "/selectClassHistorySum.do",
	    			data : { classNo : classNo },
	    			type : "post",
	    			success : function(cnt) {
	    				// 현재 신청인원
	    				const num = Number(cnt)+Number(amount);
	    				const msg = "현재 가입인원은 "+cnt+"명, 총 가입할 수 있는 인원은 "+amount+"명 입니다" ; 
	    				if(classLimit>num){
	    					console.log("가입가능");
	    					const price = changeP.toLocaleString("ko-KR");
		    	    		const text = '선택된 인원은 '+amount+'명, 총 결제 금액은 '+price+'입니다        결제하시겠습니까?';
		    	    		Swal.fire({
		    					title: className,//제목
		    					text: text,
		    					imageUrl: "/resources/img/제목없음.png",
		    					showCancelButton: true,
		    					cancelButtonColor: '#525368',
		    					confirmButtonColor: '#348E38',
		    					cancelButtonText: '취소',
		    					confirmButtonText: '신청하기'
		    				}).then((result) => {
		    					//result.value == true이니까 트루일때만 실행하는거
		    				  if (result.value) {
		    		              location.href = "/payClass.do?classNo="+classNo+"&memberNo="+memberNo+"&amount="+amount;
		    				  }
		    				})//then끝
	    				}else{
	    					console.log("가입불가");
	    					Swal.fire({
		    					title: "신청인원을 초과하였습니다",//제목
		    					text: msg,
		    					imageUrl: "/resources/img/제목없음.png",
		    					showCancelButton: true,
		    					cancelButtonColor: '#525368',
		    					confirmButtonColor: '#348E38',
		    					cancelButtonText: '취소',
		    					confirmButtonText: '메인으로 이동'
		    				}).then((result) => {
		    					//result.value == true이니까 트루일때만 실행하는거
		    				  if (result.value) {
		    		              location.href = "/";
		    				  }
		    				})//then끝
	    				}
	    			}
	    	})
		}

	}
    	
    	function closeModal() {
    		$(".confirm-modal-wrap").css("display", "none");
		}
    
        function showSide(){
            const position  = $(window).scrollTop();

            let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
	        let windowHeight = window.innerHeight; // 스크린 창
            let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x, footer제외
            if(position > 3800){
                $(".sidenav").fadeOut(0);
            }else if(position > 250 ){ // 스크롤 위치 343보다 클 때만 보이겠다
                $(".sidenav").fadeIn(300);
            }else {
                $(".sidenav").fadeOut(0);
            }

            if(position > 7000 || 905 > position){
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
            getReview();
            changePrice();
        });

        
        
        let selectVal=0;
        let changeP=0;
     	// side select 가격 바꾸기 css
     	function changePrice(){
     		const div = $("#priceBox");
	    	selectVal = $("select[name=amount]").val();
	    	const originalPrice = $("#originalPrice").text(); // 기본값
	    	console.log(originalPrice);
	    	if(selectVal != ''){
	    		changeP = Number(selectVal)*Number(originalPrice);
	    		console.log(changeP);
	    		div.find('span').eq(0).text(changeP.toLocaleString("ko-KR"));
	    	}else{
	    		div.find('span').eq(0).text(originalPrice.toLocaleString("ko-KR"));
	    	}
		};

		
        // 리뷰 script
	    $("#review-btn").on("click", function(){
	        $(".rmodal-wrap").css("display", "flex");
	    })
		
	    $("#modal-btn-box>button:first-child").on("click",function(){
	        $(".rmodal-wrap").css("display", "none");
	        $(".comment-box>div:first-child").css("visibility", "hidden");
	        $(".comment-box>div:last-child>span").text("는 어떠셨나요?");
	        $("#star-box>span").css("color", "lightgrey");
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

	    
	    function getReview() {
			const reviewBox = $("#reviewBox");
			const classTeacher = $("#classTeacher").text();
			$.ajax({
				url : "/getTeacherReview.do",
				data : { classTeacher : classTeacher },
				success : function(list) {
					console.log(list.length);
					if(list.length>0){
						reviewBox.children().remove();
					}
					for(let i=0; i<list.length; i++){
						const div = $("<div>");
						div.addClass("shadow");
						div.addClass("reviewDiv");
						div.addClass("mb-5");
						const star = Number(list[i].reviewRate);
		                const profilDiv = $("<div>");
		                profilDiv.addClass("memberBox");
		                const profileImgDiv = $("<div>");
		                profileImgDiv.addClass("profile-box");
		                if(list[i].memberImg == null){
		                	profileImgDiv.html("<img src='/resources/upload/member/기본이미지.jpg' class='profile'>");
		                }else{
		                	profileImgDiv.html("<img src='/resources/upload/member/"+list[i].memberImg+"' class='profile'>");
		                }
		                const profilInfoDiv = $("<div>");
		                profilInfoDiv.addClass("profil-info");
		                profilInfoDiv.html("<div>"+star+"</div><div>"+list[i].reviewWriter+"</div><div>"+list[i].reviewDate+"</div>");
		                profilDiv.append(profileImgDiv).append(profilInfoDiv);
		                
		                const contentDiv = $("<div>");
		                contentDiv.html("<div class='mt-3'>"+list[i].reviewContent+"</div>");
		                // <div><a href='/'>수정</a> / <a href='/'>삭제</a></div>
		                div.append(profilDiv);
		                div.append(contentDiv);
		                reviewBox.append(div);
		            }
				}
			})
		}
	    
	    
	    
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
