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
 <script src="https://code.jquery.com/jquery-3.6.1.js"></script>
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
              

                <div class="col-xl-6">
                  <!-- HTML5 Inputs -->
                <form action="#">
                  <div class="card mb-4">
                    <h5 class="card-header" style="text-align: center;">클래스 등록하기</h5>
                    <div class="card-body">
                      <div class="mb-3 row">
                        <label for="html5-text-input" class="col-md-2 col-form-label">클래스명</label>
                        <div class="col-md-10">
                          <input class="form-control" name='className' type="text" id="html5-text-input" />
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label for="html5-search-input" class="col-md-2 col-form-label">메인이미지</label>
                        <div class="col-md-10">
                          <input type="file" name = 'files' class="btn btn-outline-primary">
                        </div>
                      </div>
                      
                          <input class="form-control" value="${m.memberNo }"name = 'teacherName' type="hidden"  id="html5-email-input" />
                       
                      <div class="mb-3 row">
                        <label for="html5-url-input" class="col-md-2 col-form-label">강사소개</label>
                        <div class="col-md-10">
                          <textarea class="form-control" name = "teacherIntroduce"  id="html5-url-input" ></textarea>
                          
                        </div>
                      </div>
                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label">커리큘럼</label>
                        <div class="col-md-10">
                          <textarea class="form-control" name= "curriculum"  id="html5-tel-input" ></textarea>
                        </div>
                      </div>
                    
                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label">클래스 상세</label>
                        <div class="col-md-10">
                          <input type="file" class="form-control" name="detailFiles" id="html5-tel-input" multiple/>
                        </div>
                      </div>
				
                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label">수강기간</label>
                        <div class="col-md-10">
                          <input class="form-control" name = "startDate" type="tel" id="html5-tel-input" style="width: 200px; display: inline-block;" placeholder="시작일 ex) 20221024"/>
                          <pre style="display: inline-block; margin: 0; margin-bottom: -5px;">  ~  </pre>
                          <input class="form-control" name ="endDate" type="tel" id="html5-tel-input" style="width: 200px; display: inline-block;" placeholder="종료일 ex) 20221024"/>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label" for="category">카테고리</label>
                        <select name="category">
                        	<option value="DG">디지털</option>
                        	<option value="FU">주식/재테크</option>
                        	<option value="CR">공예</option>
                        	<option value="DE">디자인</option>
                        	<option value="EX">운동</option>
                        	<option value="FS">패션</option>
                        	<option value="ME">미디어</option>
                        	<option value="SO">악기/음악</option>
                        	<option value="FO">외국어</option>
                        	<option value="CO">요리/음식</option>
                        	<option value="ET">기타</option>
                        </select>
                      </div>
                      
                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label" for="classLimit">모집정원</label>
                        	<select name="classLimit">
                        		
                        	</select>
                      </div>
                      <div class="mb-3 row">
                        <label for="products" class="col-md-2 col-form-label">준비물유무</label>
                        <select name = "products">
                        	<option value="1">O</option>
                        	<option value="0">X</option>
                        </select>
                      
                      </div>
                      <a id="subBtn" href="javascript:void(0)" style="float: right; width:150px;" class="btn btn-outline-primary">등록하기</a>
                    </div>
                  </div>
                  
                </form>
                  <!-- File input -->
               </div></div></div>
            <!-- / Content -->
	<script>
	console.log($("input[name=teacherName]").val());
	//인원수 옵션값넣기
	const limitSelect = $("select[name=classLimit]");
 	for(let i=1;i<=30;i++){
 		limitSelect.append(
 				$('<option>').prop({
 					innerHTML: i+'명',
 					value: i
 				})
 				)
 	}
	
		$("#subBtn").on("click",function(){
			const className = $("input[name=className]").val();
			const files = document.querySelector("input[name=files]").files[0];
			const teacherName = $("input[name=teacherName]").val();
			const teacherIntroduce = $("textarea[name=teacherIntroduce]").val();
			const curriculum =$("textarea[name=curriculum]").val();
			const startDate = $("input[name=startDate]").val();
			const endDate = $("input[name=endDate]").val();
			const category = $("select[name=category]").val();
			const classLimit = $("select[name=classLimit]").val();
			const products = $("select[name=products]").val();
			
			const files2 = document.querySelector("input[name=detailFiles]").files;
		
			
			if(className==""){
				alert("클래스이름");
				return false;
			}
			if(files==""){
				alert("파일즈");
				return false;
			}
			
			if(teacherIntroduce==""){
				alert("teacherIntroduce");
				return false;
			}
			if(curriculum==""){
				alert("curriculum");
				return false;
			}
			if(startDate==""){
				alert("startDate");
				return false;
			}
			if(endDate==""){
				alert("endDate");
				return false;
			}
			
			if(category==""){
				alert("category");
				return false;
			}

			if(classLimit ==""){
				alert("classLimit");
				return false;
			}
			
			if(products==""){
				alert("products");
				return false;
			}
			
			
			console.log("files2::::"+files2)
			console.log("files2길이::::"+files2.length)
			
			var formData = new FormData();
			formData.append('className',className);
			formData.append('files', files);
			formData.append('classTeacher',teacherName);
			formData.append('teacherIntroduce',teacherIntroduce);
			formData.append('curriculum',curriculum);
			formData.append('startDate',startDate);
			formData.append('endDate',endDate);
			formData.append('classCategory',category);
			formData.append('classLimit',classLimit);
			formData.append('products',products);
			for(let i=0;i<files2.length;i++){
				formData.append('detailFiles',files2[i]);
			}
			

			
			
		
			
			
			
			console.log(formData.get("className"));
			console.log(formData.get("files"));
			console.log(formData.get("teacherName"));
			console.log(formData.get("teacherIntroduce"));
			console.log(formData.get("curriculum"));
			console.log(formData.get("startDate"));
			console.log(formData.get("endDate"));
			console.log(formData.get("classCategory"));
			console.log(formData.get("classLimit"));
			console.log(formData.get("products"));
			console.log(formData.get("detailFiles"));
			
			$.ajax({
	 			url : "/insertClass.do",
				type:"post",
				data: formData,
				contentType: false,
	            processData: false,
	            enctype	: 'multipart/form-data',
				success:function(){
					location.href="adminMgrClass.do?reqPage=1";
				},error:function(){
					alert("error");
				}
				
				
	 		})//ajax
			 
		});
	</script>




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

</body>

</html>


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

    <script src="../assets/js/form-basic-inputs.js"></script>

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
  </body>
</html>
