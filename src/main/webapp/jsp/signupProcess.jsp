<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원가입완료 - 숲 ::</title>
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
#outer-welcome {
	margin-top : 150px;
}
</style>

<header>
	<jsp:include page="/jsp/topMenu.jsp"></jsp:include>
</header>
<body style="background-color: white">
	<div id="contatiner-welcome" align="center">
		<div id="outer-welcome">
			<h3><b style="color:#28A745">${signInMember.id }</b>님,<br>라이브러리, 숲에 가입하신 것을 환영해요!</h3>
			<div id="welcome-msg">
				<h6>지금 바로 회원전용 대출서비스를 이용해보세요 :)</h6>
			</div>
		</div>
		<button type="submit" class="btn btn-success"
			onclick="location.href='login.do'">로그인하러 가기</button>
		<button type="submit" class="btn btn-outline-success"
			onclick="location.href='main.do'">메인으로 가기</button>
	</div>
</body>
</html>