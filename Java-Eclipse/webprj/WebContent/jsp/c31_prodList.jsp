<%@page import="javax.swing.event.CaretListener"%>
<%@page import="oracle.net.aso.p"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Customer"
    import="webprj.y01_vo.Product"
%>
<%
request.setCharacterEncoding("UTF-8");
Customer ckcus=null;
// 로그인 되지 않았을 때 , 현재 페이지를 호출할 때,
// 로그인 하게 처리..
boolean ckLogin=false;
if(session.getAttribute("cus")!=null){
	ckcus= (Customer)session.getAttribute("cus");
	ckLogin=true;
}
/*
	장바구니 담기 ...session  담기 처리..
	login에서 들어온 내용 처리하기 위해..
	예외처리해야됨
*/
ArrayList<Product> cartList= new ArrayList<Product>();
if(request.getParameter("name")!=null){
	String name= request.getParameter("name");
	int cnt= Integer.parseInt(request.getParameter("cnt"));
	//객체에 session값으로 setting..

	if(session.getAttribute("cartList")!=null){
		cartList=(ArrayList<Product>)session.getAttribute("cartList");
	}
	Product adProd = new Product();
	adProd.setName(name);
	adProd.setCnt(cnt);
	cartList.add(adProd);
	session.setAttribute("cartList", cartList);
	
	
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
	var ckLogin=<%=ckLogin%>
	//로그인 session값이 없을 때, 다시 로그인페이지로 이동..
	if(!ckLogin){
		alert("현재 로그인 하셔야 \n화면을 볼 수 있습니다!")
		location.href="c30_login.jsp";
	}

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
			$("form").submit();
			// form의 action값을 query에서 지정..
		});
		
		$("#showcart").click(function(){
			alert("장바구니 보기로 이동");
			location.href="c32_cartList.jsp";
		});
	});
	function logout(){
		if(confirm("로그아웃 하시겠습니까?")){
			location.href="c30_login.jsp";
		}
	}
</script>

</head>
<body><center>
<h1>구매할 과일.</h1>
<%if(ckLogin){ %>
<p align="right"><%=ckcus.getId()%>님 로그인중<br>
	<a href="javascript:logout()">로그아웃</a></p>
<%}%>
<hr>
<h3 align="right">현재 장바구닝에 담겨진 물건갯수 : <%=cartList.size()%></h3>
<form method="post">
<table>
	<tr>
		<td>과일명</td>
		<td><input type="text" name="name"/></td></tr>
	<tr>
		<td>갯수</td>
		<td><input type="text" name="cnt"/></td></tr>
	<tr>
		<td colspan="2"><input id="sndBtn" type="button" value="장바구니 담기"/>
						<input id="showcart" type="button" value="장바구니 보기"/></td></tr>
	</table>
</form>

</center>

</body>
</html>