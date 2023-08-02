<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 라이브러리, 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
	<header>
		<div id="main-top">
			<jsp:include page="./jsp/topMenu.jsp"></jsp:include>
		</div>
	</header>
	<section>

		<div class="container mt-5" align="center">
			<div>
				<h2>공지사항</h2>
			</div>
			<div class="btn-group">
			</div>
			<div class="row justify-content-center">
				<div class="col-md-11">
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="col-md-1">번호</th>
								<th class="col-md-6">제목</th>
								<th class="col-md-1">글쓴이</th>
								<th class="col-md-1">작성일</th>
								<th class="col-md-1">조회</th>
								<th class="col-md-1"></th>
							</tr>
						</thead>
						<%-- 테이블 내용 --%>
						<tbody>
							<c:choose>
								<c:when test="${ empty board }">
									<td colspan="5" align="center" style="padding: 50px 0;">등록된
										공지사항이 없습니다.</td>
								</c:when>

								<c:otherwise>
									<c:forEach var="post" items="${board}">
										<tr>
											<td>${post.no}</td>
											<td>
											<a href="notice-detail?no=${post.no}">${post.title}</a></td>
											<td>${post.writer}</td>
											<td>${post.regDate}</td>
											<td>${post.hit}</td>
											<td>
											<a href="delete-news?p_no=${post.no}" class="btn btn-secondary mb-2">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>

	</section>
	<footer>
		<jsp:include page="./jsp/bottom.jsp"></jsp:include>
	</footer>
</body>

</html>