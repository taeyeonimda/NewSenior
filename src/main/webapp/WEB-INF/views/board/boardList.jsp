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
	<table border="1">
		<tr>
			<th>번호</th><th>제목</th><th>조회수</th><th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="b" varStatus="i">
		<tr>
		
			<td>${(reqPage-1)*numPerPage+i.count }</td>
			<td><a href="/boardView.do?boardNo=${b.boardNo}">${b.boardTitle }</a></td>
			<td>${b.boardCount }</td>
			<td>${b.boardDate }</td>
		</tr>
		</c:forEach>
		<tr>
			<th colspan="4">
				${pageNavi }
			</th>
		</tr>
	</table>
</body>
</html>