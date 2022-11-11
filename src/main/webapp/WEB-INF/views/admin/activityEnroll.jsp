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
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--Datepicker-->

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
            <form  id="insertActFrm">
              <div class="card mb-4" style="width: 60%; float: left;">
                <h5 class="card-header" style="text-align: center;">액티비티 등록하기</h5>
                <div class="card-body">
                  <div class="mb-3 row">
                    <label for="html5-text-input" class="col-md-2 col-form-label">액티비티명</label>
                    <div class="col-md-10">
                      <input class="form-control" type="text" name="activityName" id="html5-text-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-file-input" class="col-md-2 col-form-label">메인이미지</label>
                    <div class="col-md-10">
                      <input type="file" name="files" class="btn btn-outline-primary" id="html5-file-input">
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-select-input" class="col-md-2 col-form-label">담당자명</label>
                    <div class="col-md-10">
                      <select name="activityManager" id="html5-select-input">
                      	<c:forEach items="${list }" var="admin">
                      		<option value="${admin.memberNo }">${admin.memberName }</option>
                      	</c:forEach>
                      </select>
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-introduce-input" class="col-md-2 col-form-label">액티비티소개</label>
                    <div class="col-md-10">
                      <input class="form-control" name="activityIntroduce" id="html5-introduce-input" />
                    </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-detail-input" class="col-md-2 col-form-label">상세소개</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name="activityDetail" id="html5-detail-input" ></textarea>
                    </div>
                  </div>
                  
                  <div class="mb-3 row">
                      <label for="html5-tel-input" class="col-md-2 col-form-label">상세사진</label>
                       <div class="col-md-10">
                        <input type="file" class="form-control" name="detailFiles" id="html5-tel-input" multiple/>
                     </div>
                  </div>
				
				
                  <div class="mb-3 row">
                        <label for="activityStartDate" class="col-md-2 col-form-label">수강기간</label>
                        <div class="col-md-10">
                          <input class="form-control" name = "startDate"  id="activityStartDate" style="width: 200px; display: inline-block;" 
                          onclick="javascript:f_datepicker(this);" placeholder="시작일 ex) 20221024"/>
                          <pre style="display: inline-block; margin: 0; margin-bottom: -5px;">  ~  </pre>
                          <input class="form-control" name ="endDate"  id="endDate" style="width: 200px; display: inline-block;" 
                           onclick="javascript:f_datepicker(this);" placeholder="종료일 ex) 20221024"/>
                        </div>
                      </div>
                  
                  <div class="mb-3 row">
                    <label for="html5-cate-input" class="col-md-2 col-form-label">카테고리</label>
                      <div class="btn-group" style="width: 200px;">
                         <select name="activityCategory" id="html5-cate-input">
                         <c:forEach items="${cateList}" var="cateList">
					       <option value="${cateList.categoryCode }">${cateList.categoryName }</option>
					     </c:forEach>   
     					</select>
                      </div>
                  </div>
                 
                  <div class="mb-3 row">
                    <label for="html5-limit-input" class="col-md-2 col-form-label">모집정원</label>
                      <div class="btn-group" style="width: 150px;">
                      	<select id="html5-limit-input" name="activityLimit">
                      		
                      	</select>
                      </div>
                  </div>
                  <div class="mb-3 row">
                    <label for="html5-price-input" class="col-md-2 col-form-label">가격</label>
                    <div class="col-md-10">
                      <input class="form-control" name="activityPrice" id="html5-price-input" />
                    </div>
                  </div>
                  
                   <div class="mb-3 row">
                    <label for="html5-etc-input" class="col-md-2 col-form-label">기타사항</label>
                    <div class="col-md-10">
                      <textarea class="form-control" name="etc" id="html5-etc-input" ></textarea>
                    </div>
                  </div>
                  
                  <button type="button" class="btn btn-outline-primary" id="submitBtn" >등록하기</button>
                </div>
              </div>
            </form>
              <!-- File input -->
            </div>
</div>
<script>

function f_datepicker(obj) {
	 $( obj ).datepicker().datepicker("show");
	}
	
	
//인원수 옵션값넣기
const limitSelect = $("select[name=activityLimit]");
	for(let i=1;i<=30;i++){
		limitSelect.append(
				$('<option>').prop({
					innerHTML: i+'명',
					value: i
				})
				)
	}
	
	$("#submitBtn").on("click",function(){
		const activityName = $("input[name=activityName]").val();
		let files = document.querySelector("input[name=files]").files[0];
		const activityManager = $("select[name=activityManager]").val();
		const activityIntroduce = $("input[name=activityIntroduce]").val();
		const activityDetail = $("textarea[name=activityDetail]").val();
		const activityCategory = $("select[name=activityCategory]").val();
		const activityLimit = $("select[name=activityLimit]").val();
		const activityPrice = $("input[name=activityPrice]").val();
		const startDate = $("input[name=startDate]").val();
		const endDate = $("input[name=endDate]").val();
		const files2 = document.querySelector("input[name=detailFiles]").files;
		const etc = $("textarea[name=etc]").val();
		
		
		console.log(files);
		console.log(files2);
		var formData = new FormData();
		formData.append('activityName',activityName);
		if(files!=null){
			formData.append('files',files);
		}else{
			formData.append('files',null);
		}
		
		formData.append('activityManager',activityManager);
		formData.append('activityIntroduce',activityIntroduce);
		formData.append('activityDetail',activityDetail);
		formData.append('activityLimit',activityLimit);
		formData.append('activityCategory',activityCategory);
		formData.append('activityPrice',activityPrice);
		formData.append('startDate',startDate);
		formData.append('endDate',endDate);
		formData.append('etc',etc);
		if(files2.length==0){
			formData.append('detailFiles',null);
		}else{
			for(let i=0;i<files2.length;i++){
				formData.append('detailFiles',files2[i]);
			}
		}
		
	
		
		
		$.ajax({
 			url : "/insertActivity.do",
			type:"post",
			data: formData,
			contentType: false,
            processData: false,
            enctype	: 'multipart/form-data',
			success:function(){
				location.href="activityMgrAdmin.do?reqPage=1";
			},error:function(){
				alert("error");
			}
			
			
 		})//ajax
	
	});
	
	
	$.datepicker.setDefaults({
		dateFormat: 'yy-mm-dd',
		prevText: '이전 달',
		nextText: '다음 달',
		monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		dayNames: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		minDate: '-100y',
		showMonthAfterYear: true,
		changeYear: true,
		yearSuffix: '년'
	});
		
	/*	
		if(activityName==""){
			alert("activityName 비었음");
			return null;
		}
		if(filepath==""){
			alert("filepath 비었음");
			return null;
		}
		if(activityManager==""){
			alert("activityManager 비었음");
			return null;
		}
		if(activityIntroduce==""){
			alert("activityIntroduce 비었음");
			return null;
		}
		if(activityDetail==""){
			alert("activityDetail 비었음");
			return null;
		}
		if(activityCategory==""){
			alert("activityCategory 비었음");
			return null;
		}
		if(activityLimit==""){
			alert("activityLimit 비었음");
			return null;
		}
		if(activityPrice==""){
			alert("activityPrice 비었음");
			return null;
		}
		if(startDate==""){
			alert("startDate 비었음");
			return null;
		}
		if(endDate==""){
			alert("endDate 비었음");
			return null;
		}
	*/	
		
	
		
</script>

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
    <script src="../assets/vendor/libs/masonry/masonry.js"></script>

    <!-- Main JS -->
    <script src="../assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>