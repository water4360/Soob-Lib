<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::(관리자전용)게시판관리 - 숲</title>
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
<body>
	<div id="top">
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</div>
	<div class="container" align="center">
			<h2>
				<b>게시판 관리</b>
			</h2>
	<div class="btn-group">
		<button type="button" class="btn btn-success"
			onclick="refreshPage()">목록 새로고침</button>
	</div>
<script>
	function refreshPage() {
		window.location.href="admin-board.do";
	}
	</script>



	<!-- 전체 도서목록 테이블 -->
	<table class="table table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">회원번호</th>
				<th scope="col">분류</th>
				<th scope="col">아이디(ID)</th>
				<th scope="col">이름</th>
				<th scope="col">연락처</th>
				<th scope="col">이메일</th>
				<th scope="col">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList}">
				<tr>
					<td>${member.memberNo}</td>
					<td><c:choose>
							<c:when test="${member.memberCode == 1}">
							회원
						</c:when>
							<c:otherwise>
								<span style="color: red;">관리자</span>
							</c:otherwise>
						</c:choose></td>
					<td>${member.id}</td>
					<td>${member.name}</td>
					<td>${member.phone}</td>
					<td>${member.email}</td>
					<td>${member.regDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
</body>
</html>