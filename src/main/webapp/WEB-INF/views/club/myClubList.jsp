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
    <!-- page Content 시작-->
    <div class="page-content">
	
		<div class="mylist" style="width: 70%; margin: 0 auto"> <!-- 인기 리스트 div  -->
			<p class="fs-5 fw-bold text-primary mt-5 text-shadow">내 동호회</p>
	        <c:choose>
	        	<c:when test="${not empty myList }">
			        <div class="mb-5 row my-list-page" style="flex-wrap: wrap;">
			        	<c:forEach items="${myList }" var="ml">
			        	<c:if test="${ml.clubNo eq newClub }">
						<div class="mb-5">							
							<div class="card shadow" style="border: 5px solid #0F4229;">
			      				<div class="card-img">
									<img src="/resources/upload/club/${ml.clubMainImg }" width="100%">
								</div>
			      				<div class="card-body" style="height: 66%;">
					        		<h5 class="card-title">${ml.clubName } <span class="fs-5 fw-bold text-danger">new!</span></h5>
					        		<p class="card-text clubIntro">${ml.clubIntro }</p>
					        		<p class="card-text">${ml.clubMemberCnt }/${ml.clubLimit }</p>
					        		<a href="/clubDetail.do?clubNo=${ml.clubNo }" class="btn btn-outline-primary">입장하기</a>
				      			</div>
			    			</div>
			  			</div>
			  			</c:if>
			  			</c:forEach>
			  			<c:forEach items="${myList }" var="ml">
			        	<c:if test="${ml.clubNo ne newClub }">
						<div class="mb-5">
							<div class="card shadow" style="border: 5px solid #E8F5E9;">
								<div class="card-img">
									<img src="/resources/upload/club/${ml.clubMainImg }" width="100%">
								</div>
			      				<div class="card-body" style="height: 66%;">
					        		<h5 class="card-title">${ml.clubName }</h5>
					        		<p class="card-text clubIntro">${ml.clubIntro }</p>
					        		<p class="card-text">${ml.clubMemberCnt }/${ml.clubLimit }</p>
					        		<a href="/clubDetail.do?clubNo=${ml.clubNo }" class="btn btn-outline-primary">입장하기</a>
				      			</div>
			    			</div>
			  			</div>
			  			</c:if>
			  			</c:forEach>
					</div>
	        	</c:when>
	        	<c:otherwise>
	        		<div class="fs-5 fw-bold text-primary text-center">선택된 관심사가 없습니다 마이페이지에서 등록하고 동호회를 추천 받으세요 !</div>
	        	</c:otherwise>
	        </c:choose>
        </div> <!-- 인기 리스트 div End  -->
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>