<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 라이브러리, 숲 ::</title>
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



#main-top {
	height: 120px;
	display: flex;
	position: relative;
	flex-direction: row;
}

#main-center {
	min-height: 300px;
}

#main-bottom {
	width: 100%;
	/* min-height : 100%; */
	/* min-height: 300px; */
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

section {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	background-color: gray;
}

#notice {
	width: 50%;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: bisque;
}

#list {
	width: 50%;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: aquamarine;
}
</style>

<body>
	<header>
		<div id="main-top">
			<jsp:include page="./jsp/topMenu.jsp"></jsp:include>
		</div>
	</header>
	<section>
		<div id="main-center">
		메인의 메인
		</div>
		<div id="main-bottom">
			<div id="notice">
				<!-- 		하나는 공지사항 -->
				공지사항
				<jsp:include page="./jsp/notice.jsp"></jsp:include>
			</div>
			<div id="list">
				자유게시판
				<!-- 		하나는 도서목록 -->
				<jsp:include page="./jsp/list.jsp"></jsp:include>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./jsp/bottom.jsp"></jsp:include>
	</footer>
</body>

</html>