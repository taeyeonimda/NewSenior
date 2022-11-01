<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 생성</title>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="center-div">
			<form action="/insertClub.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="clubLeader" value="4">
				클럽이름 : <input type="text" name="clubName"><br>
				클럽제한 : 
					<select name="clubLimit" class="form-control bg-light border-0">
	                    <option value='' selected>동아리 최대 정원</option>
	                    <option value="10">10</option>
	                    <option value="20">20</option>
	                    <option value="30">30</option>
	                    <option value="40">40</option>
	                    <option value="50">50</option>
	                </select><br>
				클럽분류 :
				<select name="clubCategory" class="form-control bg-light border-0">
	                    <option value='' selected>카테고리</option>
	                    <option value="dg">디지털</option>
	                    <option value="fu">주식/재테크</option>
	                    <option value="cr">공예</option>
	                    <option value="de">디자인</option>
	                    <option value="ex">운동</option>
	                    <option value="fs">패션</option>
	                    <option value="me">미디어</option>
	                    <option value="so">악기/노래</option>
	                    <option value="fo">외국어</option>
	                    <option value="co">요리/미식</option>
	                    <option value="etc">기타</option>
	                </select><br>
				클럽소개 : <input type="text" name="clubIntro"><br>
				클럽 메인 이미지 : <input type="file" multiple name="files"><br>
				<button class="btn btn-primary py-3 px-4" type="submit">Submit Now</button>
			</form>
		</div>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>