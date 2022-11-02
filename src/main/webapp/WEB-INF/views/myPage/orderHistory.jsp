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
    </style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>

  <body>
    <!-- Layout wrapper -->
    <div class="content-wrapper" style="left: 300px; flex-direction: row; ">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme"
         style="top: 30px; display: inline-block; width: 300px; height: 400px;">
 <ul class="menu-inner py-1">

          <!-- 회원관리 -->
          <li class="menu-item ">
            <a href="memberMgrAdmin.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">회원 관리</div>
            </a>
          </li>
          <!-- 마이페이지 -->
          <li class="menu-item  ">
            <a href="mypage.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">마이페이지</div>
            </a>
          </li>

          <!-- 주문내역 -->
          <li class="menu-item active">
            <a href="/orderHistory.do?memberNo=${sessionScope.m.memberNo }" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">주문내역</div>
            </a>
          </li>

<!-- 찜한상품 
          <li class="menu-item ">
            <a href="jjimGoods.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">찜한상품</div>
            </a>
          </li>
-->
          <!-- 수강현황 -->
          <li class="menu-item  ">
            <a href="classHistory.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">수강현황</div>
            </a>
          </li>

          <!-- 내동호회 -->
          <li class="menu-item  ">
            <a href="myClub.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">내동호회</div>
            </a>
          </li>

          <!-- 나의후기 -->
          <li class="menu-item  ">
            <a href="myComment.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">나의후기</div>
            </a>
          </li>

          <!-- 강사정보 -->
          <li class="menu-item  ">
            <a href="teacherInfo.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">강사정보</div>
            </a>
          </li>

        </ul>
        </aside>
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
                      <th>상품이름</th>
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
							<td>${Or.productName }</td>
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
