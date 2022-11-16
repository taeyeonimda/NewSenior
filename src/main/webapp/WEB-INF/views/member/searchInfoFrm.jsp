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
		width: 450px;
		height:320px;
		margin: 15px auto;
		padding-top: 35px;
		background: #FFFFFF;
		/*box-shadow: 0 0 45px rgb(0 0 0/ 10%);
		border-radius: 5%;*/
	}
	.txt1{
	font-family: 'KOHIBaeumOTF';
		text-align: center;
		font-size: 1.5em;
		color:#000;
		width: 250px;
		margin: 0 auto;
	}
	.txt2{
		text-align: left;
		margin: 0 auto;
		font-size: 1.5em;
		width: 300px;
		
	}
	.box1{
		text-align: center;
	}
	.box2{
	  font-family: 'GmarketSansMedium';
		width: 446px;
		height: 50px;
		font-size: 1.3em;
		margin-bottom: 20px;
		border: 1px solid #aaa;
	}
	.box3{
		width: 140px;
		height: 50px;
		font-size: 1.3em;
		margin-bottom: 15px;
		border: 1px solid #aaa;
	}
	.box4{
	font-family: 'GmarketSansMedium';
	border: none;
	color: #dc3545;
	background-color: #fff;
	border: 1px solid  #dc3545;
	}
	.box4:hover{
	color: #fff;
	background-color: #dc3545;
	}
	input::placeholder{
	padding-left: 15px;
	}
	#memberPhone1{
	padding-left: 10px;
	}
	
			//얇음
			@font-face {
			    font-family: 'LeferiPoint-WhiteObliqueA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			//두껍
			@font-face {
			    font-family: 'GangwonEduPowerExtraBoldA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEduPowerExtraBoldA.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			//물많이
			@font-face {
		    font-family: 'OKCHAN';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/OKCHAN.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
			}
			
			@font-face {
			    font-family: 'KOHIBaeumOTF';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/KOHIBaeumOTF.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
			    font-family: 'SANJUGotgam';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2112@1.0/SANJUGotgam.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
		    font-family: 'GmarketSansMedium';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
		}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header3.jsp"%>
	<div class="wra">
		<form action="/searchId.do" method="post">
			<div class="txt1" >아이디 찾기</div><br>
			<div class="box1">
				<input type="text" placeholder="이름을 입력해주세요." name="memberName"  class="box2" maxlength="7">
				<br>
				<select name="memberPhone1" id="memberPhone1" class="box3">
							<option value="010">010</option>
							<option value="010">011</option>
							<option value="010">016</option>
							<option value="010">017</option>
							<option value="010">018</option>
							<option value="010">019</option>
						</select>
						- <input name="memberPhone2" id="memberPhone2" class="tel box3"  placeholder="1234"  onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength="4"> -
						<input name="memberPhone3" id="memberPhone3" class="tel box3" placeholder="5678"  onkeyup="this.value=this.value.replace(/[^-0-9]/g,'');" maxlength="4"><br>
			<input type="submit" value="아이디 찾기" class="box2 box4">
			</div>
		</form>
	</div>
	<hr style="width: 500px; margin: 0 auto;">
	<div class="wra">
		<form action="/searchPw.do" method="post" onsubmit="return checkPw();">
			<div class="txt1" >비밀번호 찾기</div><br>
			<div class="box1">
				<input type="text" placeholder="아이디를 입력해주세요." name="memberId"  class="box2 mi">
				<input type="email" placeholder="이메일을 입력해주세요." name="memberEmail" class="box2 em"><br>
			<input type="submit" value="비밀번호 찾기" id="pwBtn"  class="box2 box4">
			</div>
		</form>
	</div>
	
	
	<script type="text/javascript">
	function checkPw(){
		const memberId = $(".mi").val();
		const memberEmail = $(".em").val();
		//공백인지 확인
		if(memberId == "" || memberEmail == ""){
			alert("입력이 안된 곳이 있습니다.")
			return false;
			//공백이 아니면
		}else{
			//아이디랑 이메일 일치하는게 있는지 확인
			$.ajax({
				url:"/pwCheck.do",
				data: {memberId:memberId, memberEmail:memberEmail},
				success: function(data){
					//일치
					if(data == "0"){
						//이메일 전송
						$.ajax({
							url:"/changePw.do",
							data: {memberId:memberId, memberEmail:memberEmail},
							success: function(data){
								//이메일 발송 성공 -> DB에서 비밀번호 변경해주기
								if(data == "0"){
									location.href="/searchPwSuccess.do";
									return true;
									//이메일 발송 실패
								}else{
									alert("회원정보를 찾을 수 없습니다.");
									return false;
								}
							}
						});
					//불일치
					}else{
						alert("회원정보를 찾을 수 없습니다.");
						return false;
					}
				}//success끝		
				
			});
			return false;
		}
	}
	
	</script>
</body>
</html>