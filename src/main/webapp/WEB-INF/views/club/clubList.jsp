<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <script src="https://unpkg.com/mathjs/lib/browser/math.js"></script> <!-- math 사용 위한 라이브러리 -->
<title>동호회</title>
</head>
<style>

/*인기 클럽이미지*/
.pclubImgBox {
    width: 200px;
    height: 200px; 
    border-radius: 70%;
    overflow: hidden;
}
.pclubImg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}


.serviceBox{
    color: #db7100;
    font-family: 'Zen Maru Gothic', sans-serif;
    text-align: center;
    padding: 25px 10px 0;
    position: relative;
    z-index: 1;
}
.serviceBox:before{
    content: "";
    height: 180px;
    width: 180px;
    border: 2px dashed #348E38;
    border-radius: 50%;
    transform: translateX(-50%);
    position: absolute;
    top: 0;
    left: 50%;
    z-index: -1;
    background-image: url("/resources/img/은비1.jpg");
    background-size: 100%;
}
.serviceBox .title{
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
    box-shadow: rgba(0, 0, 0, 0.07) 0px 1px 2px, rgba(0, 0, 0, 0.07) 0px 2px 4px, rgba(0, 0, 0, 0.07) 0px 4px 8px, rgba(0, 0, 0, 0.07) 0px 8px 16px, rgba(0, 0, 0, 0.07) 0px 16px 32px, rgba(0, 0, 0, 0.07) 0px 32px 64px;
    width: 30%;
    border-radius: 15px;
    align-items: center;
    text-align: center;
    margin-right: 3%;
    margin-bottom: 50px;
}
.clubListImgBox{
    text-align:center;
    display:table;
    width: 100%;
    height: 40%;
    margin: 0 auto;
    margin-top: 20px;
    padding: 20px;
}
.clubListImg{
    width: 100%;
  	height: 230px;
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
			        	<div class="container" style="width: 70%; margin-top: 50px; margin-bottom: 100px;">
						    <div class="row flex-space-between">
						    <c:forEach items="${pList }" var="pl">
							    <div class="col-md-3 col-sm-6">
							        <div class="serviceBox mb-5">
							            <div class="service-icon"></div>
							        </div>
							        <div style="margin-top: 200px; word-break:break-all;" >
							            <h3 class="card-title">${pl.clubName }</h3>
										<p class="description" style="width: 100%;">${pl.clubIntro } dddddddddddddddddddddddddddddddddddddddddddddd</p> 
							            <a href="javascript:void(0)" class="btn btn-outline-primary" onclick="clubInfoModal(${pl.clubNo })">들어가기</a>
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
    <div class="club-info-modal bg-white">
        <div class="modal-img-div">
            <img class="modal-img">
        </div>
        <div class="club-info">
            <div class="club-info-box">
            	<h3 class="mb-3 text-dark"></h3>
            	<p class="text-secondary"></p> 
            	<pre></pre>
            </div>
            <div class="modal-btn-box">
            	<button onclick="closeModal();" class="btn btn-primary">닫기</button>
            	<a href="javascript:void(0);" class="btn btn-primary" id="enterBtn">입장하기</a>
            </div>
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
    	  
    	  console.log(totalData);
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
		    		console.log("currentPage"+currentPage);
		    		console.log("dataPerPage"+dataPerPage);
		    		console.log(data);
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
						clubInfoBox.html("<h3 class='mb-3 text-secondary'>"+data[i].clubName+"</h3><p class='text-secondary'>"+data[i].clubIntro+"</p><pre>참여인원수 : <span>"+data[i].clubMemberCnt+"</span> / <span>"+data[i].clubLimit+"</span></pre>");
						infoDiv.append(clubInfoBox);
						const modalBtnBox = $("<div>");
						modalBtnBox.addClass("clubListBtnBox");
						modalBtnBox.html("<button class='btn btn-outline-primary' onclick='clubInfoModal("+data[i].clubNo+");'>입장하기</button>");
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
    					const clubName = $(".club-info-box>h3");
    					const clubContent = $(".club-info-box>p");
    					const clubImg = $(".modal-img-div>img");
    					const clubAmount = $(".club-info-box>pre")
    					clubName.text(one.clubName);
    					clubContent.text(one.clubIntro);
    					clubImg.attr("src", "/resources/upload/club/"+one.clubMainImg);
    					myClubCheck(memberNo, one.clubNo);
    				}
    			});
    			$(".modal-wrap").css("display", "flex");
    		}
		}

    	function myClubCheck(memberNo, clubNo) {
    		const btn = $("#enterBtn");
    		btn.text('가입하기');
    		btn.attr('onclick', 'joinClub('+memberNo+', '+clubNo+');');
    		$.ajax({
    			url:"/searchMyClub.do",
    			data:{memberNo: memberNo},
    			success:function(myList){
    				for(let i=0; i<myList.length; i++){
    					console.log(myList);
    					if(myList[i].clubNo==clubNo){
    						btn.text('입장하기');
    						btn.attr('onclick', 'enterClub('+myList[i].clubNo+');');
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
				  location.href="/myClubList.do?memberNo="+memberNo+"&clubNo="+clubNo;
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