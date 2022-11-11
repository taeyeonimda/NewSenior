<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    
<!DOCTYPE html>
<html
  lang="en"
  class="light-style layout-menu-fixed"
  dir="ltr"
  data-theme="theme-default"
  data-assets-path="../assets/"
  data-template="vertical-menu-template-free"
>

<style>
.forTr input,td{
	text-align : center;
}



</style>

<head>
    <meta charset="utf-8">
    <title>Gardener - Gardening Website Template</title>
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
    <link href="/resources/JSbtstr/lib/animate/animate.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/resources/JSbtstr/lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/resources/JSbtstr/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="/resources/JSbtstr/css/style.css" rel="stylesheet">
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

              <br><br><br>
              <div>
                <div style="font-size: 40px; font-weight: 900; display: inline-block;">결제정보입력</div>
                
              </div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  <form id="order-form" action="/insertOrder.do?memberNo=${sessionScope.m.memberNo}" method="post" autocomplete="off">
                  <table class="table table-borderless">
                    <thead>
                      <tr style="text-align: center;">
                        <th style=" width: 15%;">상품번호</th>
                        <th style=" width: 35%;">상품명</th>
                        <th style=" width: 15%;">금액</th>
                        <th style=" width: 15%;">수량</th>
                        <th style=" width: 10%;">배송비</th>
                        <th style=" width: 10%;">총 금액</th>
                      </tr>
                    </thead>
	             		<c:forEach items="${list }" var="Or">
	             		<tr class="forTr">
							<td><input type="text" value="${Or.productNo }" name="productNo" style="border:none" readonly></td>
							<td><input type="text" value="${Or.buyName }" name="buyName" style="border:none" readonly>
								<input type="hidden" value="${Or.memberNo }" name="memberNo" style="border:none" readonly>
							</td>
							<td><fmt:formatNumber value="${Or.buyPrice }" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${Or.buyAmount }" pattern="#,###"/></td>
							
							<td style="text-align: center;">무료배송</td>
							<td style="float:right; padding-right:30px;">
								<fmt:formatNumber value="${Or.buyPrice*Or.buyAmount }" pattern="#,###"/>
								<input type="hidden" value=" ${Or.buyAmount*Or.buyPrice }" style="border:none" class="sumPrice" readonly><span >원</span>
							</td>
						</tr>
						</c:forEach>
	                    	<tr>
		                      	<td colspan="4"></td>
		                      	<td>결제할 총 금액</td>
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" readonly>
		                      		<p class="lastPrice" style="float: left;"></p>
		                      		<p style="float:left; margin: 0 5px;">원</p>
		                      		
		                     	</td>
	                      	</tr>
	                    </tbody>
	                  </table>
              	
					
					<br><br><br><br>
					<div style="text-align:center; font-size:30px;"><span>주문자 정보</span></div>
					<div class="orderInfo" style="margin-left:15%;">
						<div><span style="margin-right:10px;">주문자명</span><input type="text" value="${sessionScope.m.memberName }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div><br>
						<div><span style="margin-right:10px;">전화번호</span><input type="text" value="${sessionScope.m.memberPhone }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div><br>
						<div><span style="margin-right:25px;">이메일</span><input type="text"  value="${sessionScope.m.memberEmail }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div>
					</div>
					<br><br><br>
					<div id="same-check" style="float:right; margin-right:10%;">
                        <input type="checkbox" id="order-same" class="order-agree" >
                        <label for="order-same">내 정보 불러오기</label>
                    </div>
					<br><br>
					<div style="text-align:center; font-size:30px;"><span>배송지 정보</span></div>
					<div class="order-info shipping" style="margin-left:15%;">
	                    <div class="order-box">
	                        <label for="shippingName" class="order-label" style="width:70px;">수령인명</label>
	                        <input type="text"  id="shippingName" class="order-input medium view-order-info"  style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" >
	                        <input type="text" class="order-input medium hidden-order-info" name="receiveName" value="${sessionScope.m.memberName }" style="width:250px; display:none;border:none; border-bottom : 2px solid rgb(120,181,143);">
	                    </div>
	                        <br>
	                    <div class="order-box">
	                        <label for="shippingPhone" class="order-label" style="width:70px;">전화번호</label>
	                        <input type="text"  id="shippingPhone" class="order-input medium view-order-info" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" placeholder="010-0000-0000 형식으로 입력" >
	                        <input type="text" class="order-input medium hidden-order-info" name="receivePhone" value="${sessionScope.m.memberPhone }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);display:none;">
	                    </div>
	                        <br>
	                    <div class="order-box">
	                        <label for="shippingPhone" class="order-label" style="width:70px;">이메일</label>
	                        <input type="text"  id="shippingPhone" class="order-input medium view-order-info"  style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" >
	                        <input type="text" class="order-input medium hidden-order-info" name="receiveEmail" value="${sessionScope.m.memberEmail }" style="width:250px; display:none;border:none; border-bottom : 2px solid rgb(120,181,143);">
	                    </div>
	                    <div class="order-box">
	                        <label for="shippingAddr1" class="order-label" style="width:70px;">주소</label>
	                        <input type="text" id="shippingAddr1" class="order-input long " style="width:400px; border:none; border-bottom : 2px solid rgb(120,181,143);" required readonly>
	                        <button type="button" class="btn btn-outline-primary" name="receiveAddr" style="width:120px;height:40px;margin-bottom:30px;margin-top:10px;" id="addr-btn" onclick="searchAddr();">주소찾기</button>
	                    </div>
	                    <div class="order-box">
	                        <label for="shippingAddr2" class="order-label" id="detailAddress" style="width:70px;">상세 주소<span class="comment"></span></label>
	                        <input type="text" id="shippingAddr2" class="order-input long " style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div>
                	</div>
                	<br><br>
                	<div class="agree" style="text-align:center;">
		                    <input type="checkbox" id="infoAgree">
	                        <label for="infoAgree">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label>
			                  <button type="submit">ㅇㅇ</button>
                    </div>
                    <br>                
                  <div style="margin: 10px; border-top: 1px solid #ddd;">
                    <button type="button" style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary" id="payBtn">결제하기</button>
                    <a href="javascript:void(0)" style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary">더 담으러 가기</a>
                  </div>
                  </form>
                  
                </div>
              </div>
</div></div>
  
            <!-- / Content -->



            <div class="content-backdrop fade"></div>
          
          <!-- Content wrapper -->
        
        <!-- / Layout page -->
      

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

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    	<script>
		$("#payBtn").on("click",function(){
			const price = $(".hiddenPayPrice").val();
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			
			IMP.init("imp10385324");
			IMP.request_pay({
				pg: "html5_inicis",
				merchat_uid : "상품코드_"+date, 			// 거래 ID
				name : "결제 테스트",			  			// 결제 이름
				amount : price,							// 결제 금액
				buyer_email : "wnstjr5558@naver.com",	// 구매자 이메일
				buyer_name : "구매자",					// 구매자
				buyer_tel : "010-1234-1234",			// 구매자 전화번호
				buyer_addr : "서울시 영등포구 당산동",			// 구매자 주소
				buyer_postcode : "12345"				// 구매자 우편변호
			
			},function(rsp){
				if(rsp.success){
					alert("결제 성공");
					const input = $("<input type='hidden' name='impUid' value='"+rsp.imp_uid+"'>");
					$("#order-form").append(input);	
		            $("#order-form").submit();
				}else{
					alert("결제 실패");
				}
			});
		});
		

		
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName("productCheck");
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			};
		
		
			function sum(){
				const sumPrice = $(".sumPrice");
				let result = 0;
				for(let i=0; i<sumPrice.length; i++){
					result += Number(sumPrice.eq(i).val());
				}
				
				//const showPrice = $(".payPrice").val(result);
				//console.log(showPrice);
				
				const lastPrice = result.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				console.log(lastPrice);
				$(".lastPrice").text(lastPrice);
				
				
			}
			
			window.onload=function(){
				sum();
			}
		
		// 체크한것 삭제
		$(".deleteCheck").on("click", function(){
		    const check = $(".deleteBtn:checked");
		    if(check.length == 0) {
		        alert("선택된 상품이 없습니다.")
				return;
		    }
			const productNoList = new Array();
		    const userNo = check.next().val();

			for(let i=0; i<check.length; i++) {
			    const productNo = check.eq(i).val();
			    productNoList.push(productNo);
			}
			location.href="/deleteCart.do?productNo="+productNoList.join("/");
		});
		
		
		$("#order-same").on("change", function(){
		    if($(this).prop("checked")) {
		        $(".view-order-info").hide();
		        $(".view-order-info").attr("name", "1");
		        $(".hidden-order-info").show();
		        $(".hidden-order-info").eq(0).attr("name", "shippingName");
		        $(".hidden-order-info").eq(1).attr("name", "shippingPhone");
		        $(".hidden-order-info").eq(2).attr("name", "shippingAddr1");
		        $(".hidden-order-info").eq(3).attr("name", "shippingAddr2");
		    } else {
		        $(".hidden-order-info").hide();
		        $(".hidden-order-info").attr("name", "2");
		        $(".view-order-info").show();
		        $(".view-order-info").eq(0).attr("name", "shippingName");
		        $(".view-order-info").eq(1).attr("name", "shippingPhone");
		        $(".view-order-info").eq(2).attr("name", "shippingAddr1");
		        $(".view-order-info").eq(3).attr("name", "shippingAddr2");
		    }
		});
		
		function searchAddr() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            console.log(data);
		            $("#postcode").val(data.zonecode);
		            $("#shippingAddr1").val(data.roadAddress);
		            
		        }
		    }).open();
		}
		
		
	</script>
  </body>
</html>
