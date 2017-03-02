<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Customer, webprj.z01_dbcon.A04_CustomDBCon"
    %>
<%
/*
	Customer ckcus = new Customer();
session.setAttribute("cus", ckcus);
*/

	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	Customer ckcus = new Customer();
	ckcus.setId(id);
	ckcus.setPass(pass);

	A04_CustomDBCon con = new A04_CustomDBCon();
	boolean isValid=con.ckLogin(ckcus);
	if(isValid){
		session.setAttribute("cus", ckcus);
	}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- 원격에 있는 jquery lib 활용 -->
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">
	var isValid = <%=isValid%>;
	//alert("전송된 isValid:"+isValid);
	// 인증되지 못했을 때는..
	if(!isValid){
		alert("인증되지 못한 사용자 입니다. 로그인 창으로 이동!")
		location.href="c30_login.jsp";
	}else{
		alert("로그인 성공");
		location.href="c31_prodList.jsp";		
		
	}
	$(document).ready(function(){
	});
</script>
</head>
<body><center><h1>
	<%=id%>님 환영합니다.
</h1>

</body>
</html>