<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     import="webprj.y01_vo.Customer"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function logout(){
		if(confirm("로그 아웃 하시겠습니까?")){
			location.href="c05_login.jsp"
		}
	}
</script>
</head>
<%
String id="";
if(session.getAttribute("cus")!=null){
	Customer cus=(Customer)session.getAttribute("cus");
	id=cus.getId();
}
%>
<body>
<p align="right"><%=id %>님 로그인 중<br>
<a href="javascript:logout()">로그아웃</a></p>
</body>
</html>