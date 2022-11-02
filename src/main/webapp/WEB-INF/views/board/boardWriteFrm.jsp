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
	<h1>자유게시판 작성</h1>
	<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				${sessionScope.m.nickName }
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				</td>	
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="boardFile" multiple></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="작성">
				</td>
			</tr>
			
		</table>
	</form>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>