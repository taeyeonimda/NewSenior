<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
.detail {
	display: inline-block;
	cursor: pointer;
}

.popup {
	display: none;
	width: 90%;
	height: 80vh;
	position: fixed;
	top: 51%;
	left: 50%;
	transform: translate(-50%, -50%);
	background: #ffffff;
	box-shadow: 10px 10px 10px rgb(0 0 0/ 20%);
	color: #424242;
	padding: 6% 5%;
	font-size: 12px;
	line-height: 1.5rem;
	border-radius: 15px;
	z-index: 99999;
	overflow-y: scroll;
	line-height: 1.5rem;
}

.zwicon-close {
	color: rgb(255, 255, 255);
	font-size: 2em;
	background-color: #b91a1a;
	padding-right: 10px;
	padding-left: 10px;
	border-radius: 70%;
}

.x_btn {
	text-align: right;
	margin: 15px;
	cursor: pointer;
}

.zwicon-close:hover {
	background-color: red;
}

.cont {
	text-align: left;
}

.personal_pop {
	z-index: 300;
}

.joinbox {
	display: flex;
	justify-content: center;
	padding: 5% 0;
}

.sp {
	display: inline-block;
	width: 160px;
	font-size: 1.5em;
}

.inbtn {
	width: 480px;
	height: 60px;
	margin-bottom: 30px;
	font-size: 1.2em;
	border-radius: 5px;
	border: 1.5px solid rgb(176, 174, 174);
}

.red {
	color: #dc3545;
	font-size: 0.7em;
	vertical-align: top;
}

[type=checkbox] {
	width: 20px;
	height: 20px;
}

.fs {
	font-size: 1.4em;
}

#memberJoin {
	width: 480px;
	height: 60px;
	color: #E8F5E9;
	background-color: #0F4229;
	border: none;
}

#memberJoin:hover {
	color: #E8F5E9;
	background-color: #348E38;
}

.wra {
	width: 800px;
	padding: 10px;
	margin: 0 auto;
	background: #FFFFFF;
	box-shadow: 0 0 45px rgb(0 0 0/ 10%);
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header2.jsp"%>
	<div class="wra">
		<form action="/join.do" method="post" class="joinbox">
			<fieldset>
				<span class="sp">이름<span class="red">*</span></span><span
					id="nameChk"></span><br> <input type="text"
					placeholder="이름을 입력해주세요." name="memberName" class="inbtn"><br>
				<span class="sp">아이디<span class="red">*</span></span><span
					id="idChk"></span><br> <input type="text"
					placeholder="아이디을 입력해주세요." name="memberId" class="inbtn"><br>
				<span class="sp">닉네임<span class="red">*</span></span><span
					id="nicChk"></span><br> <input type="text"
					placeholder="닉네임을 입력해주세요." name="nickName" class="inbtn"><br>
				<span class="sp">이메일 <span class="red">*</span></span><br> <input
					type="text" name="str_email01" id="str_email01 sz120"
					style="width: 150px;" class="inbtn"> @ <input type="text"
					name="str_email02" id="str_email02" style="width: 150px;" disabled
					value="naver.com" class="inbtn"> <select
					style="width: 150px; margin-right: 10px" name="selectEmail"
					id="selectEmail" class="inbtn">
					<option value="1">직접입력</option>
					<option value="naver.com" selected>naver.com</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="empas.com">empas.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="freechal.com">freechal.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="korea.com">korea.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanmir.com">hanmir.com</option>
					<option value="paran.com">paran.com</option>
				</select><span id="emailChk"></span><br> <span class="sp">비밀번호<span
					class="red">*</span></span><span id="pw1Chk"></span><br> <input
					type="password" placeholder="비밀번호를 입력해주세요." name="memberPw"
					class="inbtn"><br> <span class="sp">비밀번호확인<span
					class="red">*</span></span><span id="pw2Chk"></span><br>
				<input type="password" placeholder="비밀번호를 입력해주세요."
					name="memberPw_re" class="inbtn"><br> <span class="sp">전화번호<span
					class="red">*</span></span><br>
				<table>
					<tr>
						<td colspan="3"><select name="memberPhone1"
							id="memberPhone1"
							style="height: 60px; width: 150px; font-size: 1.5em; border-radius: 5px; border: 1.5px solid rgb(176, 174, 174); color: #525368;">
								<option value="010">010</option>
								<option value="010">011</option>
								<option value="010">016</option>
								<option value="010">017</option>
								<option value="010">018</option>
								<option value="010">019</option>
						</select> - <input name="memberPhone2" id="memberPhone2" class="tel inbtn"
							style="width: 150px; font-size: 1.5em;" placeholder="1234">
							- <input name="memberPhone3" id="memberPhone3" class="tel inbtn"
							style="width: 150px; font-size: 1.5em;" placeholder="5678">
						</td>
					</tr>
				</table>
				<span class="sp">관심사</span> <br> <select name="favorite"
					style="width: 480px; font-size: 1.5em; height: 60px; margin-bottom: 30px; border-radius: 5px; border: 1.5px solid rgb(176, 174, 174); color: #525368;">
					<option value="n">선택안함</option>
					<option value="dg">디지털</option>
					<option value="fu">주식/재테크</option>
					<option value="cr">공예</option>
					<option value="de">디자인</option>
					<option value="ex">운동/건강</option>
					<option value="fs">패션</option>
					<option value="me">미디어</option>
					<option value="so">악기/노래</option>
					<option value="fo">외국어</option>
					<option value="co">요리/제과제빵</option>
				</select> <br> <span class="sp">생년월일</span><span id="birthChk"></span><br>
				<input type="text" placeholder="예) 1999-10-08" name="memberBirth" onkeyup="birth_keyup(this)"
					class="inbtn"><br>
		</form>
		<input type="checkbox" class="checkBtn"><span class="fs">
			개인정보 수집 및 이용 동의</span> <span style="color: red; text-decoration: underline"
			class="detail fs">자세히보기</span> <br> <input type="submit"
			value="회원가입" id="memberJoin" class="fs">
		</fieldset>
	</div>

	<!-- 개인정보수집이용 동의 -->
	<div class="popup_bg"></div>
	<div class="popup personal_pop noto">
		<div class="x_btn">
			<span class="zwicon-close">X</span>
		</div>
		<div class="cont">
			여러분을 환영합니다.<br> 뉴시니어스 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. <br>본
			약관은 다양한 뉴시니어스 서비스의 이용과 관련하여 뉴시니어스 서비스를 제공하는 뉴시니어스 주식회사(이하 ‘뉴시니어스’)와
			이를 이용하는 뉴시니어스 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 뉴시니어스 서비스
			이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. <br>뉴시니어스 서비스를 이용하시거나 뉴시니어스
			서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의
			깊게 살펴봐 주시기 바랍니다. <br>개인정보보호법에 따라 뉴시니어스에 회원가입 신청하시는 분께 수집하는 개인정보의
			항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내
			드리오니 자세히 읽은 후 동의하여 주시기 바랍니다. <br>
			<br> 1. 수집하는 개인정보 이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 뉴시니어스
			서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를
			이용하기 위해 회원가입을 할 경우, 뉴시니어스는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다. <br>
			<br> 회원가입 시점에 뉴시니어스가 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br> - 회원
			가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 휴대전화번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는
			생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI),
			휴대전화번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다. - 단체아이디로 회원가입 시 단체아이디,
			비밀번호, 단체이름, 이메일주소, 휴대전화번호를 필수항목으로 수집합니다. 그리고 단체 대표자명을 선택항목으로 수집합니다.
			서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.<br> - 회원정보 또는 개별 서비스에서
			프로필 정보(별명, 프로필 사진)를 설정할 수 있습니다. 회원정보에 별명을 입력하지 않은 경우에는 마스킹 처리된 아이디가
			별명으로 자동 입력됩니다. <br> - 뉴시니어스 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당
			서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집
			시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를
			받습니다. <br> 서비스 이용 과정에서 IP 주소, 쿠키, 서비스 이용 기록, 기기정보, 위치정보가 생성되어
			수집될 수 있습니다. 또한 이미지 및 음성을 이용한 검색 서비스 등에서 이미지나 음성이 수집될 수 있습니다. 구체적으로 1)
			서비스 이용 과정에서 이용자에 관한 정보를 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한
			정보를 원래의 값을 확인하지 못 하도록 안전하게 변환하여 수집합니다. 서비스 이용 과정에서 위치정보가 수집될 수 있으며,
			뉴시니어스에서 제공하는 위치기반 서비스에 대해서는 '뉴시니어스 위치기반서비스 이용약관'에서 자세하게 규정하고 있습니다. 이와
			같이 수집된 정보는 개인정보와의 연계 여부 등에 따라 개인정보에 해당할 수 있고, 개인정보에 해당하지 않을 수도 있습니다.
			<br>
			<br> 2. 수집한 개인정보의 이용<br> 뉴시니어스 및 뉴시니어스 관련 제반 서비스(모바일 웹/앱
			포함)의 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다. <br>
			- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴
			의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.<br> - 콘텐츠 등 기존 서비스 제공(광고 포함)에
			더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및
			관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.<br>
			- 법령 및 뉴시니어스 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에
			지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록
			보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.<br> - 유료 서비스 제공에
			따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.<br> - 이벤트
			정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.<br> - 서비스
			이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에
			개인정보를 이용합니다.<br> - 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스
			이용환경 구축을 위해 개인정보를 이용합니다.<br>
			<br> 3. 개인정보의 보관기간<br> 회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이
			파기하고 있습니다.<br> 단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정
			기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.<br> 이용자에게 개인정보
			보관기간에 대해 회원가입 시 또는 서비스 가입 시 동의를 얻은 경우는 아래와 같습니다.<br> - 부정 가입 및
			이용 방지<br> 부정 이용자의 가입인증 휴대전화번호 또는 DI (만14세 미만의 경우 법정대리인DI) :
			탈퇴일로부터 6개월 보관 탈퇴한 이용자의 휴대전화번호(복호화가 불가능한 일방향 암호화(해시처리)) : 탈퇴일로부터 6개월
			보관 - QR코드 복구 요청 대응<br> QR코드 등록 정보:삭제 시점으로부터6개월 보관<br> -
			스마트플레이스 분쟁 조정 및 고객문의 대응<br> 휴대전화번호:등록/수정/삭제 요청 시로부터 최대1년<br>
			- 뉴시니어스 플러스 멤버십 서비스 혜택 중복 제공 방지<br> 암호화처리(해시처리)한DI :혜택 제공
			종료일로부터6개월 보관<br> - 지식iN eXpert 재가입 신청 및 부정 이용 방지<br> eXpert
			서비스 및 eXpert 센터 가입 등록정보 : 신청일로부터 6개월(등록 거절 시, 거절 의사 표시한 날로부터 30일) 보관<br>
			전자상거래 등에서의 소비자 보호에 관한 법률, 전자문서 및 전자거래 기본법, 통신비밀보호법 등 법령에서 일정기간 정보의
			보관을 규정하는 경우는 아래와 같습니다. 뉴시니어스는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른
			목적으로는 절대 이용하지 않습니다.<br> - 전자상거래 등에서 소비자 보호에 관한 법률<br> 계약 또는
			청약철회 등에 관한 기록: 5년 보관<br> 대금결제 및 재화 등의 공급에 관한 기록: 5년 보관<br>
			소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관<br> - 전자문서 및 전자거래 기본법<br>
			공인전자주소를 통한 전자문서 유통에 관한 기록 : 10년 보관<br> - 전자서명 인증 업무<br>
			인증서와 인증 업무에 관한 기록: 인증서 효력 상실일로부터 10년 보관<br> - 통신비밀보호법<br>
			로그인 기록: 3개월<br> <br> 참고로 뉴시니어스는 ‘개인정보 유효기간제’에 따라 1년간 서비스를
			이용하지 않은 회원의 개인정보를 별도로 분리 보관하여 관리하고 있습니다. <br>
			<br> 4. 개인정보 수집 및 이용 동의를 거부할 권리<br> 이용자는 개인정보의 수집 및 이용 동의를
			거부할 권리가 있습니다. 회원가입 시 수집하는 최소한의 개인정보, 즉, 필수 항목에 대한 수집 및 이용 동의를 거부하실
			경우, 회원가입이 어려울 수 있습니다.
		</div>
	</div>

	<script type="text/javascript">
		//이메일 입력방식 선택
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {

				if ($(this).val() == '1') { //직접입력일 경우
					$("#str_email02").val(''); //값 초기화
					$("#str_email02").attr("disabled", false); //활성화
				} else { //직접입력이 아닐경우
					$("#str_email02").val($(this).text()); //선택값 입력
					$("#str_email02").attr("disabled", true); //비활성화
				}
			});
		});
		
		//개인정보수집이용동의
		  $(".detail").click(function(){
    	  $(".popup_bg").stop().fadeIn();
    	  $(".popup.personal_pop").stop().fadeIn();
  		});

  		  $(".popup_bg").on("click", onPopClose);
  		  $(".x_btn").on("click", onPopClose);

		  function onPopClose() {
		    $(".popup_bg").stop().fadeOut();
		    $(".popup.personal_pop").stop().fadeOut();
		  }
		  
		  //아이디 중복체크 && 유효성검사
		  $("[name=memberId]").on("change",function(){
			const memberId = $(this).val();
			$.ajax({
				url : "/idCheck.do",
				data : {memberId : memberId},
				success : function(data){
					if(data == "0"){
						if(memberId.length<5 || memberId.length>12){
							$("#idChk").text("5자 이상 12자 이하로 입력해주세요.");
							$("#idChk").css("color","red");
							return false;
						}else {
							$("#idChk").text("사용 가능한 아이디입니다.");
							$("#idChk").css("color","green");
						}
						
					}else{
						$("#idChk").text("이미 사용중인 아이디입니다.");
						$("#idChk").css("color","red");
						return false;
					}
				}
			});
		  });
		  
		  //닉네임 중복체크
		  $("[name=nickName]").on("change",function(){
			const nickName = $(this).val();
			$.ajax({
				url : "/idCheck.do",
				data : {nickName : nickName},
				success : function(data){
					if(data == "0"){
						if(nickName.length<3 || nickName.length>10){
							$("#nicChk").text("3자 이상 10자 이하로 입력해주세요.");
							$("#nicChk").css("color","red");
							return false;
						}else{
							$("#nicChk").text("사용 가능한 닉네임입니다.");
							$("#nicChk").css("color","green");
						}
					}else{
						$("#nicChk").text("이미 사용중인 닉네임입니다.");
						$("#nicChk").css("color","red");
						return false;
					}
				}
			});
		  });
		//이메일 유효성체크 
		$("[name=str_email01]").on("change",function(){
			const email = $(this).val();
			if(email.length<5 || email.length>21){
				$("#emailChk").text("3자 이상 10자 이하로 입력해주세요.");
				$("#emailChk").css("color","red");
				return false;
			}else{
				$("#emailChk").text("");
			}
		});
		//비밀번호 유효성검사
		$("[name=memberPw]").on("change",function(){
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
		//비밀번호 확인 유효성 검사
		 function checkPw_re() {
		        let pw = $("[name=memberPw]").val();
		        let pw_re = $("[name=memberPw_re]").val();
		        if(pw !=pw_re){
		        	$("#pw2Chk").text("비밀번호가 일치하지 않습니다.");
					$("#pw2Chk").css("color","red");
					return false;
		        }else {
		        	$("#pw2Chk").text("비밀번호가 일치합니다.");
					$("#pw2Chk").css("color","green");
					return true;
		        }
		 }
		//비밀번호 확인 유효성 검사
		$("[name=memberPw_re]").on("change",function(){
			checkPw_re();
		});
		
		$("#memberJoin").on("click",function(){
			if($("[name=memberName]").val() == ""){
				alert("이름을 입력해주세요.");
				return false;
			}
			if($("[name=memberId]").val() == ""){
				alert("아이디을 입력해주세요.");
				return false;
			}
			if($("[name=memberNickname]").val() == ""){
				alert("닉네임을 입력해주세요.");
				return false;
			}
			if($("[name=str_email01]").val() == ""){
				alert("이메일을 입력해주세요.");
				return false;
			}
			if($("[name=memberPw]").val() == ""){
				alert("비밀번호를 입력해주세요.");
				return false;
			}
			if($("[name=memberPw_re]").val() == ""){
				alert("비밀번호 확인을 해주세요.");
				return false;
			}
			if($("[name=memberPhone2]").val() == ""){
				alert("전화번호를 입력해주세요.");
				return false;
			}
			if($("[name=memberPhone3]").val() == ""){
				alert("전화번호를 입력해주세요.");
				return false;
			}
			if($("[name=memberBirth]").val() == ""){
				alert("생일을 입력해주세요.");
				return false;
			}
			
			if(!$(".checkBtn").is(":checked")){
			alert("개인정보수집 동의를 해주세요.");
			return false;
			}
		});
		
		//생년월일 자동 하이픈
		function birth_keyup(obj){
	    let birth_len = obj.value.length;
	    if (event.keyCode==8){
	        obj.value = obj.value.slice(0,birth_len)
	        return 0;
	    }else if(birth_len==4 || birth_len==7){
	        obj.value += '-';
	    }
}
	</script>
</body>
</html>