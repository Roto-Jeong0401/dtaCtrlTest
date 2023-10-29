<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<br>
			<h1>Welcome UserDetail...</h1>
			<input type="hidden" id="welcomeUserId" value="${member.USERID}">
			<h5 id="welcomeUserName" style="float: right;">${member.USERNM} 님 접속중</h5>
			<table class="table table-bordered">
				<form method="post" action="/updateUserInfo.do">
					<tr>
						<td>아이디:</td>
						<td><input class="dsbledCls" type="text" id="userId" name="userId" value="${member.USERID }" disabled="disabled"/></td>
					</tr>
					<tr>
						<td>이름:</td>
						<td><input class="dsbledCls" type="text" id="userNm" name="userNm" value="${member.USERNM }" disabled="disabled"/></td>
					</tr>
					<tr>
						<td id="passWd_col">비밀번호:</td>
						<td><input type="password" id="passWd" name="passWd" onkeyup="fn_isMatchPasswd();"/></td>
					</tr>
					<tr>
						<td id="passWdChk_col">비밀번호확인:</td>
						<td><input type="password" id="passWdChk" name="passWdChk" onkeyup="fn_isMatchPasswd();"/></td>
					</tr>
					<tr>
						<td colspan="2" id="showWarnMsg" style="visibility: hidden;">
							<p id="passWarn" style="font-weight: bold; color: red; font-size: 20px; text-align: center; display: none;">비밀번호가 일치하지 않습니다.</p>
						</td>
					</tr>
					<tr>
						<td>주소:</td>
						<td><input type="text" class="dsbledCls" id="address" name="address" value="${member.ADDRESS }" disabled="disabled"/></td>
					</tr>
					<tr>
						<td colspan="2">
							<textarea rows="5" class="dsbledCls" id="comment" name="comment" style="width: 100%; resize: none;" disabled="disabled"/>${member.COMMENT }</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="2" style="text-align: center;">
							<button id="btn_modUser" type="button" onclick="fn_modUser();" class="btn btn-secondary" disabled="disabled">수정하기</button>
							<button id="btn_delUser" type="button" onclick="fn_delUser();" class="btn btn-danger" disabled="disabled">회원정보삭제</button>
							<button type="button" onclick="fn_historyBack();" class="btn btn-light">초기화면으로</button>
						</td>
					</tr>
				</form>
			</table>
		</div>
	</div>
</body>
<script>
	fn_historyBack = function() {
		window.location = "/index.do";
	}
	
	fn_isMatchPasswd = function() {
		var passWd = $("#passWd").val();	 
		var passWdChk = $("#passWdChk").val();	 
		if(!(passWd == "" || passWd == null || passWd =="undefined") && !(passWdChk == "" || passWdChk == null || passWdChk == "undefined")) {
			// 비밀번호, 비밀번호 확인 둘다 입력
			$("#btn_modUser").attr("disabled", false);
			$("#btn_delUser").attr("disabled", false);
				
			if(passWd != passWdChk) {
				// 비번 불일치
				$("#showWarnMsg").css("visibility", "visible");
				$("#passWarn").css("display", "block");
				$("#btn_modUser").attr("disabled", true);
				$("#btn_delUser").attr("disabled", true);
			}else {
				// 비번 일치
				$("#showWarnMsg").css("visibility", "hidden");
				$("#passWarn").css("display", "none");
				$("#btn_modUser").attr("disabled", false);
				$("#btn_delUser").attr("disabled", false);
			}
		}else {
			// 비밀번호, 비밀번호 확인 둘 중 하나 미입력
			$("#btn_modUser").attr("disabled", true);
			$("#btn_delUser").attr("disabled", true);
		}
	}
	
	/*
	* 수정버튼 클릭 시 이벤트
	*/
	fn_modUser = function() {
		// 기존정보 비번 확인
		var code = "1";
		fn_isRightPwd(code);
	}
	
	// 수정하기 버튼 클릭 시 - 회원정보에 등록된 비번과 일치하는지 확인
	fn_isRightPwd = function(code) {
		var userId = $("#welcomeUserId").val();
		var passWd = $("#passWd").val();
		alert("입력한 아이디: "+userId +", 입력한 비번: "+passWd);
		var data = {
				'userId': userId,
				'passWd': passWd,
				'code': code
		}
		$.ajax({
			type: 'POST',
			url: '/isRightPwd.do',
			data: data,
			dataType: 'json',
			success(result) {
				console.log('비번확인 결과: '+result);
				if(result.what === "success") {
					alert("비번 일치");
					if(result.code === "1") {
						fn_afterModUser();
					}else if(result.code === "2") {
						fn_finalModUser();
					}else if(result.code === "3") {
						fn_finalDelUser();
					}
				}else {
					alert("비번 불일치");
					return false;
				}
			},
			error() {
				alert("error");
			}
		});	
	}
	
	// 비번 통과 시 기존 버튼명, 속성 변경, 메서드 변경
	fn_afterModUser = function() {
		$(".dsbledCls").attr("disabled", false);
		// 수정하기 버튼 클릭 시 - 저장 버튼으로 이름 변경
		$("#btn_modUser").text("저장");
		$("#btn_modUser").removeAttr("onclick");	// onclick 속성 삭제
		$("#btn_modUser").attr("onclick", "fn_doModUser();")	// onclick 속성 다시 부여
		$("#btn_modUser").attr("disabled", true);	// disalbe 속성 다시 부여 - 기존 비밀번호화 새 비밀번호 입력 시 활성화
		$("#btn_delUser").attr("disabled", true);	// disalbe 속성 다시 부여 - 기존 비밀번호화 새 비밀번호 입력 시 활성화
		
		// 아이디, 이름은 수정 불가
		$("#userId").attr("readonly", true);
		$("#userId").attr("onclick", "fn_alertDsblInfo();");	// 아이디, 이름 클릭 시 안내문구 출력
		$("#userNm").attr("readonly", true);
		$("#userNm").attr("onclick", "fn_alertDsblInfo();");	// 아이디, 이름 클릭 시 안내문구 출력
		
		// 비밀번호, 비밀번호 확인 값 - 초기화 비밀번호 아이디변경, onkeyup 메서드 추가...
		$("#passWd").val("");
		$("#passWdChk").val("");
		$("#passWd_col").text("기존 비밀번호:");	// 구분하기 위해 기존 비번, 새 비번으로 텍스트 변경
		$("#passWdChk_col").text("새 비밀번호:");
		$("#passWd").attr("placeholder", "비밀번호재입력");
		$("#passWdChk").attr("placeholder", "새 비밀번호입력");
		$("#passWd").attr("onkeyup", "fn_newPassClick();");	// 기존비번, 새 비번 모두 입력해야 저장버튼 활성화
		$("#passWdChk").attr("onkeyup", "fn_newPassClick();");
	}
	
	// 비밀번호 변경 - 비번 변경 하려면 기존비번과 새비번 둘다 입력되야 함.
	fn_newPassClick = function() {
		var passWd = $("#passWd").val();
		var passWdChk = $("#passWdChk").val();
		
		if(!(passWd == "" || passWd == null || passWd =="undefined") && !(passWdChk == "" || passWdChk == null || passWdChk == "undefined")){
			// 기존비번, 새 비번 모두 입력
			$("#btn_modUser").attr("disabled", false);
			$("#btn_delUser").attr("disabled", false);
		}else {
			// 둘 중 하나 미입력
			$("#btn_modUser").attr("disabled", true);
			$("#btn_delUser").attr("disabled", true);
		}
	}
	
	fn_alertDsblInfo = function() {
		alert("아이디, 이름은 수정할 수 없습니다.");
	}
	
	fn_doModUser = function() {
		// 기존정보 비번 확인
		var code = "2";
		fn_isRightPwd(code);
	}
	
	fn_finalModUser = function() {
		// alert("수정완료");
		$("form").submit();
	};
	/*
	* 삭제버튼 클릭 시 이벤트
	*/
	fn_delUser = function() {
		// 기존정보 비번 확인
		var code = "3";
		fn_isRightPwd(code);
	}
	
	fn_finalDelUser = function () {
		// alert("del 넘어옴.");	
		var userId = $("#welcomeUserId").val();
		var passWd = $("#passWd").val();
		var data = {
				'userId': userId,
				'passWd': passWd
		}
		
		$.ajax({
			type: 'POST',
			url: '/deleteUserInfo.do',
			data: data,
			dataType: 'json',
			success(result) {
				if(result.what === "success") {
					alert("삭제처리가 완료되었습니다.");
					window.location = "/index.do";
				}else {
					alert("삭제처리에 실패하였습니다.");
				}
			},
			error() {
				alert("delete error");
			}
		});
	}
</script>
</html>