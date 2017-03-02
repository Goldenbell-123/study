<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"
    import="java.util.*"
    %>
<%
request.setCharacterEncoding("UTF-8");
ArrayList<Product> cartFruits = (ArrayList<Product>)session.getAttribute("cartFruits");

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
			alert("쇼핑 페이지 이동");
			$(location).attr("href","c20_buyProd.jsp");
			
		});
	});
</script>

</head>
<body><center>
<h2>장바구니 목록</h2>
<table border>
	<tr><th>ch</th><th>물건명</th><th>갯수</th></tr>
	<%for(Product p:cartFruits){ %>
	<tr><td><input type="checkbox" name="ck"></td>
		<td><%=p.getName()%></td>
		<td><%=p.getCnt()%></td></tr>
	<%}%>		
</table>
<input type="button" id="reBuy" value="다시 구매하시겠습니까?"/>
</body>
</html>