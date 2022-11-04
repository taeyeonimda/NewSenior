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
	<h1>자유게시판</h1>
	<table border="1">
	
		<button><a href="/boardWriteFrm.do">글작성</a></button>
	
		<tr>
			<th>번호</th><th>제목</th><th>작성자<th>조회수</th><th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="b" varStatus="i">
		<tr>
		
			<td>${(reqPage-1)*numPerPage+i.count }</td>
			<td><a href="/boardView.do?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
			<td>${b.nickName }</td>
			<td>${b.boardCount }</td>
			<td>${b.boardDate }</td>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="5">
				${pageNavi }
			</th>
		</tr>
		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>