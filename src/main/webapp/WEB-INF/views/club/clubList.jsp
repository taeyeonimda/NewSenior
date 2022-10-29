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
		<a href="/insertClubFrm.do">동호회 생성</a><br>
		<c:forEach items="${list }" var="c">
			<div style="background-color: green; color:white;">
				<div>동호회 명 : <span>${c.clubName }</span></div>
				<div>동호회 현재 회원 : <span></span></div>
				<div>동호회 정원 : <span>${c.clubLimit }</span></div>
				<a href="/clubDetail.do?clubNo=${c.clubNo}">동호회로 이동</a>
			</div>
		</c:forEach>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>