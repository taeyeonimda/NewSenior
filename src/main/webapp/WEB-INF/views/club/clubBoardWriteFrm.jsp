<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="center-div">
			<form action="/clubBoardWrite.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="clubNo" value="4">
			<input type="hidden" name="clubLeader" value="4">
			<input type="hidden" name="clubLeader" value="4">
			<textarea name="clubBoardContent"></textarea>
			클럽 메인 이미지 : <input type="file" multiple name="files"><br>
			<button class="btn btn-primary py-3 px-4" type="submit">글쓰기</button>
			</form>
		</div>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>