<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 숲 도서관 로그인 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./html/style.css">

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
	        idError.innerText = '아이디를 입력하세요';
	        id.focus();
	        return false;
	    } else if (pw.value.trim() === '') {
// 	        alert('PW를 입력하세요!');
			idError.innerText = '';
	        pwError.innerText = '비밀번호를 입력하세요';
	        pw.focus();
	        return false;
	    } else {
// 	    	alert('로그인 프로세스로 진입!')
// 	        f.action = "./jsp/loginProcess.jsp";
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
			<div class="card" style="width: 18rem" align="left">
<!-- 			submit 눌렀을때 어디로 보낼지 여기서 결정!-->
				<form method="post"  action="./jsp/loginProcess.jsp" name="loginForm"
					onsubmit="return checkForm()">
					<div class="form-group">
						<h3>로그인</h3>
						<label for="id">아이디</label>
						<input type="text" class="form-control" id="id" name="id">
<!-- 						아이디틀리면 안내메세지 -->
						<div id="idError" style="color:red;"></div>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label>
						<input type="password" class="form-control" id="pw" name="pw">
<!-- 						비번틀리면 안내메세지 -->
						<div id="pwError" style="color:red;"></div>
					</div>
					<button type="submit" class="btn btn-primary">로그인</button>
				</form>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>




