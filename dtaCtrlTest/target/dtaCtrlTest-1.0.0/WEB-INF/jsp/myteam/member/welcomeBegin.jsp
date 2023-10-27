<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
	<div class="main">
		<div class="container">
			<br>
			<h1>Welcome Begin...</h1>
			<table class="table table-bordered">
				<thead>
					<tr>
						<td>아이디</td>
						<td>이름</td>
						<td>주소</td>
						<td>비고</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>jms</td>
						<td>min</td>
						<td>add</td>
						<td>sss</td>
					</tr>
				</tbody>
					<td colspan="4">
						<button type="button" onclick="fn_signIn();">회원가입페이지로...</button>
						<button type="button" onclick="fn_logIn();">로그인페이지로...</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		window.location = "/getAllMembers.do";	
	});
	
	fn_signIn = function() {
		window.location = "/toSignin.do";
	}
	fn_logIn = function() {
		window.location = "/toLogin.do";
	}
</script>
</html>