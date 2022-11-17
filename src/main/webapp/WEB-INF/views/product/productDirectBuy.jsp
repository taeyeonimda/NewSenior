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
<style>
.showCartList td{
	line-height:70px;
}
</style>
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
					<!-- 
					<form id="order-form" action="/insertOrder.do?memberNo=${sessionScope.m.memberNo}" method="post" autocomplete="off">
 					-->
                	<form id="goDeliveryTable" action="/goDelivery.do?memberNo=${sessionScope.m.memberNo}" autocomplete="off">
                  <table class="table table-borderless">
                    <thead>
                      <tr style="text-align: center;">
                        <th style=" width: 25%;">이미지</th>
                        <th style=" width: 45%;">상품명</th>
 						<th style=" width: 10%;">금액</th>
                        <th style=" width: 10%;">수량</th>
                        <th style=" width: 10%;">총 금액</th>
                      </tr>
                    </thead>
	                    <tbody>
			            	<tr class="showCartList">
						           		<td style="text-align:center"><img style="width:70px; height:70px;" src="/resources/upload/productImg/${p.productFileVO[0].filePath }"></td>
						           		<td style="text-align:center">${p.productName }</td>
						           		<td style="text-align:center">${p.wonPrice }</td>
						           		<td style="text-align:center" class="buyQty" >${pp }</td>
						           		<td class="buyPrice" style="text-align:center"><fmt:formatNumber value="${p.productPrice*pp }" pattern="#,###"/></td>
								<td><input type="hidden" class="sumPrice"  value="${p.productPrice*pp }"></td>
			            	</tr>	
	                    </tbody>
	                  </table>
	                  <input type="hidden" name="allSumPrice" class="allSumPrice">
                <!-- 
              	</form>
				<form id="goDeliveryTable" action="/goDelivery.do?memberNo=${sessionScope.m.memberNo}" autocomplete="off">
				 -->
					<div style="text-align:center; font-size:30px; margin-top: 20px;"><span>주문자 정보</span></div>
					<div class="orderInfo" style="margin-left:15%;">
						<div><span style="margin-right:10px;">주문자명</span><input type="text" value="${sessionScope.m.memberName }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div><br>
						<div><span style="margin-right:10px;">전화번호</span><input type="text" value="${sessionScope.m.memberPhone }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div><br>
						<div><span style="margin-right:25px;">이메일</span><input type="text"  value="${sessionScope.m.memberEmail }" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);"></div>
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
					</div>
					<br><br><br>
					<div id="same-check" style="float:right; margin-right:10%;">
                        <input type="checkbox" id="order-same" class="order-agree" >
                        <label for="order-same">기본 배송지 불러오기</label>
                    </div>
					<br><br>
					<div style="text-align:center; font-size:30px;"><span>배송지 정보</span></div>
					<div class="order-info shipping" style="margin-left:15%;">
						<div class="order-box">
	                        <label for="deliveryName" class="order-label" id="deliveryName" style="width:80px;">배송지이름<span class="comment"></span></label>
	                        <input type="text" id="deliveryName" class="basicInput" name="deliveryName" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div><br>
	                    <div class="order-box">
	                        <label for="deliveryName" class="order-label" style="width:80px;">수령인명</label>
	                        <input type="text"  id="deliveryName" class="basicInput " name="receiverName" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div>
	                        <br>
	                    <div class="order-box">
	                        <label for="deliveryPhone" class="order-label" style="width:80px;">전화번호</label>
	                        <input type="text"  id="deliveryPhone" class="basicInput" name="deliveryPhone" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" placeholder="010-0000-0000 형식으로 입력" required>
	                    </div>
	                        <br>
<!-- 
	                    <div class="order-box">
	                        <label for="deliveryEmail" class="order-label" style="width:80px;">이메일</label>
	                        <input type="text"  id="deliveryEmail" class="basicInput" name="deliveryEmail" value="" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div>
 -->
	                    <div class="order-box">
	                        <label for="deliveryAddr" class="order-label" style="width:80px;">주소</label>
	                        <input type="text" id="deliveryAddr" class="addr1 basicInput" name="deliveryAddr" style="width:400px; border:none; border-bottom : 2px solid rgb(120,181,143);" required readonly>
	                        <button type="button" class="btn btn-outline-primary" style="width:120px;height:40px;margin-bottom:30px;margin-top:10px;" id="addr-btn" onclick="searchAddr();">주소찾기</button>
	                    </div>
	                    <div class="order-box">
	                        <label for="deliveryAddr2" class="order-label" id="detailAddress" style="width:80px;">우편번호<span class="comment"></span></label>
	                        <input type="text" id="deliveryAddr2" class="addr2 basicInput" name="zipcode" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div><br>
	                    <div class="order-box">
	                        <label for="deliveryAddr2" class="order-label" id="detailAddress2" style="width:80px;">상세주소<span class="comment"></span></label>
	                        <input type="text" id="deliveryAddr2" class="detailAddr basicInput" name="deliveryDetail" style="width:250px; border:none; border-bottom : 2px solid rgb(120,181,143);" required>
	                    </div><br>
	                    
                	</div>
                	<br><br>
                	<div class="agree" style="text-align:center;">
                   		<input type="checkbox" id="infoAgree">
                        <label for="infoAgree">주문 내용을 확인하였으며, 정보 제공 등에 동의합니다.</label>
                    </div>
                    <br>                
                  <div style="margin: 10px; border-top: 1px solid #ddd;">
                  <!-- <button type="submit">연습버튼</button> -->
                    <button type="button" style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary" id="payBtn">결제하기</button>
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
		


		
		function selectAll(selectAll)  {
			  const checkboxes 
			       = document.getElementsByName("productCheck");
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			};
		
		
	    	window.onload=function(){
				
				let i =0;
				let totalPrice = $(".cartTotalPrice");
				let sumPrice1=$(".sumPrice").val();
				let numberPrice;
				for(i; i<totalPrice.length; i++){
					let price = totalPrice.eq(i).text();
					numberPrice = parseInt(price);
					let realPrice = numberPrice.toLocaleString();
					$(".realPrice").eq(i).text(realPrice);				
					sumPrice1 += numberPrice;
				}
				let realPrice = sumPrice1.toLocaleString();
				$(".lastPrice").text(realPrice);
				$(".allSumPrice").val(sumPrice1);
				
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
				
				$.ajax({
					url : "/inputDelivery.do",
					type : "get",
					data : {
						memberNo : $("[name=memberNo]").val()
					},success:function(data){
						$(".basicInput").eq(0).attr("value",data.deliveryName),
						$(".basicInput").eq(1).attr("value",data.receiverName),
						$(".basicInput").eq(2).attr("value",data.deliveryPhone),
						$(".basicInput").eq(3).attr("value",data.deliveryAddr),
						$(".basicInput").eq(4).attr("value",data.zipcode),
						$(".basicInput").eq(5).attr("value",data.deliveryDetail)
					}
				});
			
			}else{
				$(".basicInput").eq(0).attr("value","")
				$(".basicInput").eq(1).attr("value","")
				$(".basicInput").eq(2).attr("value","")
				$(".basicInput").eq(3).attr("value","")
				$(".basicInput").eq(4).attr("value","")
				$(".basicInput").eq(5).attr("value","")
			}
			
		});
		
		function searchAddr() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.
		            $(".addr1").val(data.roadAddress);
		            $(".addr2").val(data.zonecode);
		            
		        }
		    }).open();
		}
		
		$("#payBtn").on("click",function(){
			const price = $(".allSumPrice").val();
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			const status = $("#infoAgree").prop("checked");
			if(status == false){
				alert("주문 내용 확인 및 정보 제공동의에 체크하여 주세요.")
				return;				
			}
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
					$("#goDeliveryTable").append(input);	
		            $("#goDeliveryTable").submit();
				}else{
					alert("결제 실패");
				}
			});
		});
		
	</script>
  </body>
</html>
