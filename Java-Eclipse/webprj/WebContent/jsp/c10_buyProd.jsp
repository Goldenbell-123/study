<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(session.getAttribute("buyFruit")!=null){
	session.invalidate();
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
	$(document).ready(function(){
		$("#sndBtn").click(function(){
			var $name=$("input[name=name]");
			var $cnt=$("input[name=cnt]");
			//alert($name.val()+":"+$cnt.val());
			if($name.val().trim()==""){
				alert("과일명 입력하세요!!");
				return;
			}
			if($cnt.val().trim()==""){
				alert("갯수 입력하세요!!");
				return;
			}
			// form의 action값을 query에서 지정..
			$("form").attr("action","c11_checkValid.jsp");
			$("form").submit();
			
		});
	});
</script>

</head>
<body><center>
<h1>구매할 과일.</h1>
<form method="post">
<table>
	<tr><td>과일명</td><td><input type="text" name="name"/></td></tr>
	<tr><td>갯수</td><td><input type="text" name="cnt"/></td></tr>
	<tr><td colspan="2"><input id="sndBtn" type="button" value="구매"/></td></tr>
	
</table>
</form>
</center>

</body>
</html>