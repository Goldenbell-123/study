<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
       import="webprj.z01_dbcon.A03_DatabasePrepare"
    	import="javastart.vo.*"
    
    %>
<%
A03_DatabasePrepare db = new A03_DatabasePrepare();
String number ="";
if(request.getParameter("number")!=null){
	number=request.getParameter("number");
};
String lastname="";
if(request.getParameter("lastname")!=null){
	number=request.getParameter("lastname");
};
System.out.print("number :"+number);

Emp search= new Emp();
search.setPhoneNumber(number);
search.setLastName(lastname);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><center>

<h1>emp list</h1>
	<form action="">
		<table>
			<tr>
			<td>phone number</td>
			<td><input type="text" name="nuber" value=<%=number %>></td>
			</tr>
			<tr>
			<td>last name</td>
			<td><input type="text" name="lastname" value=<%=lastname %>></td>
			</tr>
			<tr>
			<td colspan="2" align="right"><input type="submit" value="검색"></td>
			
			</tr>
		</table>
	
	
	</form>
	
	<table border>
		<tr><th>이름</th><th>전화번호</th><th>이메일</th><th>급여</th></tr>
		<%for(Emp e:db.getEmpList(search)){%>
		<tr>
			<td><%=e.getName() %></td>
			<td><%=e.getPhoneNumber() %></td>
			<td><%=e.getEmail() %></td>
			<td><%=e.getSalary() %></td>
		</tr>
		<%}%>
	</table>

</body>
</html>