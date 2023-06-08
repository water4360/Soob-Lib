<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::전체 도서 조회 - 숲::</title>
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
		<div id="top">
			<jsp:include page="../topMenu.jsp"></jsp:include>
		</div>
	</header>

	<!-- 관리자메뉴 -->
	<c:if test="${loginMember.memberCode =='9'}">
		<div class="btn-group">
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#addNewBook" aria-expanded="false">신규도서 등록</button>
		</div>
		<div class="btn-group">
			<button type="button" class="btn btn-success" data-toggle="modal"
				data-target="#deleteBook" aria-expanded="false">삭제</button>
		</div>
	</c:if>
	<!-- 회원메뉴 -->
	<c:choose>
		<c:when test="${empty loginMember}">
			<div class="btn-group">
				<button type="button" class="btn btn-success" data-toggle="modal"
					data-target="#rentBook" aria-expanded="false"
					onclick="redirectToLogin()">대여</button>
			</div>
		</c:when>
		<c:otherwise>
			<div class="btn-group">
				<button type="button" class="btn btn-success" data-toggle="modal"
					data-target="#rentBook" aria-expanded="false">대여</button>
			</div>
		</c:otherwise>
	</c:choose>
	<script>
		function redirectToLogin() {
			alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			window.location.href = "login.do";
		}
	</script>


	<!-- 전체 도서목록 테이블 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" name="checkAll"
					onclick="toggleCheckAll()">
				<th scope="col">도서번호</th>
				<th scope="col">도서명</th>
				<th scope="col">저자</th>
				<th scope="col">출판사</th>
				<th scope="col">대출상태</th>
				<th scope="col">인기도</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${bookList}">
				<tr>
					<th scope="row"><input type="checkbox" id="check" name="check"
						onclick="selectBook('${book.manageNo}')"></th>

					<td><a href="bookDetail.do?no=${book.manageNo}">${book.manageNo}</a></td>
					<td>${book.title}</td>
					<td>${book.author}</td>
					<td>${book.publisher}</td>
					<td><c:choose>
							<c:when test="${book.status == '1'}">
							대출가능
						</c:when>
							<c:otherwise>
								<span style="color: coral;">대출불가</span>
							</c:otherwise>
						</c:choose></td>
					<td>${book.pop}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>