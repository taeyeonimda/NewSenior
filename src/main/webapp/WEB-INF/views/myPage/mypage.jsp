<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en" class="light-style layout-menu-fixed" dir="ltr"
	data-theme="theme-default" data-assets-path="../assets/"
	data-template="vertical-menu-template-free">

<head>
<meta charset="utf-8">
<title>Gardener - Gardening Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Core CSS -->
<link rel="stylesheet" href="/resources/JSbtstr/css/core.css"
	class="template-customizer-core-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css"
	class="template-customizer-theme-css" />
<link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
<link href="/resources/css/mypage/mypage.css" rel="stylesheet">

<!--  
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
-->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
<body>
	<!-- Layout wrapper -->
	<div class="content-wrapper" style="left: 300px; flex-direction: row;">
		<!-- Menu -->
		<%@include file="/WEB-INF/views/common/aside.jsp"%>

		<!-- Content -->

		<div class="container-xxl flex-grow-1 container-p-y">
			<!-- HTML5 Inputs -->
			<form action="/mypageUpdate.do" me>
				<div class="card mb-4" /*style="width: 60%;*/">
					<h5 class="card-header">내정보</h5>
					<div class="card-body" style="padding-top: 20px;">
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
							<div class="col-md-10">
								<input class="form-control" type="text" id="html5-text-input"
									value="${member.memberName }" readonly name="memberName" />
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">아이디</label>
							<div class="col-md-10">
								<input class="form-control" type="text" id="html5-text-input"
									value="${member.memberId }" readonly name="memberId" />
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-text-input" class="col-md-2 col-form-label">닉네임</label>
							<div class="col-md-10">
								<input class="form-control" type="text" id="html5-text-input"
									value="${member.nickName }" name="nickName" maxlength="6"/>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-email-input" class="col-md-2 col-form-label">이메일</label>
							<div class="col-md-10">
								<input class="form-control" type="email" id="html5-email-input"
									value="${member.memberEmail }" name="memberEmail" />
							</div>
						</div>
						<div class="mb-3 row co_btn">
							<label for="html5-url-input" class="col-md-2 col-form-label">비밀번호</label>
							<div class="col-md-10">
								<button type="button" class="btn btn-outline-warning">
									<a href="/pwChangeFrm.do" style="color: #000;" class="co_f1">비밀번호
										변경하기</a>
								</button>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-url-input" class="col-md-2 col-form-label">생년월일</label>
							<div class="col-md-10">
								<input class="form-control" type="text" id="html5-url-input"
									value="${member.memberBirth }" name="memberBirth"
									onkeyup="birth_keyup(this)" maxlength="10"/>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="html5-url-input" class="col-md-2 col-form-label">전화번호</label>
							<div class="col-md-10">
								<input class="form-control" type="tel" id="html5-url-input"
									value="${member.memberPhone }" name="memberPhone"
									onkeyup="phone_keyup(this)" maxlength="13" />
							</div>
						</div>

						<div class="mb-3 row" style="flex-wrap: nowrap">
							<span class="col-md-2 col-form-label" style="margin-right: 10px;">관심분야</span>
							<select name="favorite" class="fv_btn"
								style="width: 80%; border: 1px solid #ced4da;">
								<option class="dropdown-item" value="NO"
									<c:if test="${member.favorite =='NO'}">selected</c:if>>선택안함</option>
								<option class="dropdown-item" value="DG"
									<c:if test="${member.favorite =='DG'}">selected</c:if>>디지털</option>
								<option class="dropdown-item" value="FU"
									<c:if test="${member.favorite=='FU'}">selected</c:if>>주식/재테크</option>
								<option class="dropdown-item" value="CR"
									<c:if test="${member.favorite =='CR'}">selected</c:if>>공예</option>
								<option class="dropdown-item" value="DE"
									<c:if test="${member.favorite =='DE'}">selected</c:if>>디자인</option>
								<option class="dropdown-item" value="EX"
									<c:if test="${member.favorite=='EX'}">selected</c:if>>운동/건강</option>
								<option class="dropdown-item" value="FS"
									<c:if test="${member.favorite =='FS'}">selected</c:if>>패션</option>
								<option class="dropdown-item" value="ME"
									<c:if test="${member.favorite =='ME'}">selected</c:if>>미디어</option>
								<option class="dropdown-item" value="SO"
									<c:if test="${member.favorite =='SO'}">selected</c:if>>악기/노래</option>
								<option class="dropdown-item" value="FO"
									<c:if test="${member.favorite =='FO'}">selected</c:if>>외국어</option>
								<option class="dropdown-item" value="CO"
									<c:if test="${member.favorite =='CO'}">selected</c:if>>요리/제과제빵</option>
							</select>

						</div>
					</div>
					<button type="submit" class="btn btn-outline-warning"
						style="float: right; color: #000;">내정보 변경하기</button>
				</div>
		</form>
		<form action="/deleteMember.do" method="post" onsubmit="return delMember();">
		<button type="submit" class="btn btn-outline-warning delbtn"
						style="color: #000;">회원탈퇴</button>
		</form>
		</div>

		<!-- File input -->
		<div class="container-xxl flex-grow-1 container-p-y">
			<div style="font-size: 25px;">배송지목록</div>
			<div class="div1 deliveryBtn">
				<button>
					<a href="#" style="color: #fff;">배송지등록</a>
				</button>
			</div>
			<div class="card">
				<div class="table-responsive text-nowrap">

					<table class="table table-borderless">
						<thead>
							<tr>
								<th>배송지</th>
								<th>주소</th>
								<th>연락처</th>
								<th>수정·삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${list }" var="d" end="0">
								<tr class="showDeliveryDetail"
									onclick="goToDeliveryDetail(${d.deliveryNo});" id="btn-modal">
									<td><strong>${d.deliveryName }</strong><br>
										${d.receiverName }<br> <span
										style="border: 1px solid #6f42c1; background-color: #6f42c1; color: #fff">기본배송지</span>
									</td>
									<td>${d.zipcode}<br> ${d.deliveryAddr }<br>
										${d.deliveryDetail }
									</td>
									<td style="line-height: 72px;">${d.deliveryPhone }</td>
									<td><button class="updateBtn" onclick="updateBtn(${d.deliveryNo});" style="position: relative; top:20px;">수정</button>
										<button class="delBtn"  style="position: relative; top:20px;">
											<a href="/deleteAddr.do?deliveryNo=${d.deliveryNo}">삭제</a>
										</button>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${list }" var="d" begin="1">
								<tr class="showDeliveryDetail" onclick="goToDeliveryDetail(${d.deliveryNo});" id="btn-modal">
									<td><strong>${d.deliveryName }</strong><br>
										${d.receiverName }<br></td>
									<td>${d.zipcode}<br> ${d.deliveryAddr }<br>
										${d.deliveryDetail }
									</td>
									<td style="line-height: 72px;">${d.deliveryPhone }</td>
									<td><button class="updateBtn" onclick="updateBtn(${d.deliveryNo});" style="position: relative; top:20px;">수정</button>
										<button class="delBtn" style="position: relative; top:20px;">
											<a href="/deleteAddr.do?deliveryNo=${d.deliveryNo }" >삭제</a>
										</button></td>
								</tr>
							</c:forEach>
							<c:if test="">
								<tr>
									<td style="text-align: center;">배송지 정보가 없습니다.</td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- / Content -->

	<!-- Content wrapper -->
	</div>
	<!-- / Layout page -->
	</div>

	<!-- 배송지 등록 모달 -->

	<div class="popup_bg00"></div>
	<div class="popup00 personal_pop00 noto bg_s" style="width: 60%;">
		<div class="x_btn00">
			<span class="zwicon-close00">X</span>
		</div>
		<div class="cont00"> 
			<h1 id="login_header">배송지 등록/수정하기</h1>
			<hr>
			<div class="delivery_cont">
				<div class="container-xxl flex-grow-1 container-p-y">
					<!-- HTML5 Inputs -->
					<form action="/insertAddr.do" method="post" onsubmit="return deliverychk();" id="formId">
						<div class="card mb-4"  style="width: 80%;">
							<h5 class="card-header">배송지등록/수정</h5>
							<div class="card-body" style="padding-top: 20px;">
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">배송지명</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-text-input"
											name="deliveryName" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">수령인</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-text-input"
											name="receiverName" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-text-input" class="col-md-2 col-form-label">주소</label>
									<div class="col-md-10">
										<span><input class="form-control " type="text"
											id="html5-text-input" name="zipcode"
											style="width: 30%; margin: 0; display: inline-block;" /></span>
										<button type="button" class="btn btn-outline-warning"
											onclick="searchAddr();">주소검색</button>

									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-email-input" class="col-md-2 col-form-label"></label>
									<div class="col-md-10">
										<input class="form-control " type="text"
											id="html5-email-input" name="deliveryAddr" />
									</div>
								</div>
								<div class="mb-3 row co_btn">
									<label for="html5-url-input" class="col-md-2 col-form-label"></label>
									<div class="col-md-10">
										<input class="form-control " type="text" placeholder="상세주소"
											id="html5-email-input" name="deliveryDetail"/>
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">연락처</label>
									<div class="col-md-10">
										<input class="form-control" type="text" id="html5-url-input"
											placeholder="010-1234-5678" name="deliveryPhone"
											onkeyup="phone_keyup(this)" />
									</div>
								</div>
								<div class="mb-3 row">
									<label for="html5-url-input" class="col-md-2 col-form-label">기본배송지</label>
									<div class="col-md-10">
										<input type="checkbox" class="checkBtn" /> 기본배송지로 설정 <input
											type="hidden" name="defaultAddr" value='n'>
									</div>
								</div>
							</div>
						</div>
						<input type="hidden" value="${member.memberNo }" name="memberNum">
						<input type="hidden" name="deliveryNum">
						<div style="margin: 0 20px; ">
							<button type="button" class="btn btn-outline-warning closeBtn" style="width: 50%;">닫기</button><button class="btn btn-outline-warning saveBtn" style="width: 50%;">저장</button><button class="btn btn-outline-warning updateBtn1" style="width: 50%; display: none;">수정</button>
						</div> 
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 배송지 등록 모달 끝 -->






	<!-- Overlay -->
	<div class="layout-overlay layout-menu-toggle"></div>
	</div>
	<!-- / Layout wrapper -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Core JS -->
	<!-- build:js assets/vendor/js/core.js -->
	<script src="../assets/vendor/libs/jquery/jquery.js"></script>
	<script src="../assets/vendor/libs/popper/popper.js"></script>
	<script src="../assets/vendor/js/bootstrap.js"></script>
	<script
		src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

	<script src="../assets/vendor/js/menu.js"></script>
	<!-- endbuild -->

	<!-- Vendors JS -->
	<script src="../assets/vendor/libs/masonry/masonry.js"></script>

	<!-- Main JS -->
	<script src="../assets/js/main.js"></script>

	<!-- Page JS -->

	<!-- Place this tag in your head or just before your close body tag. -->
	<script async defer src="https://buttons.github.io/buttons.js"></script>

	<script type="text/javascript">
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
  	//연락처 자동 하이픈
	function phone_keyup(obj){
	    let phone_len=obj.value.length;
	    if(event.keyCode==8){
	        obj.value=obj.value.slice(0,phone_len); 
	        return 0; 
	    }else if (phone_len==3 || phone_len==8){
	        obj.value += '-';
	    }
	}
  	
	//배송지 모달 js
    $(".deliveryBtn").click(function(){
      $(".popup_bg00").stop().fadeIn();
      $(".popup00.personal_pop00").stop().fadeIn();
      $("body").addClass("bg_g");
      $(".saveBtn").css("display","inline-block");
  	$(".updateBtn1").css("display","none");
    });

      $(".popup_bg00").on("click", onPopClose);
      $(".x_btn00").on("click", onPopClose);
      $(".closeBtn").on("click", onPopClose);

    function onPopClose() {
      $(".popup_bg00").stop().fadeOut();
      $(".popup00.personal_pop00").stop().fadeOut();
      $("body").removeClass("bg_g");
    }
    
    //수정 버튼 클릭시
    function updateBtn(deliveryNo){
    	$(".popup_bg00").stop().fadeIn();
        $(".popup00.personal_pop00").stop().fadeIn();
        $("body").addClass("bg_g");
        
        const deliveryName = $("input[name=deliveryName]");
    	const receiverName = $("input[name=receiverName]");
    	const zipcode = $("input[name=zipcode]");
    	const deliveryAddr = $("input[name=deliveryAddr]");
    	const deliveryDetail = $("input[name=deliveryDetail]");
    	const deliveryPhone = $("input[name=deliveryPhone]");
    	const defaultAddr = $("input[name=defaultAddr]");
    	const deliveryNum = $("input[name=deliveryNum]");
    	
        
    	$(".saveBtn").css("display","none");
    	$(".updateBtn1").css("display","inline-block");
    	$.ajax({
 			url:"/selectAddr.do",
 			type:"post",
 			data:{deliveryNo:deliveryNo},
 			success:function(data){
 				deliveryName.val(data.deliveryName);
 				receiverName.val(data.receiverName);
 				zipcode.val(data.zipcode);
 				deliveryAddr.val(data.deliveryAddr);
 				deliveryDetail.val(data.deliveryDetail);
 				deliveryPhone.val(data.deliveryPhone);
 				defaultAddr.val(data.defaultAddr);
 				deliveryNum.val(deliveryNo);
 				//수정버튼 클릭시
 				$(".updateBtn1").on("click",function(){
 					$("#formId").attr("action", "/updateAddr.do");
 					/*수정해주고 close
 					$.ajax({
 						url:"/updateAddr.do",
 						type:"post",
 			 			data:{deliveryNo:deliveryNo},
 			 			success:function(data){
 			 			}
 					});
 					*/
 				});
 			}
 		});
    }
    //배송지 등록 폼 검사
    function deliverychk(){
    	const deliveryName = $("input[name=deliveryName]").val();
    	const receiverName = $("input[name=receiverName]").val();
    	const zipcode = $("input[name=zipcode]").val();
    	const deliveryAddr = $("input[name=deliveryAddr]").val();
    	const deliveryDetail = $("input[name=deliveryDetail]").val();
    	const deliveryPhone = $("input[name=deliveryPhone]").val();
    	const defaultAddr = $("input[name=defaultAddr]");
    	
    	
    	if(deliveryName == "" || deliveryName == null){
    		alert("배송지명을 입력해주세요.");
    		return false;
    	}
    	if(receiverName == "" || receiverName == null){
    		alert("수령인을 입력해주세요.");
    		return false;
    	}
    	if(zipcode == "" || zipcode == null){
    		alert("주소을 입력해주세요.");
    		return false;
    	}
    	if(deliveryAddr == "" || deliveryAddr == null){
    		alert("주소을 입력해주세요.");
    		return false;
    	}
    	
    	if(deliveryPhone == "" || deliveryPhone == null){
    		alert("전화번호를 입력해주세요.");
    		return false;
    	}
    	
    	if($(".checkBtn").is(":checked")){
    		defaultAddr.val("y");
    	}else{
    		defaultAddr.val("n");
    	}
    	
    }
    
    
    //배송지 주소
    	function searchAddr() {
    	    new daum.Postcode({
    	        oncomplete: function(data) {
    	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

    	            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
    	            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    	            var roadAddr = data.roadAddress; // 도로명 주소 변수
    	            var extraRoadAddr = ''; // 참고 항목 변수

    	            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    	            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    	            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    	                extraRoadAddr += data.bname;
    	            }
    	            // 건물명이 있고, 공동주택일 경우 추가한다.
    	            if(data.buildingName !== '' && data.apartment === 'Y'){
    	                extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    	            }
    	            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    	            if(extraRoadAddr !== ''){
    	                extraRoadAddr = ' (' + extraRoadAddr + ')';
    	            }

    	            // 우편번호와 주소 정보를 해당 필드에 넣는다.
    	            $("[name=zipcode]").val(data.zonecode);
    	            $("[name=deliveryAddr]").val(roadAddr);
    	            //document.getElementById('userAddr').value = data.zonecode+" "+roadAddr;
    	            if( $("[name=zipcode]").val()==null){
    	            	$("[name=zipcode]").val() = data.jibunAddress;
    	            }
    	            //
    	            
    	            
    	            // 참고항목 문자열이 있을 경우 해당 필드에 넣는다. 
    	            var guideTextBox = document.getElementById("guide");
    	            // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
    	            if(data.autoRoadAddress) {
    	                var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
    	                guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
    	                guideTextBox.style.display = 'block';

    	            } else if(data.autoJibunAddress) {
    	                var expJibunAddr = data.autoJibunAddress;
    	                guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
    	                guideTextBox.style.display = 'block';
    	            }
    	        }
    	    }).open();
    	}
    	
    	//회원 탈퇴 버튼 클릭시 comfirm
    	function delMember(){
    		if(window.confirm("진짜로 회원탈퇴를 하시겠습니까? 탈퇴 후 3개월동안은 재가입이 불가능합니다. ")){
    			return true;
    		}else{
    			return false;
    		}
    	}
    </script>
</body>
</html>
