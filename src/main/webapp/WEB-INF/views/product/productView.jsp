<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	    <div class="productContent">
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
                <h6>구성품</h6>
                <div>
                    <p>1. 물건1</p>
                    <p>2. 물건2</p>
                    <p>3. 물건3</p>
                </div>
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
              <div>리뷰</div>
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
            </div>
            <div class="reviewContentWrap prodContentMenu">
              <form action="javascript:void(0)">
                <div class="reviewContent">
                  <div class="productReviewHight">
                    <h6>아이디</h6>
                    <input type="hidden" name="memberId">
                  </div>
                  <div style="height: 100px;">
                    <textarea id="customerReview" style="outline: none;" name="reviewContent"></textarea>
                  </div>
                  <div class="productReviewHight">
                    <button type="submit">등록하기</button>
                  </div>
                  <div class="star-content">
                    <div class="star-wrap">
                      <span class="material-icons">star</span>
                      <span class="material-icons">star</span>
                      <span class="material-icons">star</span>
                      <span class="material-icons">star</span>
                      <span class="material-icons">star</span>
                    </div>
                    <p>
                      <div class="input-score">
                        <span class="real-score">0</span>
                        <span class="show-score">0</span>
                        <span>점</span>
                    </div>
                    
                  </div>
                </div>
              </form>
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

</body>
</html>