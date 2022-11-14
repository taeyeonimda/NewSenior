<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 수정</title>
	<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<link rel="stylesheet" href="/resources/summernote/summernote-lite.css">
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script src="/resources/summernote/summernote-lite.js"></script>
	<script src="/resources/summernote/lang/summernote-ko-KR.js"></script>
	
<h1>게시판 수정</h1>
	<form action="/boardUpdate.do" id="boardUpdateForm" method="post" enctype="multipart/form-data">
		<table border="1">
			<tr>
				<th>글번호</th>
				<td><input type="hidden" name="boardNo" value="${b.boardNo}">${b.boardNo}</td>
			</tr>
			<tr>
				<th>카테고리</th>
				<c:if test="${b.boardType eq 'F' }">
					<td>
						<select name="boardCategory">
							<option value="info"<c:if test="${b.boardCategory eq 'info'}">selected</c:if>>정보</option>
							<option value="etc"<c:if test="${b.boardCategory eq 'etc'}">selected</c:if>>기타</option>
						</select>
					</td>	
				</c:if>
				<c:if test="${b.boardType eq 'I' }">
					<td>
						<select name="boardCategory">
							<option value="campaign"<c:if test="${b.boardCategory eq 'campaign'}">selected</c:if>>캠페인</option>
							<option value="fair"<c:if test="${b.boardCategory eq 'fair'}">selected</c:if>>박람회</option>
							<option value="tour"<c:if test="${b.boardCategory eq 'tour'}">selected</c:if>>여행</option>
							<option value="ectI"<c:if test="${b.boardCategory eq 'ectI'}">selected</c:if>>기타</option>
						</select>
					</td>
				</c:if>
				<c:if test="${b.boardType eq 'Q' }">
					<td>
						<select name="boardCategory">
							<option value="class"<c:if test="${b.boardCategory eq 'class'}">selected</c:if>>클래스</option>
							<option value="club"<c:if test="${b.boardCategory eq 'club'}">selected</c:if>>동호회</option>
							<option value="activity"<c:if test="${b.boardCategory eq 'activity'}">selected</c:if>>액티비티</option>
							<option value="product"<c:if test="${b.boardCategory eq 'product'}">selected</c:if>>상품</option>
							<option value="pay"<c:if test="${b.boardCategory eq 'pay'}">selected</c:if>>결제</option>
							<option value="delivery"<c:if test="${b.boardCategory eq 'delivery'}">selected</c:if>>배송</option>
						</select>
					</td>
				</c:if>
				<c:if test="${b.boardType eq 'N' }">
					<td>
						<select name="boardCategory">
							<option value="notice"<c:if test="${b.boardCategory eq 'notice'}">selected</c:if>>공지사항</option>
						</select>
					</td>	
				</c:if>
				<c:if test="${b.boardType eq 'P' }">
					<td>
						<select name="boardCategory">
							<option value="invite"<c:if test="${b.boardCategory eq 'invite'}">selected</c:if>>모집중</option>
							<option value="end"<c:if test="${b.boardCategory eq 'end'}">selected</c:if>>모집완료</option>
						</select>
					</td>	
				</c:if>

				
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><input type="text" name="boardTitle" value="${b.boardTitle}"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
				${sessionScope.m.nickName }
				<input type="hidden" name="boardType" value="${boardType}">
													<%--게시판 바꾸면 이 값도 바꿔줌 --%>
				</td>	
			</tr>
			<tr>	
				<th>작성일</th>
				<td>${b.boardDate }</td>
			</tr>
			<tr>
				<th>첨부파일 추가하기</th>
				<td><input type="file" name="boardFile" multiple></td>
			</tr>
			<tr>
				<th>파일목록</th>
				<td colspan="3">
			<c:forEach items="${b.fileList }" var="bf">
				<td>${bf.filename }
				<button type="button" onclick="deleteFile(this,${bf.fileNo},'${bf.filepath}');">삭제</button></td>
				<td>${bf.fileNo }</td>
				<td>${bf.filepath }</td>
			</c:forEach>
		</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="boardContent" id="boardContent">${b.boardContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" id="boardUpdateBtn" value="수정하기">
				</td>
			</tr>
			
		</table>
	</form>
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
		function deleteFile(obj,fileNo,filepath){
			//삭제 버튼 눌렀을때 데이터를 컨트롤러로 전송해줘야함 "/boardUpdate.do"로 전달
			//ajax로??
			const fileNoInput = $("<input>");
			fileNoInput.attr("name","fileNoList");
			fileNoInput.val(fileNo);
			fileNoInput.hide();
			//<input type="text" name="fileNolist" value="fileNo">
			const filepathInput = $("<input>");
			filepathInput.attr("name","filepathList");
			filepathInput.val(filepath);
			filepathInput.hide();
			//<input type="text" name="filepathList" value="filepath">
			$("#updateFrm").append(fileNoInput).append(filepathInput);
			
			$(obj).parent().remove(); // 파일네임 지워줌
			
		}
		
		$("#boardUpdateBtn").on("click",function(e){
			const boardTitle = $("[name=boardTitle]")
			const boardContent = $("#boardContent")
			const boardUpdateForm =$("#boardUpdateForm")
			if(boardTitle.val()==""){
				alert('제목을 입력해주세요');
				return false;
			}
			if(boardContent.val()==""){
				alert('내용을 입력해주세요');
				return false;
			}
		
			boardUpdateForm.submit();
		
			});

	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>
</html>