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
<!-- 
			@RequestParam("num01") String name,
			@RequestParam("age01") int age,
			Model d){
		d.addAttribute("showName",name+"님 반가워요!!");
		d.addAttribute("age10","10년후 "+(age+10));

	-->
	<center>
	<form action="/springweb/form01.do" method="post">
	이름 : <input name="name01"/><br>
	나이 : <input name="age01"/><br>
	<input type="submit"/>
	</form>
	<h3>${showName}</h3>	
	<h3>${age10}</h3>	
</body>
</html>