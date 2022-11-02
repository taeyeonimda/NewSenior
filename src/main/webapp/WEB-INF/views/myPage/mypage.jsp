<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<head>
    <meta charset="utf-8">
    <title>Gardener - Gardening Website Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/JSbtstr/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/JSbtstr/css/demo.css" />

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
    <style>
        #modal.modal-overlay {
            width: 100%;
            height: 100%;
            position: absolute;
            left: 0;
            top: 0;
            display: none;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
            border-radius: 10px;
            border: 1px solid rgba(255, 255, 255, 0.18);
        }
        #modal .modal-window {
            background: rgba( 0, 0, 0, 0.6 );
            border-radius: 10px;
            border: 1px solid rgba( 255, 255, 255, 0.18 );
            width: 600px;
            height: 500px;
            position: relative;
            top: -100px;
            padding: 10px;
        }
        #modal .title {
            padding-left: 10px;
            display: inline;
            text-shadow: 1px 1px 2px gray;
            color: white;
            
        }
        #modal .title h2 {
            display: inline;
        }
        #modal .close-area {
            display: inline;
            float: right;
            padding-right: 10px;
            cursor: pointer;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        
        #modal .content {
            margin-top: 20px;
            padding: 0px 10px;
            text-shadow: 1px 1px 2px gray;
            color: white;
        }
        .div1{
        text-align: right;
        }
        .div1>button{
        border: none;
        background-color: #6f42c1;
        width: 100px;
        height: 40px;
        border-radius: 3px;
        }
        .div1>a{
        color:#fff;
        }
        
       /* 배송지 모달 css*/
			.detail {
			  display: inline-block;
			  cursor: pointer;
			}
			.popup00{
			  display: none;
			  width: 50%;
			  height: 80vh;
			  position: fixed;
			  top: 51%;
			  left: 50%;
			  transform: translate(-50%, -50%);
			  background: #fff;
			  box-shadow: 10px 10px 10px rgb(0 0 0 / 20%);
			  color: #000000;
			  padding: 2% 5%;
			  padding-bottom: 10%;
			  font-size: 12px;
			  line-height: 1.5rem;
			  border-radius: 15px;
			  z-index: 99999;
			  line-height: 1.5rem;
			  overflow: inherit;
			  
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
			  text-align: left;
			}
			.personal_pop00{
			  z-index: 300;
			}
			#login_header{
			  text-align: center;
			  font-size: 1.7rem;
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
			  font-size: 1.4rem;
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
			  width: 40%;
			  height: 30px;
			  padding: 2.5% 1%;
			  margin-top: 3%;
			  border: 1.5px solid rgb(176, 174, 174);
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
			  background-color: rgba(0, 0, 0, 0.238);
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
			.sp1{
			font-size: 1.2em;
			}
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  <body>
    <!-- Layout wrapper -->
    <div class="content-wrapper" style="left: 300px; flex-direction: row; ">
        <!-- Menu -->
	<%@include file="/WEB-INF/views/common/aside.jsp" %>
	
        <!-- / Menu -->

        <!-- Layout container -->
        


          <!-- Content wrapper -->
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- HTML5 Inputs -->
            <form action="/mypageUpdate.do">
              <div class="card mb-4" /*style="width: 60%;*/" >
                <h5 class="card-header">내정보</h5>
                <div class="card-body" style="padding-top: 20px;">
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">이름</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input" value="${member.memberName }" readonly name="memberName"/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">아이디</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input"value="${member.memberId }" readonly name="memberId"/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">닉네임</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input"value="${member.nickName }" name="nickName"/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-email-input" class="col-md-2 col-form-label">이메일</label>
                    <div class="col-md-10">
                      <input class="form-control" type="email"  id="html5-email-input" value="${member.memberEmail }" name="memberEmail"/>
                    </div>
                  </div>
                  <div class="mb-3 row co_btn">
                    <label for="html5-url-input" class="col-md-2 col-form-label">비밀번호</label>
                    <div class="col-md-10">
                      <button type="button" class="btn btn-outline-warning"><a href="/pwChangeFrm.do" style="color: #000;" class="co_f1">비밀번호 변경하기</a></button>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-url-input" class="col-md-2 col-form-label">생년월일</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-url-input" value="${member.memberBirth }" name="memberBirth" onkeyup="birth_keyup(this)"/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-url-input" class="col-md-2 col-form-label">전화번호</label>
                    <div class="col-md-10">
                      <input class="form-control" type="tel" id="html5-url-input" value="${member.memberPhone }" name="memberPhone" onkeyup="phone_keyup(this)"/>
                    </div>
                  </div>
                  
                  <div class="mb-3 row" style="flex-wrap: nowrap">
                    	 <span class="col-md-2 col-form-label" style="margin-right: 10px;">관심분야</span> 
                    	 <select name="favorite" class="fv_btn" style=" width: 80%; border: 1px solid #ced4da;">
						<option class="dropdown-item" value="n" <c:if test="${member.favorite =='n'}">selected</c:if>>선택안함</option>
						<option class="dropdown-item" value="dg" <c:if test="${member.favorite =='dg'}">selected</c:if>>디지털</option>
						<option class="dropdown-item" value="fu" <c:if test="${member.favorite=='fu'}">selected</c:if>>주식/재테크</option>
						<option class="dropdown-item" value="cr"<c:if test="${member.favorite =='cr'}">selected</c:if>>공예</option>
						<option class="dropdown-item" value="de" <c:if test="${member.favorite =='de'}">selected</c:if>>디자인</option>
						<option class="dropdown-item" value="ex" <c:if test="${member.favorite=='ex'}">selected</c:if>>운동/건강</option>
						<option class="dropdown-item" value="fs" <c:if test="${member.favorite =='fs'}">selected</c:if>>패션</option>
						<option class="dropdown-item" value="me" <c:if test="${member.favorite =='me'}">selected</c:if>>미디어</option>
						<option class="dropdown-item" value="so" <c:if test="${member.favorite =='so'}">selected</c:if>>악기/노래</option>
						<option class="dropdown-item" value="fo" <c:if test="${member.favorite =='fo'}">selected</c:if>>외국어</option>
						<option class="dropdown-item" value="co" <c:if test="${member.favorite =='co'}">selected</c:if>>요리/제과제빵</option>
					 </select>
                      
                      </div>
                  </div>
                  <button type="submit" class="btn btn-outline-warning" style="float: right; color: #000;">내정보 변경하기</button>
                </div>
              </div>
            </form>
            
              <!-- File input -->
                <div class="container-xxl flex-grow-1 container-p-y">
			<hr>
            <div style="font-size: 25px;">배송지목록</div>
            <div class="div1 deliveryBtn"><button><a href="#" style="color: #fff;">배송지등록</a></button></div>
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
                    <c:forEach items="${list }" var="d">
		            	<tr class="showDeliveryDetail" onclick="goToDeliveryDetail(${b.deliveryNo});" id="btn-modal">
			                <td>${d.deliveryName }<br>수령인${d.receiverName }</td>
			                <td>${d.deliveryAddr }</td>
			                <td>${d.deliveryPhone }</td>
			                <td><button>수정</button><button>삭제</button></td>
		                </tr>
             		</c:forEach>
             		
             		<c:if test="">
		                <tr>
		                	<td style="text-align:center;">배송지 정보가 없습니다.</td>
		                </tr>
        			</c:if>
                  </tbody>
                </table>
              </div>
            </div>
        
        <!-- 주문 상세보기 모달 -->
	    <div id="modal" class="modal-overlay">
	        <div class="modal-window">
	            <div class="title"><h2>배송지 목록 상세 보기</h2></div>
	            <div class="close-area" style="font-size : 40px;">X</div>
	            <div class="content">
	            	<table>
	                <c:forEach items="${list }" var="Or">
		            	<tr class="showOrderDetail" onclick="goToOrderDetail(${Or.orderNo});" id="btn-modal">
			                <td>${Or.orderDate }</td>
			                <td>${Or.productName }</td>
			                <td>${Or.orderAmount }</td>
			                <td>${Or.orderPrice }</td>
			                <td>${Or.orderAmount*Or.orderPrice }원</td>
		                </tr>
             		</c:forEach>
             		</table>
	            </div>
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
			  <div class="popup00 personal_pop00 noto bg_s">
			    <div class="x_btn00"><span class="zwicon-close00">X</span></div>
			    <div class="cont00">
			      <h1 id="login_header">배송지 등록/수정하기</h1>
			      <hr>
			      <div class="delivery_cont">
			        <form action="/delivery.do" method="post" onsubmit="return loginchk();">
			          <div>
				          <div>
				            <span class="sp1" style="width: 60px;">배송지명</span> 
				            <input type="text" class="boxSize_2" name="deliveryName">
				          </div>
				          <div>
				           <span class="sp1">수령인</span> <input type="text" placeholder="150자 이내로 입력" class="boxSize_2" name="receiverName">
				          </div>
				          <div>
				          <span class="sp1">주소</span> <input type="text" class="boxSize_2 zipcode" ><button>주소검색</button>
				          </div>
				     	<div><span class="sp1"></span><input type="text" class="boxSize_2 dliveryAddr"></div>
				     	<div><span class="sp1"></span><input type="text" class="boxSize_2 deliveryDetail" placeholder="상세주소를 입력해주세요." ></div>
				     	<div><span class="sp1">연락처</span> <input type="text" class="boxSize_2 deliveryPhone" onkeyup="phone_keyup(this)"><br></div>
				     	<div><span class="sp1">기본배송지</span><input type="checkbox">기본배송지로 설정</div>
			         </div>
			        </form>
			        <h3 class="txt_1">입력/수정하신 배송지는 배송지 목록에 저장됩니다.</h3>
			        <div><button>닫기</button><button>저장</button></div>
			      </div>
			    </div>
			  </div>
          	<!-- 배송지 모달 끝 -->




      <!-- Overlay -->
      <div class="layout-overlay layout-menu-toggle"></div>
    </div>
    <!-- / Layout wrapper -->
<%@include file="/WEB-INF/views/common/footer.jsp" %>

    <!-- Core JS -->
    <!-- build:js assets/vendor/js/core.js -->
    <script src="../assets/vendor/libs/jquery/jquery.js"></script>
    <script src="../assets/vendor/libs/popper/popper.js"></script>
    <script src="../assets/vendor/js/bootstrap.js"></script>
    <script src="../assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

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
    }}
  	//연락처 자동 하이픈
	function phone_keyup(obj){
	    let phone_len=obj.value.length;
	    console.log(phone_len)
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
    </script>
  </body>
</html>
