<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "board.vo.BoardVO" %>
<%@ page import="java.util.ArrayList"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"> <%-- 모바일 디바이스에서 접속 시 지원할 Size --%>

<title>Board List</title>

    <link href="./dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./dist/css/bootstrap-theme.min.css" rel="stylesheet">
    <link href="./theme.css" rel="stylesheet">
    <script src="./assets/js/ie-emulation-modes-warning.js"></script>


</head>
<body>

	<%-- Nav --%>
	<%@ include file = "navbar.jsp" %>


	

	<div class="container">
	
	<h2 class="sub-header">[게시물]</h2>

	  <div class="row">
        <div class="col-md-12" align="center">
          <table class="table" >
            <thead>
              <tr>
                <th width="5px">No</th>
                <th>제목</th>
                <th>작성자</th>
                <th>작성일</th>
                <th>조회수</th>
              </tr>
            </thead>
            <tbody id="searchLayer">
            <%-- 
			<c:forEach items="${boards}" var="board">
			<tr>
						<td>${board.seq}	</td>
						<td><a href="boardview.do?seq=${board.seq}">${board.title}</a></td>
						<td>${board.writer}	</td>
						<td>${board.regDate}</td>
						<td>${board.cnt}	</td>
			</tr>
			</c:forEach>
			--%>
			<c:forEach items="${boards}" var="board">
			<tr>
						<td>${board.seq}	</td>
					<%--<td><button data-toggle="modal" data-target="#viewModal" type="button" id="viewBtn">${board.title}</button></a></td>--%>
						<td><a href="javascript:showModal(${board.seq})">${board.title}</a></td>
						<td>${board.writer}	</td>
						<td>${board.regDate}</td>
						<td>${board.cnt}	</td>
			</tr>
			</c:forEach>		
            </tbody>
          </table>
        </div>
      </div>
	</div>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/docs.min.js"></script>
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>


	<!-- Join Modal -->
	<div class="modal fade" id="insertModal" align="center">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"><h4>게시물 작성</h4></div>
					<div class="modal-body">
						<form action="boardinsert.do" method="post">
							<table>
								<tr><th>아아디</th><td><input type="text" id="writer" name="writer" value="${loginUser.name}" readonly="readonly" size="10%"></td></tr>
								<tr><th>제목</th><td> <input  class="form-control" type="text" 	name="title"	id="title"   placeholder="제목을 입력하세요." size="50%"></td></tr>
								<tr><th>내용</th><td><input  class="form-control" type="text" 	name="content"	id="content" placeholder="내용을 입력하세요." size="50%" style="height: 50%"></td></tr>
								<tr>
									<td >
									<button class="btn btn-primary" data-dismiss="modal" style="width: 100%">Close</button></td>
									<td >
									<button class="btn btn-primary" type="submit" style="width: 100%">Write</button></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>


	<!-- Board Modal -->
	<div class="modal fade" id="boardModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header"><h4>자유게시글</h4></div>
					<div class="modal-body">
						<form id="updateFrm" action="boardupdate.do" method="post">
							<table class="table table-bordered">
						<%--글 확인 부분 --%>
							<tr><th>제목</th><td id="utitle" colspan="2"></td></tr>
							<tr><th>작성자</th><th id="uwriter" colspan="2"></th></tr>
							<tr><th>작성일</th><td id="uregDate" colspan="2"></td></tr>
							<tr><th>내용</th><td style="height: 200px" id="ucontent" colspan="2"></td></tr>	
							<tr><th>수정제목</th><td ><input type="text" id="updateTitle" name="updateTitle" value=""></td></tr>
							<tr><th>수정콘텐츠</th><td ><input type="text" id="updateContent" name="updateContent" value=""></td></tr>
							
							</table>
							</form>
								
						<%-- 댓글 다는 부분 --%>
							<div class="modal-footer">
							<label class = "col-xs-2 col-lg-2 control-label">댓글달기</label> 
							<div class="col-xs-8 col-lg-8">
								<input type="text" id="rcontent" name="rcontent"
										class="form-control" placeholder="내용">
							</div><button id ="replyBtn" type="button"
											class="btn btn-primary col-xs-2 col-lg-2" 											onclick='javascript:showReply($("#Checkseq").val)'>댓글작성</button>
										
										<!-- hidden -->
										<input type="hidden" id="check" name="check">
										<input type="hidden" id="rwriter" name="rwriter" vlaue="${loginUser.name}">
						<%--댓글 리스트 부분 --%>
							
								<table class="table table-default">
									<tbody id="modalreplylist">
									</tbody>
									
								</table>
							
							</div>
						<%-- 수정, 삭제 버튼 --%>
							<div id="BtnOnoff" name="BtnOnoff">
									<button class="btn btn-sg btn-primary btn-block" type="submit" id="boardupdate">수정</button>
									<button class="btn btn-sg btn-primary btn-block" type="button" id="boarddelete">삭제</button>
							</div>
							<button class="btn btn-sg btn-primary btn-block" type="button" data-dismiss="modal">닫기</button>
						
					</div>
				</div>
			</div>
		</div>

<div class="container">
	<div align="center">
		<div class="col-sm-12">
			<select id="searchMenu" name="searchMenu">
				<option value="title">제목</option>
				<option value="writer">작성자</option>
				<option value="content">내용</option>
				</div>
			</select>
			<input type="text" id="searchKeyword" name="searchKeyword" placeholder="검색할 내용" value="">
			<button type="button" id="searchBtn" class="btn btn-primary">검색하기</button>
			<button data-toggle="modal" data-target="#insertModal" class="btn btn-primary" type="button">글쓰기</button>
	</div>
</div>







<!--  -->
<form id="deleteFrm" action="boarddelete.do" method="post">
	<input type="hidden" id="Checkseq" name="Checkseq" value="0">
	</form>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="./dist/js/bootstrap.min.js"></script>
    <script src="./assets/js/docs.min.js"></script>
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>


    <script type="text/javascript">
		// var WnatNum = 0;
    	
		$(document).ready(function(){
			
		
			
			$("#boarddelete").on("click",function(){
				$("#deleteFrm > input").val($("#Checkseq").val());  // deleteFrm 태그 안에 input 태그가 있다면 .val 로 seq를 삽입.
				$("#deleteFrm").submit();
				// GET방식 처리 방법 location.href="boarddelete.do?seq="+$("#seq").val(); 
			})  // boarddelete on click
			
			
			$("#boardupdate").on("click",function(){
			//	$("#updateFrm > input[name*='Checkseq']").val();
			//	$("#updateFrm > input").val($("#updateTitle").val()); 
			//	$("#updateFrm").submit();
				// $("#Checkseq").val()
				// $("#Checktitle").val()
				// $("#Checkcontent").val()
				// +"&title="+$("#Checktitle").val()+"&content="+$("#Checkcontent").val()
			}) // boardupdate on click
			
			
			$("#searchBtn").on("click",function(){
				$("#searchLayer").empty(); // tbody를 빈 공간으로 만들기.
				alert($("#searchKeyword").val());
				$.ajax({
						url : "BoardSearch.Ajax"
					,	type : "post"
					,	data : { searchKeyword : $("#searchKeyword").val(), searchMenu : $("#searchMenu").val() }
					,	dataType : "json"
					,	success : function(obj){
						var txt = "";
						$.each(obj, function(idx, obj){
							txt += "<tr><td>"+obj.seq+"</td><td>"+obj.title+"</td><td>"+obj.writer+
							"</td><td>"+obj.regDate+"</td><td>"+obj.cnt+"</td></tr>";
						});
						$("#searchLayer").html(txt);
					}
				})

			});
			
			
		}) // ready end

		
		function showModal(seq){	// 모달로 게시글 보기

			$.ajax({
				url  : "boardread.ajax"
			,	type : "post"
			,	data : { seq : seq }
			,	dataType : "json"
			,	success : function(obj){
					$("#boardModal").modal('show');
					$("#Checkseq").html(obj.seq);
					$("#Checkseq").val(obj.seq);
					$("#check").val(obj.seq);
					$("#utitle").html(obj.title);
					$("#Checktitle").val(obj.title);
					$("#uwriter").html(obj.writer);
					$("#Checkwriter").val(obj.writer);
					$("#uregDate").html(obj.regDate);
					$("#ucontent").html(obj.content);
					$("#Checkcontent").val(obj.content);
					
					if(obj.writer != '${loginUser.name}'){
						$("#updateFrm > table").children().children().get(4).hidden = true;
						$("#updateFrm > table").children().children().get(5).hidden = true;
					}
					
					
					
					if(obj.writer != '${loginUser.name}'){
						$("#BtnOnoff ").hide();
					}
					
				}
			});
		
			// $("#modalreplylist").empty();
			
			$.ajax({
				url  : "boardreplylist.ajax",
				type : "post",
				data : {seq : seq },
				dataType  : "json",
				success : function(ary){
					var txt = "";
					$.each(ary, function(idx, obj){
						txt +="<tr><th>"+obj.rwriter+"</th><td>"+obj.rcontent+"</td></tr>"
					});
					$("#modalreplylist").html(txt);
				}
			})
			
			
			alert($("#Checkseq").val());
			$.ajax({
				url  : "reqlywrite.ajax",
				type : "post",
				data : {seq : $("#Checkseq").val() ,rwriter : $("#rwriter").val(), rcontent:$("#rcontent").val()},
				dataType: "json",
				success :  function(ary){
					
					showModal(seq);
				}
			})
		}
			
			/* var formData = $("#updateFrm").serialize(); */
			//댓글작성
			
		function showReply(seq){
			alert( $("#rcontent")   );
			$("#empty").empty();
			 alert($("#Checkseq").val());
			$.ajax({
				url  : "reqlywrite.ajax",
				type : "post",
				data : {seq : $("#Checkseq").val() ,rwriter : '${loginUser.name}', rcontent:$("#rcontent").val()},
				dataType: "json",
				success :  function(ary){
					showModal(seq);
				}
			})
		};



		
    </script>




</body>
</html>