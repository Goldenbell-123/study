<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Calcu"
    %>
<%
request.setCharacterEncoding("UTF-8");
Calcu c = new Calcu();
if(request.getAttribute("calcu")!=null){
	c=(Calcu)request.getAttribute("calcu");
	
}
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
<form action="/webprj/mvc03" method="post">
	<input type="text" name="num01" value="<%=c.getNum01()%>"> +
	<input type="text" name="num02" value="<%=c.getNum02()%>"> =
	<%=c.getSum()%>
	<br>
	<input type="submit" value="계산">
</form>
</body>
</html>