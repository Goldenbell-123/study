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
<title>메인 페이지</title>
</head>
<body>
	<div align="center">
		MVC Framework with ACORN
	</div>
	<div align="right">
		<c:if test="${ loginUser == null }">
			<form action="login.do" method="post">
				<label>아이디</label>
				<input type="text" name="id" id="id">
				<label>패스워드</label>
				<input type="password" name="pwd" id="pwd">
				<input type="submit" value="LOGIN">
				&nbsp;&nbsp;
				<a href="join.do">[회원가입]</a>
			</form>
		</c:if>
		<c:if test="${ loginUser != null }">
			${loginUser.name}님 환영합니다.
			<a href="logout.do">[로그아웃]</a>
		</c:if>
		
	</div>
	<div>
		<a href="shoplist.do">[쇼핑 리스트]</a>
	</div>

</body>
</html>