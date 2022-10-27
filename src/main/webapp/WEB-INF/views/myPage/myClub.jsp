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
          <li class="menu-item ">
            <a href="orderHistory.do" class="menu-link">
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
          <li class="menu-item active ">
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
              

              <!-- Examples -->
              <div>진행중인 클래스</div><br><br>
              <div class="row mb-5">
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="/img/êµ¬ê¸ë¡ê³ .png" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">내 동호회 1</h5>
                      <p class="card-text">등산동호회</p>
                      <p class="card-text">멤버 N명</p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="/img/êµ¬ê¸ë¡ê³ .png" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">내 동호회 1</h5>
                      <p class="card-text">등산동호회</p>
                      <p class="card-text">멤버 N명</p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="/img/êµ¬ê¸ë¡ê³ .png" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">내 동호회 1</h5>
                      <p class="card-text">등산동호회</p>
                      <p class="card-text">멤버 N명</p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="/img/êµ¬ê¸ë¡ê³ .png" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">내 동호회 1</h5>
                      <p class="card-text">등산동호회</p>
                      <p class="card-text">멤버 N명</p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
                    </div>
                  </div>
                </div>
                <div class="col-md-6 col-lg-4 mb-3">
                  <div class="card h-100">
                    <img class="card-img-top" src="/img/êµ¬ê¸ë¡ê³ .png" alt="Card image cap" />
                    <div class="card-body">
                      <h5 class="card-title">내 동호회 1</h5>
                      <p class="card-text">등산동호회</p>
                      <p class="card-text">멤버 N명</p>
                      <a href="javascript:void(0)" class="btn btn-outline-primary">상세보기</a>
                    </div>
                  </div>
                </div>
              </div>
              <!-- Examples -->

             


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
  </body>
</html>
