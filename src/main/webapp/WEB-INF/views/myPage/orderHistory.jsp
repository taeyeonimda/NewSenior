<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
            <div style="font-size: 25px;">주문내역</div>
            <div style="font-size: 15px;">클래스, 액티비티, 키트</div>
            <div class="card">

              <div class="table-responsive text-nowrap">
                
                <table class="table table-borderless">
                  <thead>
                    <tr>
                      <th>주문번호</th>
                      <th>주문일자</th>
                      <th>수령인</th>
                      <th>주소</th>
                      <th>총 주문금액</th>
                      <!-- 주문번호 1개당 1tr -->
                      <!-- 상세주문 끝나면 여기서는 주문번호, 일자, 총주문금액만 보여주고 -->
                      <!-- 상세주문에서 제품정보, 각각의 수량과 금액, 설명 보여주기 -->
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach items="${list }" var="Or">
		            	<tr class="showOrderDetail" onclick="goToOrderDetail(${Or.orderNo});">
		            		<td>${Or.orderNo }</td>
							<td>${Or.orderDate }</td>
							<td>${Or.receiveName }</td>
							<td>${Or.receiveAddr }</td>
							<td>${Or.orderAmount*Or.orderPrice }원</td>
		                </tr>
             		</c:forEach>
             		
             		<c:if test="">
		                <tr>
		                	<td style="text-align:center;">주문 내역이 없습니다.</td>
		                </tr>
        			</c:if>
        			
                  </tbody>
                </table>
              </div>
            </div>
       
			<br><br><br>
          <div style="font-size: 25px;">주문내역</div>
          <div style="font-size: 17px;">상품</div>
            <div class="card">

              <div class="table-responsive text-nowrap">
                
                <table class="table table-borderless">
                  <thead>
                    <tr>
                      	<th>주문일자</th>
                      	<th>상품이름</th>
                      	<th>수량</th>
                      	<th>금액</th>
                      	<th>총 주문금액</th>
                    </tr>
                  </thead>
                  <tbody>
                    <tr>
                      	<td>2022-10-27</td>
                      	<td>카스타드</td>
                      	<td>1</td>
                      	<td>300원</td>
                      	<td>300원</td>
                    </tr>
                  </tbody>
                </table>
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
    <script src="../assets/vendor/libs/masonry/masonry.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script>
	    function goToOrderDetail(orderNo) {
			location.href = "/orderDetail.do?orderNo="+orderNo;
		}
    </script>
  </body>
</html>
