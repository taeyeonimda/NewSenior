<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link href="/resources/css/class/class-detail.css" rel="stylesheet">
    <link href="/resources/css/activity/activityDetail.css" rel="stylesheet">
    <link rel="icon" href="/resources/img/favicon-32x32.png">
    <title>뉴시니어스</title>
    <style type="text/css">
    //얇음
			@font-face {
			    font-family: 'LeferiPoint-WhiteObliqueA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			//두껍
			@font-face {
			    font-family: 'GangwonEduPowerExtraBoldA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			//물많이
			@font-face {
		    font-family: 'OKCHAN';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/OKCHAN.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face {
			    font-family: 'KOHIBaeumOTF';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/KOHIBaeumOTF.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
			    font-family: 'SANJUGotgam';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/SANJUGotgam.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			@font-face {
			    font-family: 'PyeongChangPeace-Bold';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
			    font-weight: 700;
			    font-style: normal;
			}
			//얇은
			@font-face {
			     font-family: 'S-CoreDream-3Light';
			     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
			     font-weight: normal;
			     font-style: normal;
			}
			@font-face {
		    font-family: 'LeferiPoint-WhiteObliqueA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			@font-face {
			    font-family: 'ImcreSoojin';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.3/ImcreSoojin.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			
	</style>
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--Datepicker-->
	<script src="/resources/js/activity/activity.js"></script>
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" style="background: linear-gradient(rgba(15, 66, 41, .6), rgba(15, 66, 41, .6)), url(../MAINbtstr/img/은비(5).jpg) center center no-repeat; background-size: cover;">
            <div class="container text-center py-5" >
                <h1 class="display-3 text-white mb-4 animated slideInDown">${act.activityName }</h1>
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
        <div class="sidenav bg-light rounded p-sm-3 wow fadeIn" style="text-align:center;">
            <div class="side-box rounded mt-3" style=" font-family: 'GmarketSansMedium';">
                <h6 class="side-title-box display-5 " style="font-family: 'GmarketSansMedium'">
                 	${act.activityName}
                </h6>
                <div class="side-select-box display-5" style="font-size:2rem;" > 
                    <p>담당자 : ${act.activityManagerName}</p>
                </div>
                <div class="side-select-box display-5" style="font-size:1.3rem; margin:10px;" > 
                    <p>시작일 : ${act.startDate }</p>
                </div>
                <div class="side-select-box display-5" style="font-size:1.3rem;" > 
                    <p>종료일 : ${act.startDate }</p>
                </div>
                 <div class="side-select-box display-5" style="font-size:1.3rem;" > 
                    <p style="margin-bottom:10px;">가격 : ${act.activityPrice }원</p>
                </div>
                <div class="side-select-box form-floating mb-2"> 
                    <div class="amount-box">
	                    <select name="amount" id="amountSelect" class="form-select form-select-lg" aria-label=".form-select-sm example">
	                        <option value="1" selected>1인</option>
	                        <option value="2">2인</option>
	                        <option value="3">3인</option>
	                        <option value="4">4인</option>
	                        <option value="5">5인</option>
	                        <option value="6">6인</option>
	                    </select>
                    </div>
                </div>
                <div class="side-select-box display-5 mb-2"> 
               		<input class="form-control" name = "startDate"  id="activityStartDate" 
               		       onclick="javascript:f_datepicker(this);" readonly placeholder="신청할 날짜를 선택해주세요."/>
               </div>
               <div class="side-select-box display-5 mb-2"> 
               		<div style="font-size:1.5rem;"><span>총합 : </span><span id="realAmount"></span><span> 원</span></div>
               </div>
        
                <div class="side-select-box display-5 mb-2">
                <c:if test="${not empty sessionScope.m }"> 
                	<button id="submitBtn" type="button" class="btn btn-primary py-3 px-5" style="font-size:1.5rem;">신청하기</button>
                </c:if>
                <c:if test="${empty sessionScope.m }"> 
                    <button type="button" class="btn btn-primary py-3 px-5" style="font-size:1.5rem;" onclick="location.href='/index.jsp?login=1'" >로그인하러가기</button> 
                </c:if>
               </div>
            </div>
        </div>
        <!-- sideBar End-->
        
        <!-- class main -->
        <div class="container-xxl py-5 mt-5" style=" font-family: 'GmarketSansMedium';">
            <div class="container">
				<div class="class-row g-4">
						<h6 class="side-title-box display-5 " style="font-family: 'GmarketSansMedium'; font-weight: 800;">
                 		${act.activityName}
               			 </h6>
					<div class="col-xl-12 wow fadeInUp" data-wow-delay="0.1s" style= "display: flex">
						<div class="col-xl-6 team-item rounded class-item">
							<img style="width:800px;" class="img-fluid" src="/resources/upload/activity/${act.filepath }" alt="액티비티메인사진"><br><br>
							<div class="class-row g-5">      
						        <h4 class="display-6 mb-4">
						        	<pre class="mb-4" style="font-size:18px; color:gray;font-family: 'GmarketSansMedium';">${act.activityDetail}</pre>
						        </h4>
				        	</div>  
						</div >
						
						<!-- 
						<div class="col-xl-6 team-item rounded class-item" style="font-size:1.1em; ">
						
						<h1>${act.activityName }</h1>
						<h3>${act.activityPrice }원</h3>
						<br><br><br><br><br>
						<p><strong style="font-size:1.3em">담당자</strong><h3>${act.activityManagerName }	님</h3></p>
						<p><span>시작일: ${act.startDate }</span></p> 
						<p><span>종료일: ${act.endDate }</span></p>
					 
						</div>
						-->
					</div>
				</div>
				<!-- scroll bar start -->
				
				<div class="scroll-select-box" id="scroll-select" style="width:1400px; font-size: 1.2em;">
                	<span><a href="#menu1">상세사진</a></span>
                	<span><a href="#menu2">상세소개</a></span>
                	<span><a href="#menu3">기타사항</a></span>
                	<span><a href="#menu4">후기</a></span>
                </div>
                <!-- scroll bar end -->
            </div>
            
        </div>
        <!-- class-main End -->
		<hr>


        <!-- 강의소개 -->
         
        <div class="container-xxl py-5 mt-5" id="#menu1" style=" font-family: 'GmarketSansMedium';" >
            <div class="container">
                <div class="class-row g-5 ">
                    <div class="col-lg-6 wow fadeInUp" data-wow-delay="0.1s" >
                        <p class="fs-5 fw-bold text-primary">담당자 : ${act.activityManagerName }님과 함께하는</p>
                        <h1 class="display-5 mb-4">액티비티 활동!</h1>
                        <c:forEach items="${act.fileList }" var="details">
                        <p class="mb-4"><img style="width:800px;"src="resources/upload/activity/${details.filepath }"/></p>
                        </c:forEach> 
                    </div>
                   
                </div>
            </div>
            
        </div>
        
        <br>
        <!-- Features End -->

        <!-- 강사 소개 -->
    	<div class="container-xxl py-1 mt-1" id="#menu2" >
       		<div class="class-row g-5">      
		        <h4 class="display-6 mb-4">
		        	<pre class="mb-4" style="font-size:28px; font-weight:bold; color:gray; font-family: 'GmarketSansMedium';">${act.activityDetail}</pre>
		        </h4>
        	</div>    
        </div>	
        <hr style="width: 1350px; margin: 0 auto;">
        <br><br>
        <div class="container-xxl py-1 mt-1" id="#menu2">
       		<div class="class-row g-5">      
		        <h4 class="display-6 mb-4" style=" font-family: 'GmarketSansMedium'; color:#000;">
		        	<pre class="mb-4" style="font-size:16px; font-weight:bold; font-family: 'GmarketSansMedium';">${act.etc}</pre>
		        </h4>
        	</div>    
        </div>	
        <!-- About End -->
     
        <!-- Team End -->

        <!-- 환불규정 -->
        
        <!-- Features End -->
        <hr>

		<div class="container-xxl py-5 mt-5" id="#menu5">
			<div class="container">
				<div class="row g-5">
					<form class="mb-3" name="myform" id="myform" method="post">
							<input type="hidden" name="activityNo" value="${act.activityNo }">
							<input type="hidden" name="actRiviewWriter" value="${sessionScope.m.memberNo }">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span> 
							<input type="radio" name="actReviewRate" value="5" id="rate1" checked><label
								for="rate1">★</label>
							<input type="radio" name="actReviewRate" value="4" id="rate2"><label
								for="rate2">★</label>
							<input type="radio" name="actReviewRate" value="3" id="rate3"><label
								for="rate3">★</label>
							<input type="radio" name="actReviewRate" value="2" id="rate4"><label
								for="rate4">★</label>
							<input type="radio" name="actReviewRate" value="1" id="rate5" ><label
								for="rate5">★</label>
						</fieldset>
						<div>
							<textarea class="col-auto form-control" type="text"
								id="actReviewContent" name="actReviewContent"
								placeholder="액티비티를 구매하신분만 리뷰등록이 가능합니다."></textarea>
						</div>
						<button id="reviewSubmit" type="button" class="btn btn-primary">등록</button>
					</form>

	
				</div>
				<hr>
				
					<!-- ajax로 붙여넣을공간 -->	
				<div id="ajaxReviewList">
					
        		</div>
    
				</div>
				
				<script>
		
	
		$("#reviewSubmit").on("click",function(){
			const activityNo = $('input[name=activityNo]').val();
			const actRiviewWriter = $('input[name=actRiviewWriter]').val();
			const actReviewRate = $('input[name=actReviewRate]:checked').val();
			const actReviewContent = $('textarea[name=actReviewContent]').val();
			const blank_pattern = /^\s+|\s+$/g;


			const member = '${sessionScope.m}';
			
			if(member ==''){
				alert("로그인 후 리뷰 작성이 가능합니다");
				return false;
			}
			
			$.ajax({
				method :"POST",
				data:{
					memberNo : actRiviewWriter,
					activityNo : activityNo			
				},
				url :"/checkActHistory.do",
				success: function(data){
					//data가 1일경우 히스토리에 있음
					if(data==1){
						//history에서 목록이 있을경우 댓글 insert
						if(actReviewContent.replace(blank_pattern, "").length == 0 ||
								actReviewContent.replace(blank_pattern, "") == ""){
						alert("내용을 입력해주세요.");
						$('textarea[name=actReviewContent]').focus();
						return false;
						}else{
							
						$.ajax({
							method :"POST",
							data:{
								activityNo: activityNo,
								actRiviewWriter: actRiviewWriter,
								actReviewRate : actReviewRate,
								actReviewContent : actReviewContent
							},
							url:"/insertActivityReview.do" ,
							success: function(data){
								alert("리뷰가 등록되었습니다");
								$("#actReviewContent").val("");
								goPage(1);
							},
							error: function(data){
								alert("내부서버 문제로 인한 에러가 발생했습니다.");
							}
						})//댓글insert ajax부분
						}
						
					}else{	
						alert("구매 후 리뷰를 남겨주세요.");
					}
					
				},
				fail: function(data){
					alert(data+"실패");
				},
				error: function(data){
					alert("내부서버 문제로 인한 에러가 발생했습니다.");
				}
					
			})//
		})//리뷰 등록버튼 
	</script>
			</div>
		</div>
	
        
    </div><!--page-content End-->

            
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>



    <!-- side-bar script-->

	<!-- JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
   
    <script>
    let reqPage;

	document.addEventListener("DOMContentLoaded", function(){
	        showSide();
	        
	    	const amount = $("[name=amount]").val()
	    	const amountPrice ='${act.activityPrice }';
	    	const amountPrice2 ='${act.activityPrice }';
	    	
	    	const splits = amountPrice2.split(',');
	    	let realPrice ="";
	    	 
	    	
	    	for(let i=0;i<splits.length;i++){
	    		realPrice += splits[i];
	    	}
	    	
	    	
			$("#realAmount").text(amount*realPrice);
			reqPage=1;
			showList(reqPage);
});
	
	$("[name=actReviewRate2]").attr("readonly",true);
	
	function goPage(number){
		//$("#ajaxReviewList").remove();
		showList(number);
	}
	
	function showList(number){
	
		$("#ajaxReviewList").children().remove();	
		$.ajax({
			method : "POST",
			url : "/actReviewList.do",
			data : {
				activityNo : ${act.activityNo},
				reqPage : number 
			},
			success : function(data){
	
				for(let i =0; i<data.list.length;i++){
					const div = $("<div>");//'<div class="review-list__content">'
					div.addClass("review-list__content");
					let longDiv = 
						'<div class="review-list__el-cover" >'
						+'<div class="review-list__el review-el">'
						+	'<div class="review-el__header">'
						+'<div class="review-el__header--left">'
						+'<div class="review-el__thumbnail">'
						+'<img	src="/resources/upload/member/'+data.list[i].memberImg+'" '
						+'alt="'+data.list[i].memberName+' thumbnail"></div>'
						+'<div class="review-el__user-info">'
						+  '<div class="review-el__star-cover">'
						+   '<span class="review-el__star">'
						+		'<input type="checkbox" name="actReviewRate2" value="5" id="'+data.list[i].actRiviewWriter+i+'1" disabled>'
						+			'<label for="'+data.list[i].actRiviewWriter+i+'1">★</label>'
						+		'<input type="checkbox" name="actReviewRate2" value="4" id="'+data.list[i].actRiviewWriter+i+'2" disabled>'
						+			'<label for="'+data.list[i].actRiviewWriter+i+'2">★</label>'
						+		'<input type="checkbox" name="actReviewRate2" value="3" id="'+data.list[i].actRiviewWriter+i+'3" disabled>'
						+			'<label for="'+data.list[i].actRiviewWriter+i+'3">★</label>'
						+		'<input type="checkbox" name="actReviewRate2" value="2" id="'+data.list[i].actRiviewWriter+i+'4" disabled>'
						+			'<label	for="'+data.list[i].actRiviewWriter+i+'4">★</label>'
						+		'<input type="checkbox" name="actReviewRate2" value="1" id="'+data.list[i].actRiviewWriter+i+'5" disabled>'
						+			'<label	for="'+data.list[i].actRiviewWriter+i+'5">★</label></span>'
						+	'<span class="review-el__star-num">'+data.list[i].actReviewRate+'</span></div>'//리뷰별점끝
						+				'<div class="review-el__name">'+data.list[i].memberName+'</div>'
						+			'</div> </div> </div>'//star-cover user info left
						+	'<div class="review-el__body">'+data.list[i].actReviewContent+'</div>'
						+	'<div class="review-el__tools">'
						+		'<div class="review-el__tools--left">'
						+			'<span class="review-el__tool">'+data.list[i].actReviewDate+'</span>' 
						+			 '<span class="review-el__tool review-el__tool--reply' 
						+			 ' review-el__tool--clickable e-add-reply " onclick="deleteMyReview('+data.list[i].actReviewNo+');">   ∙ 삭제</span>'
						+			 '<input type="hidden" value="'+data.list[i].actRiviewWriter+'" class="review_el_writerId">'
						+		'</div>	</div>	</div>	</div>';
						
					div.append(longDiv);
					//ajax불러온걸 append
					$("#ajaxReviewList").append(div);
					
					//별점불러와서 값바꿔주는거
					let realRate = data.list[i].actReviewRate;
					let actReviewRate2 = div.find("[name=actReviewRate2]");
					
					for(let j=0;j<realRate;j++){
						actReviewRate2.eq(j).attr("checked",true);
					}
					
					let reviewWriterNo = '${sessionScope.m.memberNo}';//멤버넘버
					let delSpan = div.find(".review-el__tool--clickable");//삭제써져있는 span
					let reviewHiddenNo = div.find(".review_el_writerId");//멤버넘버 히든
					
					
					
					
					delSpan.hide();
					
					for(let k=0;k<reviewWriterNo;k++){
						
						if(reviewWriterNo==reviewHiddenNo.eq(k).val()){
							
							delSpan.eq(k).show();
						}
						
					}
					
					
				}
			
				
				$("#ajaxReviewList").append(data.pageNavi);
			},
			error:function(data){
				console.log("액티비티 리스트 에러"+data);
			}
		})//리뷰목록 리스트 ajax
		reqPage=number;
	}
	
	
	
	
	   const startDate = '${act.startDate}';
       const endDate = '${act.endDate}';
		
       function f_datepicker(obj) {
			$(obj).datepicker().datepicker("show");
					
		}

		$.datepicker.setDefaults({
			dateFormat : 'yy-mm-dd',
			prevText : '이전 달',
			nextText : '다음 달',
			monthNames : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월',
					'9월', '10월', '11월', '12월' ],
			dayNames : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesShort : [ '일', '월', '화', '수', '목', '금', '토' ],
			dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
			//minDate : '-100y',
			minDate: new Date(startDate),
 			maxDate: new Date(endDate),
			showMonthAfterYear : true,
			changeYear : true,
			yearSuffix : '년'
		});
		
	    
	    
	    	$("#amountSelect").on("change",function(){
	    		const amount = $("[name=amount]").val()
	        	const amountPrice ='${act.activityPrice }';
	        	const amountPrice2 ='${act.activityPrice }';
	        
	        	const splits = amountPrice2.split(',');
	        	let realPrice ="";
	        	
	        	for(let i=0;i<splits.length;i++){
	        		realPrice += splits[i];
	        	}
	    		
	    		$("#realAmount").text(amount*realPrice);
	    	})
			
	  
	    
	        function showSide(){
	            const position  = $(window).scrollTop();
	            console.log("현재포지션"+position);
	            let scrollLocation = document.documentElement.scrollTop; // 현재 스크롤바 위치
		        let windowHeight = window.innerHeight; // 스크린 창
	            let fullHeight = document.body.scrollHeight; //  margin 값은 포함 x, footer제외
	           
	            if(position > 501){
	                $(".sidenav").fadeOut(1);
	            }else if(position > 0 ){ // 스크롤 위치 343보다 클 때만 보이겠다
	                $(".sidenav").fadeIn(300);
	                console.log("최고높이"+fullHeight);
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
			
		    $("#submitBtn").on("click",function(){
		    	let memberNo ='';
		    	let activityNo ='';
        		memberNo = '${sessionScope.m.memberNo}';
        		activityNo = '${act.activityNo}'; 
        	
		    	const startDate = $("[name=startDate]").val();
		    	
		    	if(startDate==null || startDate==""){
		    		alert("시작날짜를 선택해주세요");
		    		return false;
		    	}
		   	
		    	if('${sessionScope.m}' !=null || '${sessionScope.m}' !=''){
		    		$.ajax({
		        		url:"/actInsertCart.do",
		        		data:{
		        			memberNo: memberNo,
		        			activityNo : activityNo,
		        			buyAmount : $("#amountSelect").val()
		        		},
		        		success:function(data){
		        			if(data==1){
		        				if(confirm("장바구니에 담겼습니다. 장바구니로 이동하시겠습니까?")){
		        					location.href="/cart.do?memberNo="+memberNo;
		        				}else{
		        					console.log("a");
		        				}
		        				
		        			}
		        		},
		        		fail:function(data){
		        			console.log("fail:function"+data);
		        		},
		        		error:function(data){
		        			console.log("error:function"+data);
		        		}
		        	})//ajax
		    	}else{
		    		
		    	} 
		    	
        })//버튼
        
        function deleteMyReview(num){
		    	console.log(reqPage);
		    	Swal.fire({
					  text: "삭제하시겠습니까?",//내용
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '삭제',
					  cancelButtonText: '취소'
					}).then((result) => {
						//result.value == true이니까 트루일때만 실행하는거
					  if (result.value) {
						  
						  $.ajax({
				        		url:"/deleteMyReview.do",
				        		data:{
				        			actReviewNo : num
				        		},
				        		success:function(data){
				        			if(data==1){
				        				showList(reqPage);
				        			}else{
				        				alert("잘못된 접근입니다.");
				        			}
				        		},
				        		fail:function(data){
				        			console.log("fail:function"+data);
				        		},
				        		error:function(data){
				        			console.log("error:function"+data);
				        		}
				        	})//ajax
					  }
						
					})//then끝
		    }
    
    </script>
</body>
</html>
