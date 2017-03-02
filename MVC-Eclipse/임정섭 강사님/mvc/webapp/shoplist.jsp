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
	${loginUser.name}님 구매하실 상품을 선택해주세요.
	<p/>
	드림카를 선택하세요 :
	
	<form action="shopcart.do">
		<select name="item">
			<option value="BMW">BMW</option>
			<option value="AUDI">AUDI</option>
			<option value="BENS">BENS</option>
			<option value="HUYNDAI">HUYNDAI</option>
			<option value="KIA">KIA</option>
		</select>
		<input type="submit" value="장바구니 담기">
	</form>

</body>
</html>