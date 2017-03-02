<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<body> 
<!-- 
request 객체에 데이터를
영화명, 가격, 매표수, 총금액 입력하고..
el로 출력 하세요..
	영화명:@@@
	가격 : @@@
	매표수 :@@@
	지불금액:@@@
 -->
<table align="center">
	<tr><td>영화명</td><td>${movie.name}</td></tr>
	<tr><td>가격</td><td>${movie.price}</td></tr>
	<tr><td>매표수</td><td>${movie.cnt}</td></tr>
	<tr><td>지불금액</td><td>${movie.price*movie.cnt}</td></tr>
</table>
<form method="post"><!-- 이 페이지를 호출한 controller단 호출.. -->
<table align="center" >
	<tr><td>다음 영화명</td><td><input name="title" 
	                                value="${param.title }"/></td></tr>
	<tr><td>가격</td><td><input name="price"
	                               value="${param.price }"/></td></tr>
	<tr><td>매표수</td><td><input name="cnt"
	 							   value="${param.cnt }"/></td></tr>
	<tr><td>지불금액</td><td>${param.price*param.cnt}</td></tr>
	<tr><td>좋아하는영화1</td><td><input name="favor"/></td></tr>
	<tr><td>좋아하는영화2</td><td><input name="favor"/></td></tr>
	<tr><td>좋아하는영화3</td><td><input name="favor"/></td></tr>
	<tr><td>좋아하는영화4</td><td><input name="favor"/></td></tr>

</table>
<table align="center" >
	<tr><td>조건(null이거나 공백)</td><td>${empty param.title01}</td></tr>
	<tr><td>조건(이상)</td><td>${param.price>9000}</td></tr>
	<tr><td>3항연산자처리..</td>
		<td>${param.price*param.cnt>15000?"비용이 많이..":"저렴"}</td></tr>
	<tr><td>좋아하는영화1</td><td>${paramValues.favor[0]}</td></tr>
	<tr><td>좋아하는영화1</td><td>${paramValues.favor[1]}</td></tr>
	<tr><td>좋아하는영화1</td><td>${paramValues.favor[2]}</td></tr>
	<tr><td>좋아하는영화1</td><td>${paramValues.favor[3]}</td></tr>
	<tr><td colspan="2" align="center"><input type="submit"/></td></tr>

</table>	

</form>
</body>
</html>