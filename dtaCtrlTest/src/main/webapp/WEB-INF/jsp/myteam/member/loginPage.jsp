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
	<div class="container">
		<div class="content">
			<h1>Welcome Login...</h1>
			<table class="table table-bordered">
				<form action="welcomeUserDtl.do" name="loginForm" method="post">
					<tr>
						<td>아이디:</td>
						<td><input type="text" id="userId" name="userId" placeholder="아이디를 입력하세요." onkeyup="fn_isVaild();"/></td>
					</tr>
					<tr>
						<td>비밀번호:</td>
						<td><input type="password" id="passWd" name="passWd" placeholder="비밀번호를 입력하세요." onkeyup="fn_isVaild();"/></td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button id="btn_doLogin" type="button" onclick="fn_doLogin();" class="btn btn-secondary" disabled="disabled">로그인페이지로</button>
							<button type="button" onclick="fn_historyBack();" class="btn btn-light">초기화면으로</button>
						</td>
					</tr>
				</form>
			</table>
		</div>
	</div>
</body>
<script>
	fn_doLogin = function() {
		// window.location = "/doLogin.do";
		var userId = $("#userId").val();
		var passWd = $("#passWd").val();
		
		var data = {
				'userId': userId,
				'passWd': passWd
		}
		
		$.ajax({
			type: 'POST',
			url: '/getLogin.do',
			data: data,
			dataType: 'json',	// 응답 데이터
			success: function(response) { debugger;
				/* console.log(response);
				console.log(response.what); */
				if(response.what === "success") {
					/* console.log("로그인 성공");
					console.log(response.member);
					console.log(response.member.USERID); */
					// 로그인 성공 시 호출
					alert("로그인에 성공하였습니다.!");
					fn_moveUserInfoDtl();
					
				}else {
					console.log("로그인 실패");
					alert(userId+"는 없는 회원이거나 비밀번호가 일치하지 않습니다.");
				}
			},
			error: function() {
				alert("error");
			}
		});
	}
	fn_historyBack = function() {
		window.location = "/index.do";
	}
	
	// 아이디 비밀번호 입력 여부 체크
	// 둘 중 하나라도 입력되지 않으면 로그인 버튼 비활성
	fn_isVaild = function() {
		var userId = $("#userId").val();
		var passWd = $("#passWd").val();
		
		if((userId == "" || userId == null || userId == "undefined") || (passWd == "" || passWd == null || passWd == "undefined")) {
			$("#btn_doLogin").attr("disabled", true);
		}else {
			$("#btn_doLogin").attr("disabled", false);
		}
	}
	
	fn_moveUserInfoDtl = function () { debugger;
		var userId = $("#userId").val();
		var passWd = $("#passWd").val();
		
		$("form").submit();
	}
	
</script>
</html>