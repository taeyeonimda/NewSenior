<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
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
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
                <div style="font-size: 40px; font-weight: 900; display: inline-block;">장바구니</div>
                <div style="display: inline-block; float: right;"><a href="javascript:void(0)" style=" width:100px; height: 30px; margin-top: 35px; line-height: 15px;" class="btn btn-outline-primary">삭제</a></div>
              </div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr style="text-align: center;">
                        <th style=" width: 10%;"><label>전체선택 <input type="checkbox" name="productCheck" onclick="selectAll(this)" style="width: 15px; height: 15px; "></label></th>
                        <th style=" width: 10%;">상품명</th>
                        <th style=" width: 30%;">상품명</th>
                        <th style=" width: 15%;">금액</th>
                        <th style=" width: 50px; width: 15%;">수량</th>
                        <th style=" width: 10%;">배송비</th>
                        <th style=" width: 10%;">총 금액</th>
                      </tr>
                    </thead>
                    <tbody>
                      
                      <c:forEach items="${list }" var="Cart">
		            	<tr class="showCartList">
		            		<td style="text-align:center"><input type="checkbox" name="productCheck"></td>
		            		<td style="text-align:center">${Cart.productNo }</td>
		            		<td style="text-align:center">${Cart.productName }</td>
							<td style="text-align:center">${Cart.buyPrice }</td>
							<td style="text-align:center">${Cart.buyAmount }</td>
							<td style="text-align:center">무료배송</td>
							<td style="text-align:center">${Cart.buyAmount*Cart.buyPrice }원</td>
		                </tr>
             		</c:forEach>
                      <tr>
                      	<td colspan="5"></td>
                      	<td>결제할 총 금액</td>
                      	<td>
                      		<input type="text" style="border:none;" class="sumPrice" value="100" readonly>
                     	</td>
                      </tr>
					
                    </tbody>
                  </table>
                  <div style="margin: 10px; border-top: 1px solid #ddd;">
                    <button style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary" id="payBtn">결제하기</button>
                    <a href="javascript:void(0)" style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary">더 담으러 가기</a>
                  </div>
                </div>
              </div>
</div></div>
  
            <!-- / Content -->



            <div class="content-backdrop fade"></div>
          </div>
          <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
      </div>

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
			const price = $(".sumPrice").val();
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			
			IMP.init("imp10385324");
			IMP.request_pay({
				pg: "html5_inicis",
				merchat_uid : "상품코드_"+date, 		// 거래 ID
				name : "결제 테스트",			  		// 결제 이름
				amount : price,						// 결제 금액
				buyer_email : "wnstjr5558@naver.com",	// 구매자 이메일
				buyer_name : "구매자",				// 구매자
				buyer_tel : "010-1234-1234",		// 구매자 전화번호
				buyer_addr : "서울시 영등포구 당산동",	// 구매자 주소
				buyer_postcode : "12345"			// 구매자 우편변호
			
			},function(rsp){
				if(rsp.success){
					alert("결제 성공");
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
			}
		
		
	</script>
  </body>
</html>
