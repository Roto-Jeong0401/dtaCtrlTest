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
			<h1>Welcome Signin...</h1>
			<table class="table table-bordered">
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
					<td>비밀번호확인:</td>
					<td><input type="password" id="passWdChk" name="passWdChk" placeholder="비밀번호를 다시 입력하세요."/></td>
				</tr>
				<tr>
					<td>주소:</td>
					<td><input type="text" id="address" name="address" placeholder="주소를 입력하세요."></td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="5" id="comment" name="comment" style="width: 100%; resize: none;" placeholder="비고"></textarea>
					</td>
				</tr>
				<tr>
					<td><input type="checkbox" id="chk">ajax</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" onclick="fn_doSignin();">회원가입</button>
						<button type="button" onclick="fn_historyBack();">목록으로</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	fn_doSignin = function() {
		// window.location = "/registMember.do";
		var data = {
				'userId' : $("#userId").val(),
				'userNm' : $("#userNm").val(),
				'passWd' : $("#passWd").val(),
				'address' : $("#address").val(),
				'comment' : $("#comment").val()
		}
		// alert($("#userId").val()+", "+$("#userNm").val()+", "+$("#passWd").val()+", "+$("#address").val()+", "+$("#comment").val());
		$.ajax({
			type: 'POST',
			url: '/registMember.do',
			data: data,
			/* contentType: 'application/json; charset=UTF-8', */
			dataType: 'json',	// 응답 데이터
			success: function(response) {
				console.log("response: "+response);
				console.log("response.what: "+response.what);
				if (!confirm(response.userId+"님 회원가입을 축하합니다. 메인화면으로 이동합니다.")) {
			        // 취소(아니오) 버튼 클릭 시 이벤트
			    } else {
			        // 확인(예) 버튼 클릭 시 이벤트
			        window.location = "/index.do";
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
</script>
</html>