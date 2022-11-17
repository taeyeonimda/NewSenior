<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 생성</title>
<link href="/resources/css/club/club-detail.css" rel="stylesheet">
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content mt-5" style="margin-top: 100px;">
		<div style="margin: 0 auto; width: 50%;" class="mt-5">
			<h1>Create a New Club</h1>
			<img alt="" src="/resources/img/은비.jpg" width="100%;">
		</div>
		<div style="margin: 0 auto; width: 50%; border-top: 1px solid #bbb;">
			<form action="/insertClub.do" method="post" enctype="multipart/form-data">
			<table class="table">
				<tr>
					<th>동호회명</th>
					<td><input type="text" class="form-control bg-light border-0" name="clubName"><input type="hidden" name="clubLeader" value="${sessionScope.m.memberNo }"></td>
				</tr>
				<tr>
					<th>동호회 최대 인원</th>
					<td>
					<select name="clubLimit" class="form-control bg-light border-0">
	                    <option value='' selected>동아리 최대 정원</option>
	                    <option value="10">10</option>
	                    <option value="20">20</option>
	                    <option value="30">30</option>
	                    <option value="40">40</option>
	                    <option value="50">50</option>
	                </select>
	                </td>
				</tr>
				<tr>
					<th>동호회 분류</th>
					<td>
						<select name="clubCategory" class="form-control bg-light border-0">
		                    <option value='' selected>카테고리</option>
		                    <option value="DG">디지털</option>
		                    <option value="FU">주식/재테크</option>
		                    <option value="CR">공예</option>
		                    <option value="DE">디자인</option>
		                    <option value="EX">운동</option>
		                    <option value="FS">패션</option>
		                    <option value="ME">미디어</option>
		                    <option value="SO">악기/노래</option>
		                    <option value="FO">외국어</option>
		                    <option value="CO">요리/미식</option>
		                    <option value="NO">기타</option>
	                	</select><br>
					</td>
				</tr>
				<tr>
					<th>동호회 소개글</th>
					<td><textarea class="form-control bg-light border-0" name="clubIntro"></textarea></td>
				</tr>
				<tr>
					<th>동호회 메인 이미지</th>
					<td><input type="file" class="form-control bg-light border-0" style="resize: none;" multiple name="files" accept=".gif, .jpg, .png"></td>
				</tr>
				<tr>
					<th colspan="2"><div style="text-align: right;"><button class="btn btn-primary py-3 px-4" type="submit">등록하기</button></div></th>
				</tr>
			</table>
			</form>
		</div>
	</div>
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
</body>
</html>