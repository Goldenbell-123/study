<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
   request.setCharacterEncoding("UTF-8");
/*Controller*/
Product p = new Product();
p.setName("사과");
p.setCnt(5);
request.setAttribute("prod", p);
%>
<c:set var="prod01" value="${prod}"/>
<!-- target : 객체 변수 property set @@@ 
	prod01.setName("바나나")
	-->
<c:set target ="${prod01}" property="name" value="바나나"/>
<c:set target ="${prod01}" property="cnt" value="10"/>
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
	alert("물건명: ${prod01.name}");
	var name = "${prod01.name}";
	var cnt = "${prod01.cnt}";
	alert(name+":"+cnt);
$(document).ready(function(){
});
</script>

</head>
<body>
<c:set var="name" value="홍길동"/>
<c:set var="price" value="2000"/>
<c:set var="cnt" value="2"/>

<h1>${name}</h1>
<h1>${price}</h1>
<h1>${price*cnt}</h1>

</body>
</html>