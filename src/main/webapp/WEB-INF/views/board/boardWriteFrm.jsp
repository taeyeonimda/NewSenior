<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<h1>자유게시판 작성</h1>
	<form action="/boardWrite.do" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<select name="boardCategory">
					<option value="info">정보</option>
					<option value="etc">기타</option>
				</select>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				${sessionScope.m.nickName }
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="boardType" value="F">
													<%--게시판 바꾸면 이 값도 바꿔줌 --%>
				</td>	
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="boardFile" multiple></td>
			</tr>
			<tr>
				<th>파일목록</th>
				<td colspan="3">
			<c:forEach items="${b.fileList }" var="bf">
				<td>${b.filename }</td>
			</c:forEach>
		</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContent" id="boardContent"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="작성">
				</td>
			</tr>
			
		</table>
	</form>
<script>
		$("#boardContent").summernote({
			height:400,
			lang:"ko-KR",
			callbacks : {
				//onImageUpload : function(files){
					//for(let i=0;i<files.length;i++){
						//uploadImage(files[i],this);
						onImageUpload : function(files){
						uploadImage(files[0],this);
				}
			}
		});
		function uploadImage(file,editor){
			//ajax통해서 서버에 이미지를 업로드
			//업로드된 이미지의 경로를 받아오는 역할
			//<form>태그와 동일한 효과를 발생시킬 수 있는 객체
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImages.do",
				type : "post", // 무조건 post형식(파일업로드)
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					console.log(data);
									//ㄴjsp에서 넘겨준 데이터가 들어옴(파일경로)
					$(editor).summernote("insertImage",data);
					
				}
			});
			//processData : 전송하는 데이터를 문자열로 전송하게 기본값이 설정되어 있음
			//				-> 파일 전송을 위해 기본값 제거하는 작업
			//contentType : enctype="application/x-www-form-urlencoded;charset=UTF-8"
			//				-> 설정되어 있는 기본 enctype을 제거
			
		}
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
</body>
</html>