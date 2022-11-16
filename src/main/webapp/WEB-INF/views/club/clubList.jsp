<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- 구글아이콘 -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <script src="https://unpkg.com/mathjs/lib/browser/math.js"></script> <!-- math 사용 위한 라이브러리 -->
<title>동호회</title>
</head>
<style>

.plBox{
	padding: 20px;
    border-radius: 15px;
	background-color: #F5F5F5;
}
.plBox:hover{
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}
.serviceBox1 {
    width: 250px;
    height: 250px; 
    border-radius: 70%;
    overflow: hidden;
    border: 4px dashed #20c997;
    margin: 0 auto;
}
.serviceBox1 img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.title{
    color: #fff;
    background-color: #db7100;
    font-size: 18px;
    font-weight: 500;
    letter-spacing: 1px;
    text-transform: uppercase;
    padding: 4px 10px 6px;
    margin: 0 -10px 5px;
    display: inline-block;
}
.serviceBox .service-icon{
    font-size: 45px;
    margin: 0 0 70px;
}   
.serviceBox .description{
    color: #555;
    font-size: 16px;
    font-weight: 500;
    line-height: 23px;
}
.serviceBox.gray{ color: #5A696E; }
.serviceBox.gray:before{ border-color: #5A696E; }
.serviceBox.gray .title{ background-color: #5A696E; }
.serviceBox.pink{ color: #F1605D; }
.serviceBox.pink:before{ border-color: #F1605D; }
.serviceBox.pink .title{ background-color: #F1605D; }
.serviceBox.purple{ color: #8D4B7F; }
.serviceBox.purple:before{ border-color: #8D4B7F; }
.serviceBox.purple .title{ background-color: #8D4B7F; }
@media only screen and (max-width: 990px){
    .serviceBox{ margin: 0 0 30px; }
}

.clubListBox{
    background-color: #fff;
    border: 1px solid #ddd;
    width: 30%;
    align-items: center;
    text-align: center;
    margin-right: 3%;
    margin-bottom: 50px;
    border-radius: 15px;
}
.clubListBox:hover{
	box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
}
.clubListImgBox{
    text-align:center;
    display:table;
    width: 100%;
    height: 50%;
    margin: 0 auto;
	margin-bottom: 20px;
	border-top-left-radius: 15px;
	border-top-right-radius: 15px;
	overflow: hidden;
}
.clubListImg{
    width: 100%;
  	height: 250px;
  	object-fit: cover;
}
.clubListInfo{
	width: 100%;
}
.clubListInfoBox{
	width: 90%;
	text-align: left;
	margin: 0 auto;
}
.clubListBtnBox{
	width: 80%;
	margin: 0 auto;
	text-align: right;
	margin-bottom: 20px;
}

</style>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid club-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLUB</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <h5 class="mb-3 text-white">공통의 관심사를 가진 시니어들과 온라인으로 소통할 수 있습니다</h5>
                </nav>
            </div>
        </div>

        
        <!-- Page Header End -->
        <div class="popular-box"> <!-- 인기 리스트 div  -->
        	<c:if test="${not empty sessionScope.m }">
		        <c:choose>
		        	<c:when test="${not empty pList }">
		        		<p class="fs-5 fw-bold text-primary mt-5 text-center">'${sessionScope.m.nickName }'님의 관심사에 해당하는 인기 동호회를 추천합니다</p>
			        	<div class="container" style="width: 90%; margin-top: 50px; margin-bottom: 100px;">
						    <div class="flex-space-around">
						    <c:forEach items="${pList }" var="pl">
							    <div class="col-md-3 col-sm-6 plBox">
							        <div class="serviceBox1 mb-3">
							        	<img alt="" src="/resources/upload/club/${pl.clubMainImg }">
							        </div>
							        <div style="word-break:break-all;" >
							            <h3 class="card-title" style="width: 90%; margin:0 auto; text-align: center; color: #168A67;">${pl.clubName }</h3>
										<p class="description clubIntro" style="width: 90%;">${pl.clubIntro } </p> 
							        </div>
							        <div style="display: flex; justify-content: flex-end;">
							        	<a href="javascript:void(0)" onclick="clubInfoModal(${pl.clubNo })"><span class="material-symbols-outlined" style="color: #168A67; font-size: 40px;">fast_forward</span></a>
							        </div>
							    </div>
							    </c:forEach>
						    </div>
						</div>
		        	</c:when>
		        	<c:otherwise>
		        		<div class="fs-5 fw-bold text-primary text-center mb-5">선택된 관심사가 없습니다<br>마이페이지에서 등록하고 동호회를 추천 받으세요</div>
		        	</c:otherwise>
		        </c:choose>
	        </c:if>
        </div> <!-- 인기 리스트 div End  -->


		<div class="mt-5" style="width: 80%; display: flex; justify-content: space-between; margin: 0 auto;">
        	<div id="displayCount">
        	</div>
        	<div class="club-input">
            	<input type="text" class="form-control bg-light border-0" id="serchInput"><button id="serchBtn" class="btn btn btn-outline-primary" onclick="initClubList();">찾기</button>
        	</div>
        	<div>
        		<c:if test="${not empty sessionScope.m }">
        			<a href="/insertClubFrm.do" class="btn btn-primary">동호회 생성</a><br>
        		</c:if>
        	</div>
        </div>


		<!-- ajax로 추가 -->
		<div id="club-list" class="mt-5 club-list">
		</div>

		
		<div class="pagingBox mt-5">
			<ul id="pagingUl" class="pagination justify-content-center">
			</ul>
		</div>
		
	</div> <!-- pageContent End -->
	
	<div id="memberNo" style="display: none;">${sessionScope.m.memberNo }</div>
	
<div class="modal-wrap">
	<div class="cookiesContainer">
		<div class="cookiesContent" id="cookiesPopup">
			<button class="close" onclick="closeModal();">✖</button>
			<img src="/resources/img/4191760.jpg" alt="cookies-img" />
			<h4 class="fs-5 fw-bold text-dark"></h4>
			<p></p>
			<button class="accept"></button>
		</div>
	</div>
</div>


	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>




    <script>
    var totalData; //총 데이터 수
    var dataPerPage; //한 페이지에 나타낼 글 수
    var pageCount = 5; //페이징에 나타낼 페이지 수
    var currentPage = 1; //현재 페이지
    var data; //controller에서 가져온 data 전역변수
    var keyword;
    
    $(document).ready(function () {
    	initClubList();
    });
    
    function initClubList() {
   	 	//dataPerPage 선택값 가져오기
   	 	$("#club-list div").remove();
	    dataPerPage = 6;
 		const keyword = $("#serchInput").val();
	    $.ajax({ // ajax로 데이터 가져오기
	    	method: "post",
	    	url: "/searchAllClub.do",
	    	data: {keyword : keyword },
	    	success: function (data) {
	    	   //totalData 구하기
	    	   totalData = data.length;
	    	   console.log("totalData:"+totalData);
	    	   displayData(1, dataPerPage, keyword); //글 목록 표시 호출 (테이블 생성)
	    	   paging(totalData, dataPerPage, pageCount, 1); //페이징 표시 호출
	    	}
    	});
	}

    function paging(totalData, dataPerPage, pageCount, currentPage) {
    	  console.log("currentPage:" + currentPage);

    	  var totalPage = Math.ceil(Number(totalData)/dataPerPage); //총 페이지 수
    	  // console.log(totalPage);
    	  
    	  if(totalPage<Number(pageCount)){
    		  pageCount=totalPage;
    	  }
    	  
    	  var pageGroup = Math.ceil(Number(currentPage)/Number(pageCount)); // 페이지 그룹
    	  var last = pageGroup * pageCount; //화면에 보여질 마지막 페이지 번호
    	  
    	  if (last > totalPage) {
    	    last = totalPage;
    	  }

    	  let first = last-(pageCount-1); //화면에 보여질 첫번째 페이지 번호
    	  let next = last+1;
    	  let prev = first-1;

    	  let pageHtml = "";

    	  if (prev > 0) {
    		  pageHtml += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#' id='prev'>이전</a></li>";
    	  }

    	 //페이징 번호 표시 
    	  for (var i = first; i <= last; i++) {
    	    if (currentPage == i) {
    	      pageHtml +=
    	        "<li class='page-item '><a class='page-link active-page' href='#' id='" + i + "'>" + i + "</a></li>";
    	    } else {
    	      pageHtml += "<li class='page-item'><a class='page-link' href='#' id='" + i + "'>" + i + "</a></li>";
    	    }
    	  }
    	  
    	  if (last < totalPage) {
    	    pageHtml += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#' id='next'> 다음 </a></li>";
    	  }

    	  $("#pagingUl").html(pageHtml);
    	  let displayCount = "";
    	  displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
    	  $("#displayCount").text(displayCount).addClass("text-primary");


    	  //페이징 번호 클릭 이벤트 
    	    $("#pagingUl li a").click(function () {
    	    	$("#club-list div").remove();
    	        let $id = $(this).attr("id");
    	        selectedPage = $(this).text();

    	        if ($id == "next") selectedPage = next;
    	        if ($id == "prev") selectedPage = prev;

    	        //전역변수에 선택한 페이지 번호를 담는다...
    	       	CurrentPage = selectedPage;
    	        //페이징 표시 재호출
    	        paging(totalData, dataPerPage, pageCount, selectedPage);
    	        //글 목록 표시 재호출
    	        displayData(selectedPage, dataPerPage, data);
    	    });
    	}
    
    

    
	  //현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
	    function displayData(currentPage, dataPerPage, keyword) {
	    	const memberNo = $("#memberNo").text();
	      	currentPage = Number(currentPage);
	      	dataPerPage = Number(dataPerPage);
	      	$.ajax({ // ajax로 데이터 가져오기
		    	method: "post",
		    	url: "/searchAllClub.do",
		    	data: {keyword : keyword},
		    	success: function (data) {
		    		for (let i=(currentPage-1)*dataPerPage; i<(currentPage-1)*dataPerPage+dataPerPage; i++) {
						const div = $("<div>");
						div.addClass("clubListBox");
						const imgDiv = $("<div>");
						imgDiv.addClass("clubListImgBox");
						imgDiv.html("<img class='clubListImg'  src='/resources/upload/club/"+data[i].clubMainImg+"'>");
						div.append(imgDiv);
						const infoDiv = $("<div>");
						infoDiv.addClass('clubListInfo');
						const clubInfoBox = $("<div>");
						clubInfoBox.addClass('clubListInfoBox');
						const modalBtnBox = $("<div>");
						modalBtnBox.addClass("clubListBtnBox");
						if(data[i].clubMemberCnt>=data[i].clubLimit){
							clubInfoBox.html("<h3 class='mb-3 text-secondary'>"+data[i].clubName+"</h3><p class='text-secondary clubIntro'>"+data[i].clubIntro+"</p><p class='text-danger fw-bold'>참여인원 : <span>"+data[i].clubMemberCnt+"</span> / <span>"+data[i].clubLimit+"</span></p>");
							infoDiv.append(clubInfoBox);
						}else{
							clubInfoBox.html("<h3 class='mb-3 text-secondary'>"+data[i].clubName+"</h3><p class='text-secondary clubIntro'>"+data[i].clubIntro+"</p><p class='text-secondary fw-bold'>참여인원 : <span>"+data[i].clubMemberCnt+"</span> / <span>"+data[i].clubLimit+"</span></p>");
							infoDiv.append(clubInfoBox);
						}
						modalBtnBox.html("<button class='btn btn-outline-dark' onclick='clubInfoModal("+data[i].clubNo+");'>입장하기</button>");
						infoDiv.append(modalBtnBox);
						div.append(infoDiv);
						$("#club-list").append(div);
					}
		    	}
		    });
	      	
	    }

    	function clubInfoModal(clubNo) {
    		const memberNo = $("#memberNo").text();
    		if(memberNo==""){
    			Swal.fire({
					title: "로그인이 필요한 서비스입니다",//제목
					text: '로그인 후 동호회에 가입할 수 있습니다',
					imageUrl: "/resources/img/제목없음.png",
					showCancelButton: true,
					cancelButtonColor: '#525368',
					confirmButtonColor: '#348E38',
					cancelButtonText: '닫기',
					confirmButtonText: '로그인 하러 가기'
				}).then((result) => {
					//result.value == true이니까 트루일때만 실행하는거
				  if (result.value) {
					   $(".loginBtn").click();
				  }
				})//then끝
    		}else{
    			$.ajax({
    				url : "/selectOneClub.do",
    				data : {clubNo:clubNo },
    				success : function(one){
    					const clubName = $(".cookiesContent>h4");
    					console.log(one);
    					clubName.text(one.clubName);
    					const clubCheck = one.clubLimit - one.memberList.length;
    					clubMemberCheck(memberNo, one.clubNo, clubCheck);
    				}
    			});
    			$(".modal-wrap").css("display", "flex");
    		}
		}
		
    	// -1이면 블락 멤버, 0이면 가입하지 않은 멤버, 1이면 가입한 멤버
    	function clubMemberCheck(memberNo, clubNo, clubCheck) {
    		console.log(clubNo, clubCheck);
    		const btn = $(".accept");
    		const clubContent = $(".cookiesContent>p");
    		btn.css("display", "block");
    		$.ajax({
    			url:"/searchBlockMember.do",
    			data:{
    				clubLeader: memberNo, // 클럽 객체를 사용하기 때문에 clubLeader일 뿐, 일반 회원 check
    				clubNo 	: clubNo
    			},
    			success:function(result){
    				if(result=='-1'){
    					btn.css("display", "none");
    					clubContent.html('동호회에 입장할 수 없습니다.');
    				}else if(result=='1'){
    					btn.text('입장하기');
						clubContent.html('이미 가입한 동호회입니다.<br>입장하시겠습니까?');
						btn.attr('onclick', 'enterClub('+clubNo+');');
						btn.removeClass('btn-danger');
    		    		btn.addClass('btn-warning');
    				}else{
    					if(clubCheck>0){
    						btn.text('가입하기');
        		    		btn.attr('onclick', 'joinClub('+memberNo+', '+clubNo+');');
        		    		clubContent.html('가입하지 않은 동호회입니다.<br>새로 가입하시겠습니까?');
        		    		btn.removeClass('btn-danger');
        		    		btn.addClass('btn-warning');
    					}else{
    						btn.text('가입불가');
    						btn.removeClass('btn-warning');
    						btn.addClass('btn-danger');
    						btn.attr('onclick', 'closeModal();');
        		    		clubContent.html('동호회 정원이 초과하여<br>가입할 수 없습니다.');
    					}
    				}
    			}
    		})
		}
    	

    	
    	function joinClub(memberNo, clubNo) {
    		Swal.fire({
				title: "동호회 가입",//제목
				text: '동호회에 가입하시겠습니까?',
				imageUrl: "/resources/img/제목없음.png",
				showCancelButton: true,
				cancelButtonColor: '#525368',
				confirmButtonColor: '#348E38',
				cancelButtonText: '닫기',
				confirmButtonText: '가입하기'
			}).then((result) => {
				//result.value == true이니까 트루일때만 실행하는거
			  if (result.value) {
				  location.href="/joinClub.do?memberNo="+memberNo+"&clubNo="+clubNo;
			  }
			})//then끝
		}
    	
    	function enterClub(clubNo) {
			location.href="/clubDetail.do?clubNo="+clubNo;
		}
    	
        function closeModal() {
        	$(".modal-wrap").css("display", "none");
    	}
    </script>
</body>
</html>