<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<style>
	.form-label {
		font-weight: bold;
	}
</style>
</head>
<body>
	<div class="container">
		<div class="content">
			<br>
			<h1>Welcome Policy...</h1>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">약관 동의</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8">
			  	제 1 장 총칙
	          제1조(목적)
	          ① 이 약관은 (주)dtaCtrlTest(이하 “본부”라 한다)가 제공하는 본부 사업 관련 서비스(이하 서비스라 합니다)를 이용함에 있어 이용조건 및 절차와 기타 필요한 사항을 규정하는 것을 목적으로 합니다.
	          제2조(약관의 효력과 변경)
	          ① 본 약관은 그 내용을 서비스 화면에 게시하고 이용자가 서비스화면에서 동의 의사표시를 함으로써 효력을 발생합니다.
	          ② 본부는 사정상 혹은 영업상 중요한 사유가 발생될 경우에는 약관의 규제 등에 관한 법률, 전자거래기본법, 전자서명법, 정보통신망이용촉진 등에 관한 법률, 방문판매 등에 관한 법률, 소비자보호법 등 관련법을 위배 하지 않은 범위에서 이 약관을 개정할 수 있습니다.
	          ③ 본부가 약관을 개정할 경우에는 적용일자 및 개정 사유를 명시하여 현행 약관과 함께 서비스 초기화면에 공지하며, 제1항과 같은 방법으로 효력을 발생시킵니다. 단, 구 약관에 동의한 이용자가 약관 개정 적용일 이후에도 계속 본부의 서비스를 이용하면 개정 약관에 대해 동의한 것으로 간주합니다.
	          ④ 회원은 개정된 약관에 동의하지 않을 경우 서비스 이용을 중단하고 회원 탈퇴를 요청할 수 있습니다.
	          제3조(약관 외 준칙)
	          이 약관에 명시되지 않은 사항은 관계 법령에 규정되어 있을 경우 그 규정에 따르며, 그렇지 않은 경우에는 정부가 제정한 전자거래소비자보호지침 및 관계법령 또는 일반적인 관례에 따릅니다.
	          제4조(용어의 정의)
	          본 약관에서 사용하는 용어의 정의는 다음과 같습니다.
	          ① 서비스 : 본부 홈페이지 및 본부와 연계된 홈페이지를 말합니다.
	          ② 본부가 제공하는 서비스를 받는 자를 통칭 이용자라고 합니다. 이용자는 비회원, 회원으로 구성됩니다.
	          1. 비회원 : 회원에 가입하지 않고 본부에서 제공하는 일부 서비스를 이용하는 자를 말합니다.
	          2. 회원 : 가입신청을 할 경우 자동적으로 등록되며, 본부에 개인정보를 제공하여 회원등록을 한 자로서, 본부의 정보를 지속적으로 제공받으며, 본부에서 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
	          ③ ID : 회원의 식별과 서비스 이용을 위하여 회원이 정하고 본부가 승인하는 문자 또는 숫자의 조합을 말합니다.
	          ④ 비밀번호 : 회원의 본인 확인과 비밀보호를 위하여 선정한 문자, 숫자 또는 양자의 조합을 말합니다.
	          ⑤ 해지 : 회원이 "서비스" 이용계약 체결 후 이용계약의 효력을 상실시키는 행위를 말합니다.
	          ⑥ 이 약관에서 사용하는 용어의 정의는 위에 정하는 것을 제외하고는 관계 법령 및 서비스별 홈페이지 안내에서 정하는 바에 의합니다.
	          
	          .............................................
	          
	          제 5 장 관할법원
	          제17조(관할법원)
	          ① 본부와 회원은 "서비스" 와 관련하여 발생한 분쟁을 원만하게 해결하기 위하여 필요한 모든 노력을 하여야 합니다.
	          ② 제1항의 규정에도 불구하고 "서비스" 와 관련되어 분쟁이 발생할 경우 대한민국법을 적용하며, 본 분쟁으로 인한 소는 대한민국의 법원에 제기합니다.
	          ③ 본부와 회원 간 발생한 분쟁에 관한 소송은 민사소송법 상의 관할법원에 제소합니다.
	          부 칙
	          시행일) 이 약관은 2017년 1월 1일부터 시행합니다.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck1">
			    <label class="form-check-label" for="isCheck1">[필수] 약관 동의</label>
		    </div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">개인정보 수집동의</label>
			  <textarea class="form-control" id="exampleFormControlTextarea2" rows="3">
			  	(주)dtaCtrlTest는 당 사이트 서비스 가입시 기재를 요구하는 회원의 개인정보는 본 이용계약의 이행과 본 이용계약상의 서비스제공을 위한 목적으로 개인 정보를 수집·이용합니다.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck2">
			    <label class="form-check-label" for="isCheck2">[필수] 개인정보 수집동의</label>
		    </div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">마케팅정보 활용동의</label>
			  <textarea class="form-control" id="exampleFormControlTextarea3" rows="3">
			  	(주)dtaCtrlTest는 당 사이트 서비스 가입시 서비스제공을 위한 목적으로 자격증 정보를 이용합니다.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck3">
			    <label class="form-check-label" for="isCheck3">[선택] 마케팅정보 활용동의</label>
		    </div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" onclick="fn_allCheck();" id="isCheck4">
			    <label class="form-check-label" for="isCheck4">전체 동의</label>
		    </div>
				<button type="button" onclick="fn_neccessaryCheck();" class="btn btn-secondary">회원가입진행</button>
				<button type="button" onclick="location.href='/index.do'" class="btn btn-light">초기화면으로</button>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$(".form-control").attr("readonly", "readonly");
		$(".form-control").css("white-space", "pre-line");
	});
	fn_neccessaryCheck = function() {
		var check1 = $("#isCheck1").is(":checked");
		var check2 = $("#isCheck2").is(":checked");
		// alert(check1);
		if(check1 == true && check2 == true) {
			window.location = "/toSignin.do";
		}else {
			alert("필수항목을 확인해주세요.");
		}
	}
	
	fn_allCheck = function() {
		var allCheck = $("#isCheck4").is(":checked");
		if(allCheck == true) {
			$(".form-check-input").prop("checked", true);
		}else {
			$(".form-check-input").prop("checked", false);
		}
	}
</script>
</html>