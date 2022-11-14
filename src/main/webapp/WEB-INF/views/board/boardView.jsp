<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<style>
	.inputCommentBox{
		color : blue;
	}
	.commentView{
		color : blue;
	}
	.inputRecommentBox{
		display:none;
		color : red;
	}
	.reCommentView{
		color : red;
	}
</style>

</head>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid page-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">커뮤니티</h1>
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-0">
                    	<c:if test="${b.boardType eq 'F' or b.boardType eq 'I' or b.boardType eq 'P'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">게시판</li>
                        </c:if>
                        <c:if test="${b.boardType eq 'N' or b.boardType eq 'Q' or b.boardType eq 'A'}">
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></li>
	                        <li class="breadcrumb-item"><a href="boardList.do?reqPage=1&boardType=A">FAQ</a></li>
	                        <li class="breadcrumb-item active" aria-current="page">강사모집</li>
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
                <p class="fs-5 fw-bold text-primary">새로운 나를 발견하는 재미</p>
                <c:if test="${b.boardType eq 'F'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=F">자유게시판</a></h1>
                </c:if>
                <c:if test="${b.boardType eq 'I'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=I">정보게시판</a></h1>
                </c:if>
                <c:if test="${b.boardType eq 'P'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=P">동호회모집</a></h1>
                </c:if>
                <c:if test="${b.boardType eq 'N'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=N">공지사항</a></h1>
                </c:if>
                <c:if test="${b.boardType eq 'Q'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=Q">Q&A</a></h1>
                </c:if>
                <c:if test="${b.boardType eq 'A'}">
                	<h1 class="display-5 mb-5"><a href="boardList.do?reqPage=1&boardType=A">FAQ</a></h1>
                </c:if>
            </div>
            
            <div class="row wow fadeInUp" data-wow-delay="0.3s">
                <div class="col-12 text-center">
                    <ul class="list-inline rounded mb-5" id="portfolio-flters">
                        <c:forEach items="${list}" var="cateList">
                        	<li class="mx-2 ${cateList.boardCategory }" data-filter="*"><a href="/classList.do?classCategory=${cateList.boardCategory}&reqPage=1">${cateList.boardCategory }</a></li>
                        </c:forEach>   
                    </ul>
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
        </div>
	<table border="1">
		<tr>
			<th>글번호</th>
			<td>${b.boardNo }</td>
		</tr>
		<tr>
			<th>카테고리</th>
			
					<!-- 자유게시판 -->
			<c:if test ="${b.boardCategory eq 'info'}">
				<td>정보</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'etc'}">
				<td>기타</td>
			</c:if>
			<!-- 공지사항 -->
			<c:if test ="${b.boardCategory eq 'notice'}">
				<td>공지사항</td>
			</c:if>
			<!-- 동호회모집 -->
			<c:if test ="${b.boardCategory eq 'invite'}">
				<td>모집중</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'end'}">
				<td>모집완료</td>
			</c:if>
			<!-- 정보게시판 -->
			<c:if test ="${b.boardCategory eq 'campaign'}">
				<td>캠페인</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'fair'}">
				<td>박람회</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'tour'}">
				<td>여행</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'ectI'}">
				<td>기타</td>
			</c:if>
			<!-- QNA -->
			<c:if test ="${b.boardCategory eq 'class'}">
				<td>클래스</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'club'}">
				<td>동호회</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'activity'}">
				<td>액티비티</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'product'}">
				<td>상품</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'pay'}">
				<td>결제</td>
			</c:if>
			<c:if test ="${b.boardCategory eq 'delivery'}">
				<td>배송</td>
			</c:if>
		</tr>
		
		<tr>
			<th>닉네임</th>
			<td>${b.nickName }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${b.boardDate }</td>
		</tr>
			
			<tr>
				<th>제목</th>
				<td colspan="3">${b.boardTitle }</td>
			</tr>
			<tr>
				<th>보드타입</th>
				<td colspan="3">${b.boardType }</td>
			</tr>
		<tr>
			<th>첨부파일</th>
			<td colspan="3">
			<c:forEach items="${b.fileList }" var="bf">
				<p>
				<a href="/boardFileDown.do?fileNo=${bf.fileNo }">${bf.filename }</a>
				</p>
			</c:forEach>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="6">
				<div>${b.boardContent }</div>
			</td>
		</tr>
		<c:if test="${not empty sessionScope.m  && b.nickName eq sessionScope.m.nickName }">
			<tr class="tr-1">
				<th colspan="6">
					<button><a class="btn bc44" href="/boardUpdateFrm.do?boardNo=${b.boardNo}&boardType=${b.boardType}">수정</a></button>
					<button><a class="btn bc44" id="delBtn" href="/boardDelete.do?boardNo=${b.boardNo}&boardType=${b.boardType}">삭제</a></button>
					<!--<button class="btn bc44" onclick="boardDelete(${b.boardNo},${b.boardType});">삭제</button> -->
				</th>
			</tr>
			</c:if>
	</table>
	<c:if test="${b.boardType ne 'Q' and b.boardType ne 'N'}">
		<%--댓글작성 form--%>
		<c:if test="${not empty sessionScope.m }">
		<div class="inputCommentBox">
			<form action="/insertComment.do" method="post">
				<ul>
					<li>
						<span>댓글general</span>
					</li>
					<li>
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
						<input type="hidden" name="boardRef" value="${b.boardNo}">
													<!-- ㄴ몇 번 글의 댓글인지 -->
						<input type="hidden" name="boardCommRef" value="0">
							<!-- ㄴ어떤 댓글의 대댓글인지 -->	<!-- ㄴ댓글,대댓글 구분 (0번 시퀀스는 쓰지 않으므로 0번은 대댓글이 아닌 일반댓글)-->
														<!-- 참조하는 대댓글이 없음 -->
						<textarea name="boardCommContent"></textarea>
					</li>
					<li class="commentWriteBtn1">
						<button type="submit" name="commentWriteBtn1" class="commentWriteBtn1">등록</button>
					</li>
				</ul>
			</form>
		</div>
		</c:if>
		
		<%--댓글 출력 --%>
		<%--forEach(1): 댓글반복문 시작(댓글 출력, 대댓글 출력, 대댓글 작성폼   --%>
		<div class="commentBox">
		
		 <c:forEach items="${commentList }" var="bc">
		 	<ul class="commentView">
		 		<li>
						<span>댓글</span>
				</li>
				<li>
					<p>
						<span>${bc.nickName }</span>
						<span>${bc.boardCommDate }</span>
					</p>
					<p>${bc.boardCommContent }</p>
					<textarea name="boardCommContent" style="display:none;">${bc.boardCommContent}</textarea>
					<%--ㄴ 수정용 textarea 숨겨두고 수정하게되면 javaScript레벨에서 form태그 만들어서 전송 --%>
					<p>
						<c:if test="${not empty sessionScope.m }">
							<c:if test="${sessionScope.m.nickName eq bc.nickName }">
								<a href="javaScript:void(0)" onclick="modifyComment(this,${bc.boardCommNo},${b.boardNo})">수정</a>
								<a href="javaScript:void(0)" onclick="deleteComment(this,${bc.boardCommNo},${b.boardNo})">삭제</a>
							</c:if>
						
						
						<a href="javaScript:void(0)" class="reCommentShow">답글달기</a>
									<%-- href는 효과만 / a태그 기본이벤트 제거 --%>
									<%--대댓글 작성 폼을 (댓글 나타내기창에) 숨겨두고 답글달기 누르면 나타나게 만든다 --%>
						</c:if>
					</p>
				</li>
		 	</ul>
		 		
		 		<%--대댓글 출력 반복문 --%>
		 		<c:forEach items="${reCommentList }" var="bcc">
		 			<c:if test="${bcc.boardCommRef eq bc.boardCommNo }">
		 				<ul class="reCommentView">
		 					<li>
		 						<span>대댓글</span>
		 					</li>
		 					<li>
								<p>
									<span>${bcc.nickName }</span>
									<span>${bcc.boardCommDate }</span>
								</p>
								<p>${bcc.boardCommContent }</p>
								<textarea name="boardCommContent" style="display:none;">${bcc.boardCommContent}</textarea>
								<%--ㄴ 수정용 textarea 숨겨두고 수정하게되면 javaScript레벨에서 form태그 만들어서 전송 --%>
								<p>
									<c:if test="${not empty sessionScope.m }">
										<c:if test="${sessionScope.m.nickName eq bcc.nickName }">
											<a href="javaScript:void(0)" onclick="modifyComment(this,${bcc.boardCommNo},${b.boardNo})">수정</a>
											<a href="javaScript:void(0)" onclick="deleteComment(this,${bcc.boardCommNo},${b.boardNo})">삭제</a>
										</c:if>
									</c:if>
									
								</p>
							</li>
		 				</ul>
		 			</c:if><%--해당댓글의 대댓글인지 체크 --%>
		 		</c:forEach><%--대댓글 출력 반복문 --%>
		 		
		 		<%--대댓글 작성 폼
		 		을 (댓글 나타내기창에) 숨겨두고 답글달기 누르면 나타나게 만든다 --%>
		 		
		 		<c:if test="${not empty sessionScope.m }">
				<div class="inputRecommentBox">
					<form action="/insertComment.do" method="post">
						<ul>
							<li>
								<span>대댓글</span>
							</li>
							<li>
								<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
								<input type="hidden" name="boardRef" value="${b.boardNo}">
															<!-- ㄴ몇 번 글의 댓글인지 -->
								<input type="hidden" name="boardCommRef" value="${bc.boardCommNo }">
									<!-- ㄴ어떤 댓글의 대댓글인지 -->					<%--ㄴ해당 댓글 번호 --%>
								<textarea name="boardCommContent"></textarea>
							</li>
							<li>
								<button type="submit" name="commentWriteBtn2">등록</button>
							</li>
						</ul>
					</form>
				</div>
				</c:if>
		 
		 </c:forEach><%--forEach(1): 댓글반복문 끝 --%>
		</div><%--commentBox끝--%>
	</c:if><!-- boardType Q or N이 아닌경우 -->
	
	<c:if test="${b.boardType eq 'Q' or b.boardType eq 'N' }">
		<%--댓글작성 form--%>
		<c:if test="${not empty sessionScope.m }">
			<c:if test="${sessionScope.m.memberGrade eq 3}">
		<div class="inputCommentBox">
			<form action="/insertComment.do" method="post">
				<ul>
					<li>
						<span>댓글QQQ</span>
					</li>
					<li>
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}">
						<input type="hidden" name="boardRef" value="${b.boardNo}">
													<!-- ㄴ몇 번 글의 댓글인지 -->
						<input type="hidden" name="boardCommRef" value="0">
							<!-- ㄴ어떤 댓글의 대댓글인지 -->	<!-- ㄴ댓글,대댓글 구분 (0번 시퀀스는 쓰지 않으므로 0번은 대댓글이 아닌 일반댓글)-->
														<!-- 참조하는 대댓글이 없음 -->
						<textarea name="boardCommContent"></textarea>
					</li>
					<li>
						<button type="submit" name="commentWriteBtn1">등록</button>
					</li>
				</ul>
			</form>
		</div>
			</c:if>
		</c:if>
		
		<%--댓글 출력 --%>
		<%--forEach(1): 댓글반복문 시작(댓글 출력, 대댓글 출력, 대댓글 작성폼   --%>
		<div class="commentBox">
		
		
		 <c:forEach items="${commentList }" var="bc">
		 	<ul class="commentView">
		 		<li>
						<span>댓글</span>
				</li>
				<li>
					<p>
						<span>${bc.nickName }</span>
						<span>${bc.boardCommDate }</span>
					</p>
					<p>${bc.boardCommContent }</p>
					<textarea name="boardCommContent" style="display:none;">${bc.boardCommContent}</textarea>
					<%--ㄴ 수정용 textarea 숨겨두고 수정하게되면 javaScript레벨에서 form태그 만들어서 전송 --%>
					<p>
						<c:if test="${not empty sessionScope.m }">
							<c:if test="${sessionScope.m.nickName eq bc.nickName }">
								<a href="javaScript:void(0)" onclick="modifyComment(this,${bc.boardCommNo},${b.boardNo})">수정</a>
								<a href="javaScript:void(0)" onclick="deleteComment(this,${bc.boardCommNo},${b.boardNo})">삭제</a>
							</c:if>
						</c:if>
					</p>
				</li>
		 	</ul>
		 </c:forEach>
	</c:if>
		<script>
		
			//답글달기를 누르면 답글달기 - > 취소 / 취소 -> 답글달기
			$(".reCommentShow").on("click",function(){
				//클릭한 답글달기가 몇 번째 댓글 것인지 구함 (이벤트를 발생시킨것이 몇 번째 인덱스인지)
				const idx = $(".reCommentShow").index(this);
				if($(this).text() == "답글달기"){
					//답글달기를 누르면 답글달기  -> 취소로 변경
					$(this).text("취소");
				}else{
					$(this).text("답글달기");
				}
				
				//숨겨진 대댓글 폼을 나타나게 해준다 (대댓글 박스중 idx번쨰를 toggle)
				$(".inputRecommentBox").eq(idx).toggle();
				$(".inputRecommentBox").eq(idx).find("textarea").focus();
			});
			
//			수정		 삭제		 답글달기
			//-> <수정하기>	수정완료  수정취소   답글달기 x
			//-> <수정취소>	수정		삭제		답글달기 O
			
			//modifyComment 선언적함수 (수정하기)
			function modifyComment(obj,boardCommNo,boardNo){
								   //ㄴ해당하는객체(this)
				console.log(obj,boardCommNo,boardNo);
				$(obj).parent().prev().show(); // 수정용 textarea 화면에 보여줌
				$(obj).parent().prev().prev().hide();//내용을 보여주던 p태그 숨김
				//수정 - > 수정완료
				$(obj).text("수정완료");
				//-> 함수 바꿔줌(수정 - > 수정완료)
				$(obj).attr("onclick","modifyComplete(this,"+boardCommNo+","+boardNo+")");
				
				//삭제->수정취소
				$(obj).next().text("수정취소");
				//-> 함수 바꿔줌 (삭제 -> 수정취소)
				$(obj).next().attr("onclick","modifyCancel(this,"+boardCommNo+","+boardNo+")");
				
				//답글달기버튼 숨김 
				$(obj).next().next().hide();
			}
			
			//				수정		 삭제		 답글달기
			//-> <수정하기>	수정완료  수정취소   답글달기 x
			//-> <수정취소>	수정		삭제		답글달기 O
			
			//수정취소
			function modifyCancel(obj,boardCommNo,boardNo){
				
				//수정취소는 삭제 버튼이 바뀐 것. 삭제 버튼 기준으로 만들어주기
				$(obj).parent().prev().hide(); // textarea 숨김
				$(obj).parent().prev().prev().show(); // 기존댓글 보여줌
				
				//수정완료 - > 수정
				$(obj).prev().text("수정");
				//함수교체 (수정완료 -> 수정)
				$(obj).prev().attr("onclick","modifyComment(this,"+boardCommNo+","+boardNo+")");
				
				//수정취소 - > 삭제
				$(obj).text("삭제");
				//함수 바꿔줌 (수정취소 -> 삭제)
				$(obj).attr("onclick","deleteComment(this,"+boardCommNo+","+boardNo+")");
				
				//답글달기버튼 보여줌
				$(obj).next().show();
			}
			
			//수정완료시 동작하는 함수
			function modifyComplete(obj,boardCommNo,boardNo){
				
				//form 태그를 생성해서 전송(다른방법] form을 숨겨서 보내기(위의 대댓글 작성 폼처럼?) / a태그로 보내기)
				//1.form 태그 생성
				const form = $("<form action='/boardCommentUpdate.do' method='post'></form>");
				
				//2.input태그 생성(bcNo)
				const bcInput = $("<input type='text' name='boardCommNo'>");
				//ncNo 값 세팅 : input태그안에 value="${boardCommNo}"로 세팅 ??
				bcInput.val(boardCommNo);
				//ncInput을 form 태그에 추가
				form.append(bcInput);
				
				//3.input 태그 생성(boardNo)
				const boardInput=$("<input type='text' name='boardNo'>")
				boardInput.val(boardNo);
				form.append(boardInput);
				
				//4.textarea
				const boardCommContent = $(obj).parent().prev();
				form.append(boardCommContent);
				
				//body 태그에 생성한 form태그를 추가
				$("body").append(form);
				//form 태그 전송
				form.submit();
			}
			
			//게시글 삭제
			function boardDelete(boardNo,boardType){
				if(confirm("글을 삭제하시겠습니까?")){
					location.href="/boardDelete.do?boardNo="+boardNo+"&boardType="+boardType;	
				}
			}
			$("#delBtn").on("click",function(){
				confirm("글을 삭제하시겠습니까?")
				
			});c
			//comment 삭제
			function deleteComment(obj,boardCommNo,boardNo){
			//obj는 사실 필요없는 매개변수(형식 맞춰주기 위해서 기입)
			if(confirm("댓글을 삭제하시겠습니까?")) {
				location.href="/deleteBoardComment.do?boardCommNo="+boardCommNo+"&boardNo="+boardNo;
			}
		}
		
			</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>























