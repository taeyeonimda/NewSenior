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
  <div class="content-wrapper" style="left: 300px; flex-direction: row; min-height: 500px;">
      <!-- Menu -->

      <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme"
       style="top: 30px; display: inline-block; width: 300px; height: 400px;">
        
        <ul class="menu-inner py-1">

          <!-- 회원관리 -->
          <li class="menu-item">
            <a href="memberMgrAdmin.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">회원 관리</div>
            </a>
          </li>

          <!-- 클래스관리 -->
          <li class="menu-item">
            <a href="classMgrTeacher.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-collection"></i>
              <div data-i18n="Basic">클래스관리(강사페이지)</div>
            </a>
          </li>
          <!-- 클래스등록 -->
          <li class="menu-item">
            <a href="classEnroll.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">클래스 등록</div>
            </a>
          </li>

          <!-- 액티비티등록 -->
          <li class="menu-item ">
            <a href="activityEnroll.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">액티비티 등록</div>
            </a>
          </li>

          <!-- 액티비티관리 -->
          <li class="menu-item active">
            <a href="activityMgrAdmin.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">액티비티 관리</div>
            </a>
          </li>

          <!-- 상품등록 -->
          <li class="menu-item ">
            <a href="goodsEnroll.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">상품 등록</div>
            </a>
          </li>

          <!-- 상품관리 -->
          <li class="menu-item">
            <a href="goodsMgrAdmin.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">상품 관리</div>
            </a>
          </li>

          <!-- Tables -->
          <li class="menu-item">
            <a href="classMgrAdmin.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-table"></i>
              <div data-i18n="Tables">클래스관리(관리자페이지)</div>
            </a>
          </li>

          <!-- 장바구니 -->
          <li class="menu-item ">
            <a href="cart.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-table"></i>
              <div data-i18n="Tables">장바구니</div>
            </a>
          </li>

          <!-- 마이페이지 -->
          <li class="menu-item  ">
            <a href="mypage.do" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">마이페이지</div>
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
              <div style="font-size: 25px;">액티비티관리</div>
              <div class="card">

                <div class="table-responsive text-nowrap">
                  
                  <table class="table table-borderless">
                    <thead>
                      <tr>
                        <th style="width: 20px;">
                          <label>전체선택 <input type="checkbox" style="width: 15px; height: 15px; "></label>
                        </th>
                        <th style="width: 20px;">번호</th>
                        <th>상품명</th>
                        <th>가격</th>
                        <th>상품소개</th>
                        <th>수정</th>
                        <th>삭제</th>
                      </tr>
                    </thead>
                    <tbody>
                    
                    <c:forEach items="${list }" var="act">
                      <tr>
                        <td style="text-align: center;"><input type="checkbox"></td>
                        <td style="text-align: center;">${act.activityNo }</td>
                        <td>${act.activityName }</td>
                        <td>${act.activityPrice }</td>
                        <td>${act.activityIntroduce }</td>
                        <td></td>
                        <td>
                          <div class="dropdown">
                            <button type="button" class="btn p-0 dropdown-toggle hide-arrow" data-bs-toggle="dropdown">
                              <i class="bx bx-dots-vertical-rounded"></i>
                            </button>
                            <div class="dropdown-menu">
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-edit-alt me-1"></i>승인</a
                              >
                              <a class="dropdown-item" href="javascript:void(0);"
                                ><i class="bx bx-trash me-1"></i>취소</a
                              >
                            </div>
                          </div>
                        </td>
                      </tr>
                      </c:forEach>
                      
                    </tbody>
                  </table>
                   <div id="pageNavi">${pageNavi }</div>
                </div>
              </div>
</div></div>

             

  
            <!-- / Content -->
<!-- Footer Start -->
<div class="container-fluid bg-dark text-light footer mt-5 py-5 wow fadeIn" data-wow-delay="0.1s" style="width: 100%;">
  <div class="container py-5">
      <div class="row g-5">
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Our Office</h4>
              <p class="mb-2"><i class="fa fa-map-marker-alt me-3"></i>123 Street, New York, USA</p>
              <p class="mb-2"><i class="fa fa-phone-alt me-3"></i>+012 345 67890</p>
              <p class="mb-2"><i class="fa fa-envelope me-3"></i>info@example.com</p>
              <div class="d-flex pt-2">
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-youtube"></i></a>
                  <a class="btn btn-square btn-outline-light rounded-circle me-2" href=""><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Services</h4>
              <a class="btn btn-link" href="">Landscaping</a>
              <a class="btn btn-link" href="">Pruning plants</a>
              <a class="btn btn-link" href="">Urban Gardening</a>
              <a class="btn btn-link" href="">Garden Maintenance</a>
              <a class="btn btn-link" href="">Green Technology</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Quick Links</h4>
              <a class="btn btn-link" href="">About Us</a>
              <a class="btn btn-link" href="">Contact Us</a>
              <a class="btn btn-link" href="">Our Services</a>
              <a class="btn btn-link" href="">Terms & Condition</a>
              <a class="btn btn-link" href="">Support</a>
          </div>
          <div class="col-lg-3 col-md-6">
              <h4 class="text-white mb-4">Newsletter</h4>
              <p>Dolor amet sit justo amet elitr clita ipsum elitr est.</p>
              <div class="position-relative w-100">
                  <input class="form-control bg-light border-light w-100 py-3 ps-4 pe-5" type="text" placeholder="Your email">
                  <button type="button" class="btn btn-primary py-2 position-absolute top-0 end-0 mt-2 me-2">SignUp</button>
              </div>
          </div>
      </div>
  </div>
</div>

<!-- Footer End -->



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
  </body>
</html>
