<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    %>
<%
// session 저장
// setAttribute("key",value);
session.setAttribute("session01","himan");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align = "center">세션값 저장 페이지!!</h1>
	<center>
		<a href="c02_goSession.jsp">페이지로 이동</a>
</body>
</html>