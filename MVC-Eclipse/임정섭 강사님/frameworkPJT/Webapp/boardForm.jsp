<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    
	<!-- css -->
	<link href="./dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/navbar-fixed-top.css" rel="stylesheet">
    <link href="./css/dashboard.css" rel="stylesheet">
    
    <style type="text/css">
    </style>
    
    <!-- script -->
    <script src="./assets/js/ie-emulation-modes-warning.js"></script>
</head>
<body>
	
	<%-- navbar --%>
	<%@ include file="navbar.jsp" %> 
	
	<%-- body --%>
	<h2 class="sub-header">글쓰기</h2>
	<form role="form" class="form-horizontal" action="boardinsert.do" method="post"> <%--   writeFmt--%> 
		<div class="form-group">
			<label class="col-xs-3 col-lg-3 control-label">작성자</label>
			<div class="col-xs-5 ol-lg-5">
				<input type="text" id="writer" name="writer"
						class="form-control" placeholder="작성자"
						value="${loginUser.name}" readonly/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-xs-3 col-lg-3 control-label">제목</label>
			<div class="col-xs-5 ol-lg-5">
				<input type="text" id="title" name="title"
						class="form-control" placeholder="제목"/>
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-xs-3 col-lg-3 control-label">내용</label>
			<div class="col-xs-5 ol-lg-5">
				<textarea id="content" name="content"
						rows="5" class="form-control " placeholder="작성할 내용을 입력하세요." ></textarea>
			</div>
		</div>
		<div  class="form-group" align="center">
			<button id="writeBtn" class="btn btn-primary">작성완료</button>
		</div>
	</form>
	
		<div  class="form-group" align="right">
			<button id="cancleBtn" class="btn btn-danger" >작성취소</button>
		</div>
		
	
		
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/docs.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
			$("#writeBtn").on("click",function() {
				var title = $("#title").val();
				var content = $("#content").val();
				
				if(title == ''){
					alert("제목을 입력해 주세요.");
					 $("#title").Focus();
				}else if(contet == ''){
					alert("내용을 입력해주세요.");
					$("#contet").Focus();
				}else{
					$("#writeFmt")
					.prop("action","boardinsert.do")
					.prop("method","post")
					.submit();
				}
				
				
			});
			
			$("#cancleBtn").on("click",function() {
				location.href="boardlist.do";
			});
		})   
		
		
		
    </script>
</body>
</html>








