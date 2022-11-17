<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	 <link href="/resources/css/board/boardWrite.css" rel="stylesheet">
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
	
</head>
<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
         <c:if test="${boardType eq 'F' or boardType eq 'I' or boardType eq 'P'}">
                <h1 class="display-3 text-white mb-4 animated slideInDown">커뮤니티</h1>
             </c:if>
              <c:if test="${boardType eq 'N' or boardType eq 'Q' or boardType eq 'A'}">
              	<h1 class="display-3 text-white mb-4 animated slideInDown">공지사항</h1>
              </c:if>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                    	<c:if test="${boardType eq 'F' or boardType eq 'I' or boardType eq 'P'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></li>
                        </c:if>
                        <c:if test="${boardType eq 'N' or boardType eq 'Q' or boardType eq 'A'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></li>
	                        <li class="breadcrumb-item active" aria-current="page"><a href="/classEnroll.do">강사모집</a></li>
                        </c:if>
                        
                    </ol>
                </nav>
            </div>
        </div>
        <!-- Page Header End -->
    <!-- Projects Start -->
    <div class="container-xxl py-5">
        <div class="container">
            <div class="text-center mx-auto wow fadeInUp" data-wow-delay="0.1s" style="max-width: 500px;">
                
                <c:if test="${boardType eq 'F'}">
                <p class="fs-5 fw-bold text-primary">새로운 나를 발견하는 재미</p>
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></h1>
                </c:if>
                <c:if test="${boardType eq 'I'}">
                <p class="fs-5 fw-bold text-primary">all about Senior Activity</p>
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></h1>
                </c:if>
                <c:if test="${boardType eq 'P'}">
                <p class="fs-5 fw-bold text-primary">새로운 나를 발견하는 재미</p>
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></h1>
                </c:if>
                <c:if test="${boardType eq 'N'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></h1>
                </c:if>
                <c:if test="${boardType eq 'Q'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></h1>
                </c:if>
                <c:if test="${boardType eq 'A'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=A">FAQ</a></h1>
                </c:if>
            </div>
            
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    
        	   </div>
                    <div style="display: none;" class="category">${classCategory }</div>
                </div>
            </div>
            <div class="row g-4 portfolio-container">
            <c:forEach items="${clist }" var="cla" varStatus="i">
            	<div class="col-lg-4 col-md-6 portfolio-item first wow fadeInUp" data-wow-delay="0.3s">
                    <div class="portfolio-inner rounded" onclick="classDetail(${cla.classNo });">
                        <img class="img-fluid class-img"style="width:408px;height:408px;"src="/resources/upload/class/${cla.filepath }" alt="">
                        <div class="portfolio-text">
                            <h4 class="text-white mb-4">${cla.className }</h4>
                            <div class="d-flex">
                                <a class="btn btn-lg-square rounded-circle mx-2" href="/resources/upload/class/${cla.filepath }" data-lightbox="portfolio"><i class="fa fa-eye"></i></a>
                                <a class="btn btn-lg-square rounded-circle mx-2" href=""><i class="fa fa-link"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </div>
 <div class="boardWriteWrap">
	<form action="/boardWrite.do" id="boardWriteForm" method="post" enctype="multipart/form-data">
		<table class="boardWriteTbl table" border="1">
			<tr>	
				<th style="background-color:#0F4229; color:white;">카테고리</th>
				<c:if test="${boardType eq 'F' }">
					<td>
						<select name="boardCategory">
							<option value="info">정보</option>
							<option value="etc">기타</option>
						</select>
					</td>	
				</c:if>
				<c:if test="${boardType eq 'I' }">
					<td>
						<select name="boardCategory">
							<option value="campaign">캠페인</option>
							<option value="fair">박람회</option>
							<option value="tour">여행</option>
							<option value="ectI">기타</option>
						</select>
					</td>
				</c:if>
				<c:if test="${boardType eq 'Q' }">
					<td>
						<select name="boardCategory">
							<option value="class">클래스</option>
							<option value="club">동호회</option>
							<option value="activity">액티비티</option>
							<option value="product">상품</option>
							<option value="pay">결제</option>
							<option value="delivery">배송</option>
						</select>
					</td>
				</c:if>
				<c:if test="${boardType eq 'N' }">
					<td>
						<select name="boardCategory">
							<option value="notice">공지사항</option>
						</select>
					</td>	
				</c:if>
				<c:if test="${boardType eq 'P' }">
					<td>
						<select name="boardCategory">
							<option value="invite">모집중</option>
							<option value="end">모집완료</option>
						</select>
					</td>	
				</c:if>
				
			</tr>
			<tr>
				<th style="background-color:#0F4229; color:white;">제목</th>
				<td colspan="3"><input type="text" name="boardTitle"></td>
			</tr>
			<tr>
				<th style="background-color:#0F4229; color:white;">닉네임</th>
				<td>
				${sessionScope.m.nickName }
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<input type="hidden" name="boardType" value="${boardType }">
													<%--게시판 바꾸면 이 값도 바뀜 / 주소에 boardType넘겨줌 --%>
				</td>	
			</tr>
			<tr>
				<th style="background-color:#0F4229; color:white;">첨부파일</th>
				<td>
				<input type="file" name="boardFile" multiple>
				</td>
				
			</tr>
			<tr>
				<th style="background-color:#0F4229; color:white;">내용</th>
				<td><textarea name="boardContent" id="boardContent"></textarea></td>
			</tr>
	</table>
				<div class="boardWriteBtnBox">
					<input type="submit" id="boardWriteBtn" class="boardWriteBtn" value="작성">
				</div>
	</form>
</div>

<script>
		$("#boardContent").summernote({
			height:400,
			lang:"ko-KR",
			callbacks : {

				//onImageUpload : function(files){
				//for(let i=0;i<files.length;i++){
										//uploadImage(files[i],this);
				
						onImageUpload : function(files){
						uploadImage(files[0],this);
				}
			}
		});
		function uploadImage(file,editor){
			//ajax통해서 서버에 이미지를 업로드
			//업로드된 이미지의 경로를 받아오는 역할
			//<form>태그와 동일한 효과를 발생시킬 수 있는 객체
			const form = new FormData();
			form.append("file",file);
			$.ajax({
				url : "/uploadImages.do",
				type : "post", // 무조건 post형식(파일업로드)
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					console.log(data);
									//ㄴjsp에서 넘겨준 데이터가 들어옴(파일경로)
					$(editor).summernote("insertImage",data);
					
				}
			});
			//processData : 전송하는 데이터를 문자열로 전송하게 기본값이 설정되어 있음
			//				-> 파일 전송을 위해 기본값 제거하는 작업
			//contentType : enctype="application/x-www-form-urlencoded;charset=UTF-8"
			//				-> 설정되어 있는 기본 enctype을 제거
			
		}
		
		$("#boardWriteBtn").on("click",function(){
			const boardTitle = $("[name=boardTitle]")
			const boardContent = $("#boardContent")
			const boardWriteForm =$("#boardWriteForm")
			if(boardTitle.val()==""){
				alert('제목을 입력해주세요');
				return false;
			}
			if(boardContent.val()==""){
				alert('내용을 입력해주세요');
				return false;
			}
			boardWriteForm.submit();
		
			});
		
			
	</script>


	
</body>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>