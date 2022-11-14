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
		width: 600px;
		height:200px;
		margin: 100px auto;
		padding-top: 35px;
		background: #FFFFFF;
	}
	.txt1{
		text-align: center;
		font-size: 2em;
		color:#000;
	}
	.txt2{
		text-align: center;
		margin: 0 auto;
		font-size: 1.5em;
		width: 600px;
		
	}
	.box1{
		text-align: center;
	}
	.box2{
		width: 300px;
		height: 50px;
		font-size: 1.3em;
		margin-bottom: 20px;
		border-radius: 5px;
		border: 1px solid #aaa;
		background-color: #dc3545;
	}
	.box3{
		width: 90px;
		height: 50px;
		font-size: 1.3em;
		margin-bottom: 40px;
		border-radius: 5px;
		border: 1px solid #aaa;
	}
	.box4{
	border: none;
	color: #fff;
	background-color: #dc3545;
	}
	.box4:hover{
	color: #fff;
	background-color: #ffc107;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header3.jsp"%>
	<div class="wra">
		<div class="txt2">임시비밀번호가 이메일로 전송되었습니다.</div><br>
			<div class="box1">
			<button  class="box2 box4 btn" style="background-color: #fff; color:#dc3545; border: 1px solid #dc3545;">로그인하러가기</button>
			</div>
		</div>
	<script type="text/javascript">
	$(".btn").on("click",function(){
		$(".loginBtn").click();
	});
	$(".btn").on("mouseover",function(){
		$(this).css("background-color"," #dc3545").css("color","#fff");
	});
	$(".btn").on("mouseout",function(){
		$(this).css("background-color"," #fff").css("color","#dc3545");
	});
	</script>
	
</body>
</html>