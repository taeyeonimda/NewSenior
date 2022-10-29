<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">CLUB</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <h4 class="mb-3 text-white">관심사를 검색하세요 ! </h4>
                    <input type="text" class="mt-2" id="club-input">
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        <div style="width: 90%; display: flex; justify-content: flex-end;">
        	<a href="/insertClubFrm.do" class="btn btn-primary">동호회 생성</a><br>
        </div>
		<div id="club-list" style="width: 80%; margin: 0 auto; overflow: hidden;" class="mt-5">
			<c:forEach items="${list }" var="c">
				<div style="width: 400px; text-align: center; margin-bottom: 20px; border: 1px solid #eee; float: left;">
					<h4 class="mb-3">${c.clubName }</h4>
					<p>참여인원수 : <span></span> / <span>${c.clubLimit }</span></p>
					<a href="/clubDetail.do?clubNo=${c.clubNo}">동호회로 이동</a>
				</div>
			</c:forEach>
		</div>

	</div> <!-- pageContent End -->
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>