<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.ArrayList" %>
	<%@ page import="board.vo.BoardVO" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
    
<%int cnt=1; int cntt=1;%>
<%	
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
	<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/navbar-fixed-top.css" rel="stylesheet">  <%--navbar --%>
    <link href="./css/carousel.css" rel="stylesheet"> <%--carousel --%>
    <link href="./css/theme.css" rel="stylesheet"> <%--theme --%>
    <style type="text/css">
    	.tab-content {
    		padding: 10px 0;
    	}
    </style>
    
    <script src="./assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
<%-- navbar --%>
<%@ include file="navbar.jsp" %>

<%-- carousel --%>
<%@ include file="carousel.jsp"%>

<%-- body --%>
	<div class="page-header">
		<h5>공지사항</h5>
	</div>
	<ul class="nav nav-tabs" role="tablist">
		<li role="presentation" class="active">
			<a href="#bbs" data-toggle="tab">공지사항</a></li>
		<li role="presentation">
			<a id="custab" href="#customer" data-toggle="tab">고객센터</a></li>
	</ul>
	<div class="tab-content">
		<div id ="bbs" class="tab-pane active">
			<div class="row">
				<div class="col-sm-3">
					<table class="table table-striped">
						<thead>
							<tr><th>번호</th><th>제목</th><th><i class="glyphicon glyphicon-plus"></i></th></tr>
						</thead>
						<tbody>
							<c:forEach items="${boards}" var="board">
							<tr><td> <%=cnt++%> </td><td colspan="2">${board.title}</td></tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="customer" class="tab-pane">
			<div class="row">
				<div class="col-sm-3">
					<table class="table">
						<thead>
							<tr><th>번호</th><th>제목</th></tr>
						</thead>
						<tbody id="customerbody">
							
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>



		<%-- js --%>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
		<script src="./dist/js/bootstrap.min.js"></script>

		<%--navbar --%>
		<script src="./assets/js/ie10-viewport-bug-workaround.js"></script>

		<%--carousel --%>
		<script src="./assets/js/docs.min.js"></script>
		
		<script type="text/javascript">
			$(document).ready(function(){
				$("#custab").on("click",function(){
					$.ajax({
						url  : "cusbbs.ajax",
						type : "post",
						dataType : "json",
						success : function(ary) {
							var txt = "";
							$.each(ary, function(idx, obj){
								txt +="<tr><td>"+obj.seq+"</td><td>"+obj.title+"</td>/tr>"
							});
							$("#customerbody").html(txt);
						}
					})
				});
			})
			
		</script>
</body>
</html>