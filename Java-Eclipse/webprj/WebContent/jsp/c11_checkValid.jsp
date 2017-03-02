<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Product"
    import="webprj.z01_dbcon.A05_ProductDBCon"
    %>
<%
request.setCharacterEncoding("UTF-8");

boolean isValid=false;
String name=request.getParameter("name");
//webprj.z01_dbcon.A05_ProductDBCon
A05_ProductDBCon db = new A05_ProductDBCon();
isValid=db.ckValid(new Product(name));

/*
String[] validFruits={"사과","바나나","딸기"};
for(String fname:validFruits){
	if(fname.equals(name)){
		isValid=true;
	}
}
*/
/*
DB에서 해당 내용 여부 check하기..
1. DB설계 - 테이블 만들기..
   과일명을 담는 내용, 재고량?
2. sql 구성 
   select 1 from fruit where name=?
   select * from fruit
   where name='사과'		   
3. DB모듈 작성..
   sql
   rs.next(); // 데이터 있는지 여부 boolean  return
4. jsp ck처리..
	입력받은 값을  VO 객체에 할당..
	DB모듈 생성..
	check하는 모듈을 호출 처리..
	데이터가 있는지 여부에 따라 
	   session 처리 -main페이지 이동
	    초기 페이지로 이동..- 입력화면 이동
	

*/



if(isValid){
	// session에 과일명과 가격 setting..
	Product p = new Product();
	p.setName(name);
	p.setCnt(new Integer(request.getParameter("cnt")));
	session.setAttribute("buyFruit", p);
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
		location.href="c12_main.jsp";
	}else{
		alert("판매하는 과일이 아닙니다.");
		location.href="c10_buyProd.jsp";
	}


	$(document).ready(function(){
	});
</script>

</head>
<body>
</body>
</html>