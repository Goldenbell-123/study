<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body> <center>
  <!--%for(int cnt=1;cnt<=10;cnt++) {%>
    <h1>하이<--%=cnt%></h1>
  <-- %}%-->
  확인 예제1번<br>
  <%!int sum; %>
  <%for(int cnt=1;cnt<=5;cnt++) {%>
  
	<%=cnt%>
	<% if(cnt!=5){%>
	+
	<%}else{%>
	 =
	<%}%>
	<%sum += cnt; %>
  <%}%>
  	<%=sum%>
  	<br>
  	확인 예제 2번
  	<table border=1px style="text-align: center;">
  		<tr>
  			<th>연산내용</th>
  			<th> 	<%sum = 0; %>
  					<%for(int cnt=1;cnt<=4;cnt++) {%>				  
					<%=cnt*2%>
					<% if(cnt!=4){%>
					+
					<%}else{%>
					 
					<%}%>
					<%sum += cnt*2; %>
				  <%}%>
				  	</th>
  		</tr>
  		<tr>
  			<th>결과</th><th><%=sum%></th>
  		</tr>
  	</table>
  	
 	확인예제 3번
 	<table border=1px style="text-align: center;">
 		<tr>
 			<%for(int idx=1;idx<=3;idx++) {%>
 			<th><%=idx%>단</th>
 			<%} %>
 		</tr>
 		<%for(int idx=1;idx<=3;idx++) {%>
 		
 			<tr>
 			<%for(int cnt=2;cnt<=4;cnt++) {%>
 				<td>
 				 <%=cnt%> * <%=idx%> = <%=cnt*idx%>
 				</td>
 			<%} %>
 			</tr>
 		<%} %>
 	</table>
  <!--
  확인 예제 1
    중앙정렬해서 1 + 2 + 3 + 4 + 5
    출력
  확인 예제 2
	테이블에 넣어서 
	연산내용 2 + 4 + 6 + 8
	결과값
  -->
</body>
</html>
