<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/css/product/product.css" rel="stylesheet">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	    <div class="page-content">
        <!-- Page Header Start -->
        <div class="container-fluid club-header py-5 mb-3 wow fadeIn" data-wow-delay="0.1s">
            <div class="container text-center py-5">
                <h1 class="display-3 text-white mb-4 animated slideInDown">Market</h1>
            </div>
        </div>
	    
        <!-- <div class="marketTitle">
        	<a href="/insertProductFrm.do">상품등록</a>
        </div> -->
        <div class="productList">
         <c:forEach items="${list }" var="p">
	         <c:choose>
	         <c:when test="${p.productStatus eq 0 }">
	            <div class="text-gray-900 dark:text-gray-100 bg-white dark:bg-zinc-800 border-zinc-200 dark:border-zinc-600 rounded-sm group  hover:shadow-md duration-300">
	                <a href="/productView.do?productNo=${p.productNo }&memberId=${sessionScope.m.memberId}">
	                	<img src="/resources/upload/productImg/${p.productFileVO[0].filePath }" style="width:360px; height: 300px;">
	                    <!-- <div class="productImg"><img src="/resources/TGbtstr/img/국수키트.jpg" alt=""></div> -->
	                    <br><br>
	                    <div class="productName h-full object-contain group-hover-noon-background font-image-preview" style="font-size: 29px;">${p.productName }</div>
	                    <div class="productSubName">${p.productSubName }</div>
	                    <div class="productPrice" style="color:#6c757d;">${p.wonPrice }<span>원</span></div>
	                    <br>
	                </a>
	            </div>
            </c:when>
            </c:choose>
       	 </c:forEach>
        </div>
        <div style="text-align: center;">
        	${pageNavi }
        </div>
      </div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>