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
    <link rel="stylesheet" href="resources/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="resources/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="resources/css/demo.css" />

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
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="resources/css/style.css" rel="stylesheet">
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

          <!-- íìê´ë¦¬ -->
          <li class="menu-item ">
            <a href="memberMgrAdmin.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">íì ê´ë¦¬</div>
            </a>
          </li>
          
          <!-- ë§ì´íì´ì§ -->
          <li class="menu-item active ">
            <a href="mypage.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ë§ì´íì´ì§</div>
            </a>
          </li>

          <!-- ì£¼ë¬¸ë´ì­ -->
          <li class="menu-item ">
            <a href="orderHistory.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ì£¼ë¬¸ë´ì­</div>
            </a>
          </li>

          <!-- ì°íìí -->
          <li class="menu-item ">
            <a href="jjimGoods.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ì°íìí</div>
            </a>
          </li>
          
          <!-- ìê°íí© -->
          <li class="menu-item  ">
            <a href="classHistory.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ìê°íí©</div>
            </a>
          </li>

          <!-- ë´ëí¸í -->
          <li class="menu-item  ">
            <a href="myClub.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ë´ëí¸í</div>
            </a>
          </li>

          <!-- ëìíê¸° -->
          <li class="menu-item  ">
            <a href="myComment.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ëìíê¸°</div>
            </a>
          </li>

          <!-- ê°ì¬ì ë³´ -->
          <li class="menu-item  ">
            <a href="teacherInfo.html" class="menu-link">
              <i class="menu-icon tf-icons bx bx-detail"></i>
              <div data-i18n="Basic Inputs">ê°ì¬ì ë³´</div>
            </a>
          </li>

        </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        


          <!-- Content wrapper -->
          
            <!-- Content -->

            <div class="container-xxl flex-grow-1 container-p-y">
              <!-- HTML5 Inputs -->
            <form action="#">
              <div class="card mb-4" style="width: 60%; float: left;" >
                <h5 class="card-header">ë´ì ë³´</h5>
                <div class="card-body">
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">ì´ë¦</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">ìì´ë</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-email-input" class="col-md-2 col-form-label">ì´ë©ì¼</label>
                    <div class="col-md-10">
                      <input class="form-control" type="email"  id="html5-email-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-url-input" class="col-md-2 col-form-label">ë¹ë°ë²í¸</label>
                    <div class="col-md-10">
                      <button type="button" class="btn btn-outline-warning"><a href="#" style="color: #FFAB00;">ë¹ë°ë²í¸ ë³ê²½íê¸°</a></button>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-url-input" class="col-md-2 col-form-label">ìëìì¼</label>
                    <div class="col-md-10">
                      <input class="form-control" type="url" id="html5-url-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-url-input" class="col-md-2 col-form-label">ì íë²í¸</label>
                    <div class="col-md-10">
                      <input class="form-control" type="url" id="html5-url-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-tel-input" class="col-md-2 col-form-label">ê´ì¬ë¶ì¼</label>
                    <div class="btn-group" style="width: 150px;">
                      <button
                        type="button"
                        class="btn btn-outline-warning dropdown-toggle"
                        data-bs-toggle="dropdown"
                        aria-expanded="false"
                      >
                        ê´ì¬ë¶ì¼ì í
                      </button>
                        <ul class="dropdown-menu">
                          <li><a class="dropdown-item" href="javascript:void(0);">ëì§í¸</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ì£¼ì/ì¬íí¬</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ê³µì</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ëìì¸</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ì´ë/ê±´ê°</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">í¨ì</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ë¯¸ëì´</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ìê¸°/ë¸ë</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ì¸êµ­ì´</a></li>
                          <li><a class="dropdown-item" href="javascript:void(0);">ìë¦¬/ì ê³¼ì ë¹µ</a></li>
                        </ul>
                      </div>
                  </div>

                  <button type="button" class="btn btn-outline-warning" style="float: right;"><a href="#" style="color: #FFAB00;">ë¹ë°ë²í¸ ë³ê²½íê¸°</a></button>
                </div>
              </div>
            </form>
              <!-- File input -->
            </div>
</div>
        <!-- / Content -->



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
