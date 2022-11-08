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
	
	<div class="sortBoard">
		<form action="/searchCategory.do?reqPage=1" method="post">
			
			<button class="categoryBtn">조회</button>
		</form>
		
	</div>
	
	<button><a href="/boardWriteFrm.do">글작성</a></button>
	
	<table border="1">
		<tr>
			<th>번호</th><th>카테고리</th><th>제목</th><th>작성자<th>조회수</th><th>작성일</th>
		</tr>
		<c:forEach items="${list }" var="b" varStatus="i">
		<tr>
		
			<td>${(reqPage-1)*numPerPage+i.count }</td>
			<td>${b.boardCategory }</td>
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
		</table>
		
		<div class="searchForm">
			<form action="/searchBoard.do?reqPage=1" method="post">
				<select name="categoryTag">
					<option value="all">전체</option>
					<option value="info">정보</option>
					<option value="etc">기타</option>
				</select>
				<select name="searchTag">
					<option value="nickName">작성자</option>
					<option value="boardTitle">제목</option>
				</select>
				
				<input type="text" name="searchInput">
				<button class="searchBtn">검색</button>
			</form>
		</div>

		
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>	
</body>
</html>