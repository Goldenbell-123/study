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
	<div align="center">
		Sevlet / JSP
	</div>
	<hr/>
	<div align="right">
		<form action="login.do" method="post">
			<label>아이디</label>
			<input type="text" name="id" id="id">
			<label>패스워드</label>
			<input type="password" name="pwd" id="pwd">
			<input type="submit" value="LOGIN">
			&nbsp;&nbsp;
			<a href="joinform.do">[회원가입]</a><!-- 앵커테그 -->
			
		</form>
	</div>
</body>
</html>