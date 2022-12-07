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

<head>
    <meta charset="utf-8">
    <title>뉴시니어스 장바구니</title>
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
                <div style="font-size: 40px; font-weight: 900; display: inline-block;">장바구니</div>
                <div style="display: inline-block; float: right;"><button type="button" style=" width:100px; height: 30px; margin-top: 35px; line-height: 15px;" class="btn btn-outline-primary deleteCheck">삭제</button></div>
              </div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  <form id="order-form" action="/goOrderHistory.do?memberNo=${sessionScope.m.memberNo}" method="post" autocomplete="off">
                  <table class="table table-borderless">
                    <thead>
                      <tr style="text-align: center;">
                        <th style=" width: 10%;"><label> </label><input type="checkbox" name="productCheck" onclick="selectAll(this)" style="width: 15px; height: 15px; "></th>
						<th style=" width: 10%;">카트번호</th>
                        <th style=" width: 25%;">이미지</th>
                        <th style=" width: 25%;">상품명</th>
 						<th style=" width: 10%;">금액</th>
                        <th style=" width: 10%;">수량</th>
                        <th style=" width: 10%;">총 금액</th>
                      </tr>
                    </thead>
                    
	                    <tbody>
                    		<c:choose>
                    		<c:when test="${empty list}">
	                    		<td colspan="7" style="text-align : center; font-size:30px; font-weight:900; padding-top:20px; color:rgba(100,50,50,0.7);">장바구니가 비었습니다.</td>
                    		</c:when>
                    		<c:otherwise>
	                    <c:forEach items="${list }" var="Cart">
			            	<tr class="showCartList">
					            <td style="text-align:center"><input type="checkbox" name="productCheck" class="deleteBtn">
				            	<input type="hidden" class="cartNoHidden" value="${Cart.cartNo }" name="cartNo">
					            <input type="hidden" value="${sessionScope.m.memberNo }">
					            </td>
					            
					         	<td style="text-align:center">
					         		${Cart.cartNo }
					            </td>
					         
					            <c:choose>
						           	<c:when test="${Cart.productPhoto != null}">
						           		<td style="text-align:center"><img style="width:70px; height:70px;" src="/resources/upload/productImg/${Cart.productPhoto}"></td>
						           	</c:when>	
						           	<c:when test="${Cart.activityPhoto != null}">
						           		<td style="text-align:center"><img style="width:70px; height:70px;" src="/resources/upload/activity/${Cart.activityPhoto}"></td>
						           	</c:when>		
					            </c:choose>
					         	
					         	<c:choose>
						           	<c:when test="${Cart.buyName != null}">
						           		<td style="text-align:center">${Cart.buyName }</td>
						           	</c:when>	
						           	<c:when test="${Cart.activityName != null}">
						           		<td style="text-align:center">${Cart.activityName }</td>
						           	</c:when>		
					            </c:choose>

					            <c:choose>
						           	<c:when test="${Cart.buyPrice != 0}">
						           		<td class="buyPrice" style="text-align:center"><fmt:formatNumber value="${Cart.buyPrice }" pattern="#,###"/></td>
						           	</c:when>	
						           	<c:when test="${Cart.activityPrice != ''}">
						           		<td class="buyPrice" style="text-align:center">${Cart.activityPrice }</td>
						           	</c:when>		
					            </c:choose>
								<td style="text-align:center"><fmt:formatNumber value="${Cart.buyAmount }" /></td>
								

					         
								 	<c:if test="${Cart.buyPrice != 0}">
								 		<td style="text-align:center; display:none;" class="cartTotalPrice">${Cart.buyPrice*Cart.buyAmount }</td>
								 		<td style="text-align:center;" class="realPrice"></td>
								 	</c:if>
									<c:if test="${Cart.activityPrice != ''}">
						           		<td style="text-align:center; display:none;" class="cartTotalPrice">${Cart.activityPrice*Cart.buyAmount }</td>
						           		<td style="text-align:center;" class="realPrice"></td>
						           	</c:if>		
									<td><input type="hidden" class="sumPrice" value="${Cart.buyPrice*Cart.buyAmount }"></td>
								
								
			            	</tr>
	             		</c:forEach>
	             		</c:otherwise>
	             		</c:choose>
	             		<c:if test="${!empty list }">
	                    	<tr>
		                      	<td colspan="4"></td>
		                      	<td>결제할 총 금액</td>
		                      	<td>
		                      		<input type="hidden" style="border:none;" class="hiddenPayPrice payPrice" name="productsPrice" readonly>
		                      		<p class="lastPrice"></p>
		                      		
		                     	</td>
	                      	</tr>
                      	</c:if>
	                    </tbody>
	                  </table>
              	<c:if test="${!empty list }">
              		<button type="submit" style="float: right; width:250px; margin: 10px; margin-top:20px;" class="btn btn-outline-primary" id="testPay" >주문하기</button>
              	</c:if>
					</form>
                    <!-- <button style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary" id="payBtn">결제하기</button> -->
                  <div style="margin: 10px; border-top: 1px solid #ddd;">
                   <c:if test="${!empty list }">
                    	<a href="javascript:void(0)" style="float: right; width:250px; margin: 10px;" class="btn btn-outline-primary">더 담으러 가기</a>
                   	</c:if>
                  </div>
                </div>
              </div>
              </div>
</div>
  
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
    	function sum(){
    		const sumPrice = $(".sumPrice");
			let result = 0;
			for(let i=0; i<sumPrice.length; i++){
				result += Number(sumPrice.eq(i).val());
			}
			
			
		}
    	window.onload=function(){
			sum();
			let i =0;
			let totalPrice = $(".cartTotalPrice");
			let sumPrice=0;
			let numberPrice;
			for(i; i<totalPrice.length; i++){
				let price = totalPrice.eq(i).text();
				numberPrice = parseInt(price);
				let realPrice = numberPrice.toLocaleString();
				$(".realPrice").eq(i).text(realPrice);				
				sumPrice += numberPrice;
			}
			console.log(sumPrice);
			let realPrice = sumPrice.toLocaleString();
			$(".lastPrice").text(realPrice);
			
		}
    	
    	
    	
    	
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
		

		
		function selectAll(selectAll)  { // 전체선택
			  const checkboxes 
			       = document.getElementsByName("productCheck");
			  
			  checkboxes.forEach((checkbox) => {
			    checkbox.checked = selectAll.checked;
			  })
			}
		
		
		
		
		

		
		$(".deleteCheck").on("click", function(){
			// 체크한것 삭제
			    const check = $(".deleteBtn:checked");
			    if(check.length == 0) {
			        alert("선택된 상품이 없습니다.")
					return;
			    }
		    	if(confirm("삭제하시겠습니까?")){
		    		//const memberNo = $(".deleteBtn").next().next().val();
					const memberNo = ${sessionScope.m.memberNo};
					
					const cartNoArr = new Array();
					
					check.each(function(index,item){
						let cartNo = $(item).next().val();	
						cartNoArr.push(cartNo);
					});
					
					console.log(cartNoArr);
					location.href="/deleteCart.do?memberNo="+memberNo+"&cartNoArr="+cartNoArr.join("/");
					
		    	}else{
		    		return false;
		    	}
		    	
			});
		
	</script>
  </body>
</html>
