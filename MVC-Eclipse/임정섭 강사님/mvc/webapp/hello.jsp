<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! private static final String DEFAULT_NAME="World";%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%--Determine the specified name(or user default) --%>
<%
	request.setCharacterEncoding("UTF-8");
	out.print("Welcome : ");
	String name = request.getParameter("name");
	if((name==null)||(name.length()==0)){
		name = DEFAULT_NAME;
	}
%>
<b>Hello.<%=name %></b>
<body>

</body>
</html>