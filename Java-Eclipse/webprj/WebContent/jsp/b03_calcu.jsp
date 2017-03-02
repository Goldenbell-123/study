<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%
	String show="";
	int num01=0;
	int num02=0;
	int calIdx=0;
	if(request.getParameter("num01")!=null){
		num01=Integer.parseInt(request.getParameter("num01"));
	}
	if(request.getParameter("num02")!=null){
		num02=Integer.parseInt(request.getParameter("num02"));
	}	
	if(request.getParameter("cal")!=null){
		calIdx=Integer.parseInt(request.getParameter("cal"));
		String cal[]={" + "," - "," * "," / "};
		int sum[]={num01+num02,num01-num02,num01*num02,num01/num02};
		show=num01+cal[ calIdx ]+num02+" = "+sum[ calIdx ];
	}		
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body><center>
<%if(show.equals("")){ %>
<h1>계산기</h1>
<form>
	<input type="text" size="2" name="num01"/>
	<select name="cal">
		<option value="0">+</option>
		<option value="1">-</option>
		<option value="2">*</option>
		<option value="3">/</option>
	</select>
	<input type="text" size="2" name="num02"/><br>
	<input type="submit" value="계산" />
</form>
<%}else{%>
	<%=show%><br>
	<a href="b03_calcu.jsp">계산기페이지 이동</a>
<%}%>
</body>
</html>