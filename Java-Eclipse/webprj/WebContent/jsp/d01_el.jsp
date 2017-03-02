<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="webprj.y01_vo.Person"%>
<%
   request.setCharacterEncoding("UTF-8");

// 변수 지정..
request.setAttribute("greet", "안녕하세요");

// 변수 지정..
request.setAttribute("greet", "안녕하세요");
request.setAttribute("num01", "1");
request.setAttribute("num02", "2");

Person p = new Person();
p.setName("홍길동");
p.setAge(25);
p.setLocation("서울");
request.setAttribute("person", p);
/// ${person.name}
//		객체.getNamte을 호출함
//      변수가 아닌 해당 객체의 메서드를 호출함.
//  request.getAttribute("greet") --> ${greet}
//  null값에 대한 처리를 포함한다. null 일때는ㄴ 공백으로 처리된다.
// request.getParameter("name")-- > #{param.name}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript" 
		src="../jqueryLib/jquery-1.10.2.js">	
</script>

<style type="text/css">	
</style>

<script type="text/javascript">
$(document).ready(function(){
});
</script>

</head>
<body>
<center>
<h1> ${greet}</h1>
<h1> 데이터가? ${greet01}</h1><!-- 정해지지않는 변수는 오류대신 공백으로 처리됨 -->
<h1> ${num01}+${num02}=${num01+num02}</h1>
<h1> ${num01}-${num02}=${num01-num02}</h1>
<h1> ${num01}/${num02}=${num01/num02}</h1>
<h1> ${num01}*${num02}=${num01*num02}</h1>
<h1> 이름: ${person.name}</h1>
<h1> 나이: ${person.age}</h1>
<h1> 사는 곳: ${person.location}</h1>
<h1> 지정되지 않는 메서드 : ${person.location}</h1>
<!-- 
request 객체에 데이터를
영화명, 가격, 매표수, 총금액 입력하고..
el로 출력 하세요..
	영화명 : @@@
	가격 :  @@@
	매표수 : @@@
	지불금액 : @@@
 -->
</center>
</body>
</html>