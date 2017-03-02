<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 
		src="../jqueryLib/jquery-1.10.2.js">	
</script>

<style type="text/css">	
</style>

<script type="text/javascript">
$(document).ready(function(){
});
</script>

</head>
<body>
<c:set var="age" value="15"/>
<c:set var="point" value="85"/>
<!-- 조건에 따라서 성입입니다. 미성년자입니다. -->
<center>
<h1>나이는 ${age }이며
<c:if test="${age>=18 }">
</c:if>
<c:if test="${age<18 }">
</c:if>
</h1>
<h1>점수는 ${point }이고, 학점은
	<c:choose>
		<c:when test="${point>=90 }">A</c:when>
		<c:when test="${point>=80 }">B</c:when>
		<c:when test="${point>=70 }">C</c:when>
		<c:when test="${point>=60 }">D</c:when>
		<c:when test="${point<60 }">F</c:when>
	</c:choose>
	입니다!!
</h1>
</body>
</html>