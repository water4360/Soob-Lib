<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입완료 - 숲</title>
<link rel="stylesheet" href="./css/style.css">

</head>
<body style="background-color: beige">
	<header class="top-banner" style="text-align: center" height="50px">
		<a href="main.do"> 라이브러리, 숲 </a>
		<hr>
	</header>
	<h3>라이브러리 숲에 가입하신 것을 환영합니다!</h3>
	아이디 ${loginMember.id }님
	<a href="login.do">로그인하러 가기</a>
	<a href="main.do">메인으로 가기</a>
</body>
</html>