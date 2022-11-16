<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
.wra {
	width: 500px;
	padding: 50px 0;
	margin: 100px auto;
	background: #FFFFFF;
}
	.txt1{
	text-align: center;
	font-size: 2em;
	}
	.txt2{
	text-align: center;
	font-size: 1.5em;
	color: #dc3545;
	}
	.box1{
	text-align: center;
	}
	.box2{
	width: 300px;
	height: 50px;
	font-size: 1.3em;
	}
	.box3{
	width: 100px;
	height: 50px;
	background-color:#dc3545;
	border:none;
	color: #fff;
	font-size: 1.3em;
	}
	.box3:hover{
	background-color:#198754;
	}
	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header3.jsp"%>
	<div class="wra" style="font-family: 'GmarketSansMedium'!important;">
		<form action="/currentPwCheck.do" method="post">
				<div class="txt1">비밀번호 변경</div>
				<hr style="margin-bottom: 40px;">
				<div class="txt2">현재 비밀번호를 입력해주세요.</div>
				<div class="box1">
				<input type="password" name="memberPw" class="box2"><input type="hidden" name="memberId" value="${sessionScope.m.memberId }"><input type="submit" value="확인" class="box3">
				</div>
		</form>
	</div>
</body>
</html>