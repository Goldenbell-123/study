<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR" 
    import="webprj.y01_vo.Person" 
    import="java.util.*"
    %>
<%
	Person p = new Person();
	p.setName("홍길동");
	p.setAge(29);
	p.setLocation("서울 강남");
%>    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">
	$(document).ready(function(){
		$("td").attr("align","center");
		$("td").attr("bgColor","yellow");
	});
</script>
</head>
<body>
<table align="center" border>
	<tr><td>이름</td><td><%=p.getName() %></td></tr>
	<tr><td>나이</td><td><%=p.getAge() %></td></tr>
	<tr><td>사는 곳</td><td><%=p.getLocation() %></td></tr>

</table>

</body>
</html>