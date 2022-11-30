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
    <title>클래스 등록</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">
    <!-- Favicon -->
    <link rel="icon" href="/resources/img/favicon-32x32.png">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Jost:wght@500;600;700&family=Open+Sans:wght@400;500&display=swap" rel="stylesheet">  

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">
	<%@include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
  	
  	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script><!--Datepicker-->
       	<!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-5 wow fadeIn" style="background: linear-gradient(rgba(15, 66, 41, .6), rgba(15, 66, 41, .6)), url(/resources/img/은비5.jpg) center center no-repeat; background-size: cover;">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">클래스 신청</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                        <li class="breadcrumb-item">뉴시니어스의 강사가 되어 나만의 재능을 나눠보세요</li>
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
        
        
    <div class="page-content rounded mt-5">
            <div class="container-xxl flex-grow-1 container-p-y mt-5">
                <div class="col-xl-6 " style="margin: 0 auto;">
                  <!-- HTML5 Inputs -->
                <form action="#">
                  <div class="card mb-4" style="width:100wh;">
                    <h5 class="card-header" style="text-align: center; background-color: #0F4229; color: white;">클래스 신청서</h5>
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
                        <label for="html5-curri-input" class="col-md-2 col-form-label">커리큘럼</label>
                        <div class="col-md-10">
                          <textarea class="form-control" name= "curriculum"  id="html5-curri-input" ></textarea>
                        </div>
                      </div>
                    
                      <div class="mb-3 row">
                        <label for="html5-claDetail-input" class="col-md-2 col-form-label">클래스 상세</label>
                        <div class="col-md-10">
                          <input type="file" class="form-control" name="detailFiles" id="html5-claDetail-input" multiple/>
                        </div>
                      </div>
				
                      <div class="mb-3 row">
                        <label for="classStartDate" class="col-md-2 col-form-label">수강기간</label>
                        <div class="col-md-10">
                          <input class="form-control" name = "startDate"  id="classStartDate" style="width: 200px; display: inline-block;"
                          onclick="javascript:f_datepicker(this);" readonly placeholder="시작일"/>
                          <pre style="display: inline-block; margin: 0; margin-bottom: -5px;">  ~  </pre>
                          <input class="form-control" name ="endDate" type="tel" id="classEndDate" style="width: 200px; display: inline-block;"
                          onclick="javascript:f_datepicker(this);" readonly placeholder="종료일"/>
                        </div>
                      </div>

                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label" for="category">카테고리</label>
                        <select name="category" class="fv_btn" id="category"
								style="width: 30%; border: 1px solid #ced4da;  margin-left: 10px;">
                        <c:forEach items="${cateList}" var="cateList">
                         <option value="${cateList.categoryCode }">${cateList.categoryName }</option>
                        </c:forEach>   
                        </select>
                      </div>
                      
                      <div class="mb-3 row">
                        <label for="html5-tel-input" class="col-md-2 col-form-label" for="classLimit">모집정원</label>
                        	<select name="classLimit" class="fv_btn" style="width: 30%; border: 1px solid #ced4da; margin-left: 10px;">
                        		
                        	</select>
                      </div>
                      <div class="mb-3 row">
                        <label for="products" class="col-md-2 col-form-label">준비물유무</label>
                        <select name = "products" class="fv_btn" style="width: 30%; border: 1px solid #ced4da;  margin-left: 10px;">
                        	<option value="1">O</option>
                        	<option value="0">X</option>
                        </select>
                      
                      </div>
                      <c:if test="${sessionScope.m != null}">
                       	<a id="subBtn" href="javascript:void(0)" style="float: right; width:150px;" class="btn btn-outline-primary">등록하기</a>
                      </c:if>
                     <c:if test="${sessionScope.m == null}">
                       	<a id="subFail" href="/main.do?login=1" style="float: right; width:150px;" class="btn btn-outline-primary">로그인 후 등록이 가능합니다</a>
                      </c:if>
                    </div>
                  </div>
                  
                </form>
                  <!-- File input -->
               </div></div></div>
            <!-- / Content -->
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
	<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>






<script>

	function f_datepicker(obj) {
		 $( obj ).datepicker().datepicker("show");
		}
	
	
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
				alert("클래스 이름을 작성해 주세요.");
				return false;
			}
			if(files==""||files==null){
				alert("파일을 등록해 주세요");
				return false;
			}
			
			if(files2.length==0){
				alert("상세파일을 등록해 주세요");
				return false;
			}
			
			if(teacherIntroduce==""){
				alert("강사 정보를 작성해 주세요");
				return false;
			}
			if(curriculum==""){
				alert("커리큘럼을 작성해 주세요");
				return false;
			}
			if(startDate==""){
				alert("시작일을 등록하세요");
				return false;
			}
			if(endDate==""){
				alert("마감일을 등록하세요");
				return false;
			}
			
			if(category==""){
				alert("카테고리를 선택하세요");
				return false;
			}

			if(classLimit ==""){
				alert("클래스제한을 선택하세요");
				return false;
			}
			
			if(products==""){
				alert("준비물 유무를 선택하세요");
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
					alert("에러가 발생하였습니다. 다시 시도해주세요.");
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
		
	</script>
</body>
</html>
