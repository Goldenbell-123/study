<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"
    import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%	
   request.setCharacterEncoding("UTF-8");
ArrayList<Product> plist = new ArrayList<Product>();
plist.add(new Product("사과",3)); 
plist.add(new Product("바나나",5));
plist.add(new Product("딸기",7));
request.setAttribute("prodList", plist);
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
<body><center>
<c:set var="sum" value="0"/>
<!-- 
forEach
	var : 반복문에 쓰일 변수 지정
	begin : 시작 변수,
	end : 마지막 변수
	step : 변경 단위
	varStatus : 변수에 대한 상태 처리 변수 지청.
		index : index값 호출 - 객체
		count: 순서값..
		first : 초기값인지 여부 호출 boolean
		last : 마지막값인지 여부 호출
 -->
<h1>1~10까지 합산..</h1>
<h2>
	<c:forEach var="cnt" begin="1" end="10" step="1" varStatus="status">
		${cnt} <c:if test="${!status.last }">+</c:if>
		 <c:set var="sum" value="${sum+cnt}"/>
		 
	</c:forEach>
</h2>
<h2>결과값: ${sum}</h2>
<h1>과일 목록</h1>
<!-- items : controller에서 보낸 setAttribute("key","value") -->
<table border>
	<tr><th>no</th><th>과일명</th><th>갯수</th></tr>
	<c:forEach var="prod" items="${prodList}" varStatus="sts">
		<tr><td>${sts.index}=>${sts.count}</td>
			<td>${prod.name}</td>
			<td>${prod.cnt}</td></tr>
	</c:forEach>
</table>
</body>
</html>