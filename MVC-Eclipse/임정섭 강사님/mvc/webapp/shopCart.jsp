<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%	
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
${loginUser.name}님 장바구니에 담긴 상품입니다..
	<p/>
	장바구니 목록 :
	 <c:forEach items="${cart}" var="list" varStatus="status">
	
		<c:if test="${!status.last}">${list}, </c:if>
		<c:if test="${status.last}">${list}</c:if>
	 </c:forEach>
	 
	
	<div>
		<a href="shoplist.do">[쇼핑 리스트 다시 가기]</a>
	</div>



</body>
</html>