<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("cus")!=null){
	// 현재 session을 초기화처리..
	session.invalidate();
	
}
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<!-- 원격에 있는 jquery lib 활용 -->
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">
	$(document).ready(function(){
	});
	function send(){
		// jquery   tag[속성=속성값]
		var idVal=$("input[name=id]").val();
		var passVal=$("input[name=pass]").val();
		//alert(idVal);
		// 조건 체크 return : 해당 조건이 있을 때, 그 다음 프로세스로
		// 넘겨가지 못하게 처리..
		// 입력값이 있을 때만 서버로 데이터 넘기는 처리 브라우저단에서
		// 처리..
		if(idVal.trim()==""){
			alert("아이디 값이 입력하세요!");
			$("input[name=id]").focus();
			return;
		}
		if(passVal.trim()==""){
			alert("패스워드값 입력하세요.");
			$("input[name=pass]").focus();
			return;
		}	
		$("form").submit(); // 현재 form에 있는 객체 데이터 서버로 넘김..
	}
</script>
</head>
<body><center>
<h2>로그인</h2>
<form action="c06_check.jsp">
<table border>
	<tr><td>ID</td>
		<td><input type="text" name="id"/></td></tr>
	<tr><td>PASSWORD</td>
		<td><input type="password" name="pass"/></td></tr>
	<tr><td colspan="2" align="center">
		<input type="button" value="확인"  
		  onclick="javascript:send();"/>
		</td>
	</tr>
</table>
</form>
</center>
</body>
</html>