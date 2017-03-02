<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
// 스크립트 자바코드..
String title="안녕하세요! jsp입니다.";
int num01=5;
int num02=7;
int sum=num01+num02;

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body><center>
<h1>안녕....<%=title%></h1>
<table width="200" border>
<!-- -->
	<tr><td align="center">
	<%=num01%> + <%=num02 %>
	 = <%=sum %></td></tr>
</table>
</body>
</html>