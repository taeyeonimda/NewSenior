<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>뉴시니어스</title>
    <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
  			
        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
    
        <!-- Libraries Stylesheet -->
        <link href="/resources/TGbtstr/lib/animate/animate.min.css" rel="stylesheet">
        <link href="/resources/TGbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="/resources/TGbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    
        <!-- Customized Bootstrap Stylesheet -->
        <link href="/resources/TGbtstr/css/bootstrap.min.css" rel="stylesheet">
    	<link href="/resources/TGbtstr/css/productList.css" rel="stylesheet">
        <!-- Template Stylesheet -->
        <link href="/resources/TGbtstr/css/styleTG.css" rel="stylesheet">
        <!-- 로그인 모달 css
        <link href="/resources/css/login/login.css" rel="stylesheet">
        -->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"><!-- datepicker -->
 		<link rel="stylesheet" href="/resources/css/datepicker.css"><!--datepickercss--> 
 		<script src="https://code.jquery.com/jquery-3.6.1.js"></script> 
		<!-- 카카오 로그인 -->
        <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
        <!-- sweetalert -->
		<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>        
         <style type="text/css">
         @charset "UTF-8";
         .swal2-popup {
		    width: 24em !important;
		 }
         .swal2-styled.swal2-confirm{
         	background-color: #0F4229 !important;
         }
			.detail {
			  display: inline-block;
			  cursor: pointer;
			}
			.popup00{
			  display: none;
			  width: 45%;
			  position: fixed;
			  top: 55%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  background: #fff;
			  box-shadow: 10px 10px 10px rgb(0 0 0 / 20%);
			  color: #000000;
			  padding: 2% 5%;
			  padding-bottom: 3%;
			  font-size: 12px;
			  line-height: 1.5rem;
			  border-radius: 15px;
			  z-index: 99999;
			  line-height: 1.5rem;
			  overflow: hidden auto;
			  /*
			  backdrop-filter: blur(4px);
  			-webkit-backdrop-filter: blur(4px);*/
			  
			}
			.zwicon-close00{
			  color: rgb(255, 255, 255);
			  font-size: 2em;
			  background-color: #0F4229;
			  padding-right: 10px;
			  padding-left: 10px;
			  border-radius: 70%;
			}
			.x_btn00{
			  text-align: right;
			  margin: 15px;
			  cursor: pointer;
			}
			.zwicon-close00:hover {
			  background-color: #b91a1a;
			}
			.cont00{
			 font-family: 'GangwonEduPowerExtraBoldA';
			  text-align: left;
			}
			.personal_pop00{
			  z-index: 3000000;
			}
			#login_header{
			  text-align: center;
			  font-size: 1.8rem;
			}
			.login_cont{
			  text-align: center;
			}
			.txt_1_1{
			  font-size: 1.1rem;
			}
			.txt_1{
			  font-size: 1rem;
			}
			.txt_07{
			  font-size: 0.7rem;
			}
			.txt_3{
			  font-size: 1rem;
			}
			.txt_4{
			 font-size: 0.8rem;
			}
			.flex00{
			  display: flex;
			}
			.flex_01{
			  width: 60%;
			  justify-content: space-between;
			  margin: 10px auto;
			  margin-bottom: 30px;
			}
			.boxSize_2{
			  width: 350px;
			  height:60px;
			  padding: 2.5% 1%;
			  margin: 0 auto;
			  border-radius: 5px;
			  border: 1px solid rgb(176, 174, 174);
			}
			.boxSize_2:hover{
			  border: 1.5px solid rgb(120, 120, 120);
			}
			
			.color_g{
			  border: none;
			  background-color: #348E38;
			}
			.color_g_b{
			  border: 1px solid #348E38;
			}
			.bg_g{
			  background-color: rgba(0, 0, 0, 0.238)!important;
			}
			.bg-white1{
				background-color: #fff;
			}
			.loginBtn_1{
			  cursor: pointer;
			}
			.loginBtn_1:hover{
			  border: none;
			  background-color: #217125;
			  color: #fff;
			}
			.c_red{
			color: #b91a1a;
			}
			.f_c{
			  color: #000000;
			}
			.f_c:hover{
			  color: #fff;
			}
			.txt_d1{
			  text-decoration: none;
			}
			.fw_8:hover{
			  font-weight: 800;
			}
			input[type=checkbox]{
			  width: 17px;
			  height: 17px;
			}
			input::placeholder {
			padding-left:15px;
			font-weight:800;
			color: #9fa2a6;
			}
			.hov{
			color:#ffc107;
			}
			.hov:hover:{
			color:#198754;
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
			@font-face {
			    font-family: 'PyeongChangPeace-Bold';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-02@1.0/PyeongChangPeace-Bold.woff2') format('woff2');
			    font-weight: 700;
			    font-style: normal;
			}
			//얇은
			@font-face {
			     font-family: 'S-CoreDream-3Light';
			     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/S-CoreDream-3Light.woff') format('woff');
			     font-weight: normal;
			     font-style: normal;
			}
			//강원교육체
			@font-face {
			    font-family: 'GangwonEdu_OTFBoldA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
			    font-weight: normal;
			    font-style: normal;
			}
			//웰컴
			@font-face {
			    font-family: 'OTWelcomeRA';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2110@1.0/OTWelcomeRA.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
		    font-family: 'LeferiPoint-WhiteObliqueA';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/LeferiPoint-WhiteObliqueA.woff') format('woff');
		    font-weight: normal;
		    font-style: normal;
			}
			@font-face {
			    font-family: 'Tenada';
			    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Tenada.woff2') format('woff2');
			    font-weight: normal;
			    font-style: normal;
			}
			@font-face {
		    font-family: 'FlowerSalt';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/FlowerSalt.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
			body *{
			 font-family: 'GmarketSansMedium';
			}
	</style>
         
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-white1 navbar-light sticky-top p-0">
        <a href="/" class="navbar-brand d-flex align-items-center px-2 px-lg-3">
            <img src="/resources/MAINbtstr/img/로고1.png" width="250px">
        </a>
        <button type="button" class="navbar-toggler me-4" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse" style="padding-right: 15px;">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
             <!-- 클래스 -->
                <div class="nav-item dropdown">
                    <a href="/classList.do?classCategory=AL&reqPage=1" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" onclick="location.href='/classList.do?classCategory=AL&reqPage=1'">클래스</a>
                    <div class="dropdown-menu bg-light m-0">
                    	<a href="/classList.do?classCategory=AL&reqPage=1" class="dropdown-item">전체</a>
                        <a href="/classList.do?classCategory=DG&reqPage=1" class="dropdown-item">디지털</a>
                        <a href="/classList.do?classCategory=FU&reqPage=1" class="dropdown-item">주식 / 재태크</a>
                        <a href="/classList.do?classCategory=CR&reqPage=1" class="dropdown-item">공예</a>
                        <a href="/classList.do?classCategory=DE&reqPage=1" class="dropdown-item">디자인</a>
                        <a href="/classList.do?classCategory=EX&reqPage=1" class="dropdown-item">운동 / 건강</a>
                        <a href="/classList.do?classCategory=FS&reqPage=1" class="dropdown-item">패션</a>
                        <a href="/classList.do?classCategory=ME&reqPage=1" class="dropdown-item">미디어</a>
                        <a href="/classList.do?classCategory=SO&reqPage=1" class="dropdown-item">악기 / 노래</a>
                        <a href="/classList.do?classCategory=FO&reqPage=1" class="dropdown-item">외국어</a>
                        <a href="/classList.do?classCategory=CO&reqPage=1" class="dropdown-item">요리 / 제과제빵</a>
                        <a href="/classList.do?classCategory=NO&reqPage=1" class="dropdown-item">기타</a>                      
                    </div>
                </div>
                <!-- 액티비티 -->
                <div class="nav-item dropdown">
                    <a href="/activityList.do?activityCategory=AL&reqPage=1" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" onclick="location.href='/activityList.do?activityCategory=AL&reqPage=1'">액티비티</a>
                    <div class="dropdown-menu bg-light m-0">
                    	<a href="/activityList.do?activityCategory=AL&reqPage=1" class="dropdown-item">전체</a>
                        <a href="/activityList.do?activityCategory=DG&reqPage=1" class="dropdown-item">디지털</a>
                        <a href="/activityList.do?activityCategory=FU&reqPage=1" class="dropdown-item">주식 / 재태크</a>
                        <a href="/activityList.do?activityCategory=CR&reqPage=1" class="dropdown-item">공예</a>
                        <a href="/activityList.do?activityCategory=DE&reqPage=1" class="dropdown-item">디자인</a>
                        <a href="/activityList.do?activityCategory=EX&reqPage=1" class="dropdown-item">운동 / 건강</a>
                        <a href="/activityList.do?activityCategory=FS&reqPage=1" class="dropdown-item">패션</a>
                        <a href="/activityList.do?activityCategory=ME&reqPage=1" class="dropdown-item">미디어</a>
                        <a href="/activityList.do?activityCategory=SO&reqPage=1" class="dropdown-item">악기 / 노래</a>
                        <a href="/activityList.do?activityCategory=FO&reqPage=1" class="dropdown-item">외국어</a>
                        <a href="/activityList.do?activityCategory=CO&reqPage=1" class="dropdown-item">요리 / 제과제빵</a>
                    </div>
                </div>
                
                <c:choose>
                	<c:when test="${not empty sessionScope.m.favorite}">
                		<a href="/popularClubList.do?memberNo=${sessionScope.m.memberNo }" class="nav-item nav-link">동호회</a>
                	</c:when>
                	<c:otherwise>
                		<a href="/clubList.do" class="nav-item nav-link">동호회</a>
                	</c:otherwise>
                </c:choose>
                
                <div class="nav-item dropdown">
                    <a href="/boardList.do?reqPage=1&boardType=F" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">커뮤니티</a>
                    <div class="dropdown-menu bg-light m-0">

                     	<a href="#">${isLogin }</a>
                        <a href="/boardList.do?reqPage=1&boardType=F" class="dropdown-item">자유게시판</a>
                        <a href="boardList.do?reqPage=1&boardType=P" class="dropdown-item">동호회모집</a>
                        <a href="boardList.do?reqPage=1&boardType=I" class="dropdown-item">정보게시판</a>
                    </div>
                </div>
                <a href="/productList.do?reqPage=1" class="nav-item nav-link">마켓</a>
                <div class="nav-item dropdown">
                    <a href="/boardList.do?reqPage=1&boardType=N"" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">고객센터</a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/boardList.do?reqPage=1&boardType=N" class="dropdown-item">공지사항</a>
                        <a href="boardList.do?reqPage=1&boardType=Q" class="dropdown-item">Q&A</a>
                         <a href="/classEnroll.do" class="dropdown-item">강사모집</a>
                    </div>
                </div>
                
                <a href="cart.do?memberNo=${sessionScope.m.memberNo }" class="nav-item nav-link">장바구니</a>

            </div>
            <!--  
            <c:choose>
				<c:when test="${empty sessionScope.m}">
		            <div>
		                <a href="javascript:void(0)" class="loginBtn" ><img alt="로그인" src="/resources/img/log-in.png" style="width: 60px;" ></a><span> / </span>
		                <a href="/joinFrm.do"><img alt="회원가입" src="/resources/img/join.png" style="width: 60px;"></a>
		            </div>
				</c:when>
				<c:otherwise>
					<a href="/mypage.do"><img alt="마이페이지" src="/resources/img/login.png" style="width: 40px; margin-right: 20px;"></a>
					<a href="/logout.do">로그아웃</a>
					<!--<a href="/logout.do"><img alt="로그아웃" src="/resources/img/logout.png" style="width: 40px; margin-right: 10px;">-->
				<!--</c:otherwise>
			</c:choose>
            -->
			<c:choose>
				<c:when test="${empty sessionScope.m}">
		            <div>
		                <a href="javascript:void(0)" class="loginBtn hov" style="font-family: 'PyeongChangPeace-Bold';  font-size: 20px; margin-right: 20px;" >login</a><span></span>
		                <a href="/joinFrm.do" class="hov" style="font-family: 'PyeongChangPeace-Bold';  font-size: 20px;margin-right: 13px;">join</a>
		            </div>
				</c:when>
				<c:otherwise>
					<div class="nav-item dropdown">
                    <a href="/mypage.do" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><img alt="마이페이지" src="/resources/img/login.png" style="width: 40px;"></a>
                    <div class="dropdown-menu bg-light m-0">
                        <a href="/mypage.do" class="dropdown-item">마이페이지</a>
                        <a href="/logout.do" class="dropdown-item">로그아웃</a>
                    </div>
                </div>
				</c:otherwise>
			</c:choose>
       	 </div>
    </nav>

	<!-- 로그인 모달 -->
	<div class="popup_bg00"></div>
  	<div class="popup00 personal_pop00 noto bg_s" >
    <div class="x_btn00"><span class="zwicon-close00">X</span></div>
      <h1 id="login_header" style="color:#000; font-family: 'KOHIBaeumOTF'!important;">로그인</h1>
     
      <hr>
      <!--  <h3 class="txt_4" style="color:#000;">로그인</h3>-->
      <div style="font-family: 'LeferiPoint-WhiteObliqueA'!important; text-align: center; font-size: 1.4em;">아이디와 비밀번호 입력하기 귀찮으시죠?<br>카카오로 1초만에 로그인 하세요.</div><br>
        <div onclick="kakaoLogin();" style="text-align: center;">
        	<a  href="javascript:void(0)">
        		 <span><img alt="카카오로그인" src="/resources/img/kakao_login.png" style="width: 350px;"></span>
        	</a>
        </div>
        <br>
        <hr>
        <br>
      <div class="login_cont"style="font-family: 'GmarketSansMedium'!important;">
        <form action="/login.do" method="post" onsubmit="return loginchk();">
          <div>
            <input type="text" placeholder="아이디를 입력해주세요." class="boxSize_2 form-control" name="memberId" style="font-size: 1.3em; padding-left: 20px;"><br>
            <input type="password" placeholder="비밀번호를 입력해주세요." class="boxSize_2 form-control" name="memberPw" style="font-size: 1.3em;padding-left: 20px;"><br>
            <input type="submit" value="로그인" class="boxSize_2 color_g loginBtn_1 lb" style="color:#fff; font-size: 1.3rem;">
          </div>
        </form>
        <br>
        <div><a href="/joinFrm.do"><input value="뉴시니어스 회원가입 하러가기" class="boxSize_2 color_g_b loginBtn_1 f_c form-control" style="font-size: 1rem; text-align: center; text-decoration: none; "></a></div>
        <div class="txt_1 flex00 flex_01" style="width: 350px;">
          <div>
            <a href="/searchInfoFrm.do" class="c_red txt_d1 fw_8" >아이디 찾기</a>
          </div>
        <br>
          <div>
            <a href="/searchInfoFrm.do" class="c_red txt_d1 fw_8" >비밀번호 찾기</a>
          </div>
        </div>
        
        
        <!-- 카카오 로그인 -->
     
        <ul>
			<li onclick="kakaoLogout();" style="display: none;">
		      <a href="javascript:void(0)">
		          <span>카카오 회원 탈퇴</span>
		      </a>
			</li>
		</ul>
		
      </div>
    </div>
  </div>

    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="/resources/TGbtstr/lib/wow/wow.min.js"></script>
    <script src="/resources/TGbtstr/lib/easing/easing.min.js"></script>
    <script src="/resources/TGbtstr/lib/waypoints/waypoints.min.js"></script>
    <script src="/resources/TGbtstr/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/resources/TGbtstr/lib/counterup/counterup.min.js"></script>
    <script src="/resources/TGbtstr/lib/parallax/parallax.min.js"></script>
    <script src="/resources/TGbtstr/lib/isotope/isotope.pkgd.min.js"></script>
    <script src="/resources/TGbtstr/lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="/resources/TGbtstr/js/mainTG.js"></script>
    <!-- 로그인 js -->
    <script src="/resources/js/login/login.js"></script>

    <script type="text/javascript">
   
    
    function alert(text){
		Swal.fire(text);
	}
    
    
    
    $(".loginBtn").click(function(){
      $(".popup_bg00").stop().fadeIn();
      $(".popup00.personal_pop00").stop().fadeIn();
      $("body").addClass("bg_g");
    });

      $(".popup_bg00").on("click", onPopClose);
      $(".x_btn00").on("click", onPopClose);

    function onPopClose() {
      $(".popup_bg00").stop().fadeOut();
      $(".popup00.personal_pop00").stop().fadeOut();
      $("body").removeClass("bg_g");
    }
    
  
    function loginchk(){
    	const memberId = $("[name=memberId]").val();
    	const memberPw = $("[name=memberPw]").val();
    	
    	if(memberId == "" || memberPw == ""){
    		alert("아이디와 비밀번호를 입력해주세요.");
    		return false;
    	}else{
    		return true;
    	}
    }
    
    
    /*카카오 로그인 두번째 시도*/
    //카카오로그인
	Kakao.init('6bc8b7d3275ee64d59901f933c4c45e5'); //발급받은 키 중 javascript키를 사용해준다.
	console.log(Kakao.isInitialized()); // sdk초기화여부판단
	function kakaoLogin() {
	    Kakao.Auth.login({
	      success: function (response) {
	        Kakao.API.request({
	          url: '/v2/user/me',
	          success: function (response) {
	        	  console.log(response)
	        	  console.log(response.id)
	        	  console.log(response.properties.nickname)
	        	  console.log(response.kakao_account.email)
	        	  //로그인 성공 후 insert 하기
	        	  
	        	  $.ajax({
	        		  url: "/kakaoLogin.do",
	        		  type:'post',
	        		  data:{
	        			  kakaoLogin:response.id,
	        			  nickName:response.properties.nickname,
	        			  memberId:response.kakao_account.email,
	        			  memberEmail:response.kakao_account.email
	        			  },
	        		 success:function(data){
	        			 //로그인 성공
	        			 if(data == "0"){
	        				 alert("로그인 성공");
	        				 window.location.href = "/kakao.do";
	        				 //회원가입 성공
	        			 }else if(data == "1"){
	        				 alert("카카오 회원가입 성공하셨습니다. 로그인 해주세요");
	        				 window.location.href = "/kakao.do";
	        				 //실패
	        			 }else if(data == "4"){
	        				 alert("이미 탈퇴한 회원입니다.");
	        			 }else{
	        				 alert("실패")
	        			 }
	        		 }
	        	  });
	        	  
	          },
	          fail: function (error) {
	            console.log(error)
	          },
	        })
	      },
	      fail: function (error) {
	        console.log(error)
	      },
	    })
	  }
	//카카오 로그아웃
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        	$.ajax({
	        		url:"/kakaoLogout.do",
	        		type:"post",
	        		data: {kakaoLogin:response.id},
	        		success:function(data){
	        			alert("로그아웃 성공");
	        		}
	        		
	        		
	        	});
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
    </script>
    
    
  
</body>
</html>