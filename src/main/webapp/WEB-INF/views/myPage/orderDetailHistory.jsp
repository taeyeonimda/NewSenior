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
<table>
	<c:forEach items="${list }" var="Or">
		<tr>
			<td>${Or.orderDate }</td>
			<td>${Or.orderDetailAmount }</td>
			<td>${Or.productNo }</td>
			<td>${Or.receivePhone }</td>
			<td>${Or.receiveAddr }</td>
			<td>${Or.receiveName }</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>