<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
			  <label for="exampleFormControlTextarea1" class="form-label">��� ����</label>
			  <textarea class="form-control" id="exampleFormControlTextarea1" rows="8">
			  	�� 1 �� ��Ģ
	          ��1��(����)
	          �� �� ����� (��)dtaCtrlTest(���� �����Ρ��� �Ѵ�)�� �����ϴ� ���� ��� ���� ����(���� ���񽺶� �մϴ�)�� �̿��Կ� �־� �̿����� �� ������ ��Ÿ �ʿ��� ������ �����ϴ� ���� �������� �մϴ�.
	          ��2��(����� ȿ�°� ����)
	          �� �� ����� �� ������ ���� ȭ�鿡 �Խ��ϰ� �̿��ڰ� ����ȭ�鿡�� ���� �ǻ�ǥ�ø� �����ν� ȿ���� �߻��մϴ�.
	          �� ���δ� ������ Ȥ�� ������ �߿��� ������ �߻��� ��쿡�� ����� ���� � ���� ����, ���ڰŷ��⺻��, ���ڼ����, ������Ÿ��̿����� � ���� ����, �湮�Ǹ� � ���� ����, �Һ��ں�ȣ�� �� ���ù��� ���� ���� ���� �������� �� ����� ������ �� �ֽ��ϴ�.
	          �� ���ΰ� ����� ������ ��쿡�� �������� �� ���� ������ ����Ͽ� ���� ����� �Բ� ���� �ʱ�ȭ�鿡 �����ϸ�, ��1�װ� ���� ������� ȿ���� �߻���ŵ�ϴ�. ��, �� ����� ������ �̿��ڰ� ��� ���� ������ ���Ŀ��� ��� ������ ���񽺸� �̿��ϸ� ���� ����� ���� ������ ������ �����մϴ�.
	          �� ȸ���� ������ ����� �������� ���� ��� ���� �̿��� �ߴ��ϰ� ȸ�� Ż�� ��û�� �� �ֽ��ϴ�.
	          ��3��(��� �� ��Ģ)
	          �� ����� ��õ��� ���� ������ ���� ���ɿ� �����Ǿ� ���� ��� �� ������ ������, �׷��� ���� ��쿡�� ���ΰ� ������ ���ڰŷ��Һ��ں�ȣ��ħ �� ������� �Ǵ� �Ϲ����� ���ʿ� �����ϴ�.
	          ��4��(����� ����)
	          �� ������� ����ϴ� ����� ���Ǵ� ������ �����ϴ�.
	          �� ���� : ���� Ȩ������ �� ���ο� ����� Ȩ�������� ���մϴ�.
	          �� ���ΰ� �����ϴ� ���񽺸� �޴� �ڸ� ��Ī �̿��ڶ�� �մϴ�. �̿��ڴ� ��ȸ��, ȸ������ �����˴ϴ�.
	          1. ��ȸ�� : ȸ���� �������� �ʰ� ���ο��� �����ϴ� �Ϻ� ���񽺸� �̿��ϴ� �ڸ� ���մϴ�.
	          2. ȸ�� : ���Խ�û�� �� ��� �ڵ������� ��ϵǸ�, ���ο� ���������� �����Ͽ� ȸ������� �� �ڷμ�, ������ ������ ���������� ����������, ���ο��� �����ϴ� ���񽺸� ��������� �̿��� �� �ִ� �ڸ� ���մϴ�.
	          �� ID : ȸ���� �ĺ��� ���� �̿��� ���Ͽ� ȸ���� ���ϰ� ���ΰ� �����ϴ� ���� �Ǵ� ������ ������ ���մϴ�.
	          �� ��й�ȣ : ȸ���� ���� Ȯ�ΰ� ��к�ȣ�� ���Ͽ� ������ ����, ���� �Ǵ� ������ ������ ���մϴ�.
	          �� ���� : ȸ���� "����" �̿��� ü�� �� �̿����� ȿ���� ��ǽ�Ű�� ������ ���մϴ�.
	          �� �� ������� ����ϴ� ����� ���Ǵ� ���� ���ϴ� ���� �����ϰ�� ���� ���� �� ���񽺺� Ȩ������ �ȳ����� ���ϴ� �ٿ� ���մϴ�.
	          
	          .............................................
	          
	          �� 5 �� ���ҹ���
	          ��17��(���ҹ���)
	          �� ���ο� ȸ���� "����" �� �����Ͽ� �߻��� ������ �����ϰ� �ذ��ϱ� ���Ͽ� �ʿ��� ��� ����� �Ͽ��� �մϴ�.
	          �� ��1���� �������� �ұ��ϰ� "����" �� ���õǾ� ������ �߻��� ��� ���ѹα����� �����ϸ�, �� �������� ���� �Ҵ� ���ѹα��� ������ �����մϴ�.
	          �� ���ο� ȸ�� �� �߻��� ���￡ ���� �Ҽ��� �λ�Ҽ۹� ���� ���ҹ����� �����մϴ�.
	          �� Ģ
	          ������) �� ����� 2017�� 1�� 1�Ϻ��� �����մϴ�.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck1">
			    <label class="form-check-label" for="isCheck1">[�ʼ�] ��� ����</label>
		    </div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">�������� ��������</label>
			  <textarea class="form-control" id="exampleFormControlTextarea2" rows="3">
			  	(��)dtaCtrlTest�� �� ����Ʈ ���� ���Խ� ���縦 �䱸�ϴ� ȸ���� ���������� �� �̿����� ����� �� �̿������ ���������� ���� �������� ���� ������ �������̿��մϴ�.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck2">
			    <label class="form-check-label" for="isCheck2">[�ʼ�] �������� ��������</label>
		    </div>
			<div class="mb-3">
			  <label for="exampleFormControlTextarea1" class="form-label">���������� Ȱ�뵿��</label>
			  <textarea class="form-control" id="exampleFormControlTextarea3" rows="3">
			  	(��)dtaCtrlTest�� �� ����Ʈ ���� ���Խ� ���������� ���� �������� �ڰ��� ������ �̿��մϴ�.
			  </textarea>
			</div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" id="isCheck3">
			    <label class="form-check-label" for="isCheck3">[����] ���������� Ȱ�뵿��</label>
		    </div>
			<div class="mb-3 form-check">
			    <input type="checkbox" class="form-check-input" onclick="fn_allCheck();" id="isCheck4">
			    <label class="form-check-label" for="isCheck4">��ü ����</label>
		    </div>
				<button type="button" onclick="fn_neccessaryCheck();" class="btn btn-secondary">ȸ����������</button>
				<button type="button" onclick="location.href='/index.do'" class="btn btn-light">�ʱ�ȭ������</button>
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
			alert("�ʼ��׸��� Ȯ�����ּ���.");
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