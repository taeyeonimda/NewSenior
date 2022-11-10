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
	<form action="/boardUpdate.do" id="boardUpdateForm" method="post" enctype="multipart/form-data">
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
				<input type="hidden" name="boardType" value="${boardType}">
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
					<input type="submit" id="boardUpdateBtn" value="수정하기">
				</td>
			</tr>
			
		</table>
	</form>
	<script>
		function deleteFile(obj,fileNo,filepath){
			//삭제 버튼 눌렀을때 데이터를 컨트롤러로 전송해줘야함 "/boardUpdate.do"로 전달
			//ajax로??
			const fileNoInput = $("<input>");
			fileNoInput.attr("name","fileNoList");
			fileNoInput.val(fileNo);
			fileNoInput.hide();
			//<input type="text" name="fileNolist" value="fileNo">
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepathList");
			filepathInput.val(filepath);
			filepathInput.hide();
			//<input type="text" name="filepathList" value="filepath">
			$("#updateFrm").append(fileNoInput).append(filepathInput);
			
			$(obj).parent().remove(); // 파일네임 지워줌
			
		}
		
		$("#boardUpdateBtn").on("click",function(e){
			const boardTitle = $("[name=boardTitle]")
			const boardContent = $("#boardContent")
			const boardUpdateForm =$("#boardUpdateForm")
			if(boardTitle.val()==""){
				alert('제목을 입력해주세요');
				return false;
			}
			if(boardContent.val()==""){
				alert('내용을 입력해주세요');
				return false;
			}
		
			boardUpdateForm.submit();
		
			});

	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>