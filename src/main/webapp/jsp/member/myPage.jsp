<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 나의 정보 - 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
	<style>
	section {
		min-height: 600px;
	}
	</style>
<body>
	<header>
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</header>
	<section>



		<div class="container" align="center">
			<h2>
				<b>나의 정보 관리</b>
			</h2>
			<script>
					<%-- 버튼 상태변경 --%>
					 function updateButtons() {
					        var buttons = document.getElementsById('btn-rent');
					        
					        for (var i = 0; i < buttons.length; i++) {
					            var status = buttons[i].getAttribute(${book.status});
					            
					            if (status === '0' ) {
					                buttons[i].disabled = false; // 대출 가능일 때 버튼 활성화
					            } else {
					                buttons[i].disabled = true; // 대출 불가일 때 버튼 비활성화
					            }
					        }
					    }
					    // 페이지 로드 시 버튼 업데이트
					    window.onload = function() {
					        updateButtons();
					    };
					    
					    
					    <%-- 회원정보 수정모드 --%>
					    function enableEdit() {
					        var inputs = document.getElementsByClassName('editable');
					        var editButton = document.getElementById('edit-btn');

					        // 모든 input 요소를 활성화 또는 비활성화
					        for (var i = 0; i < inputs.length; i++) {
					            inputs[i].disabled = !inputs[i].disabled;
					        }

					        // 수정 버튼의 텍스트 변경
					        editButton.innerText = inputs[0].disabled ? '수정' : '저장';
					        editButton.onclick = saveChanges;
					    }
					    
					    <%-- 정보수정 반영 --%>
					    function saveChanges() {
					        var pwInput = document.getElementById('pw');
					        var phoneInput = document.getElementById('phone');
					        var emailInput = document.getElementById('email');
					        var editButton = document.getElementById('edit-btn');
					        
					        // 수정된 정보를 서버로 전송하는 로직 추가
					        
					        
					        // 저장 버튼을 수정 버튼으로 변경
					        editButton.innerText = '수정';
					        editButton.onclick = enableEdit;
					        
							// 입력 필드 비활성화
							phoneInput.disabled = true;
							emailInput.disabled = true;
					    }
					    
					    
					    
					    
					    
					    
					    
				</script>
			<%-- 테이블 시작 --%>
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th scope="col">이름</th>
						<th scope="col">ID</th>
						<th scope="col">PW</th>
						<th scope="col">연락처</th>
						<th scope="col">이메일</th>
						<th scope="col">가입일</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<%-- 테이블 내용 --%>
				<tbody>
					<tr>
						<td class="name">${loginMember.name}</td>
						<td class="id">${loginMember.id}</td>
						<td class="pw"><input type="password" id="pw" class="editable"
							value="${loginMember.pw}" style="width:60px" disabled></td>
						<td class="phone"><input type="text" id="phone" class="editable"
							value="${loginMember.phone}" style="width:110px" disabled></td>
						<td class="email"><input type="email" id="email" class="editable"
							value="${loginMember.email}" disabled></td>
						<td class="regDate">${loginMember.regDate}</td>
						<td>
							<div class="btn-group">
								<button type="button" class="btn btn-success" id="edit-btn" onclick="enableEdit()">수정</button>
							</div>
							<div class="btn-group">
								<button type="button" class="btn btn-danger" data-toggle="modal"
									data-target="#withdrawMem" aria-expanded="false">탈퇴는 불가</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>

			<div id="infoMenu"></div>
		</div>


	</section>
	<footer>
		<jsp:include page="../bottom.jsp"></jsp:include>
	</footer>
</body>
</html>