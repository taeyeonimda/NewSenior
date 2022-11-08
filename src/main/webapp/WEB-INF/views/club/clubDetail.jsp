<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동호회 상세</title>
    <link href="/resources/css/club/club-detail.css" rel="stylesheet">
    <!-- 구글 아이콘 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <!-- page Content 시작-->
    <div class="page-content">
        <!-- sideBar-right 회원 목록 /  채팅하기 버튼 -->
        <div class="sidenav-right bg-white rounded p-sm-5 wow fadeIn">
            <div class="side-box rounded mt-2">
                <p class="fs-5 fw-bold text-primary mt-5">내 동호회</p>
                <div class="side-info-box text-center">
                    <div class="side-info-box text-center">
                        <div><span>동아리이름</span><span>(이동)</span></div>
                        <div><span>동아리이름</span><span>(이동)</span></div>
                        <div><span>동아리이름</span><span>(이동)</span></div>
                    </div>
                </div>
                <div>
                    <div class="btn-group mt-2" role="group" aria-label="Basic outlined example">
                        <button type="button" class="btn btn-outline-primary">Left</button>
                        <button type="button" class="btn btn-outline-primary"> </button>
                        <button type="button" class="btn btn-outline-primary">Right</button>
                    </div>
                </div>
            </div>
            <div class="side-box rounded mt-5">
                <p class="fs-5 fw-bold text-primary">${c.clubName } </p>
                <div class="side-info-box text-center">
                	<c:forEach items="${c.memberList }" var="cm">
                		<div><span>${cm.nickName }</span><span>(${cm.memberId })</span></div>
                	</c:forEach>
                </div>
                <div>
                    <button class="btn btn-primary py-2 px-4 mt-2" onclick="openModal();">채팅방 참여</button>
                </div>
            </div>
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
                <p class="fs-5 fw-bold text-primary mt-2">${c.clubName }</p>
                <div class="side-info-box text-center">
                    <p>${c.clubIntro } </p>
                </div>
                <div>
                    <button class="btn btn-primary py-2 px-4 mt-2" >동호회 탈퇴하기</button>
                </div>
            </div>
        </div>

        <!-- 동호회 board -->
        <div class="center-div">
            <!-- 글쓰기 버튼 구역 -->
            <div class="container-xxl py-5">
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
			                        <div class="ml-20">
				                        <div class="flex-space-between" style="width: 90%;">
				                        	<div class="profile-box" style="background: #BDBDBD;">
												<img class="profile" src="/resources/upload/club/person_1.jpg">
												<p class="text-primary">${cb.clubBoardWriter }</p>
											</div>
											<div>
											<c:if test="${sessionScope.m.memberNo eq cb.clubBoardWriter }">
												<a href="#" style="margin-right: 14px;">수정</a>
												<a href="#" onclick="deleteBoard(${cb.clubBoardNo})">삭제</a>
											</c:if>
											</div>
				                        </div>
			                            <p class="mb-4">${cb.clubBoardDate }</p>
			                            <c:if test="${not empty cb.clubBoardFilepath }">
			                        		<div class="clubBoardTitle">
			                        			<div class="clubBoardImgBox">
			                        				<img class="clubBoardImg" src="/resources/upload/club/${cb.clubBoardFilepath } ">
			                        			</div>
			                        		</div>
			                        	</c:if>
			                            <p class="mb-4">${cb.clubBoardContent }</p>
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
														    <img class="profile" src="/resources/upload/club/person_1.jpg">
														</div>
													</li>
													<li class="comment-content-li">
														<p class="comment-info">
															<span class="text-primary">${cbc.clubComWriter }</span>
															<span>${cbc.clubComDate }</span>
														</p>
														<p class="comment-content">${cbc.clubComContent }</p>
														<textarea name="ncContent" class="input-form" style="min-height:50px; display:none;" class="comment-textarea">ncContent</textarea>
														<p class="comment-link">
															<c:if test="${cbc.clubComWriter eq sessionScope.m.memberNo}">
															<a href="javascript:void(0)" onclick="modifyComment(this, ${cbc.clubComNo }, ${cb.clubNo});">수정</a>
															<a href="javascript:void(0)" onclick="deleteComment(this, ${cbc.clubComNo }, ${cb.clubNo});">삭제</a>
															</c:if>
															<a href="javascript:void(0)" class="recShow">답글달기</a>
														</p>
													</li>
												</ul>
			                    			</c:if>
			                    			
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
								                    		<input type="hidden" name="clubBoardNo" value="${cb.clubBoardNo }">
								                    		<input type="hidden" name="clubComWriter" value="${sessionScope.m.memberNo }">
								                    		<textarea name="clubComContent" class="comment-textarea" style="width: 100%;" maxlength="205"></textarea>
														</li>
														<li class="btn-box">
															<button class="btn btn-primary">등록</button>
														</li>
													</ul>
												</form>
											</div>
			                    		
			                    		
											<!-- 대댓글 출력 -->
											<c:forEach items="${cb.commentList }" var="cbrc" > <!-- 대댓글 출력 for문 -->
			                    				<c:if test="${cbc.clubComNo eq cbrc.clubComRef }"> <!-- 댓글번호와 대댓글의 참조 글번호가 같으면  -->
												<ul class="reply-comment reply">
													<li class="arrow-box">
														<span class="material-symbols-outlined arrow-span" style="font-size: 35px;">subdirectory_arrow_right</span>
													</li>
													<li class="comment-profil-li"> 
														<div class="profile-box" style="background: #BDBDBD;">
															<img class="profile" src="/resources/upload/club/person_1.jpg">
														</div>
													</li>
													<li class="comment-content-li">
														<p class="comment-info">
															<span class="text-primary">${cbrc.clubComWriter }</span>
															<span>${cbrc.clubComDate }</span>
														</p>
														<p class="comment-content">${cbrc.clubComContent }</p>
														<textarea name="ncContent" class="input-form" style="min-height:50px; display:none;">ncContent</textarea>
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

        </div> <!-- 넓이제한-->
    </div><!--page-content End-->
<div class="modal-wrap">
    <div class="modal-chat bg-secondary">
    	<button onclick="closeModal();">X</button>
		<div id="member-box" class="bg-secondary mt-5 mb-5">
			<div class="mt-5"></div>
            <input type="hidden" value="${c.clubNo }" id="clubNo">
            <img src="/resources/MAINbtstr/img/로고4.png" onclick="initChat('${sessionScope.m.memberId}');">
            <p class="text-light mt-3">클릭하면 채팅방으로 이동합니다</p>
        </div>
		<div class="chatting">
			<div class="messageArea bg-secondary"></div>
			<div class="sendBox">
				<input type="text" id="sendMsg">
				<button id="sendBtn" class="btn btn-outline-light" onclick="sendMsg();">전송</button>
				<input type ="file" class="input-form text-light" name ="chatFile" id="chatFile" multiple="multiple">
				<button type="button" class="btn btn-outline-light" onclick="fileSend();" id="sendFileBtn">보내기</button>
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
				<input type="file" multiple name="files"><br>
			</div>
			<div class="writeModalButtonBox">
				<button class="btn btn-primary py-2 px-4" type="submit">글쓰기</button><button type="button" class="btn btn-primary py-2 px-4" onclick="closeWriteModal();">닫기</button>
			</div>
		</form>
        </div>
    </div>
</div>


	<%@include file="/WEB-INF/views/common/footer.jsp" %>
    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
	<script>
	
	function boardDelete(boardNo){
		if(confirm("공지사항을 삭제하시겠습니까?")){
			location.href="/deleteClubBoard.do?clubBoardNo="+noticeNo;
		}
	}
	
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
		
		const form = $("<form action='updateClubComment.do' method='post'></form>");
		const clubComNoInput = $("<input type='text' name='clubComNo'>");
		clubComNoInput.val(cbcNo);		// input의 값으로 매개변수로 받은 번호 
		form.append(clubComNoInput);	// 인풋 태그 form태그에 append
		
		const clubNoInput = $("<input type='text' name='clubNo'>");
		clubNoInput.val(clubNo);
		form.append(clubNoInput);
		
		//4. textarea
		const ncContent = $(obj).parent().prev();
		form.append(ncContent);
		
		// body 태그에 생성한 폼 append
		$("body").append(form);
		
		// form 전송
		form.submit();
	}
	
	function deleteComment(obj, cbcNo, clubNo){
		if(confirm("댓글을 삭제하시겠습니까?")){
			console.log(clubNo);
			location.href = "/deleteComment.do?clubComNo="+cbcNo+"&clubNo="+clubNo;
		}
	}
	
	
	// side bar 스크롤
    function stopSide(){
        const position  = $(window).scrollTop();
        console.log("p:"+position);
        let windowHeight = window.innerHeight; // 스크린 창
        console.log("wH:"+windowHeight);
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
    
    
    // 채팅모달
    function openModal() {
    	$("#member-box").show();
    	$(".modal-wrap").css("display", "flex");
	}
    function closeModal() {
    	endChat();
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

	</script>
</body>
</html>