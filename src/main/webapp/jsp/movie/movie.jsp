<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 최신영화 - 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</header>
	<!-- 	<section style="display: flex; justify-content: center; align-items: center;"> -->
	<section>
		<iframe src="https://water4360.github.io/web-movie-details/"
			style="width: 100%; height: 800px; border: none;"></iframe>
	</section>
	<footer>
		<jsp:include page="../bottom.jsp"></jsp:include>
	</footer>
</body>
</html>