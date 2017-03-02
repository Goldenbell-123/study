<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String id = request.getParameter("id");
// request는 맞는지 안맞는지 여부 따짐 getparameter 넘어온 정보중 name을 받아옴
   String pass = request.getParameter("pass");
   boolean success = true;
   if(!id.equals("himain")){
      success = false;
   }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%if(success == true){ %>
<h1>로그인 성공, <%=id %>님 환영합니다!</h1>
<%} else { %>
<h1>잘못된 사용자 정보를 입력하셨습니다.</h1>
<%} %>
<h2>받은 값 ID : <%=id %></h2>
<h2>받은 값 PASS : <%=pass %></h2>
<a href="b01_form.jsp">로그인 페이지로 이동</a>
</body>
</html>