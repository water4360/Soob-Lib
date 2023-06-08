<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::(관리자전용)회원관리 - 숲</title>
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
	<div id="top">
		<jsp:include page="topMenu.jsp"></jsp:include>
	</div>
	<h1>전체 회원목록</h1>
	<hr>
	<div class="btn-group">
		<button type="button" class="btn btn-success"
			onclick="refreshBookList()">목록 새로고침</button>
	</div>
	<div class="btn-group">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#addNewMember" aria-expanded="false">신규등록</button>
	</div>
	<div class="btn-group">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#searchMember" aria-expanded="false">검색</button>
	</div>






	<!-- 전체 도서목록 테이블 -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col"><input type="checkbox" name="checkAll"
					onclick="toggleCheckAll()">
				<th scope="col">회원번호</th>
				<th scope="col">회원코드</th>
				<th scope="col">아이디</th>
				<th scope="col">이름</th>
				<th scope="col">연락처</th>
				<th scope="col">이메일</th>
				<th scope="col">가입일</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList}">
				<tr>
					<th scope="row"><input type="checkbox" id="check" name="check"
						onclick="selectMember('${member.memberNo}')"></th>

					<td><a href="memberDetail.do?no=${member.memberNo}">${member.memberNo}</a></td>
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
</body>
</html>