<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">커뮤니티</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                    	<c:if test="${boardType eq 'F' or boardType eq 'I' or boardType eq 'P'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">게시판</li>
                        </c:if>
                        <c:if test="${boardType eq 'N' or boardType eq 'Q' or boardType eq 'A'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=A">FAQ</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">강사모집</li>
                        </c:if>
                        
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
                <c:if test="${boardType eq 'F'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></h1>
                </c:if>
                <c:if test="${boardType eq 'I'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></h1>
                </c:if>
                <c:if test="${boardType eq 'P'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></h1>
                </c:if>
                <c:if test="${boardType eq 'N'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></h1>
                </c:if>
                <c:if test="${boardType eq 'Q'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></h1>
                </c:if>
                <c:if test="${boardType eq 'A'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=A">FAQ</a></h1>
                </c:if>
            </div>
            
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <c:forEach items="${list}" var="cateList">
                        	<li class="mx-2 ${cateList.boardCategory }" data-filter="*"><a href="/classList.do?classCategory=${cateList.boardCategory}&reqPage=1">${cateList.boardCategory }</a></li>
                        </c:forEach>   
                    </ul>
        	   </div>
                    <div style="display: none;" class="category">${classCategory }</div>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
            <c:forEach items="${clist }" var="cla" varStatus="i">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" onclick="classDetail(${cla.classNo });">
                        <img class="img-fluid class-img"style="width:408px;height:408px;"src="/resources/upload/class/${cla.filepath }" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">${cla.className }</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="/resources/upload/class/${cla.filepath }" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-lg-square rounded-circle mx-2" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
        </div>
	<c:if test="${not empty sessionScope.m }">
		<button><a href="/boardWriteFrm.do">글작성</a></button>
		</c:if>

		<c:if test="${boardType ne 'Q' }">
		<div class="boardWrap">
	<table border="1">
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 15%;">카테고리</th>
			<th style="width: 35%;">제목</th>
			<th style="width: 15%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 20%;">작성일</th>
		</tr>
		<c:forEach items="${list }" var="b" varStatus="i">
		<tr>
		
			<td>${(reqPage-1)*numPerPage+i.count }</td>
			<!-- 자유게시판 -->
			<c:if test ="${b.boardCategory eq 'info'}">
				<td>정보</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'etc'}">
				<td>기타</td>
			</c:if>
			<!-- 공지사항 -->
			<c:if test ="${b.boardCategory eq 'notice'}">
				<td>공지사항</td>
			</c:if>
			<!-- 동호회모집 -->
			<c:if test ="${b.boardCategory eq 'invite'}">
				<td>모집중</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'end'}">
				<td>모집완료</td>
			</c:if>
			<!-- 정보게시판 -->
			<c:if test ="${b.boardCategory eq 'campaign'}">
				<td>캠페인</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'fair'}">
				<td>박람회</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'tour'}">
				<td>여행</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'ectI'}">
				<td>기타</td>
			</c:if>
			
			<td><a href="/boardView.do?boardNo=${b.boardNo}">${b.boardTitle }[${b.boardCommCnt }]</a></td>
			<td>${b.nickName }</td>
			<td>${b.boardCount }</td>
			<td>${b.boardDate }</td>
			<!--<td>${b.boardType }</td>  -->
			<td><input type="hidden" value="${b.boardType }"></td>
		</tr>
		</c:forEach>
		
		<tr>
			<th colspan="5">
				${pageNavi }
			</th>
		</tr>
		</table>
		</div>
		</c:if>

		
		<!-- Q&A  -->
		<c:if test="${boardType eq 'Q' }">
		
	<table border="1">
		<tr>
			<th style="width: 10%;">번호</th>
			<th style="width: 10%;">카테고리</th>
			<th style="width: 35%;">제목</th>
			<th style="width: 10%;">작성자</th>
			<th style="width: 10%;">조회수</th>
			<th style="width: 15%;">작성일</th>
			<th style="width: 10%;">답변여부</th>
		</tr>
		<c:forEach items="${list }" var="b" varStatus="i">
		<tr>
		
			<td>${(reqPage-1)*numPerPage+i.count }</td>
			<!-- QNA -->
			<c:if test ="${b.boardCategory eq 'class'}">
				<td>클래스</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'club'}">
				<td>동호회</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'activity'}">
				<td>액티비티</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'product'}">
				<td>상품</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'pay'}">
				<td>결제</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'delivery'}">
				<td>배송</td>
			</c:if>
			<td><a href="/boardView.do?boardNo=${b.boardNo}">${b.boardTitle }[${b.boardCommCnt }]</a></td>
			<td>${b.nickName }</td>
			<td>${b.boardCount }</td>
			<td>${b.boardDate }</td>
			<c:if test="${b.boardCommCnt eq 0 }">
				<td>답변대기중</td>
			</c:if>
			<c:if test="${b.boardCommCnt ne 0 }">
				<td style="color : green">답변완료</td>
			</c:if>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="5">
				${pageNavi }
			</th>
		</tr>
		</table>
		</c:if>
		<!-- Q&A 끝-->
		
		<!-- 검색 form -->
		<div class="searchForm">
			<!-- <form action="/searchBoard.do?reqPage=1" method="post"> -->
			<form action="/searchBoard.do?reqPage=1&boardType=${boardType}" method="post">
				<select name="categoryTag">
				<!-- 보드별로 카테고리 추가하기 (writeFrm 참고)-->
					<option value="all">전체</option>
					<option value="info" <c:if test="${b.boardCategory eq 'info'}">selected</c:if>>정보</option>
					<option value="etc" <c:if test="${b.boardCategory eq 'etc'}">selected</c:if>>기타</option>
				</select>
				<select name="searchTag">
					<option value="boardTitle">제목</option>
					<option value="nickName">작성자</option>
				</select>
				<input type="text" name="searchInput">
				<button class="searchBtn">검색</button>
			</form>
		</div>
		

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>