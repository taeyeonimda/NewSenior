<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판 수정</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	
<h1>자유게시판 수정</h1>
	<form action="/boardUpdate.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				
			</tr>
			<tr>
				<th>글번호</th>
				<td><input type="hidden" name="boardNo" value="${b.boardNo}">${b.boardNo}</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<td>
				<select name="boardCategory">
					<option value="info" <c:if test="${b.boardCategory eq 'info'}">selected</c:if>>정보</option>
					<option value="etc" <c:if test="${b.boardCategory eq 'etc'}">selected</c:if>>기타</option>
				</select>
				</td>
				
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="boardTitle" value="${b.boardTitle}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				${sessionScope.m.nickName }
				<input type="hidden" name="boardType" value="F">
													<%--게시판 바꾸면 이 값도 바꿔줌 --%>
				</td>	
			</tr>
			<tr>	
				<th>작성일</th>
				<td>${b.boardDate }</td>
			</tr>
			<tr>
				<th>첨부파일 추가하기</th>
				<td><input type="file" name="boardFile" multiple></td>
			</tr>
			<tr>
				<th>파일목록</th>
				<td colspan="3">
			<c:forEach items="${b.fileList }" var="bf">
				<td>${bf.filename }
				<button type="button" onclick="deleteFile(this,${bf.fileNo},'${bf.filepath}');">삭제</button></td>
				
				<td><input type="hidden" name="fileNoList" value="${bf.fileNo }"></td>
				<td><input type="hidden" name="filepathList" value="${bf.filepath }"></td>
				<td><input type="hidden" name="filename" value="${bf.filename }"></td>
				<td>${bf.fileNo }</td>
				<td>${bf.filepath }</td>
			</c:forEach>
		</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContent" id="boardContent">${b.boardContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정하기">
				</td>
			</tr>
			
		</table>
	</form>
	<script>
		function deleteFile(obj,fileNo,filepath){
			$(obj).parent().remove();
		}

	</script>
	
</body>
</html>