<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html
  lang="ko"
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
	
	<link rel="stylesheet" href="/resources/TGbtstr/css/productFrm.css" />
    <!-- Favicon -->
    <link href="/resources/JSbtstr/img/favicon.ico" rel="icon">

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
    <link rel="stylesheet" href="/resources/TGbtstr/css/adminProductList.css">
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
            <form action="/insertProduct.do" method="post" enctype="multipart/form-data">
              <div class="card mb-4" style="width: 90%; float: left;">
                <h5 class="card-header" style="text-align: center;">상품 관리하기</h5>
                <div class="card-body">
                <table style="border: 1px solid black; width: 100%" class="adminProductTable">
                <tr>
                	<th style="width: 8%;">상품번호</th><th style="width: 45%;">상품명</th><th style="width: 15%;">상품가격</th><th style="width: 10%;">수량</th><th style="width: 10%;">판매상태</th><th style="width: 12%">상품관리</th>
                </tr>
                  <c:forEach items="${list }" var="p">
                  <tr>
                  	<td class="productNo">${p.productNo }</td>
                  	<td class="productTitle"><a href="/productView.do?productNo=${p.productNo }">${p.productName }</a></td>
                  	<td>${p.wonPrice }<span>원</span></td>
                  	<td>${p.productQty }</td>
                  	<c:if test="${p.productStatus eq 0 }">
                  		<td>판매중</td>
                  	</c:if>
                  	<c:if test="${p.productStatus eq 1 }">
                  		<td>품절</td>
                  	</c:if>
                  	<td>
                  		<button type="button" class="productUpdateBtn" onclick="productUpdate(this,${p.productNo});">수정</button>
                  		<button type="button" class="productDeleteBtn" onclick="productDelete(this,${p.productNo});">삭제</button>
                  	</td>
                  </tr>
			  	  </c:forEach>
			  	 </table>
                  <div class="paging">${pageNavi }</div>
                </div>
              </div>
            </form>
              <!-- File input -->
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

<!-- Footer Start -->
<%@include file="/WEB-INF/views/common/footer.jsp" %>
<!-- Footer End -->
	<script>
		
		function productDelete(obj, productNo){
			if(confirm("상품을 삭제하시겠습니까?")){
				location.href="/adminDeleteProduct.do?productNo="+productNo;
			}
		}
	
		function productUpdate(obj, productNo) {
			if(confirm("상품정보를 수정하시겠습니까?")){
				location.href="/productUpdateFrm.do?productNo="+productNo;
			}
		}
	
	
		function productInsert(){
			var mainImg = $(".mainImg").val();
			 if(mainImg==''){
				 alert("메인이미지를 등록해주세요.");
				 return false;
			 } else {
				 if(confirm("상품을 등록하시겠습니까?")){
					 
				 }
			 }
		}
		
		</script>

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
                  	