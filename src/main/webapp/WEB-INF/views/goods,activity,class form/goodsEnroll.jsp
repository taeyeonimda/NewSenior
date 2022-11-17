<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    <script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
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
              <div class="card mb-4" style="width: 60%; float: left;">
                <h5 class="card-header" style="text-align: center;">상품 등록하기</h5>
                <div class="card-body">
                  <div class="mb-3 row" style="margin-top: 10px;">
                    <label for="html5-text-input" class="col-md-2 col-form-label">상품명</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input" name="productName"/>
                    </div>
                  </div>
                  <div class="mb-3 row" style="margin-top: 10px;">
                    <label for="html5-text-input" class="col-md-2 col-form-label">클래스명</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" id="html5-text-input" name="productSubName"/>
                    </div>
                  </div>
                  
                  <div class="mb-3 row">
                    <label for="html5-tel-input" class="col-md-2 col-form-label">가격</label>
                    <div class="col-md-10">
                      <input class="form-control" type="tel" id="html5-tel-input" style="width: 200px; display: inline-block;" name="productPrice"/>
                      <label for="html5-tel-input" class="col-md-2 col-form-label" style="text-align: right; padding-right: 10px; width:187px;">판매 수량</label>
                      <input class="form-control" type="tel" id="html5-tel-input" style="width: 220px; display: inline-block;" name="productQty"/>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-search-input" class="col-md-2 col-form-label">메인이미지</label>
                    <div class="col-md-10">
                      <input type="file" name="productFile" id="productFile" class="productFile mainImg">
                    </div>
                    <label for="html5-search-input" class="col-md-2 col-form-label">상세이미지1</label>
                    <div class="col-md-10">
                      <input type="file" name="productFile" id="productFile" class="productFile">
                    </div>
                    <label for="html5-search-input" class="col-md-2 col-form-label">상세이미지2</label>
                    <div class="col-md-10">
                      <input type="file" name="productFile" id="productFile" class="productFile">
                    </div>
                    <label for="html5-search-input" class="col-md-2 col-form-label">상세이미지3</label>
                    <div class="col-md-10">
                      <input type="file" name="productFile" id="productFile" class="productFile">
                    </div>
                    
                  </div>
                  
                  <div class="mb-3 row">
                    <label for="html5-tel-input" class="col-md-2 col-form-label">카테고리 상세</label>
                      <div class="btn-group" style="width: 150px;">
                      	<select id="productCategory" name="productCategory">
                      		<option value="">카테고리 선택</option>
                      		<option value="dg">디지털</option>
                      		<option value="fu">주식/재테크</option>
                      		<option value="cr">공예</option>
                      		<option value="de">디자인</option>
                      		<option value="ex">운동/건강</option>
                      		<option value="fs">패션</option>
                      		<option value="me">미디어</option>
                      		<option value="so">악기/노래</option>
                      		<option value="fo">외국어</option>
                      		<option value="co">요리/제과제빵</option>
                      	</select>
                      </div>
                  </div>
                  
                  <div class="mb-3 row">
                    <label for="html5-tel-input" class="col-md-2 col-form-label">판매상태</label>
                      <div class="btn-group" style="width: 150px;">
                      	<select id="productStatus" name="productStatus">
                      		<option value="0">판매</option>
                      		<option value="1">품절</option>
                      	</select>
                      </div>
                  </div>

                  
                  <div class="mb-3 row">
                    <label for="html5-email-input" class="col-md-2 col-form-label">상품소개</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name="productContent" id="productContent" style="height: 300px;"></textarea>
                      <!-- <input class="form-control" type="email"  id="html5-email-input" /> -->
                    </div>
                  </div>
 
                  <button type="submit" style="float: right; width:150px;" class="btn btn-outline-primary" id="productInsertBtn" onclick="return productInsert();">등록하기</button>
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
	
		$("#fileUpload").on("click",function(){
			$(".productFile").click();
		});
		
		function productInsert(){
			var mainImg = $(".mainImg").val();
			var category = $("#productCategory").val();
			console.log(category);
			 if(mainImg==''){
				 alert("메인이미지를 등록해주세요.");
				 return false;
			 } else if(category ==''){
				 alert("카테고리를 선택해주세요.")
				 return false;
			 } else {
				if(confirm("상품을 등록하시겠습니까?")){
					 
				 } else {
					 return false;
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
