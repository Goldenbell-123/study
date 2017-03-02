<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import= "webprj.y01_vo.Movie"%>
<%
   request.setCharacterEncoding("UTF-8");

	Movie m = new Movie();
	m.setName("더킹");
	m.setPrice(10000);
	m.setCnt(2);
	request.setAttribute("king", m);
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
<center>
<h1>영화명 : ${king.name}</h1>
<h1>가격 : ${king.price}</h1>
<h1>매표수 : ${king.cnt}</h1>
<h1>지불금액 : ${king.price*king.cnt}</h1>
</center>

<!-- 
request 객체에 데이터를
영화명, 가격, 매표수, 총금액 입력하고..
el로 출력 하세요..
	영화명 : @@@
	가격 :  @@@
	매표수 : @@@
	지불금액 : @@@
 -->
</body>
</html>