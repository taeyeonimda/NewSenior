<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/TGbtstr/css/productView.css">
<link rel="stylesheet" href="/resources/MAINbtstr/css/bootstrap.min.css">
<script src="https://unpkg.com/mathjs/lib/browser/math.js"></script> <!-- math 사용 위한 라이브러리 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<style>
ul {
    text-align: center;
    display: inline-block;
    border: 1px solid #dee2e6;
    border-right: 0;
    list-style-type: none;
}

ul li {
    text-align: center;
    float: left;
}
ul li:hover{
	z-index: 2;
    color: #2a722d;
    background-color: #e9ecef;
    border-color: #dee2e6;
}

ul li a {
    display: block;
    font-size: 14px;
    padding: 9px 12px;
    border-right: solid 1px #ccc;
    box-sizing: border-box;
    height: 38px;
    line-height: 22px;
}

ul li.on {
    background: #fff;
}

ul li.on a {
    color: #348E38;
}
#pagingul{
	padding: 0;
}
.changeColor{
	background-color: #0F4229;
	color: white;
};
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	    <div class="productContent">
	    <button type="button" onclick="deleteProduct(${p.productNo})">상품삭제</button>
	    <div><a href="/productUpdateFrm.do?productNo=${p.productNo}">상품수정</a></div>
		<input type="hidden" name="userId" id="userId" value="${sessionScope.m.memberId }">
        <div class="productWrap">
            <div style="width: 500px;">
                <img src="/resources/upload/productImg/${p.productFileVO[0].filePath }" class="productImage">
            </div>
            
            <div style="width: 500px;" class="prodContent">
                <h3>${p.productName }</h3>
                <h4>${p.wonPrice }<span>원</span></h4>
                <input type="hidden" class="hiddenPrice" value=${p.productPrice }>
                <p>배송비-무료</p>
                
                <h6>클래스 종합키트</h6>
                <br>
                <br>
                <br>
                <div class="classMove">
                    <a href="javascript:void(0)">관련클래스 바로가기 >>></a>
                </div>
                
                <div class="productQty">
                    <div style="width: 200px;">
                        <span class="material-icons" id="minus">remove</span>
                        <span class="productBuyQty">1</span>
                        <span class="material-icons" id="plus">add</span>
                    </div>
                    <div style="width: 300px;">
                    	<input type="hidden" class="sumPrice" 
                    	value="${p.productPrice }" readonly
                    	style="font-weight: bold; margin: 0; border:none; width:100px; text-align:center;">
                    	<input type="text" class="showSumPrice" 
                    	value="${p.productPrice }" readonly
                    	style="font-weight: bold; margin: 0; border:none; width:100px; text-align:center; background-color:#f8f8f8;">
                    	<span style="font-size: 14px; margin: 0;">원</span>
                   	</div>
                </div>
	                <div>
	                
                <form id="insertCartForm" action="/insertCart.do" autocomplete="off" >
                		<input type="hidden" value="${p.productNo }" name="productNo">
	        	        <input type="hidden" value="${p.productName }" name="buyName">
		                <input type="hidden" value="${p.productPrice }" name="buyPrice">
		                <input type="hidden" value="${p.productFileVO[0].filePath }" name="buyPhoto">
		                <input type="hidden" value="${sessionScope.m.memberNo }" name="memberNo">
						<input type="hidden" class="changeProductAmount" value="${p.productQty }" name="buyAmount">
	                	<button type="submit">장바구니</button>
	                 	<button type="button" id="directBuy">바로구매</button>
            	</form>
	                </div>
	                
            </div>
            
            
            <div class="subTitle" style="width: 1200px;">
              <div>상세내용</div>
              <div style="height: 57px"><button type="button" id="reviewListBtn" value="10">리뷰</button></div>
              <div>교환/반품 안내</div>
              <div><a href="#">문의남기기</a></div>
            </div>
            <div>
            <div class="detailContentWrap prodContentMenu">
              <div class="detailContent">상품필수정보</div>
              <div class="detailContentBox">
                <div>
                  <div class="BoxSub">원산지</div>
                  <div>대한민국</div>
                </div>
                <div>
                  <div class="BoxSub">상품상태</div>
                  <div>새상품</div>
                </div>
                <div>
                  <div class="BoxSub">브랜드</div>
                  <div>주식회사 연금복권</div>
                </div>
                <div>
                  <div class="BoxSub">판매자 연락처</div>
                  <div>1588-1234 / pension@lottery.com</div>
                </div>
              </div>
              <div>
                <div><img alt="" src="/resources/upload/productImg/${p.productFileVO[1].filePath }"></div>
              	<div><img alt="" src="/resources/upload/productImg/${p.productFileVO[2].filePath }"></div>
              	<div><img alt="" src="/resources/upload/productImg/${p.productFileVO[3].filePath }"></div>
              </div>
              <div>
              	<textarea id="productContentArea" readonly>${p.productContent }</textarea>
              </div>
            </div>
            <input type="hidden" name="productNo1" value="${p.productNo }">
		    <div class="prodContentMenu productReviewDiv">
            <c:choose>
            	<c:when test="${!empty sessionScope.m }">
			            <div class="reviewContentWrap">
			              <!-- <form action="/insertReview.do" method="post"> -->
			                <div class="reviewContent">
			                  <div class="productReviewHight">
			                    <h6>${sessionScope.m.memberId }</h6>
			                    <input type="hidden" name="productMemberId" value="${sessionScope.m.memberId }">
			                    <input type="hidden" name="productNo" value="${p.productNo }">
			                  </div>
			                  <div style="height: 100px;">
			                    <textarea id="customerReview" style="outline: none;" name="reviewContent"></textarea>
			                  </div>
			                  <div class="productReviewHight">
			                    <button type="button" id="productReviewInsertBtn">등록하기</button>
			                  </div>
			                  <div class="star-content">
			                    <div class="star-wrap">
			                      <span class="material-icons">star</span>
			                      <span class="material-icons">star</span>
			                      <span class="material-icons">star</span>
			                      <span class="material-icons">star</span>
			                      <span class="material-icons">star</span>
			                    </div>
			                      <div class="input-score">
			                      	<input type="hidden" name=reviewScore id="reviewScore">
			                        <span class="real-score">0</span>
			                        <span class="show-score">0</span>
			                    </div>
			                  </div>
			                </div>
			              <!-- </form>  -->
			            </div>
		            </c:when>
	            </c:choose>
	            <div class="reviewsTotalDiv">
	            	
	            </div>
	            <ul id="pagingul"></ul>
            </div>
            
            <div class="refundWrap prodContentMenu">
              <div>
                <div class="detailContent">교환/환불 안내</div>
                <table class="refundTable">
                  <tr>
                    <th class="refundTitle" rowspan="2">교환/환불 비용</th>
                    <td class="refundContent">
                      <p>
                        반품비 : 3,000원<br>
                        교환비 : 6,000원
                      </p>
                    </td>
                  </tr>
                  <tr>
                    <td class="refundContent">
                      <p>단, 고객의 단순 변심에 의한 경우 발생하며 부분반품 시 배송조건에 따라 일부 반품 비용이 부과될 수 있습니다.</p>
                      <p>전자상거래법 기준에 따라 환불이 지연되었을 경우 판매자에게 환불지연배상금(연이자 15%를 일할 계산) 지급을 요청하실 수 있습니다.</p>
                    </td>
                  </tr>
                  <tr>
                    <td class="refundContent"></td>
                  </tr>
                </table>
                <br>
                <div class="detailContent">교환/환불 규정 안내</div>
                <table class="refundTable" style="margin-bottom: 10px;">
                  <tr>
                    <th class="refundTitle">교환/환불 기간</th>
                    <td class="refundContent">
                      <p>교환/반품은 구매확정 전까지 가능합니다. (상품을 받으신 날로부터 7일 경과 시 자동 구매확정이 됩니다.)</p>
                      <p>구매확정이 된 이후에는 고객센터나 판매자를 통해서 교환/반품 가능여부를 확인할 수 있습니다.</p>
                      <p>주문제작, 설치 상품 등 일부 상품은 교환/반품 기준이 상이할 수 있습니다.</p>
                      <p>스마트픽 픽업 배송상품은 스마트픽 픽업 지점에 상품도착일로부터 5일까지 픽업 가능합니다. 픽업가능일 경과 시 자동으로 반품되며 반품배송비가 차감 후 환불되거나, 필요시 고객센터를 통해서 반품비에 대한 결제 안내를 받으시게 됩니다.</p>
                    </td>
                  </tr>
                  <tr>
                    <th class="refundTitle" rowspan="2">교환/환불 기간</th>
                  
                    <td class="refundContent">
                      <p>교환/반품은 구매확정 전까지 가능합니다. (상품을 받으신 날로부터 7일 경과 시 자동 구매확정이 됩니다.)</p>
                      <p>구매회원의 귀책사유로 말미암아 상품이 멸실·훼손된 경우 (단, 상품 등의 내용을 확인하기 위하여 포장 등을 훼손한 경우에는 청약철회를 할 수 있습니다)</p>
                      <p>구매회원의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우(예시 : 화장품류, 식품은 밀봉 개봉 시, 의류, 침구류는 수선했거나 세탁하였을 시, 기타 사용·분리·훼손에 의해 상품의 가치가 현저히 감소하여 재판매가 불가할 시)</p>
                      <p>신선식품 상품으로 상품의 특성상 배송이 시작된 경우 (신선식품은 냉장/냉동을 포함하며, 상품 불량인 경우는 제외)</p>
                      <p>시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우 (예: 계절의류, 냉난방기기 등 계절상품)</p>
                      <p>배송된 상품이 하자없음을 확인한 후 설치가 완료된 상품의 경우 (예: 가전제품, 가구, 헬스기기 등)</p>
                      <p>복제가 가능한 상품의 포장을 훼손한 경우(예시 : CD, DVD, GAME, 서적 등의 경우 포장 개봉 시)</p>
                      <p>주문에 따라 개별적으로 생산되는 물품 등 회사 또는 판매회원에게 회복할 수 없는 중대한 피해가 예상되는 경우로서 사전에 해당 거래에 대하여 별도로 그 사실을 고지하고 구매회원의 서면(전자문서를 포함)에 의한 동의를 받은 경우</p>
                      <p>구매하신 상품의 구성품 일부가 훼손되거나 누락된 경우 (예 : 화장품 세트 상품, 의류에 부착되는 액세사리, 가전제품의 부속품, 사은품 등)</p>
                      <p>기타 관련법령이 정하는 청약철회 제한사유에 해당되는 경우</p>
                    </td>
                  </tr>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script src="/resources/TGbtstr/js/productDetail.js"></script>
	<script>
	
		function deleteProduct(productNo) {
			if(confirm("상품을 삭제하시겠습니까?")){
				location.href="/deleteProduct.do?productNo="+productNo;
			}
		}
		
		$(".reviewsScore").each(function(index,item){
			const score = $(item).children().eq(1).children().text();
			const span = $(item).children().eq(0).children();
			for(let i = 0; i<score; i++){
				span.eq(i).css("color","gold");
			}
		});
		
			function reviewUpdate(obj,reviewNo,productNo){
				const reviewContent = $(obj).parent().prev().children().val();
				console.log(reviewContent);
				if(confirm("리뷰를 수정하시겠습니까?")){
					$.ajax({
						url : "/productReviewUpdate.do",
						method : "post",
						data : {
							reviewContent:reviewContent,
							reviewNo:reviewNo,
							productNo:productNo
						},
						success:function(data){
							alert("수정완료!");
							$(obj).parent().prev().children().css("background-color","white").attr("readonly",true);
							$(".reviewUpdateBtn").attr("onclick","modifyComment(this,"+reviewNo+","+productNo+")");
							$(".reviewUpdateBtn").text("수정");
							$(".reviewUpdateBtn").next().text("삭제");
						}
					});
				}
			}
			
			function deleteReview(reviewNo,obj){
				if(confirm("리뷰를 삭제하시겠습니까?")){
					$.ajax({
						url : "/deleteReview.do",
						data : {
							reviewNo:reviewNo					
						},
						success : function(data){
							alert("삭제가 완료되었습니다.");
							$(obj).parent().parent().parent().remove();
							
						}
					});
				}
			};
		
		$("#productReviewInsertBtn").on("click",function(){
			const memberId = $("[name=productMemberId]").val();
			const productNo = $("[name=productNo]").val();
			const reviewContent = $("[name=reviewContent]").val();
			const reviewScore = $("[name=reviewScore]").val();
			const reviewNo = $("[name=reviewNo1]").val();
			$.ajax({
				url : "/insertReview.do",
				type : "post",
				data : {
					memberId : memberId,
					productNo : productNo,
					reviewContent : reviewContent,
					reviewScore : reviewScore,
				},
				success : function(data){
					var now = new Date();
					var year = now.getFullYear();
					var month = ('0'+(now.getMonth()+1)).slice(-2);
					var day = ('0'+now.getDate()).slice(-2);
					var viewDate = year+'-'+month+'-'+day;
					
					const oneDiv = $("<div>");
					oneDiv.addClass("reviewsWrap reviewMenu");
					//
					
					const twoDiv = $("<div>");
					twoDiv.addClass("reviewsContent");
					//
					
					const three1Div = $("<div>");
					three1Div.addClass("reviewsId");
					const three1H6 = $("<h6>"+memberId+"</h6>"); //id
					const three1P = $("<p>"+viewDate+"</p>"); //date
					//
					three1Div.append(three1H6);
					three1Div.append(three1P);
					
					
					const three2Div = $("<div>");
					three2Div.addClass("reviewsTextArea");
					const three2Textarea = $("<textarea name='reviewContent'>"+reviewContent+"</textarea>");
					three2Textarea.attr("readonly",true);
					//
					three2Div.append(three2Textarea);
					const three3Div = $("<div>");
					three3Div.addClass("reviewsBtnBox");
					const updateBtn = $("<button>수정</button>");
					updateBtn.addClass("reviewUpdateBtn");
					updateBtn.attr("onclick","updateReview("+data+")");
					const deleteBtn = $("<button>삭제</button>");
					deleteBtn.addClass("reviewDeleteBtn");
					deleteBtn.attr("onclick","deleteReview("+data+",this)");
					//
					three3Div.append(updateBtn);
					three3Div.append(deleteBtn);
					
					const three4Div = $("<div>");
					three4Div.addClass("reviewsScore");
					const fourNextDiv = $("<div>");
					fourNextDiv.addClass("reviewStar-wrap");
					const starSpan1 = $("<span>star</span>");
					const starSpan2 = $("<span>star</span>");
					const starSpan3 = $("<span>star</span>");
					const starSpan4 = $("<span>star</span>");
					const starSpan5 = $("<span>star</span>");
					starSpan1.addClass("material-icons")
					starSpan2.addClass("material-icons")
					starSpan3.addClass("material-icons")
					starSpan4.addClass("material-icons")
					starSpan5.addClass("material-icons")
					//
					fourNextDiv.append(starSpan1);
					fourNextDiv.append(starSpan2);
					fourNextDiv.append(starSpan3);
					fourNextDiv.append(starSpan4);
					fourNextDiv.append(starSpan5);
					three4Div.append(fourNextDiv);
					
					
					const three5Div = $("<div>");
					const fiveSpan = $("<span>"+reviewScore+"</span>");
					fiveSpan.addClass("reviewScore");
					//
					three5Div.append(fiveSpan);
					
					three4Div.append(three5Div);
					
					twoDiv.append(three1Div);
					twoDiv.append(three2Div);
					twoDiv.append(three3Div);
					twoDiv.append(three4Div);
					
					oneDiv.append(twoDiv);
					
					$(".reviewContentWrap").after(oneDiv);
					$(".input-score").each(function(index,item){
						const score = $(item).children().eq(1).text();
						const span = $(".reviewStar-wrap").children();
						for(let i = 0; i<score; i++){
							span.eq(i).css("color","gold");
						}
					});
					$("#customerReview").val('');
					$(".input-score>span").text('0');
					$(".star-wrap").children().css("color","");
				}
			});
		});
			$("#plus").on("click",function(){
				const price = $(".sumPrice").val();
				const pricecomma = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$(".showSumPrice").val(pricecomma);
			});
			$("#minus").on("click",function(){
				const price = $(".sumPrice").val();
				const pricecomma = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$(".showSumPrice").val(pricecomma);
			});
			
			let totalData; //총 데이터
			let dataPerPage; //한 페이지에 나타낼 글의 수
			let pageCount = 5; //페이징에 나타낼 페이지 수
			let reviewCurrentPage=1; //현재 페이지
			const userId = $("#userId").val();
			
			$(document).ready(function(){
				const price = $(".sumPrice").val();
				console.log(price);
				const pricecomma = price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				console.log("돈 : "+pricecomma);
				$(".showSumPrice").val(pricecomma);
				
				dataPerPage = $("#reviewListBtn").val(); 
				console.log("dataPerPage : "+dataPerPage);
				const productNo = $("[name=productNo1]").val();
				console.log("productNo : "+productNo);
				$.ajax({
					method : "POST",
					url : "/productReviewList.do",
					data : {
						productNo : productNo
					},
					success : function(data){
						totalData = data.length;
						console.log("총 데이터 : "+totalData);
					}
				});
				displayData(1, dataPerPage);
				paging(totalData, dataPerPage, pageCount, 1);
			});
			
			function paging(totalData, dataPerPage, pageCount, currentPage){
				console.log("currentPage : "+currentPage);
				console.log("데이터퍼페이지 : "+dataPerPage);
				console.log("토탈데이터 : "+totalData);
				var totalPage = Math.ceil(totalData / dataPerPage); //총 페이지 수
				console.log("totalPage : "+totalPage);
				
				if(totalPage<pageCount){
					pageCount = totalPage;
				}
				
				let pageGroup = Math.ceil(currentPage/pageCount);
				console.log("pageGroup : "+pageGroup);
				let last = pageGroup * pageCount;
				
				if(last > totalPage){
					last = totalPage;
				}
				
				let first = last - (pageCount - 1);
				let next = last + 1;
				let prev = first - 1;
				
				//태그생성
				let pageHtml = "";
				if(prev > 0){
					//pageHtml = "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#Redirect' id='prev'>이전</a></li>";
					pageHtml += "<li><a href='#Redirect' id='prev'> 이전 </a></li>";
				}
				
				//페이징 번호 처리
				for(var i = first; i <= last; i++){
					if(currentPage == i){
						//pageHtml += "<li class='page-item '><a class='page-link active-page' href='#Redirect' id='" + i + "'>" + i + "</a></li>";
						pageHtml +=  "<li class='on'><a href='#Redirect' id='" + i + "'>" + i + "</a></li>";
					}else {
						//pageHtml += "<li class='page-item'><a class='page-link' href='#Redirect' id='" + i + "'>" + i + "</a></li>";
						pageHtml += "<li><a href='#Redirect' id='" + i + "'>" + i + "</a></li>";
					}
				}
				
				if(last < totalPage){
					//pageHtml += "<li class='page-item disabled'><a class='page-link' tabindex='-1' aria-disabled='true' href='#Redirect' id='next'> 다음 </a></li>";
					pageHtml += "<li><a href='#Redirect' id='next'> 다음 </a></li>";
				}
				
				$("#pagingul").html(pageHtml);
				let displayCount = "";
				displayCount = "현재 1 - " + totalPage + " 페이지 / " + totalData + "건";
				$("#displayCount").text(displayCount);
				
				//페이징 번호 클릭 이벤트 
				$("#pagingul li a").click(function () {
				$(".reviewsWrap").remove();
				let $id = $(this).attr("id");
				selectedPage = $(this).text();

				if ($id == "next") selectedPage = next;
				if ($id == "prev") selectedPage = prev;
				    
				//전역변수에 선택한 페이지 번호를 담는다...
				reviewCurrentPage = selectedPage;
				//페이징 표시 재호출
				paging(totalData, dataPerPage, pageCount, selectedPage);
				//글 목록 표시 재호출
				displayData(selectedPage, dataPerPage);
				});
			}
			
			//현재 페이지(currentPage)와 페이지당 글 개수(dataPerPage) 반영
			function displayData(currentPage, dataPerPage) {
			  let chartHtml = "";
			  const productNo = $("[name=productNo1]").val();
			  console.log("productNo1 : "+productNo);
			  
			//Number로 변환하지 않으면 아래에서 +를 할 경우 스트링 결합이 되어버림.. 
			  currentPage = Number(currentPage);
			  dataPerPage = Number(dataPerPage);
			  $.ajax({
				  mothod : "POST",
				  data : {productNo : productNo},
				  url : "/productReviewList.do",
				  success : function(data){
					  for (var i = (currentPage - 1) * dataPerPage;i < (currentPage - 1) * dataPerPage + dataPerPage; i++) {
						  
						  const oneDiv = $("<div>");
							oneDiv.addClass("reviewsWrap reviewMenu");
							//
							
							const twoDiv = $("<div>");
							twoDiv.addClass("reviewsContent");
							//
							
							const three1Div = $("<div>");
							three1Div.addClass("reviewsId");
							const three1H6 = $("<h6>"+data[i].memberId+"</h6>"); //id
							const three1P = $("<p>"+data[i].reviewDate+"</p>"); //date
							//
							three1Div.append(three1H6);
							three1Div.append(three1P);
							
							
							const three2Div = $("<div>");
							three2Div.addClass("reviewsTextArea");
							const three2Textarea = $("<textarea name='reviewContent'>"+data[i].reviewContent+"</textarea>");
							three2Textarea.attr("readonly",true);
							//
							three2Div.append(three2Textarea);
								
							
							const three3Div = $("<div>");
							three3Div.addClass("reviewsBtnBox");
							if(userId != '' && userId == data[i].memberId){
							const updateBtn = $("<button>수정</button>");
							updateBtn.addClass("reviewUpdateBtn");
							updateBtn.attr("onclick","modifyComment(this,"+data[i].reviewNo+","+data[i].productNo+")");
							const deleteBtn = $("<button>삭제</button>");
							deleteBtn.addClass("reviewDeleteBtn");
							deleteBtn.attr("onclick","deleteReview("+data[i].reviewNo+",this);");
							//
							three3Div.append(updateBtn);
							three3Div.append(deleteBtn);
							} else {
								three2Textarea.css("margin-right","52px");
							}

							const three4Div = $("<div>");
							three4Div.addClass("reviewsScore");
							const fourNextDiv = $("<div>");
							fourNextDiv.addClass("reviewStar-wrap");
							const starSpan1 = $("<span>star</span>");
							const starSpan2 = $("<span>star</span>");
							const starSpan3 = $("<span>star</span>");
							const starSpan4 = $("<span>star</span>");
							const starSpan5 = $("<span>star</span>");
							starSpan1.addClass("material-icons")
							starSpan2.addClass("material-icons")
							starSpan3.addClass("material-icons")
							starSpan4.addClass("material-icons")
							starSpan5.addClass("material-icons")
							//
							fourNextDiv.append(starSpan1);
							fourNextDiv.append(starSpan2);
							fourNextDiv.append(starSpan3);
							fourNextDiv.append(starSpan4);
							fourNextDiv.append(starSpan5);
							three4Div.append(fourNextDiv);
							
							const three5Div = $("<div>");
							const fiveSpan = $("<span>"+data[i].reviewScore+"</span>");
							fiveSpan.addClass("reviewScore");
							//
							three5Div.append(fiveSpan);
							
							three4Div.append(three5Div);
							
							twoDiv.append(three1Div);
							twoDiv.append(three2Div);
							twoDiv.append(three3Div);
							twoDiv.append(three4Div);
							
							oneDiv.append(twoDiv);
							
							$(".reviewsTotalDiv").append(oneDiv);
							
							$(".reviewsScore").each(function(index,item){
								const score = $(item).children().eq(1).children().text();
								const span = $(item).children().eq(0).children();
								for(let i = 0; i<score; i++){
									span.eq(i).css("color","gold");
								}
							});
					  } 
					  
				  }
			  });
			}
			
			$("#reviewListBtn").click(function () {
				$(".reviewsWrap").remove();
			    dataPerPage = $("#reviewListBtn").val();
			    console.log("dataPerPage1 : "+dataPerPage);
			    //전역 변수에 담긴 globalCurrent 값을 이용하여 페이지 이동없이 글 표시개수 변경 
			    paging(totalData, dataPerPage, pageCount, reviewCurrentPage);
			    displayData(reviewCurrentPage, dataPerPage);
			    
			 });
		
		function modifyComment(obj,reviewNo,productNo){
			$(obj).parent().prev().children().attr("readonly",false).css("background-color","#F0FFF0");
			$(obj).text("수정완료");
			$(obj).attr("onclick","reviewUpdate(this,"+reviewNo+","+productNo+")");
			
			$(obj).next().text("수정취소");
			$(obj).next().attr("onclick","modifyCancel(this,"+reviewNo+","+productNo+")");
		};
		function modifyCancel(obj,reviewNo,productNo){
			$(obj).parent().prev().children().attr("readonly",true).css("background-color","white");
			$(obj).prev().text("수정");
			$(obj).prev().attr("onclick","modifyComment(this,"+reviewNo+","+productNo+")");
			$(obj).text("삭제") 	;
			$(obj).attr("onclick","deleteReview("+reviewNo+",this)");
		};
		function modifyComplete(obj,reviewNo,productNo){
			const form = $("<form action='/productReviewUpdate.do' method='post'></form>");
			const reviewInput = $("<input type='text' name='reviewNo'>");
			reviewInput.val(reviewNo);
			form.append(reviewInput);
			
			const productNoInput = $("<input type='text' name='productNo'>");
			productNoInput.val(productNo);
			form.append(productNoInput);
			const productReviewContent = $(obj).parent().prev().children().clone();
			form.append(productReviewContent);
			$("body").append(form);
			form.submit();
		};
				

		
		$("#directBuy").on("click",function(){
			const price = $(".sumPrice").val();
			//console.log(price);
			const d = new Date();
			const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
			
			IMP.init("imp43256257");
			IMP.request_pay({
				merchat_uid : "상품코드_"+date, //거래ID
				name : "결제 테스트",			 //결제이름
				amount : price,				//결제금액
				buyer_email : "eyeyo93@gmail.com", //구매자 이메일
				buyer_name : "구매자",		//구매자 이름
				buyer_tel : "010-0000-0000", //구매자 전화번호
				buyer_addr : "경기도 부천시", //구매자 주소
				buyer_postcode : "12345"  //구매자 우편번호
				
				
			},function(rsp){
				if(rsp.success){
					alert("결제성공");
				}else {
					alert("결제실패");
				}	
			});
		});
		const pageli = $("#pagingul").children(); 
		$(pageli).on("click",function(){
			console.log("zzz");
			$(this).css("background-color","black");
		});
		</script>
</body>
</html>