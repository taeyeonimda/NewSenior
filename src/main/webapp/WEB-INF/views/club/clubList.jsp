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
		        		<p class="fs-5 fw-bold text-primary text-center mb-5">${sessionScope.m.memberName }님의 관심사에 해당하는 인기 동호회를 추천합니다</p>
				        <div class="row mb-5" style="justify-content: space-evenly;">
				        	<c:forEach items="${pList }" var="pl">
							<div class="col-md-6 col-lg-4 mb-3">
								<div class="card h-100">
				      				<img src="/resources/upload/club/hero.png">
				      				<div class="card-body">
						        		<h5 class="card-title">${pl.clubName }</h5>
						        		<p class="card-text">${pl.clubIntro }</p>
						        		<a href="javascript:void(0)" class="btn btn-outline-primary" onclick="clubInfoModal(${pl.clubNo })">들어가기</a>
					      			</div>
				    			</div>
				  			</div>
				  			</c:forEach>
						</div>
		        	</c:when>
		        	<c:otherwise>
		        		<div class="fs-5 fw-bold text-primary text-center mb-5">선택된 관심사가 없습니다<br>마이페이지에서 등록하고 동호회를 추천 받으세요</div>
		        	</c:otherwise>
		        </c:choose>
	        </c:if>
        </div> <!-- 인기 리스트 div End  -->


		<div style="width: 80%; display: flex; justify-content: space-between; margin: 0 auto;">
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
    <div class="club-info-modal bg-light">
        <div class="modal-img-div">
            <img class="modal-img">
        </div>
        <div class="club-info">
            <div class="club-info-box">
            	<h3 class="mb-3 text-dark"></h3>
            	<p class="text-secondary"></p> 
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
						div.addClass("lists");
						div.attr("onclick", "clubInfoModal("+data[i].clubNo+")");
						div.append("<img src='/resources/MAINbtstr/img/로고2.png' width='65px'>")
						div.append("<h4 class='mb-3'>"+data[i].clubName+"</h4");
						div.append("<p>참여인원수 : <span>"+data[i].clubMemberCnt+"</span> / <span>"+data[i].clubLimit+"</span></p>");
						$("#club-list").append(div);
					}
		    	}
		    });
	      	
	    }

    	function clubInfoModal(clubNo) {
    		const memberNo = $("#memberNo").text();
    		if(memberNo==""){
    			alert("로그인 먼저 진행해 주세요");
    			return;
    		}
			console.log(clubNo);
			$.ajax({
				url : "/selectOneClub.do",
				data : {clubNo:clubNo },
				success : function(one){
					const clubName = $(".club-info-box>h3");
					const clubContent = $(".club-info-box>p");
					const clubImg = $(".modal-img-div>img");
					clubName.text(one.clubName);
					clubContent.text(one.clubIntro);
					clubImg.attr("src", "/resources/upload/club/"+one.clubMainImg);
					myClubCheck(memberNo, one.clubNo);
				}
			});
			$(".modal-wrap").css("display", "flex");
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
    		if(confirm('정말 가입하시겠습니까?')){
    			location.href="/myClubList.do?memberNo="+memberNo+"&clubNo="+clubNo;
    		}else{
    			$(".modal-wrap").css("display", "none");
    		}
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