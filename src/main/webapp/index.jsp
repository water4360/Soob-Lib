<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>:: 도서관 숲 ::</title>
		<link rel="stylesheet" href="./css/style.css">
	</head>

	<style>
		#top {
			position: relative;
			min-height : 20%;
			display: block;
			flex-direction: row;
		}


		#center-main {
			width: 100%;
			/* min-height : 100%; */
/* 			min-height: 300px; */
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
			background-color : gray;
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
			<div id="top">
				<jsp:include page="./jsp/topMenu.jsp"></jsp:include>
				<hr>
				<jsp:include page="./jsp/topContents.jsp"></jsp:include>
			</div>
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