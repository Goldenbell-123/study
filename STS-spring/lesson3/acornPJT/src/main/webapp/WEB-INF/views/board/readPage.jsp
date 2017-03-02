<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@include file="../include/header.jsp" %>


    <!-- Main content -->
    <section class="content">
      <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        <div class="box box-primary">
        <div class="box-header">
          <h3 class="box-title">READ BOARD</h3>
        </div><!-- /.box-header -->

 <form role="form" action="modifyPage.do" method="post">
    
    <input type='hidden' name='bno' value ="${boardVO.bno}">
    <input type='hidden' name='page' value ="${cri.page}">
    <input type='hidden' name='perPageNum' value ="${cri.perPageNum}">
    
 </form>   
    
  <div class="box-body">
    <div class="form-group">
      <label for="exampleInputEmail1">Title</label>
      <input type="text" name='title' class="form-control" 
         value="${boardVO.title}" readonly="readonly">
    </div>
    <div class="form-group">
      <label for="exampleInputPassword1">Content</label>
      <textarea class="form-control"  name="content" rows="3" 
      readonly="readonly">${boardVO.content}</textarea>
    </div>
    <div class="form-group">
      <label for="exampleInputEmail1" >Writer</label>
      <input type="text" name="writer" id="writer" class="form-control" 
        value="${boardVO.writer}" readonly="readonly">
        <input type="hidden" id="uname" value="${loginUser.uname}">
    </div>
  </div><!-- /.box-body -->
	
  <div class="box-footer">
    <button type="submit" class="btn btn-warning" id="modify" >Modify</button>
    <button type="submit" class="btn btn-danger" id="remove" >REMOVE</button>
    <button type="submit" class="btn btn-primary">GO LIST </button>
  </div>
  


<script>
$(document).ready(function(){
	
	var formObj = $("form[role='form']");
	
	console.log(formObj);
	
	$(".btn-warning").on("click", function(){
		formObj.attr("action", "/board/modifyPage.do");
		formObj.attr("method", "get");		
		formObj.submit();
	});
	
	$(".btn-danger").on("click", function(){
		formObj.attr("action", "/board/removePage.do");
		formObj.submit();
	});
	
	$(".btn-primary").on("click", function(){
		formObj.attr("method", "get");
		formObj.attr("action", "/board/listPage.do");
		formObj.submit();
	});
	$(window).load(function(){
		var writer=$("#writer").val()
		var uname=$("#uname").val()
		/* var writer=;
		var uname=; */
		if(writer!=uname){
			$("#modify").hide();
			$("#remove").hide();
		}
	});

});
</script>


  
  
        </div><!-- /.box -->
      </div><!--/.col (left) -->
      </div>   <!-- /.row -->
      
     <div class="row">
      <!-- left column -->
      <div class="col-md-12">
        <!-- general form elements -->
        
        
        <div class="box box-primary">
    	<form method="post" action="replyRegister.do">
    		<input type='hidden' name='bno' value ="${boardVO.bno}">
    		<input type='hidden' name='rwriter' value ="${loginUser.uname}">
    		
	  	<!-- /.reply-body -->
		<div class="box-body">
			<div class="form-group">
				<label for="exampleInputPassword1">댓글 작성</label>
				<textarea class="form-control" name="rcontent" rows="2"
					placeholder="Enter ..."></textarea>
			</div>
			<button type="submit" class="btn btn-primary">댓글 작성</button>
		</div>
		</form>
		
		<!-- /.reply-list -->
			<div class="box-footer">
				<c:set />
				<c:forEach items="${replylist}" var="replyVO" >
					<form method="post" action="replyDelete.do">
						<div class="form-group">
							<input type="hidden" name="rbno" id="checkName" value="${replyVO.rwriter}"/>
							<input type="hidden" name="rwriter" id="checkbno" value="${replyVO.rbno}"/>
							
					  		<label>작성자&nbsp;:&nbsp; ${replyVO.rwriter}</label>
					  		<c:if test="${replyVO.rwriter eq loginUser.uname}" >
					  		<span ><button type="submit" name="replyRemoveBtn" class="btn btn-danger" style="visibility: hidden;" >삭제</button></span>
					  		</c:if>
					  		<textarea class="form-control" rows="1" 
					  				readonly="readonly">${replyVO.rcontent}</textarea>
						</div>
					</form>
				</c:forEach>
			</div>
			

			
		
        
		</div><!-- /.reply-box -->
	</div><!--/.reply-col (left) -->
</div>   <!-- /.reply-row -->

      
   
     </section><!-- /.content -->
   
<%@include file="../include/footer.jsp" %>
  