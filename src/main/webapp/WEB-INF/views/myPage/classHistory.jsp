<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html
  lang="ko"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
    <meta charset="utf-8">
    <title>Gardener - Gardening Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/JSbtstr/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/resources/JSbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  <body>
    <!-- Layout wrapper -->
    <div class="content-wrapper" style="left: 300px; flex-direction: row; ">
        <!-- Menu -->
<%@include file="/WEB-INF/views/common/aside.jsp" %>

        
        <!-- / Menu -->

        <!-- Layout container -->
          <!-- Content wrapper -->
            <!-- Content -->
            <div class="container-xxl flex-grow-1 container-p-y">
              <br><br><br>
              <div style="font-size: 25px;">진행중인 클래스</div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th>클래스명</th>
                        <th>강사</th>
                        <th>수강기간</th>
                        <th>남은 수강 기간</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list }" var="ch">
                    <tr>
                        <td>${ch.className }</td>
                        <td>${ch.classTeacher }</td>
                        <td>${ch.startDate } ~ ${ch.endDate }</td>
                        <td>${ch.dayDate}일</td>
                      </tr>
                    </c:forEach>
                    </tbody>
                  </table>
                </div>
              </div>
  
            <!-- / Content -->
            <br><br><br><br>
            <div style="font-size: 25px;">종료된 클래스</div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th>클래스명</th>
                        <th>강사</th>
                        <th>수강기간</th>
                        <th>후기</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${endList }" var="ech">
                    <tr>
                        <td>${ech.className }</td>
                        <td>${ech.classTeacher }</td>
                        <td>${ech.startDate } ~ ${ech.endDate }</td>
                        <td>
                          <div class="col-md-10">
                            <button type="button" id="review-btn" class="btn btn-outline-warning" 
                            style="width: 200px;" onclick="classReview(${ech.classNo});">후기작성</button>
                          </div>
                        </td>
                      </tr>
                    </c:forEach>
                     
                    </tbody>
                  </table>
                </div>
              </div>
              <script>
              	
              </script>

<!-- 후기 모달 -->
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
    			<p class="fs-5 fw-bold text-primary mt-2 reviewClassName">[ ${cla.className } ]를 수강하셨습니다.</p>
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
                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
                <textarea name="reviewContent" id="review-textarea"></textarea>
                <div id="modal-btn-box">
                    <button type="button" id="review-cancel" class="btn bc5">취소</button>
                    <button type="submit" id="review-submit" class="btn bc5">등록</button>
                </div>
            </form>
        </div>
    </div>
</div>




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
    <script type="text/javascript">
    /*후기*/    
     // 리뷰 script
	    
     /*$("#review-btn").on("click", function(){
	        $(".rmodal-wrap").css("display", "flex");
	        
	        /*$.ajax({
	        	url: "/selectClassName.do",
	        	data:{
	        		classNo:
	        	}
	        });
	    })*/
	    function classReview(number){
     		 $(".rmodal-wrap").css("display", "flex");
     		 
     		 $.ajax({
     			url:"/selectClassName.do",
     			data:{
     				classNo:number
     			},
     			success:function(data){
     				$(".reviewClassName").text(data.className);
     				$("[name=classTeacher]").val(data.classTeacher);
     				$("[name=classNo]").val(data.classNo);
     			}
     		 });//ajax끝
     	}
	    
		
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
		                	profileImgDiv.html("<img src='/resources/upload/class/iconmonstr-user-7-48.png' class='profile'>");
		                }else{
		                	profileImgDiv.html("<img src='/resources/upload/"+list[i].memberImg+"' class='profile'>");
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
  </body>
</html>
