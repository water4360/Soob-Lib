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

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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



	<div class="container" align="center">
			<h2>
				<b style="color: #28A745">${loginMember.name}</b><b>님의 서재</b>
			</h2>
			<c:choose>
				<c:when test="${ empty rentalList }">
					<img alt="검색결과 없음" src="./source/src-img/gr-magnifying-glass.png"
						width="50px">
					<h4>${ loginMember.name}님이 대출중인 도서가 없어요</h4>
						<li>지금 바로 도서를 대출해보세요!</li>
						<button type="button" class="btn btn-success"
			onclick="location.href='allBooks.do'">어떤 책이 있나 보러가기</button>
				</c:when>


				<c:otherwise>
					<%-- 테이블 시작 --%>
					<table class="table table-hover table-striped">
						<thead>
							<tr>
								<th scope="col">도서번호</th>
								<th scope="col">도서명</th>
								<th scope="col">저자명</th>
								<th scope="col">출판사</th>
								<th scope="col">대출일</th>
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
											<button type="button" class="btn btn-success"
												aria-expanded="false" data-toggle="modal"
												data-target="#returnBook"
												data-bookNo="${rentBook.bookNo}" 
												data-bookTitle="${rentBook.title}"
												id="return-btn" onclick="returnBook(this)">반납</button>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>

			<div id="infoMenu"></div>
		</div>


<script>
function returnBook(button) {
	console.log("반납버튼 클릭");
	// data-bookNo의 속성 값을 가지고 옴.
	var bookNo = button.getAttribute("data-bookNo");
	var bookTitle = button.getAttribute("data-bookTitle");

// 	document.getElementById("bookNo").innerText = bookNo;
	document.getElementById("bookTitle").innerText = bookTitle;

	document.getElementById("bookNoInput").value = bookNo;

	console.log("도서번호: ", bookNo);
	console.log("도서명: ", bookTitle);
}
</script>







	<%-- 도서반납 모달 --%>
	<div class="modal fade" id="returnBook" tabindex="-1"
		aria-labelledby="newBookModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content input-form mx-auto">
				<div class="modal-header">
					<h2 class="modal-title" id="returnBook" style="color: #FFC107">
					도서 반납</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%-- 모달 내용 --%>
				<div class="modal-body">
					<form method="post" action="returnBook.do" name="renturnBookForm"
						class="validation-form" novalidate>
						<input type="hidden" name="memberId" id="memberId" value="${loginMember.id}" />
						<input type="hidden" name="bookNo" id="bookNoInput" value="" />
						<div id="returnMsg">
							<h5>
								<b><<span id="bookTitle"></span>></b><br>도서를 반납할까요?
							</h5>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-success">반납</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>








	</section>
	<footer>
		<jsp:include page="../bottom.jsp"></jsp:include>
	</footer>
</body>
</html>