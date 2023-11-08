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
			<h1>Welcome Begin...</h1>
			<form action="/toFindMemberByBtn.do" method="post">
				<div style="display: flex; float: right;">
					<div style="line-height: 48px; margin-right: 10px;">
						<input type="checkbox" id="checkAjax" onchange="fn_changeMethod();">
						<p style="margin-top: 0; margin-bottom: 1rem; display: inline-block;">체크시 실시간 호출합니다.</p>
					</div>
					<!-- 콤보박스 추가(검색조건) -->
					<select class="form-select form-select-lg mb-3" id="condition" name="condition" aria-label="Large select example" onclick="fn_searchMember();" style="width: 280px;">
					  <option selected>검색조건을 선택하세요.</option>
					  <option value="userId">아이디</option>
					  <option value="userNm">이름</option>
					</select>
					<input type="text" id="tofindUser" name="user" style="width: 180px; height: 50px; margin-left: 10px;" placeholder="검색어를 입력하세요." onkeyup="fn_searchMember();">
					<button type="button" id="btn_search" class="btn btn-primary" style="margin-left: 10px; height: 50px; width: 100px;" onclick="fn_btnSearchMember();">검색</button>
					<br>
				</div>
				<br><br>
				<table class="table table-bordered">
					<c:choose>
						<c:when test="${not empty memberList}">
								<thead id="table_header">
									<tr>
										<td>이름</td><td>아이디</td><td>주소</td><td>비고</td>
									</tr>
								</thead>
								<c:forEach items="${memberList }" var="memberList">
									<tbody id="table-container">
										<tr>
											<td>${memberList.USERNM }</td>
											<td>${memberList.USERID }</td>
											<td>${memberList.ADDRESS }</td>
											<td>${memberList.COMMENT }</td>
										</tr>
									</tbody>
								</c:forEach>
						</c:when>
						<c:otherwise>
							<thead id="table_header">
								<tr>
									<td>이름</td><td>아이디</td><td>주소</td><td>비고</td>
								</tr>
							</thead>
							<tbody id="table-container">
									<tr>
										<td colspan="4" style="text-align: center;">데이터가 존재하지 않습니다.</td>
									</tr>
								</tbody>
						</c:otherwise>
					</c:choose>
					<tr>
						<td colspan="4" style="text-align: center;">
							<button type="button" onclick="fn_signIn();" class="btn btn-secondary">회원가입페이지로...</button>
							<button type="button" onclick="fn_logIn();" class="btn btn-light">로그인페이지로...</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		// fn_searchMember();
		var condition = $("#condition");
		var toFindUser = $("#tofindUser");
		// 체크 해제 default - onkeyup 속성 삭제
		condition.removeAttr("onclick");
		toFindUser.removeAttr("onkeyup");
	});
	
	fn_changeMethod = function() { 
		var condition = $("#condition");
		var toFindUser = $("#tofindUser");
		var checkAjax = $("#checkAjax").is(":checked");
		
		if(checkAjax == false) {
			// 체크 해제 시 - onkeyup 속성 삭제
			// window.location.reload();
			window.location = "/index.do";
		}else if(checkAjax == true) {
			// 체크 시 - onkeyup, onclick 속성 재부여
			// $("#table-container").empty();
			// $("#table_header").remove();
			$("#btn_search").attr("disabled", true);
			condition.attr("onclick", "fn_searchMember();");
			toFindUser.attr("onkeyup", "fn_searchMember();");
			fn_searchMember();
		}
	}
	
	fn_btnSearchMember = function() { 
		var selected = $("#condition").val();
		if(!(selected == "userId" || selected == "userNm")) {
			$("#condition").prop("")
		}else {
			$("form").submit();
		}
	}
	
	fn_signIn = function() {
		window.location = "/toPolicy.do";
	}
	fn_logIn = function() {
		window.location = "/toLogin.do";
	}
	
	fn_searchMember = function () {
		var condition = $("#condition").val();
		// var pathname = window.location.pathname;
		
		// alert(pathname);
		data = {
				'user': $("#tofindUser").val(),
				'condition': condition
		}
		$.ajax({
			type: 'GET',
			url: '/getAllMembers.do',
			data: data,
			dataType: 'json',	// 응답 데이터
			success: function(response) { 
				if(response.what === "success") {
					console.log(response.list);
					console.log("response.list.length: "+response.list.length);
					
					var jsonArray = response.list;
					
					// HTML 테이블 생성
					var tableHtml = '<table><thead><tr>';
					
					// 기존 테이블 헤더 제거
					$("#table_header").remove();
					var dataRowHtml = '';

					jsonArray.forEach(function(item, index) { 
					    if (index === 0) {
					        // 첫 번째 데이터 행을 이용하여 컬럼 제목 생성
					        for (var key in item) {
					            tableHtml += '<td>' + key + '</td>';
					        }
					        tableHtml += '</tr></thead><tbody>';
					    }

					    // 각 데이터 행을 생성
					    dataRowHtml += '<tr>';
					    for (var key in item) {
					        dataRowHtml += '<td>' + item[key] + '</td>';
					    }
					    dataRowHtml += '</tr>';
					});

					tableHtml += dataRowHtml + '</tbody></table>';

					// HTML에 테이블 추가
					document.getElementById('table-container').innerHTML = tableHtml;
					
				}else {
					console.log("조회 실패");
					// HTML 테이블 생성
					var tableHtml = '<table><thead><tr><td>이름</td><td>아이디</td><td>주소</td><td>비고</td></tr>';
					
					tableHtml +='</tr></thead><tbody>';
					tableHtml += '<tbody><table><tr><td colspan="4" style="text-align: center;">데이터가 없습니다.</td></tr>'
					tableHtml += '</tbody></table>';
					
					// HTML에 테이블 추가
					document.getElementById('table-container').innerHTML = tableHtml;
				}
				
			},
			error: function(response) { 
				console.log("error");
			}
		});
	}
</script>
</html>