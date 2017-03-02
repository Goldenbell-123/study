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
	<form action="join.do" method="post">
		<label>아이디</label>
		<input type="text" 		name="id"		id="id"><br/>
		<label>패스워드</label>
		<input type="password" 	name="pwd"		id="pwd"><br/>
		<label>이름</label>
		<input type="text" 		name="name"		id="name"><br/>
		<label>이메일</label>
		<input type="text" 		name="email" 	id="email"><br/>
		<label>성별</label>
		<select name="gender">
			<option value="f">여자</option>
			<option value="m">남자</option>
		</select><br/>
		<label>전화번호</label>
		<input type="text" 		name="phoneNumber" id="phoneNumber"><br/>
		<input type="submit" 	value="JOIN">
	</form>
</body>
</html>