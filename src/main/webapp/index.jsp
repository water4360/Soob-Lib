<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>:: 도서관 숲 ::</title>
		<link rel="stylesheet" href="./html/style.css">
	</head>

	<style>
		#center-main {
			width: 100%;
			height: 100%;
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
		}

		#notice {
			width: 50%;
			height: 50vh;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			background-color: bisque;
		}

		#list {
			width: 50%;
			height: 50vh;
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
			background-color: aquamarine;
		}
	</style>

	<body>
		<header>
			<jsp:include page="./jsp/topMenu.jsp"></jsp:include>
		</header>
		<section>
			<div id="center-main">
				<div id="notice">
					<!-- 		하나는 공지사항 -->
					공지사항
					<jsp:include page="./jsp/notice.jsp"></jsp:include>
				</div>
				<div id="list">
					리스트
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