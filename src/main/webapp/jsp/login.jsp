<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 로그인 - 라이브러리, 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">
<style>
section {
	min-height: 600px;
	position: relative;
	display: flex;
	flex-direction : row;
	align-items: center;
	padding-top: 50px;
}

#loginBox {
	position: relative;
	display: flex;
	align-items: center;
	flex-direction: row;
}

</style>


<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>


<script>
	//이 함수의 결과가 true이면 아래에 onsubmit이 넘어감.
	function checkForm() {
		let f = document.loginForm
		let id = f.id
		let pw = f.pw
		let idError = document.getElementById("idError")
		let pwError = document.getElementById("pwError")

		if (id.value.trim() === '') {
			// 	        alert('ID를 입력하세요!');
			loginError.innerText = '아이디를 입력하세요';
			id.focus();
			return false;
		} else if (pw.value.trim() === '') {
			// 	        alert('PW를 입력하세요!');
			loginError.innerText = '비밀번호를 입력하세요';
			pw.focus();
			return false;
		} else {
			// 	비밀번호와 아이디가 모두 입력되었을 때에만 로그인 요청
			// 	alert('로그인 프로세스로 진입!')
			// 	f.action = "./jsp/loginProcess.jsp";
			return true;
		}
	}
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div align="center">
			<!-- 	액션이 갈지 말지 선택하는걸 이 onsubmit 에서 ... -->
			<div class="card" style="width: 20rem" align="center">
				<!-- 	submit 눌렀을때 어디로 보낼지 여기서 결정!-->
				<form id="loginBox" method="post" action="loginProcess.do"
					name="loginForm" style="height: 400px"
					onsubmit="return checkForm()">
					<div class="form-group">
				<h3>로그인</h3>
						<label for="id"> <input type="text" class="form-control"
							placeholder="아이디" id="id" name="id">
						</label> <label for="pw"> <input type="password"
							class="form-control" placeholder="비밀번호" id="pw" name="pw">
						</label>
						<div class="checkbox mb-3">
							<label for="saveId"> <input type="checkbox" name="saveId"
								value="save"> 아이디기억 아직못해
							</label>
						<div id="loginError" style="color: red;">
						<c:if test="${loginFeedback ne ''}">
							${loginFeedback}
						</c:if>
						</div>
						</div>
						<button type="submit" class="btn btn-success">로그인</button>
						<div>
							<a href="findId.do">아이디 찾기</a> | <a href="findPw.do">비밀번호 찾기</a>
							| <a href="signup.do">회원가입</a>
						</div>
					</div>
				</form>

			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>




