<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 나의 서재 - 라이브러리, 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">

<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>
</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</header>
	<section>



		<div class="container">
			<h2>
				<b>나의 서재</b>
			</h2>

			<%-- 테이블 시작 --%>
			<table class="table table-hover table-striped">
				<thead>
					<tr>
						<th scope="col">도서번호</th>
						<th scope="col">도서명</th>
						<th scope="col">저자명</th>
						<th scope="col">출판사</th>
						<th scope="col">대여일</th>
						<th scope="col">반납예정일</th>
						<th scope="col">잔여일</th>
						<th scope="col">반납신청</th>
					</tr>
				</thead>
				<%-- 테이블 내용 --%>
				<tbody>
					<c:forEach var="rentBook" items="${rentalList}">

						<tr>
							<td>${rentBook.bookNo}</td>
							<td>${rentBook.title}</td>
							<td>${rentBook.author}</td>
							<td>${rentBook.publisher}</td>
							<td>${rentBook.renDate}</td>
							<td>${rentBook.dueDate}</td>
							<td>${rentBook.overdueDay}일</td>
							<td>
								<div class="btn-group">
									<button type="button" class="btn btn-warning" id="return-btn"
										onclick="returnBook()">반납</button>
								</div>
<!-- 									<button type="button" class="btn btn-warning" -->
<!-- 										data-toggle="modal" data-target="#returnBook" -->
<!-- 										aria-expanded="false">반납</button> -->
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<div id="infoMenu"></div>
		</div>


	</section>
	<footer>
		<jsp:include page="../bottom.jsp"></jsp:include>
	</footer>
</body>
</html>