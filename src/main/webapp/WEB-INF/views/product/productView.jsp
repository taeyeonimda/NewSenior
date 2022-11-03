<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/resources/TGbtstr/css/productView.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	    <div class="productContent">
	    <button type="button" onclick="deleteProduct(${p.productNo})">상품삭제</div>
	    <div><a href="/productUpdateFrm.do?productNo=${p.productNo}">상품수정</a></div>
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
                    	<input type="text" class="sumPrice" 
                    	value="${p.productPrice }" readonly
                    	style="font-weight: bold; margin: 0; border:none; width:100px; text-align:center; background-color:beige;">
                    	<span style="font-size: 14px; margin: 0;">원</span>
                   	</div>
                </div>
                <input type="hidden"  ${p.productName } ${p.wonPrice } ${p.productPrice } >
                <div>
                  <button type="button" onclick="insertCart();">장바구니</button>
                  <button>바로구매</button>
                </div>
            </div>
            
            <div class="subTitle" style="width: 1200px;">
              <div>상세내용</div>
              <div style="height: 57px"><button type="button" id="reviewListBtn">리뷰</button></div>
              <div>교환/반품 안내</div>
              <div><a href="#">문의남기기</a></div>
            </div>
            <div>
            <div class="detailContentWrap prodContentMenu">
              <div class="detailContent">상품필수정보</div>
              	<div>
              		${p.productContent }
              	</div>
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
			                    <input type="hidden" name="reviewDate" value="${pr.reviewDate }">
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
	            <c:forEach items="${prlist }" var="pr">
	            	<!-- <div class="reviewsWrap reviewMenu">
		                <div class="reviewsContent">
		                  <div class="reviewsId">
		                    <h6>${pr.memberId }</h6>
		                    <p>${pr.reviewDate }</p>
		                  </div>
		                  <div class="reviewsTextArea">
		                    <textarea>${pr.reviewContent }</textarea>
		                  </div>
		                  <div class="reviewsBtnBox">
		                    <button id="reviewUpdateBtn" onclick="UpdateReview(${pr.reviewNo})">수정</button>
		                    <button id="reviewDeleteBtn" onclick="deleteReview(${pr.reviewNo})">삭제</button>
		                  </div>
		                  <div class="reviewsScore">
		                    <div class="reviewStar-wrap">
		                      <span class="material-icons">star</span>
		                      <span class="material-icons">star</span>
		                      <span class="material-icons">star</span>
		                      <span class="material-icons">star</span>
		                      <span class="material-icons">star</span>
		                    </div>
		                    <div>
		                      <span class="reviewScore">${pr.reviewScore }</span>
		                    </div>
		                  </div>
		                </div>
              		</div>
              		 -->
              	</c:forEach>
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
		$("#reviewDeleteBtn").on("click",function(){
		});
		
			function deleteReview(reviewNo){
				if(confirm("리뷰를 삭제하시겠습니까?")){
					$.ajax({
						url : "/deleteReview.do",
						data : {
							reviewNo:reviewNo					
						},
						success : function(data){
							alert("삭제가 완료되었습니다.");
							location.reload(true);
						}
					});
				}
			};
		
		$("#productReviewInsertBtn").on("click",function(){
			const memberId = $("[name=productMemberId]").val();
			const productNo = $("[name=productNo]").val();
			const reviewContent = $("[name=reviewContent]").val();
			const reviewScore = $("[name=reviewScore]").val();
			const reviewDate = $("[name=reviewDate]").val();
			const reviewNo = $("[name=reviewNo1]").val();
			$.ajax({
				url : "/insertReview.do",
				type : "post",
				data : {
					memberId : memberId,
					productNo : productNo,
					reviewContent : reviewContent,
					reviewScore : reviewScore,
					reviewDate : reviewDate
				},
				success : function(data){
					
					const oneDiv = $("<div>");
					oneDiv.addClass("reviewsWrap reviewMenu");
					//
					
					const twoDiv = $("<div>");
					twoDiv.addClass("reviewsContent");
					//
					
					const three1Div = $("<div>");
					three1Div.addClass("reviewsId");
					const three1H6 = $("<h6>"+memberId+"</h6>"); //id
					const three1P = $("<p>"+reviewDate+"</p>"); //date
					//
					three1Div.append(three1H6);
					three1Div.append(three1P);
					
					
					const three2Div = $("<div>");
					three2Div.addClass("reviewsTextArea");
					const three2Textarea = $("<textarea>"+reviewContent+"</textarea>");
					three2Textarea.attr("readonly",true);
					//
					three2Div.append(three2Textarea);
					
					const three3Div = $("<div>");
					three3Div.addClass("reviewsBtnBox");
					const updateBtn = $("<button>수정</button>");
					updateBtn.addClass("reviewUpdateBtn");
					const deleteBtn = $("<button>삭제</button>");
					deleteBtn.addClass("reviewDeleteBtn");
					deleteBtn.attr("onclick","deleteReview("+reviewNo+")");
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
					$(".productReviewDiv").append(oneDiv);
				}
			});
			
		});
		
		$("#reviewListBtn").on("click",function(){
			const productNo = $("[name=productNo1]").val();
			$.ajax({
				url : "/productReviewList.do",
				data : {productNo:productNo},
				success : function(data){
					
					for(let i =0; i < data.length; i++){
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
						const three2Textarea = $("<textarea>"+data[i].reviewContent+"</textarea>");
						three2Textarea.attr("readonly",true);
						//
						three2Div.append(three2Textarea);
						
						const three3Div = $("<div>");
						three3Div.addClass("reviewsBtnBox");
						const updateBtn = $("<button>수정</button>");
						updateBtn.addClass("reviewUpdateBtn");
						const deleteBtn = $("<button>삭제</button>");
						deleteBtn.addClass("reviewDeleteBtn");
						deleteBtn.attr("onclick","deleteReview("+data[i].reviewNo+");");
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
						$(".productReviewDiv").append(oneDiv);
						
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
		});
		
		$(".reviewUpdateBtn").on("click",function(){
			
		});
		</script>
</body>
</html>