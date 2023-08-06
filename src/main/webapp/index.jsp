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

<header>
	<div id="main-top">
		<jsp:include page="./jsp/topMenu.jsp"></jsp:include>
	</div>
</header>
<body>
	<section>
		<!-- 	style="background-color:blue;" -->
		<div class="container">
			<div class="main-contents">
				<img alt="main-banner" style="width: 60%"
					src="source/src-img/img/library8.jpg">
				<div class="col-md-6">
					<div class="card column justify-content-center">
						<div class="card-header">
							<h2><a href="board.do">자유게시판</a></h2>
						</div>
						<div class="col-md-12">
							<table class="table table-hover">
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
													<td><a href="post-detail.do?no=${post.no}">${post.title}[${post.replyCnt}]</a></td>
													<td>${post.writer}</td>
													<td>${post.regDate}</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="./jsp/bottom.jsp"></jsp:include>
	</footer>
</body>

</html>