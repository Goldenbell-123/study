<%@page import="javax.swing.event.CaretListener"%>
<%@page import="oracle.net.aso.p"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Customer"

%>
<%
request.setCharacterEncoding("UTF-8");
Customer ckcus= new Customer();
if(request.getAttribute("ckcus")!=null){
	
}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	tr{text-align:center;}
</style>
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">

</script>

</head>
<body><center>
<h1>회원 검색 테이블.</h1>

<hr>
<form action="/webprj/mvcPerson" method="post">
<table>
	<tr>
		<td>회원번호</td>
		<td><input type="text" name="num01" value="<%=getNum01()%>"></td></tr>
	<tr>
		<td></td>
		<td><input type="text" name="cnt"/></td></tr>
	<tr>
		<td colspan="2"><input id="sndBtn" type="button" value="장바구니 담기"/>
						<input id="showcart" type="button" value="장바구니 보기"/></td></tr>
	</table>
</form>

</center>

</body>
</html>