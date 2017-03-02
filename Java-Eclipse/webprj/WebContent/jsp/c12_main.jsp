<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"
    %>
<%
request.setCharacterEncoding("UTF-8");
Product p = (Product)session.getAttribute("buyFruit");

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
		$("#reBuy").click(function(){
			alert("구매 페이지 이동");
			$(location).attr("href","c10_buyProd.jsp");
			
		});
	});
</script>

</head>
<body><center>
<h3>현재 구매한 과일:<%=p.getName()%>, 갯수:<%=p.getCnt() %></h3>
<input type="button" id="reBuy" value="다시 구매하시겠습니까?"/>
</body>
</html>