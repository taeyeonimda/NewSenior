<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴시니어스</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
.wra {
	width: 500px;
	height:300px;
	padding: 50px 0;
	margin: 200px auto;
	background: #FFFFFF;
	box-shadow: 0 0 45px rgb(0 0 0/ 10%);
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
	background-color:#0F4229;
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
<%@include file="/WEB-INF/views/common/header2.jsp"%>
	<div class="wra">
		<form action="/pwChange.do" method="post" onsubmit="return checkPw();">
		<div class="txt1">비밀번호 변경</div><br>
		<div class="txt2">새로운 비밀번호를 입력해주세요.</div>
		<div class="box1">
		<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
		<input type="password" name="memberPw" class="box2"><input type="hidden"><input type="submit" value="변경" id="pwBtn"  class="box3"><br>
		<span id="pw1Chk"></span>
		</div>
	</form>
	</div>
	
	<script type="text/javascript">
	$("[name=memberPw]").on("change",function(){
		const memberPw = $(this).val();
		checkPw();
	});
	$("#pwBtn").on("click",function(){
		checkPw();
	});
	//비밀번호 유효성검사
	 function checkPw() {
       let pw = $("[name=memberPw]").val();
       let number = pw.search(/[0-9]/g);
       let english = pw.search(/[a-z]/ig);
       let spece = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);
       let reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;

       if (pw.length < 8 || pw.length > 20) {
    		$("#pw1Chk").text("8자리 ~ 20자리 이내로 입력해주세요.");
			$("#pw1Chk").css("color","red");
           return false;

       } else if (pw.search(/\s/) != -1) {
       	$("#pw1Chk").text("비밀번호는 공백 없이 입력해주세요.");
			$("#pw1Chk").css("color","red");
           return false;

       } else if (number < 0 || english < 0 || spece < 0) {
       	$("#pw1Chk").text("영문,숫자,특수문자를 혼합하여 입력해주세요.");
			$("#pw1Chk").css("color","red");
           return false;

       } else if ((number < 0 && english < 0) || (english < 0 && spece < 0) || (spece < 0 && number < 0)) {
       	$("#pw1Chk").text("영문,숫자, 특수문자 중 2가지 이상을 혼합하여 입력해주세요.");
			$("#pw1Chk").css("color","red");
           return false;

       } else if (/(\w)\1\1\1/.test(pw)) {
       	$("#pw1Chk").text("같은 문자를 4번 이상 사용하실 수 없습니다.");
			$("#pw1Chk").css("color","red");
           return false;

       }  else {
       	$("#pw1Chk").text("비밀번호가 정상적으로 입력되었습니다.");
			$("#pw1Chk").css("color","green");
           return true;
       }

       if (false === reg.test(pw)) {
       	$("#pw1Chk").text("비밀번호는 8자 이상이어야 하며, 숫자/대문자/소문자/특수문자를 모두 포함해야 합니다.");
			$("#pw1Chk").css("color","red");
           return false;
       } else {
       	$("#pw1Chk").text("비밀번호가 정상적으로 입력되었습니다.");
			$("#pw1Chk").css("color","green");
           return true;
       }
   }
</body>
</html>