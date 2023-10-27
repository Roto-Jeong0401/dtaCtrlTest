<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Welcome Login...</h1>
	<table>
		<tr>
			<td>아이디:</td>
			<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요."/></td>
		</tr>
		<tr>
			<td>이름:</td>
			<td><input type="text" id="userNm" name="userNm" placeholder="이름을 입력하세요."/></td>
		</tr>
		<tr>
			<td>비밀번호:</td>
			<td><input type="password" id="passWd" name="passWd" placeholder="비밀번호를 입력하세요."/></td>
		</tr>
		<tr>
			<td colspan="2">
				<button type="button" onclick="fn_doLogin();">로그인...</button>
				<button type="button" onclick="fn_historyBack();">목록으로...</button>
			</td>
		</tr>
	</table>
</body>
<script>
	fn_doLogin = function() {
		window.location = "/doLogin.do";
	}
	fn_historyBack = function() {
		window.location = "/index.do";
	}
</script>
</html>