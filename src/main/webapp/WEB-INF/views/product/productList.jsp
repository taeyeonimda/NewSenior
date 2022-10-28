<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	    <div style="padding-top: 90px;">
        <div class="marketTitle">
            Market
        </div>
        <div class="marketTitle">
        	<a href="/insertProductFrm.do">상품등록</a>
        </div>
        
        <div class="productList">
         <c:forEach items="${list }" var="p">
            <div>
                <a href="/productView.do?productNo=${p.productNo }">
                	<img src="/resources/upload/productImg/${p.productFileVO[0].filePath }" style="width:360px; height: 300px;">
                    <!-- <div class="productImg"><img src="/resources/TGbtstr/img/국수키트.jpg" alt=""></div> -->
                    <div class="productName">${p.productName }</div>
                    <div class="productSubName">${p.productSubName }</div>
                    <div class="productPrice">${p.wonPrice }</div>
                </a>
            </div>
       	 </c:forEach>
        </div>
        <div style="text-align: center;">
        	${pageNavi }
        </div>
      </div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>