<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="num1" value="7"/>
<c:set var="num2" value="9"/>
<c:set var="result" value="${num1+num2}"/>
<c:set var="num" value="1"/>
<%	
   request.setCharacterEncoding("UTF-8");
%>
	<c:set var="array">yellow,blue,pink,red,green</c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 실습</title>
</head>
<body>
	${num1}과 ${num2}의 합은 ${result} 이다.
	if 최대값:
	
	<c:if test="${num1>num2}">
		${num1}
	</c:if>
	<c:if test="${num1<num2}">
		${num2}
	</c:if><br>
	
	choose :
	<c:choose>
		<c:when test="${num==0}">
			처음 뵙겠습니다.<br/>
		</c:when>
		<c:when test="${num==1}">
			다시 뵙게 되어 반갑습니다.<br/>
		</c:when>
		<c:otherwise>
			안녕하세요.<br/>
		</c:otherwise>
	</c:choose><br/>
		forEach : 
	<c:forEach var="color" items="${array}" varStatus="status">
	 	<c:if test="${!status.last}">${color},</c:if>
	 	<c:if test="${status.last}">${color}</c:if>
	</c:forEach>
	
</body>
</html>