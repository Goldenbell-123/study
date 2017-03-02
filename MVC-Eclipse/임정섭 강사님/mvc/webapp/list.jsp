<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="boardmodel.vo.BoardVO" %>

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
	<label>jsp tag를 활용한 테이블에 데이터 출력</label>
	<%--
		<%
		HSR request, HSR response
		%> ->scirptlet tag역할을 함 (doGet|doPost)
	--%>
	<p/>
	<table border="1">
		<tr>
			<th>게시물번호</th><th>제목</th><th>작성자</th><th>조회수</th>
		</tr>
		<c:forEach items="${boards}" var="board">
		<tr>
			<td>${board.seq}</td>
			<td>${board.title}</td>
			<td>${board.writer}</td>
			<td>${board.cnt}</td>
		</tr>
		</c:forEach>
	</table>
	
	
</body>
</html>