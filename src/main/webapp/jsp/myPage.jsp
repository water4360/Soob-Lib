<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 라이브러리, 숲</title>
<link rel="stylesheet" href="./css/style.css">
</head>
<body>
	<header>
		<jsp:include page="../jsp/topMenu.jsp"></jsp:include>
	</header>
	<section>
		<div id="center-myPage">
			<div id="memInfo">
				<!-- 하나는 회원정보 -->
				내정보
				<jsp:include page="../jsp/notice.jsp"></jsp:include>
			</div>
			<div id="rentInfo">
				대여정보
				<!-- 하나는 대여정보 -->
				<jsp:include page="../jsp/list.jsp"></jsp:include>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="../jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>