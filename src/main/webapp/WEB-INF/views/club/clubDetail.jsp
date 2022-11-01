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
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
                    <div><span>회원이름</span><span>(간단정보)</span></div>
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
                    <button>동호회 탈퇴하기</button>
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
            		<c:forEach items="${cbList }" var="cb">
					    <div class="container-xxl py-5 club-container">
			                <div class="container wow fadeInUp" data-wow-delay="0.05s"">
			                    <div class="row align-items-end club-board-div">
			                        <div class="ml-20">
				                        <div class="flex-space-between" style="width: 90%;">
				                        	<div class="profile-box" style="background: #BDBDBD;">
												<img class="profile" src="/resources/upload/club/person_1.jpg">
												<p class="text-primary">${cb.clubBoardWriter }</p>
											</div>
											<div>
												<a href="#" style="margin-right: 14px;">수정</a>
												<a href="#">삭제</a>
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
			                    <div class="inputCommentBox">
			                    	<form action="/insertClubComment.do" method="post">
			                    		<input type="hidden" name="clubNo">
			                    		<input type="hidden" name="clubBoardNo">
			                    		<input type="hidden" name="clubComWriter">
			                    		<textarea name="clubComContent" style="width:80%;"></textarea><button width="20%" class="btn btn-primary py-2 px-4">등록</button>
			                    	</form>
			                    </div>
			                    <div class="commentBox">
			                    	<ul class="posting-comment">
										<li>
											<div class="profile-box" style="background: #BDBDBD;">
											    <img class="profile" src="/resources/upload/club/person_1.jpg">
											</div>
										</li>
										<li>
											<p class="comment-info">
												<span class="text-primary">댓글작성자</span>
												<span>댓글작성일</span>
											</p>
											<p class="comment-content">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</p>
											<textarea name="ncContent" class="input-form" style="min-height:50px; display:none;">ncContent</textarea>
											<p class="comment-link">
												<!--세션이 null이 아니고 세션값이 댓글 작성자와 동일하면,-->
												<a href="javascript:void(0)" onclick="modifyComment(this, 'comment넘버', 'boardNo');">수정</a>
												<a href="javascript:void(0)" onclick="deleteComment(this, 'comment넘버', 'boardNo');">삭제</a>
												<a href="javascript:void(0)" class="recShow">답글달기</a>
											</p>
										</li>
									</ul>
									<div class="inputRecommentBox">
										<form action="/insertClubRecomment.do" method="post">
											<ul>
												<li>
													<span class="material-symbols-outlined" style="font-size: 33px;">subdirectory_arrow_right</span>
												</li>
												<li>
													<input type="hidden" name="ncWriter" value="clubNo">
													<input type="hidden" name="noticeRef" value="clubNo">
													<input type="hidden" name="ncRef" value="clubNo">
													<textarea name="clubComContent"></textarea>
												</li>
												<li>
													<button class="btn btn-primary py-2 px-4">등록</button>
												</li>
											</ul>
										</form>
									</div>
			                    </div>
			                </div>
			            </div>
				    </c:forEach>
	    			<!-- 회원 게시글 End -->
            	</c:when>
            </c:choose>

        </div> <!-- 넓이제한-->
    </div><!--page-content End-->
<div class="modal-wrap">
    <div class="modal-chat">
        <div class="modal-top">
            <h1>동호회 채팅</h1>
        </div>
        <div class="modal-content">
            <div id="member-box">
                <div>member</div>
                <div>member</div>
                <div>member</div>
                <div>member</div>
                <div>member</div>
                <input type="text" value="${c.clubNo }" id="clubNo"><button onclick="initChat('${sessionScope.m.memberId}');">채팅시작하기</button>
            </div>
			<div class="chatting">
				<div class="messageArea bg-light"></div>
				<div class="sendBox">
					<input type="text" id="sendMsg">
					<button id="sendBtn" onclick="sendMsg();">전송</button>
					<input type ="file" name ="chatFile" id="chatFile" multiple="multiple">
					<button type="button"  onclick="fileSend();" id="sendFileBtn">보내기</button>
					<div id="fileMsgBox"></div>
				</div>
			</div>
			<button onclick="closeModal();">닫기</button>
        </div>
    </div>
</div>
<div class="write-modal-wrap">
    <div class="modal-write">
        <div class="writeModalTop">
            <h1>글쓰기</h1>
            <div>작성자</div>
        </div>
        <div class="writeModalContent">
        <form action="/clubBoardWrite.do" method="post" enctype="multipart/form-data">
			<div class="writeModalInputBox">
				<input type="hidden" name="clubNo" value="${c.clubNo }">
				<input type="hidden" name="memberNo" value="4">
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
		const data = {type:"enter", msg:"onnbi", club:clubNo};
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
	
	function sendMsg() {
		const msg = $("#sendMsg").val();
		// val
		if(msg != ''){ // 전송 눌렀을 때 메시지 박스에 val이 ''이 아니면
			// 서버에 소켓으로 문자열을 전송
			const data = {type:"chat", msg:msg, club:clubNo};	// 받앗서 구분하기 위해 key값이 있는 JSON 객체 타입으로 전송
			ws.send(JSON.stringify(data));
			appendChat("<div class='chat right'>"+msg+"</div>");
			$("#sendMsg").val("");
			// msg가 null이 아니고, file도 null이 아닐 때
			// file만 있을 때
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
	$("#sendMsg").on("keyup", function(key) {
		if(key.keyCode==13){
			sendMsg();
		}
	})

	</script>
</body>
</html>