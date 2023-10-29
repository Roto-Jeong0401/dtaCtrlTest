<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link href="/css/egovframework/_accordion.scss" rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="content">
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
					<td><input type="password" id="passWd" name="passWd" placeholder="비밀번호를 입력하세요." onkeyup="fn_isMatchPasswd();"/></td>
				</tr>
				<tr>
					<td>비밀번호확인:</td>
					<td><input type="password" id="passWdChk" name="passWdChk" placeholder="비밀번호를 다시 입력하세요." onkeyup="fn_isMatchPasswd();"/></td>
				</tr>
				<tr>
					<td colspan="2" id="showWarnMsg" style="visibility: hidden;">
						<p id="passWarn" style="font-weight: bold; color: red; font-size: 20px; text-align: center; display: none;">비밀번호가 일치하지 않습니다.</p>
					</td>
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
					<td colspan="2" style="text-align: center;">
						<button id="btn_signIn" type="button" onclick="fn_doSignin();" class="btn btn-secondary">회원가입</button>
						<button type="button" onclick="fn_historyBack();" class="btn btn-light">초기화면으로</button>
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
	
	fn_isMatchPasswd = function() {
		var passWd = $("#passWd").val();	 
		var passWdChk = $("#passWdChk").val();	 
		if(!(passWd == "" || passWd == null || passWd =="undefined") && !(passWdChk == "" || passWdChk == null || passWdChk == "undefined")) {
			// 비밀번호, 비밀번호 확인 둘다 입력
			if(passWd != passWdChk) {
				$("#showWarnMsg").css("visibility", "visible");
				$("#passWarn").css("display", "block");
				$("#btn_signIn").attr("disabled", true);
			}else {
				$("#showWarnMsg").css("visibility", "hidden");
				$("#passWarn").css("display", "none");
				$("#btn_signIn").attr("disabled", false);
			}
		}else {
			// 비밀번호, 비밀번호 확인 둘 중 하나 미입력
			console.log("미입력");
		}
	}
</script>
</html>