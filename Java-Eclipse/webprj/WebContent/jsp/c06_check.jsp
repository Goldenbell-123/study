<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Customer, webprj.z01_dbcon.A04_CustomDBCon"
    %>
<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	Customer ckcus = new Customer();
	ckcus.setId(id);
	ckcus.setPass(pass);
/*
넘겨온 데이터가 인증된 데이터이면, session처리..
아니면, 원래 페이지로 이동처리..
// VO객체 id, pass 입력할 수 있는 객체로 session 값 setting

	//  webprj.z01_dbcon.A04_CustomDBCon
		A04_CustomDBCon con = new A04_CustomDBCon();
		Customer ckcus = new Customer();
		ckcus.setId("홍길동");
		ckcus.setPass("8888");
		System.out.println(con.ckLogin(ckcus));
*/
	A04_CustomDBCon con = new A04_CustomDBCon();
	boolean isValid=con.ckLogin(ckcus);
	if(isValid){
		session.setAttribute("cus", ckcus);
	}
/*
1) db 구성 및 데이터 입력..
2) VO
3) DB 모듈 구성..select * 
               from @@@@
               where id = @@
                 and pass = @@
4) DB 모듈 호출 처리..                 

*/	
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
		location.href="c05_login.jsp";
	}else{
		alert("로그인 성공");
		location.href="c07_main.jsp";		
		
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