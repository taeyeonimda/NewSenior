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
		box-shadow: 0 0 45px rgb(0 0 0/ 10%);
		border-radius: 5%;
	}
	.txt1{
		text-align: center;
		font-size: 2em;
		color:#000;
	}
	.txt2{
		margin: 0 auto;
		font-size: 1.5em;
		width: 500px;
		text-align: center;
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
	.box4>a{
	color: #fff;
	text-decoration: none;
	}
	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header2.jsp"%>

	<div class="wra">
		<div class="txt2">${member.memberName }님의  아이디는 <span style="color:red;">${member.memberId }</span>입니다.</div><br>
			<div class="box1">
			<button  class="box2 box4 btn"  style="background-color: #dc3545; color:#fff;">로그인하러가기</button>
			</div>
		</div>
	<script type="text/javascript">
	$(".btn").on("click",function(){
		$(".loginBtn").click();
	});
	$(".btn").on("mouseover",function(){
		$(this).css("background-color"," #ffc107").css("color","#fff");
	});
	$(".btn").on("mouseout",function(){
		$(this).css("background-color"," #dc3545").css("color","#fff");
	});
	</script>
</body>
</html>