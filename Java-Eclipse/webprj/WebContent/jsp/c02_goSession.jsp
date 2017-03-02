<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// session 값 가져오기..
// session.getAttribute("key") ==> Object..
// Object이기에  해당 객체로 casting이 필요하다.
String session01 = (String)session.getAttribute("session01");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><center>
</center>
<h2>등록된 session값 : <%=session01%></h2>
<a href="c03_session.jsp">페이지로 이동</a>
</body>
</html>