<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 상세</title>
    <link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Hahmlet:wght@300&display=swap" rel="stylesheet">
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<style>
.closeSpan:hover{
	cursor: pointer;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- page Content 시작-->
    <div class="page-content">
        <!-- sideBar-right 회원 목록 /  채팅하기 버튼 -->
        <div class="sidenav-right bg-white rounded p-sm-5 wow fadeIn">
	        <div>
	            <div class="side-box rounded mt-2">
	                <p class="fs-5 fw-bold text-primary mt-5">내 동호회</p>
	                <div class="side-info-box text-center">
	                    <div class="side-info-box text-center" id="myClubList">
							<!-- ajax로 가져오는 정보 -->
	                    </div>
	                </div>
	                <div class="pagination-my">
						<span class="material-symbols-outlined">chevron_left</span><span class="material-symbols-outlined">chevron_right</span>
					</div>
	            </div>
	            <div class="side-box rounded mt-5">
	                <p class="fs-5 fw-bold text-primary">${c.clubName } </p>
	                <div class="side-info-box text-center clubIntro" style="min-height: 190px;">
	                	<c:forEach items="${c.memberList }" var="cm">
	                		<c:if test="${cm.memberNo eq c.clubLeader }">
	                			<div class="memberNameBox"><span>${cm.nickName } </span><span> (${cm.memberId }) </span><span class="text-dark fw-bold">-동호회장</span></div>
	                		</c:if>
	                	</c:forEach>
	                	<c:forEach items="${c.memberList }" var="cm">
	                		<c:if test="${cm.memberNo ne c.clubLeader }">
	                			<div class="memberNameBox"> <span>${cm.nickName } </span><span> (${cm.memberId }) </span></div>
	                		</c:if>
	                	</c:forEach>
	                </div>
	                <div>
	                    <button class="btn btn-primary py-2 px-4 mt-2" onclick="openModal();">채팅방 참여</button>
	                </div>
	            </div>
            </div>
            <div></div>
        </div>

        <!-- sideBar-left 동호회 정보 목록 /  채팅하기 버튼 -->
        <div class="sidenav-left bg-light rounded p-sm-5 wow fadeIn">
            <div class="side-box rounded mt-5">
                <nav aria-label="breadcrumb animated slideInDown">
                    <ol class="breadcrumb justify-content-center mb-3">
                        <li class="breadcrumb-item"><a href="#">Club</a></li>
                        <li class="breadcrumb-item"><a href="/class-list.html">${c.clubCategory }</a></li>
                        <li class="breadcrumb-item active" aria-current="page">${c.clubName }</li>
                    </ol>
                </nav>
                <div class="club-title">
                    <div class="club-img-div">
                        <img src="/resources/upload/club/${c.clubMainImg }" class="club-img">
                    </div>
                </div>
                <p class="fs-5 fw-bold text-dark mt-2">${c.clubName }</p>
                <div class="side-info-box text-center">
                    <p class="clubIntro">${c.clubIntro } </p>
                </div>
                <div>
                	<c:choose>
                		<c:when test="${c.clubLeader eq sessionScope.m.memberNo }">
                			<button class="btn btn-primary py-2 px-4 mt-2" id="clubMgrBtn" onclick="clubMgrModal();">동호회 관리</button>
                		</c:when>
                		<c:otherwise>
                			<button class="btn btn-primary py-2 px-4 mt-2" onclick="quitClub(${c.clubNo}, ${sessionScope.m.memberNo });">동호회 탈퇴하기</button>
                		</c:otherwise>
                	</c:choose>
                </div>
            </div>
            <div></div>
        </div>

        <!-- 동호회 board -->
        <div class="center-div">
        
        	<!-- 클럽 공지사항 -->
        	<img alt="" src="/resources/img/은비.jpg" width="100%;">
        	<div class="container-xxl py-3 shadow bg-img mb-5">
                <div class="container class-container">
                    <div class="row pt-2">
                        <div class="wow fadeInUp" data-wow-delay="0.1s">
                        	<div id="noticeDiv">
                        		<div class="flex-space-between">
                        			<p class="fs-5 fw-bold text-primary">동호회 공지사항</p>
		                            <div class="text-right">
		                            <c:if test="${c.clubLeader eq sessionScope.m.memberNo }">
		                            	<a href="javascript:void(0);" style="margin-right: 14px;" onclick="updateNotice(this, ${c.clubNo });">수정</a>
										<a href="javascript:void(0);" style="display: none;" onclick="updateNoticeCancle(this, ${c.clubNo });">수정취소</a>
									</c:if>
		                            </div>
                        		</div>
	                            <pre style="font-family: sans-serif">${c.clubNotice }</pre>
	                            <textarea rows="5" cols="90" style="display: none;" name="clubNotice" class="noticeTextarea">${c.clubNotice }</textarea>
                        	</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- 글쓰기 버튼 구역 -->
            <div class="container-xxl py-3">
                <div class="container class-container">
                    <div class="row g-5 flex-space-between">
                        <div class="wow fadeInUp flex-space-between" data-wow-delay="0.1s">
                            <p class="fs-5 fw-bold text-primary">동호회 게시판</p>
                            <button class="btn btn-primary py-2 px-4" onclick="boardModal();">글쓰기</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 글쓰기 버튼 구역 End -->

            <!-- 회원 게시글 -->
            <c:choose>
            	<c:when test="${empty cbList }">
	           		<div class="container-xxl py-5" style="border: 1px solid #eee">
			        	<div class="container">
			        	<h3>게시글이 없습니다</h3>
			        	<p> 재미있는 게시글로 동호회 멤버들과 소통해 보세요 </p>
			        	<a onclick="boardModal();" class="btn btn-primary py-2 px-4">지금바로 작성하기</a>
			        	</div>
			        </div>
            	</c:when>
            	<c:when test="${not empty cbList }">
            		<c:forEach items="${cbList }" var="cb" varStatus="i">
					    <div class="container-xxl py-5 club-container">
			                <div class="container wow fadeInUp" data-wow-delay="0.05s">
			                    <div class="row align-items-end club-board-div">
			                        <div>
				                        <div class="flex-space-between" style="width: 90%;">
				                        	<div class="flex-space-between ml-10" style="width:27%;">
				                        		<div class="profile-box" style="background: #BDBDBD;">
															<c:if test="${empty cb.clubBoardContent }">
															<img class="profile" src="/resources/upload/member/기본이미지.jpg">
															</c:if>
															<c:if test="${not empty cb.clubBoardContent }">
															<img class="profile" src="/resources/upload/member/${cb.memberImg }">
														    </c:if>
												</div>
												<div class="mb-4">
													<p class="text-primary fs-5" style="margin-bottom: 0;">${cb.clubBoardWriter }</p>
													<pre>${cb.clubBoardDate }</pre>
												</div>
				                        	</div>
											<div>
											<c:if test="${sessionScope.m.memberNo eq cb.memberNo }">
												<a href="#Redirect" style="margin-right: 14px;" onclick="updateBoard(this); return false;">수정</a>
												<a href="javascript:void(0);" onclick="boardDelete(${c.clubNo },${cb.clubBoardNo});">삭제</a>
											</c:if>
											</div>
				                        </div>
				                        <div class="boardBox">
				                            <c:if test="${not empty cb.clubBoardFilepath }">
			                        		<div class="clubBoardTitle">
			                        			<div class="clubBoardImgBox text-center">
			                        				<img class="clubBoardImg" src="/resources/upload/club/${cb.clubBoardFilepath } ">
			                        			</div>
			                        		</div>
				                        	</c:if>
				                            <p class="mb-4 ml-20">${cb.clubBoardContent }</p>
			                            </div>
			                            <div style="display: none;" class="updateBox" class="mt-5">
				                        	<div class="updateInputBox">
												<input type="hidden" name="clubNo" class="updateClubNo" value="${c.clubNo }">
												<input type="hidden" name="clubNo" class="updateClubBoardNo" value="${cb.clubBoardNo }">
												<input type="hidden" name="status" value="stay" class="status"> <!--기존파일 지웠다 / 아니다 신호 -->
												<textarea name="clubBoardContent" class="updateContent">${cb.clubBoardContent }</textarea><br>
												<c:choose>
													<c:when test="${not empty cb.clubBoardFilepath }">
														<pre class="delFile">${cb.clubBoardFilepath }</pre><button class="delFile btn btn-secondary">삭제</button>
														<input type="file" name ="upfile" class="upfile" multiple style="display:none;" accept=".gif, .jpg, .png"><!--삭제하면 파일 선택 show-->
							                            <input type="hidden" name="oldFilepath" value="${cb.clubBoardFilepath }" class="oldFilepath">
													</c:when>
													<c:otherwise>
														<input type="file" name ="upfile" class="upfile" multiple accept=".gif, .jpg, .png">
													</c:otherwise>
												</c:choose>
											</div>
			                        	</div>
			                        </div>
			                    </div>
			                    <hr>
			                    
			                    <!-- 댓글달기 -->
			                    <div class="inputCommentBox">
			                    	<form action="/insertClubComment.do" method="post">
			                    		<input type="hidden" name="clubNo" value="${c.clubNo }">
			                    		<input type="hidden" name="clubComRef" value='0' >
			                    		<input type="hidden" name="clubBoardNo" value="${cb.clubBoardNo }">
			                    		<input type="hidden" name="clubComWriter" value="${sessionScope.m.memberNo }">
			                    		<textarea name="clubComContent" style="width:80%;" maxlength="205"></textarea>
			                    		<button class="btn btn-primary comment-btn" id="comment-btn">등록</button>
			                    	</form>
			                    </div>
			                    
			                    <!-- 댓글출력 -->
			                    <div class="commentBox">
			                    	<c:if test="${not empty cb.commentList }">
			                    	<c:forEach items="${cb.commentList }" var="cbc" > <!-- 댓글 출력 for문 -->
			                    		<c:if test="${cb.clubBoardNo eq cbc.clubBoardNo }"> <!-- 글번호와 댓글의 참조 글번호가 같으면  -->
			                    			<c:if test="${cbc.clubComRef eq 0 }">
			                    				<ul class="posting-comment">
													<li class="comment-profil-li">
														<div class="profile-box" style="background: #BDBDBD;">
															<c:if test="${empty cbc.memberImg }">
															<img class="profile" src="/resources/upload/member/기본이미지.jpg">
															</c:if>
															<c:if test="${not empty cbc.memberImg }">
															<img class="profile" src="/resources/upload/member/${cbc.memberImg }">
														    </c:if>
														</div>
													</li>
													<li class="comment-content-li">
														<p class="comment-info">
															<span class="text-primary">${cbc.nickName }</span>
															<span>${cbc.clubComDate }</span>
														</p>
														<p class="comment-content">${cbc.clubComContent }</p>
														<textarea name="clubComContent" rows="5" cols="95" style="display:none;" class="comment-textarea">${cbc.clubComContent }</textarea>
														<p class="comment-link">
															<c:if test="${cbc.clubComWriter eq sessionScope.m.memberNo}">
															<a href="javascript:void(0)" onclick="modifyComment(this, ${cbc.clubComNo }, ${cb.clubNo});">수정</a>
															<a href="javascript:void(0)" onclick="deleteComment(this, ${cbc.clubComNo }, ${cb.clubNo});">삭제</a>
															</c:if>
															<a href="javascript:void(0)" class="recShow">답글달기</a>
														</p>
													</li>
												</ul>
												<!-- 대댓글 달기 -->
												<div class="inputRecommentBox">
													<form action="/insertClubComment.do" method="post">
														<ul>
															<li class="arrow-box">
																<span class="material-symbols-outlined arrow-span" style="font-size: 35px;">subdirectory_arrow_right</span>
															</li>
															<li class="text-box">
																<input type="hidden" name="clubNo" value="${c.clubNo }">
									                    		<input type="hidden" name="clubComRef" value="${cbc.clubComNo }">
									                    		<input type="hidden" name="clubBoardNo"	 value="${cb.clubBoardNo }">
									                    		<input type="hidden" name="clubComWriter" value="${sessionScope.m.memberNo }">
									                    		<textarea name="clubComContent" class="comment-textarea" style="width: 100%;" maxlength="205"></textarea>
															</li>
															<li class="btn-box">
																<button class="btn btn-primary">등록</button>
															</li>
														</ul>
													</form>
												</div>
			                    			</c:if>
			                    			
			                    			
			                    		
			                    		
											<!-- 대댓글 출력 -->
											<c:forEach items="${cb.commentList }" var="cbrc" > <!-- 대댓글 출력 for문 -->
			                    				<c:if test="${cbc.clubComNo eq cbrc.clubComRef }"> <!-- 댓글번호와 대댓글의 참조 글번호가 같으면  -->
												<ul class="reply-comment reply">
													<li class="arrow-box">
														<span class="material-symbols-outlined arrow-span" style="font-size: 35px;">subdirectory_arrow_right</span>
													</li>
													<li class="comment-profil-li"> 
														<div class="profile-box" style="background: #BDBDBD;">
															<c:if test="${empty cbrc.memberImg }">
															<img class="profile" src="/resources/upload/member/기본이미지.jpg">
															</c:if>
															<c:if test="${not empty cbrc.memberImg }">
															<img class="profile" src="/resources/upload/member/${cbrc.memberImg }">
														    </c:if>
														</div>
													</li>
													<li class="comment-content-li">
														<p class="comment-info">
															<span class="text-primary">${cbrc.nickName }</span>
															<span>${cbrc.clubComDate }</span>
														</p>
														<p class="comment-content">${cbrc.clubComContent }</p>
														<textarea name="clubComContent" class="input-form" rows="5" cols="90" style="display:none;">${cbrc.clubComContent }</textarea>
														<c:if test="${cbrc.clubComWriter eq sessionScope.m.memberNo}">
														<p class="comment-link">
															<a href="javascript:void(0)" onclick="modifyComment(this, ${cbrc.clubComNo }, ${cb.clubNo});">수정</a> 
															<a href="javascript:void(0)" onclick="deleteComment(this, ${cbrc.clubComNo }, ${cb.clubNo});">삭제</a> 
														</p>
														</c:if>
													</li>
												</ul>
											</c:if>
			                    			</c:forEach> <!-- 대댓글 for문 -->

			                    		</c:if>
			                    	</c:forEach> <!-- 댓글 for문 -->
			                    	</c:if> <!-- 댓글이 null이 아니면 -->
			                    </div> <!-- 댓글 출력 End -->
			                </div>
			            </div>
				    </c:forEach><!-- 회원 게시글 End -->
            	</c:when>
            </c:choose>

        </div> <!-- 넓이제한 End -->
    </div><!--page-content End-->
<div class="modal-wrap">
    <div class="modal-chat bg-white">
    	<div class="closeBtnDiv"><span class="material-symbols-outlined fw-bold" onclick="closeModal();">close</span></div>
		<div id="member-box" class="bg-white mt-5 mb-5">
			<div class="mt-5"></div>
            <input type="hidden" value="${c.clubNo }" id="clubNo">
            <img src="/resources/MAINbtstr/img/로고2.png" onclick="initChat('${sessionScope.m.memberId}');">
            <p class="text-secondary mt-3">클릭하면 채팅방으로 이동합니다</p>
        </div>
		<div class="chatting">
			<div class="messageArea bg-white"></div>
			<div class="sendBox" id="sendBox">
				<div class="flex-space-between">
					<input type="text" class="form-control bg-light border-0" width="80%;" id="sendMsg">
					<button id="sendBtn" class="btn btn-outline-secondary" onclick="sendMsg();">전송</button>
				</div>
				<div class="flex-space-between" id="fileBox">
					<input type ="file" class="form-control border-0 text-secondary" name ="chatFile" id="chatFile" multiple="multiple">
					<button type="button" class="btn btn-outline-secondary" onclick="fileSend();" id="sendFileBtn">보내기</button>
				</div>
				<div id="fileMsgBox"></div>
			</div>
		</div>
    </div>
</div>
<div class="write-modal-wrap">
    <div class="modal-write">
        <div class="writeModalTop">
            <h1>글쓰기</h1>
            <div>작성자 : ${sessionScope.m.nickName }</div>
        </div>
        <div class="writeModalContent">
        <form action="/clubBoardWrite.do" method="post" enctype="multipart/form-data">
			<div class="writeModalInputBox">
				<input type="hidden" name="clubNo" value="${c.clubNo }">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<textarea name="clubBoardContent"></textarea><br>
				<input type="file" multiple name="files" accept=".gif, .jpg, .png"><br>
			</div>
			<div class="writeModalButtonBox">
				<button class="btn btn-primary py-2 px-4" type="submit">글쓰기</button><button type="button" class="btn btn-primary py-2 px-4" onclick="closeWriteModal();">닫기</button>
			</div>
		</form>
        </div>
    </div>
</div>

<div class="clubLeader-modal-wrap">
    <div class="clubLeader-modal bg-white">
    	<div style="text-align: right; width: 98%;" class="mt-2"><span class="material-symbols-outlined fw-bold closeSpan" onclick="leaderModalClose();">close</span></div>
        <div class="clubLeaderModalTop">
            <h3 class="text-secondary">동호회 관리</h3>
        </div>
        <div class="clubLeaderModalContent">
        <c:choose>
        	<c:when test="${fn:length(c.memberList) > 1 }">
        		<p>동호회장을 다른 동호회원에게 양도할 수 있습니다</p>
        		<form action="/changeClubLeader.do" method="post">
					<select name="clubLeader" id="leaderNo" class="bg-white border-0" style="padding: 0; padding-left: 30px; padding-right: 30px;" onchange="selectLeader();">
						<option value="">선택해주세요.</option>
						<c:forEach items="${c.memberList }" var="cml">
		               		<c:if test="${cml.memberNo ne sessionScope.m.memberNo }">
		               			<option value="${cml.memberNo }">${cml.nickName } (${cml.memberId })</option>
		               		</c:if>
		                </c:forEach>
					</select>
					<input type="hidden" name="clubNo" value="${c.clubNo }">
					<button class="btn btn-secondary" id="changeLeaderBtn">동호회 양도하기</button>
				</form>
        	</c:when>
        	<c:otherwise>
        		<p>동호회를 삭제하면 기록이 남지 않습니다</p>
        		<button onclick="deleteClub(${c.clubNo });" class="btn btn-secondary">동호회 없애기</button>
        	</c:otherwise>
        </c:choose>
        </div>
        <hr>
        <div class="align-center" style="width: 70%; margin: 0 auto;">
        <c:choose>
        	<c:when test="${fn:length(c.memberList) > 1 }">
        		<table class="table" style="margin-bottom: 0;">
		        	<tr>
		        		<th>선택</th>
		        		<th>닉네임</th>
		        		<th>아이디</th>
		        	</tr>
		        </table>
		        <div style="height: 240px;" class="clubIntro2">
		        <table class="table" style="margin-top: 0;">
					<c:forEach items="${c.memberList }" var="cm">
					<c:if test="${cm.memberNo ne sessionScope.m.memberNo }">
		            <tr>
		        		<td><input type="checkbox" name="blockMemberNo" value="${cm.memberNo }"></td>
		        		<td>${cm.nickName }</td>
		        		<td>${cm.memberId }</td>
		        	</tr>
		        	</c:if>
		            </c:forEach>
		        </table>
		        </div>
		        <div class="flex-space-between mt-4"><p style="margin: 0;">선택한 회원을 추방하시겠습니까?</p><button onclick="blockMember(${c.clubNo });" class="btn btn-secondary">회원 추방</button></div>
        	</c:when>
        	<c:otherwise>
        		<p class="fw-bold">관리할 회원이 없습니다</p>
        		<p>동호회 게시판에서 <br> 우리 동호회를 홍보할 수 있습니다</p>
        		<a href="/boardList.do?reqPage=1&boardType=P" class="btn btn-secondary">이동</a>
        	</c:otherwise>
        </c:choose>
	    </div>
    </div>
</div>

<div id="memberNo" style="display: none;">${sessionScope.m.memberNo }</div>

	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	<script>

	// side bar 스크롤
    function stopSide(){
        const position  = $(window).scrollTop();
        let windowHeight = window.innerHeight; // 스크린 창
        if(position > windowHeight){
            $(".sidenav-left").addClass("left-absolute");
            $(".sidenav-right").addClass("right-absolute");
        }else{
        	$(".sidenav-left").removeClass("left-absolute");
        	$(".sidenav-right").removeClass("right-absolute");
        }
    }
    $(window).on("scroll",function(){
        stopSide();
        // let fullHeight = document.body.scrollHeight-1000; //  margin 값은 포함 x, footer제외
    });
    $(function(){
    	stopSide();
    });

    // 글쓰기 버튼
    function boardModal() {
    	$(".write-modal-wrap").css("display", "flex");
	}
    function closeWriteModal() {
    	$(".write-modal-wrap").css("display", "none");
	}
    
    
    /* ----------동호회 관리---------- */
	// 리더의 모달
	function clubMgrModal() {
		$(".clubLeader-modal-wrap").css("display", "flex");
	}
	function leaderModalClose() {
		$(".clubLeader-modal-wrap").css("display", "none");
	}
	$("#changeLeaderBtn").on("click", function() {
		const leaderNo = $("#leaderNo").val();
		if(leaderNo==''){
			arlet("선택된 회원이 없습니다");
			$("#changeLeaderBtn").attr("type", "button");
		}
	})
	// 나는 바보다  select 값 가져오는 방법 (가져올 필요 없는데 가져옴)
	function selectLeader() {
		const leaderNo=$("#leaderNo option:selected").val();
	}
	function quitClub(clubNo, memberNo) {
		Swal.fire({
			title: "동호회 탈퇴",//제목
			text: "정말 탈퇴하시겠습니까?",
			imageUrl: "/resources/img/제목없음.png",
			showCancelButton: true,
			cancelButtonColor: '#525368',
			confirmButtonColor: '#348E38',
			cancelButtonText: '취소',
			confirmButtonText: '탈퇴하기'
		}).then((result) => {
			//result.value == true이니까 트루일때만 실행하는거
		  if (result.value) {
			  location.href="/quitClub.do?clubNo="+clubNo+"&memberNo="+memberNo;
		  }
		})//then끝
	}
	function boardDelete(clubNo, clubBoardNo){
		if(confirm("게시글을 삭제하시겠습니까?"+clubBoardNo)){
			location.href="/deleteClubBoard.do?clubNo="+clubNo+"&clubBoardNo="+clubBoardNo;
		}
	}
	// 클럽 삭제
	function deleteClub(clubNo) {
		if(confirm("정말삭제하시겟습니까?")){
			const memberNo = $("#memberNo").text();
			location.href = "/deleteClub.do?clubNo="+clubNo+"&clubLeader="+memberNo;
		}
	}
	// 클럽 회원 추방
	function blockMember(clubNo) {
		var memberNoArr = [];
		$("input[name=blockMemberNo]:checked").each(function(){
			memberNoArr.push($(this).val());
		});
		console.log(memberNoArr);
		let str;
		for(let i=0; i<memberNoArr.length; i++){
			if(i<1){
				str = "clubNo="+clubNo+"&memberNo"+"="+memberNoArr[i];
			}else{
				str += "&memberNo"+"="+memberNoArr[i];
			}
		}
		alert(str);
		location.href="/blockMember.do?"+str;
	}

	
	
	
	
	
	/* ----------동호회 공지사항 수정---------- */
	// 공지사항 수정 form
	function updateNotice(obj, clubNo) {
		$(obj).parent().parent().next().hide();
		$(obj).parent().parent().next().next().show();
		
		// 수정> 수정완료
		$(obj).text("수정완료");
		$(obj).attr("onclick", "updateNoticeComplete(this, "+clubNo+")");// 버튼 이름변경에 따른 함수 변경
		// 수정취소 보이기
		$(obj).next().show();
		$(obj).next().attr("onclick", "updateNoticeCancle(this, "+clubNo+")");// 버튼 이름변경에 따른 함수 변경
	}
	
	function updateNoticeComplete(obj, clubNo) {
		const form = $("<form>");
		form.attr("action", "/updateClubNotice.do");
		form.attr('method', 'post');
		const clubNoInput = $("<input type='text' name='clubNo'>");
		clubNoInput.val(clubNo);
		form.append(clubNoInput);
		
		const textarea = $(".noticeTextarea");
		const text = textarea.text();
		textarea.append(text);
		form.append(textarea);
		
		// body 태그에 생성한 폼 append
		$("body").append(form);

		// form 전송
		form.submit();
	}
	
	function updateNoticeCancle(obj, clubNo) {
		$(obj).parent().parent().next().show();
		$(obj).parent().parent().next().next().hide();
		
		// 수정완료> 수정
		$(obj).prev().text("수정");
		$(obj).prev().attr("onclick", "updateNotice(this, "+clubNo+")");
		// 수정취소 > 삭제
		$(obj).hide();
	}
	

	
	
	

	
	
	
	
	
	/* ----------채팅---------- */
	
    // 채팅모달
    function openModal() {
    	$("#member-box").show();
    	$(".modal-wrap").css("display", "flex");
	}
    function closeModal() {
    	endChat();
    	if(ws != null){
    		ws.close();
    	}
    	$(".chatting").hide();
    	$(".messageArea *").remove();
    	$(".modal-wrap").css("display", "none");
	}
    
	// 웹소켓 객체를 저장할 변수
	let ws;
	// 회원 아이디 저장용 변수
	let memberId;
	const clubNo = $("#clubNo").val();
	
	function initChat(param) {
		memberId = param;
		// 웹소켓 연결 시도
		ws = new WebSocket("ws://192.168.10.55/chat.do");
		// 웹소켓 연결 성공 시 실행할 함수 지정
		ws.onopen = startChat;
		// 서버에서 데이터 받으면 처리할 함수
		ws.onmessage = receiveMsg;
		// 웹소켓 연결이 종료되면 실행할 함수
		ws.onclose = endChat;
		$("#member-box").hide();
		$(".chatting").slideDown();
	}
	function startChat() {
		console.log("웹소켓 연결완료");
		const data = {type:"enter", msg:memberId, club:clubNo};
		ws.send(JSON.stringify(data));
		appendChat("<p>채팅방에 입장했습니다</p>");
	}
	function receiveMsg(param) {	// 매개변수 : 서버에서 보낸 데이터
		console.log(param);
		appendChat(param.data);
	}
	function endChat() {
		console.log("웹소켓 연결종료");
	}
	function getMember() {
		const data = {type:"member", msg:"onnbi", club:clubNo};
		ws.send(JSON.stringify(data));
		$("#member-box").text(msg);
	}
	function sendMsg() {
		const msg = $("#sendMsg").val();
		// val
		if(msg != ''){ // 전송 눌렀을 때 메시지 박스에 val이 ''이 아니면
			// 서버에 소켓으로 문자열을 전송
			const data = {type:"chat", msg:msg, club:clubNo};	// 받앗서 구분하기 위해 key값이 있는 JSON 객체 타입으로 전송
			ws.send(JSON.stringify(data));
			appendChat("<div class='chat right'>"+msg+"</div>");
			$("#sendMsg").val("");
		}
	}
	function fileSend() {
		const formData = new FormData();
		// 파일 input
		const fileInputVal = $("input[name='chatFile']");
		const files = fileInputVal[0].files;
		console.log(files);
		formData.append('chatFile', files[0]);
		if(files != null){ // 전송 눌렀을 때 인풋이 null이 아니면,
			$.ajax({
	 			url : "/UploadFile.do",
				type: "post",
				data: formData,
				contentType: false,
	            processData: false,
	            enctype	: 'multipart/form-data',
				success:function(path){
					const filepath = path; // filepath만 전송받음
					const data = {type:"file", msg:filepath, club:clubNo}; //type=file의 새로운 elseif문 작성
					ws.send(JSON.stringify(data));
					appendChat("<div class='chat right'><img width='150px' height='180px' src='/resources/upload/chat/"+filepath+"'></div>");
					$("input[name='chatFile']").val("");
					//const data = {type:"file", filepath, club:clubNo};	// 받앗서 구분하기 위해 key값이 있는 JSON 객체 타입으로 전송
					//ws.send(JSON.stringify(data));
				}
	 		})//ajax로 보내야 함 왜냐면 나한테도 띄우고 가야 하는데 filepath를 정하지 않으면 띄울 수 없기 때문
		}else{
			$("#fileMsgBox").text("선택된 파일이 없습니다");
		}
	}
	function appendChat(msg) {
		$(".messageArea").append(msg);
		$(".messageArea").scrollTop($(".messageArea")[0].scrollHeight);
	}
	function appendId(msg) {
		$("#member-box").append(msg);
	}
	$("#sendMsg").on("keyup", function(key) {
		if(key.keyCode==13){
			sendMsg();
		}
	})

	
	/* ----------게시판---------- */
	// 클럽 게시판 수정
	function updateBoard(obj) { // 수정 눌렀을 때 버튼 상태 : 수정완료 / 수정취소
		$(obj).parent().parent().next().hide();
		$(obj).parent().parent().next().next().show();
		$(obj).text("수정완료");
		$(obj).attr("onclick", "updateComplete(this)");
		$(obj).next().text("수정취소");
		$(obj).next().attr("onclick", "updateCancle(this)");
	}
	function updateComplete(obj) { // 수정완료 눌렀을 때 버튼 상태 : 모두 끝난 뒤, 수정 / 삭제
		const boardBox = $(obj).parent().parent().next();
		const updateBox = $(obj).parent().parent().next().next();
		const formData = new FormData();
		// 파일 input
		const upfileInput = updateBox.find(".upfile");
		const files = upfileInput[0].files;
		console.log(files);
		formData.append('upfile', files[0]);
		formData.append('clubNo', updateBox.find(".updateClubNo").val());
		formData.append('clubBoardContent', updateBox.find(".updateContent").val());
		formData.append('clubBoardNo', updateBox.find(".updateClubBoardNo").val());
		formData.append('oldFilepath', updateBox.find(".oldFilepath").val());
		formData.append('status', updateBox.find(".status").val());
		
		console.log(formData);

		$.ajax({
			url : "/updateClubBoard.do",
			data : formData,
			type : "post",
			contentType: false,
            processData: false,
			enctype : 'multipart/form-data',
			success : function(cb) {
				const boardBox = $(obj).parent().parent().next();
				if(cb.clubBoardFilepath != null){
					const img = $(obj).parent().parent().next().find('img');
					boardBox.html("<div class='clubBoardTitle'><div class='clubBoardImgBox'><img class='clubBoardImg' src='/resources/upload/club/"+cb.clubBoardFilepath+" '></div></div><p class='mb-4'>"+cb.clubBoardContent+"</p>");
				}else{
					boardBox.html("<p class='mb-4'>"+cb.clubBoardContent+"</p>");
				}	
				boardBox.show(); // boardBox보이기
				boardBox.next().hide(); // updateBox숨기기
				$(obj).text("수정");
				$(obj).attr("onclick", "updateBoard(this)");
				$(obj).next().text("삭제");
				$(obj).next().attr("onclick", "deleteBoard(this)");
			}
		})
	}
	function updateCancle(obj) { // 수정취소 눌렀을 때 : 수정 / 삭제
		$(obj).parent().parent().next().show();
		$(obj).parent().parent().next().next().hide();
		$(obj).text("삭제");
		$(obj).attr("onclick", "deleteBoard(this)");
		$(obj).prev().text("수정");
		$(obj).prev().attr("onclick", "updateBoard(this)");
	}
	//첨부파일 
 	$("button.delFile").on("click",function(){
 		$(".delFile").hide();
 		$(this).next().show();
 		$("[name=status]").val("delete"); <%--status의 값이 delete로 넘어감--%>
 	});
	
	
	
 	/* ----------게시판 댓글---------- */
	$(".recShow").on("click", function(){
		// 몇번째 recShow인지
		const idx = $(".recShow").index(this);
		if($(this).text()=="답글달기"){
			$(this).text("취소");
		}else{
			$(this).text("답글달기");
		}
		$(".inputRecommentBox").eq(idx).toggle();
		$(".inputRecommentBox").eq(idx).find("textarea").focus();
	})
	
	
	function modifyComment(obj, cbcNo, clubNo){
		$(obj).parent().prev().show(); //textarea 화면에show
		$(obj).parent().prev().prev().hide();//
		
		// 수정> 수정완료
		$(obj).text("수정완료");
		$(obj).attr("onclick", "modifyComplete(this,"+cbcNo+","+clubNo+")");// 버튼 이름변경에 따른 함수 변경
		// 삭제> 수정취소
		$(obj).next().text("수정취소");
		$(obj).next().attr("onclick", "modifyCancle(this,"+cbcNo+","+clubNo+")");// 버튼 이름변경에 따른 함수 변경
		// 답글달기버튼 - 숨김
		$(obj).next().next().hide();
		$(obj).next()
	}
	
	function modifyCancle(obj, cbcNo, clubNo){
		$(obj).parent().prev().hide();
		$(obj).parent().prev().prev().show();
		// 수정완료> 수정
		$(obj).prev().text("수정");
		$(obj).prev().attr("onclick", "modifyComment(this,"+cbcNo+","+clubNo+")");
		
		// 수정취소 > 삭제
		$(obj).text("삭제");
		$(obj).attr("onclick", "deleteComment(this,"+cbcNo+","+clubNo+")");
		
		// 답글 달기 보여줌
		$(obj).next().show();
	}
	function modifyComplete(obj, cbcNo, clubNo){
		// form 태그를 생성하여 보내는 방식
		// 숨겨놨다가 보내도 상관없음
		// 자바 스크립트에서 a태그로 보내는 것도 가능
		
		const form = $("<form>");
		form.attr("action", "/updateClubComment.do");
		form.attr('method', 'post');
		
		const clubComNoInput = $("<input type='text' name='clubComNo'>");
		clubComNoInput.val(cbcNo);		// input의 값으로 매개변수로 받은 번호 
		form.append(clubComNoInput);	// 인풋 태그 form태그에 append
		
		const clubNoInput = $("<input type='text' name='clubNo'>");
		clubNoInput.val(clubNo);
		form.append(clubNoInput);
		
		const textarea = $(obj).parent().prev();
		const text = textarea.text();
		textarea.append(text);
		form.append(textarea);
		
		// body 태그에 생성한 폼 append
		$("body").append(form);
		
		// form 전송
		form.submit();
	}
	// 클럽 댓글 삭제
	function deleteComment(obj, cbcNo, clubNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			console.log(clubNo);
			location.href = "/deleteComment.do?clubComNo="+cbcNo+"&clubNo="+clubNo;
		}
	}
	
	
	
	
	
	
    
    $(document).ready(function () {
    	initMyClubList(startIndex);
    });
    
    let startIndex=1;
	const searchStep = 3;
    function initMyClubList(startIndex) { // total 구하는 ajax
    	if(startIndex == 1){
    		$(".pagination-my span:first-child").css("visibility", "hidden");
    	}
   	 	//dataPerPage 선택값 가져오기
   	 	console.log(startIndex);
   	 	$("#myClubList div").remove();
	    $.ajax({ // ajax로 데이터 가져오기
	    	method: "post",
	    	url: "/getMyClubListTotal.do",
	    	data: { memberNo : $("#memberNo").text() },
	    	success: function (list) {
	    		console.log(list.length);
				paging(list.length, startIndex); //페이징 표시
	    	} // success End
    	});
	}

    function paging(totalList, startIndex) {
    	let endIndex = startIndex+searchStep-1;
    	var num = totalList/searchStep;
		var totalPage = Math.ceil(num); // 총 페이지 수
    	
   	 	//dataPerPage 선택값 가져오기
   	 	$("#myClubList div").remove();
	    $.ajax({
	    	method: "post",
	    	url: "/getMyClubList.do",
	    	data: { memberNo : $("#memberNo").text(),
	    			startIndex : startIndex,
	    			endIndex : endIndex
	    	},
	    	success: function (list) {
	    		for (let i=0; i<list.length; i++) {
					const div = $("<div>");
					div.append("<span onclick='locationClub("+list[i].clubNo+");'>"+list[i].clubName+"</span>");
					$("#myClubList").append(div);
				}
	    		
	    		if(endIndex >= totalList){ //4-7을 구해올 건데, 7 > 총 구해온 list수보다 크면
	    			$(".pagination-my span:last-child").css("visibility", "hidden");
	    		}

	    	} // success End
    	});
	}
    
    $(".pagination-my span:last-child").on("click", function() {
    	$(".pagination-my span:first-child").css("visibility", "visible");
    	startIndex=startIndex+searchStep;
    	initMyClubList(startIndex);
	})
    $(".pagination-my span:first-child").on("click", function() {
    	$(".pagination-my span:last-child").css("visibility", "visible");
    	startIndex=startIndex-searchStep;
    	initMyClubList(startIndex);
	})
    
	function locationClub(clubNo) {
		Swal.fire({
			text: '선택한 동호회로 이동합니다',
			imageUrl: "/resources/img/제목없음.png",
			showCancelButton: true,
			cancelButtonColor: '#525368',
			confirmButtonColor: '#348E38',
			cancelButtonText: '닫기',
			confirmButtonText: '이동'
		}).then((result) => {
			//result.value == true이니까 트루일때만 실행하는거
		  if (result.value) {
			  location.href = "/clubDetail.do?clubNo="+clubNo;
		  }
		})//then끝
	}
	</script>
</body>
</html>