<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<%
request.setCharacterEncoding("UTF-8");
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>

</head>
<body><center>
<h1>Emplist</h1>
<!--  employeeId 	 name  phoneNumber salary 
	private String firstName;    
	private String lastName; 8+9+++++
-->
<table border>
	<tr><th>사번</th><th>이름</th><th>전화번호</th><th>급여</th></tr>
	<c:forEach var="emp" items="${emplist}">
	<tr><td>${emp.employeeId}</td>
		<td>${emp.firstName} ${emp.lastName}</td>
	    <td>${emp.phoneNumber}</td><td>${emp.salary}</td></tr>
	</c:forEach>
</table>
</body>
</html>