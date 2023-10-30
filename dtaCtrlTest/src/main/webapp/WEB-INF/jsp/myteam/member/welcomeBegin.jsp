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
			<div style="display: flex; float: right;">
				<!-- 콤보박스 추가(검색조건) -->
				<select class="form-select form-select-lg mb-3" id="condition" aria-label="Large select example" onclick="fn_searchMember();" style="width: 280px;">
				  <option selected>검색조건을 선택하세요.</option>
				  <option value="userId">아이디</option>
				  <option value="userNm">이름</option>
				</select>
				<input type="text" id="tofindUser" style="width: 180px; height: 50px; margin-left: 10px;" placeholder="검색어를 입력하세요." onkeyup="fn_searchMember();">				
			</div>
			<br><br>
			<table class="table table-bordered">
				<tbody id="table-container">
					<tr>
						<td colspan="4">데이터가 존재하지 않습니다.</td>
					</tr>
				</tbody>
				<tr>
					<td colspan="4" style="text-align: center;">
						<button type="button" onclick="fn_signIn();" class="btn btn-secondary">회원가입페이지로...</button>
						<button type="button" onclick="fn_logIn();" class="btn btn-light">로그인페이지로...</button>
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script>
	$(document).ready(function(){
		fn_searchMember();
	});
	
	fn_signIn = function() {
		window.location = "/toPolicy.do";
	}
	fn_logIn = function() {
		window.location = "/toLogin.do";
	}
	
	fn_searchMember = function () {
		var condition = $("#condition").val();
		// alert(condition);
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