<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
   request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그인 페이지</title>

    <link href="./dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="./css/signin.css" rel="stylesheet">

    <script src="./assets/js/ie-emulation-modes-warning.js"></script>
    
</head>
<body>
    <div class="container">

      <form class="form-signin" role="form" action="login.do" method="post">
        <h2 class="form-signin-heading">VR official Sign-in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input name="email" type="email"  id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input name="pwd" type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
        <button data-toggle="" data-target="#joinModal" class="btn btn-lg btn-danger btn-block" type="button">Join in</button>
      </form>

    </div> <!-- /container -->

	<!-- join modal -->
	<div class="modal fade" id="joinModal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class = "modal-header">
					<h4>회원가입</h4>
				</div>
				
				<div class = "modal-body">
					<form action="join.do" method="post">
						<input name="id" type="text" id="id" class="form-control" placeholder="Id" required autofocus>
						<label id="checkId"></label>
						<input name="pwd" type="password" id="pwd" class="form-control" placeholder="Password" required>
						<input name="email" type="email" id="email" class="form-control" placeholder="Email address" required> 
						<input name="name" type="text" id="name" class="form-control" placeholder="Name" required>
						<div class="checkbox" >
							<input type="radio" value="m" name="gender" checked> 남자
							<input type="radio" value="f" name="gender"> 여자
						</div>
						<input name="phoneNumber" type="tel" id="phoneNumber" class="form-control" placeholder="PhoneNumber" required>
						<div class = "modal-footer">
							<button class="btn btn-primary " type="submit">Join in</button>
							<button class="btn btn-primary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="./dist/js/bootstrap.min.js"></script>
	
	<script type="text/javascript">
		// window.onload = function() { } 과 동일
		$(document).ready(function(){
			$("#id").on("blur",function(){
				$.ajax({
					url  : "loginCheck.ajax",
					type : "post",
					data : {id : $("#id").val()},
					dataType : "json" ,
					success : function(obj){
						if(obj.flag){
							$("#checkId").html("<font color='red'>중복된 아이디입니다..</font>");
						}else{
							$("#checkId").html("<font color='blue'>사용가능한 아이디입니다.</font>");
						}
					}
				});
			});
			//$.ajax(); -- html(),text)_,append() .modal
		})
	
	</script>
	
</body>
</html>



