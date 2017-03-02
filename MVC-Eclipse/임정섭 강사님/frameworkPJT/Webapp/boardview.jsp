<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "board.vo.BoardVO" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
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



<%-- body --%>

<h2 class="sub-header">글 상세보기</h2>
    <div class="table-responsive ">
	    <table class="table">
	    <thead>
        </thead>
        <tbody>
         	<tr>
        		<th>작성자</th><td>${board.writer}</td><th>조회수</th><td>${board.cnt}</td>
        	</tr>
          	<tr>
     			<th>제목</th><td colspan="3">${board.title}</td>
	        </tr>
	        <tr>
	        	<th>내용</th>
	        	<td colspan="3" >${board.content}</td>
	        </tr>
	        
        </tbody>
       </table>
       

	</div>
		<div  class="" align="center">
			<button id="cancleBtn" class="btn btn-primary" >수정완료</button>
			<button id="cancleBtn" class="btn btn-success" >작성하기</button>
			<button id="cancleBtn" class="btn btn-danger" >작성취소</button>
			
		</div>
	
	  <div class="row">
        <div class="col-md-12">
          <table class="table table-bordered">
				<tr><th style="width: 70px">제목</th><td>${boards.title}</td></tr>
				<tr><th >작성자</th><th>${boards.writer}</th></tr>
				<tr><th >작성일</th><td>${boards.regDate}</td></tr>
				<tr><th>내용</th><td style="height: 200px">${boards.content}</td></tr>
          </table>
        </div>
      </div>
	
	<div class="form-group" align="right">
		<label class = "col-xs-2 col-lg-2 control-label">댓글달기</label> 
		<div class="col-xs-8 col-lg-8">
			<input type="text" id="rcontent" name="rcontent"
					class="form-control" placeholder="내용">
		</div><button id ="replyBtn" type="button"
				class="btn btn-primary col-xs-2 col-lg-2">댓글작성</button>
	</div>
	<div>
		<%--
		x버튼 만들기
		로그인 사용자만 삭제하기
		<c:forEach>
		</c:forEach>
		 --%>
	</div>
	
	
	
	
	
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/docs.min.js"></script>
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>
	<script type = "text/javascript">
		$(document).ready(function(){
			$("#replyBtn").on("click",funtion(){
				alert(${board.seq});
				alert($("#rcontent").val());
				alert(${"#loginUser.name"});
				/*
				$.ajax();
				*/
			})
		})
	
	</script>
</body>
</html>