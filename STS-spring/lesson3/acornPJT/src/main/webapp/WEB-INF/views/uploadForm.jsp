<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		iframe{
			width	: 0px;
			height	: 0px;
			border	: 0px;
		}
	</style>

</head>
<body>
	<form	id="form1"
			target="ifrm"
			action="uploadForm.do" 
			method="post"
			enctype="multipart/form-data">
			
		<input	type="file"	name="file"><br>
		<input	type="text"	name="writer"><br>
		<input	type="text"	name="title"><br>
		<input	type="text"	name="content"><br>
		
		<input	type="submit" >
		<iframe	name="ifrm"></iframe>
		<img id="img" width='100px' height='100px'></img>
		<script type="text/javascript">
			function addFilePath(msg){
				alert(msg);
				document.getElementById("form1").reset();
				document.getElementById("img").setAttribute("src","./upload/"+msg);
			}
		</script>
	</form>
</body>
</html>