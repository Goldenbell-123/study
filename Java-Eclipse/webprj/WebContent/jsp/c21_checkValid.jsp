<%@page import="oracle.net.aso.p"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"
    import="webprj.z01_dbcon.A05_ProductDBCon"
    import="java.util.*"

    %>
<%
request.setCharacterEncoding("UTF-8");

boolean isValid=false;
String name=request.getParameter("name");
//webprj.z01_dbcon.A05_ProductDBCon
A05_ProductDBCon db = new A05_ProductDBCon();
isValid=db.ckValid(new Product(name));

if(isValid){
	// session에 과일명과 가격 setting..
	Product p = new Product();
	p.setName(name);
	p.setCnt(new Integer(request.getParameter("cnt")));
	// 현재 session에 있는 ArrayList 가져옴..
	// 없으면 만듬.
	ArrayList<Product> cartFruits= null;
	
	if(session.getAttribute("cartFruits") != null){
		cartFruits=(ArrayList<Product>)session.getAttribute("cartFruits");
				
	}else{
		cartFruits= new ArrayList<Product>();
	}
	
	//물건 담기..
	cartFruits.add(p);
	
	//세션에 물건 다시 담기..
	session.setAttribute("cartFruits",cartFruits);
}

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
<script type="text/javascript"
	 src="../jqueryLib/jquery-1.10.2.js">
</script>
<script type="text/javascript">
	var isValid = <%=isValid%>;
	if(isValid){
		alert("장바구니 목록확인..");
		location.href="c22_main.jsp";
	}else{
		alert("판매하는 물건이 아닙니다. \n 물건을 다시 장바구니에 담습니다.");
		location.href="c20_buyProd.jsp";
	}


	$(document).ready(function(){
	});
</script>

</head>
<body>
</body>
</html>