<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::(관리자전용)도서관리 - 숲</title>
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



<script>
	//선택된 도서
	var selectedBook = {};
	
	//전체선택 체크박스
	function toggleCheckAll() {
		var checkboxes = document.getElementsByName("check");
		var checkAllCheckbox = document.getElementsByName("checkAll")[0];

		for (var i = 0; i < checkboxes.length; i++) {
			checkboxes[i].checked = checkAllCheckbox.checked;
		}
	}

	//목록 새로고침
	function refreshBookList() {
		location.reload();
	}
	
	
	//도서 선택시
	function selectBook(bookNo) {
		//bookList에서 정보 찾아오기
		for(var i=0; i<bookList.length; i++) {
			if(bookList[i].manageNo === bookNo) {
				selectedBook = bookList[i];
				break;
			}
		}
	}
</script>


</head>
<div id="top">
	<jsp:include page="topMenu.jsp"></jsp:include>
</div>
<body>
	<h1>전체 도서관리</h1>
	<hr>
<script>
	//목록 새로고침
	function refreshBookList() {
		window.location.href="allBooks.do";
	}
	</script>
	<div class="btn-group">
		<button type="button" class="btn btn-success"
			onclick="refreshBookList()">전체도서목록 조회</button>
	</div>
	<div class="btn-group">
		<button type="button" class="btn btn-success" data-toggle="modal"
			data-target="#addNewBook" aria-expanded="false">신규등록</button>
	</div>
	<div class="btn-group">
		<form action="searchBook.do">
			<select name="searchBy">
				<option id="all" value="all" selected>통합검색</option>
				<option id="title" value="title">도서명</option>
				<option id="author" value="author">저자</option>
				<option id="publisher" value="publisher">출판사</option>
			</select> <input type="search" id="searchKeyword" name="searchKeyword"
				placeholder="검색어를 입력하세요">
			<button type="submit" id="search" class="btn btn-success" disabled>검색</button>
			<div id="search-feedback"></div>
		</form>
	</div>

	<script>
		//검색어 미입력시 검색버튼 비활성화
		const searchKeyword = document.getElementById("searchKeyword");
		const searchButton = document.getElementById("search");
		
		searchButton.disabled = true;
		
		searchKeyword.addEventListener("input", () => {
		  if (searchKeyword.value.trim() !== "") {
		    searchButton.disabled = false;
		  } else {
		    searchButton.disabled = true;
		  }
		});
	</script>



	<script>
// //ISBN 유효성검사
// function checkIsbn() {
// 	let f = document.addBookForm
// 	let isbn = f.isbn
	
// 	let isbnFeedback = document.getElementById("invalid-feedback")
	
// 	if(isbn.length == 10 || isbn.length == 13) {
// 		isbn.classList.add("is-invalid");
// 		isbnFeedback.innerText = ('❌ISBN이 올바르지 않습니다');
// 		isbnFeedback.style.color = "red";
// 		return false;
// 	} else {
// 		isbn.classList.remove("is-invalid");
// 		isbnFeedback.innerText = ('✔올바른 ISBN입니다');
// 		isbnFeedback.style.color = "green";
// 		return true;
// 	}
// }
</script>

	<!-- 신규등록 모달 -->
	<div class="modal fade" id="addNewBook" tabindex="-1"
		aria-labelledby="newBookModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content input-form mx-auto">
				<div class="modal-header">
					<h5 class="modal-title" id="addNewBook">신규 도서정보</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<!-- 모달 내용 -->
				<div class="modal-body">
					<form method="post" action="add-book-process.do" name="addBookForm"
						class="validation-form" novalidate>
						<label for="isbn">ISBN</label> <input type="text"
							class="form-control" id="isbn" name="isbn" autocorrect="off"
							autocapitalize="none" placeholder="공백이나 하이픈없이 10~13자리" value=""
							onchange="checkIsbn()" required>
						<div class="invalid-feedback">도서관리번호를 입력해주세요</div>
						<div id="invalid-feedback" style="color: red;"></div>
						<div id="valid-feedback" style="color: green;"></div>


						<label for="title">도서명</label> <input type="text"
							class="form-control" id="title" name="title" autocorrect="off"
							autocapitalize="none" placeholder="시선으로부터" value="" required>
						<div class="invalid-feedback">도서명을 입력해주세요</div>
						<div id="valid-feedback" style="color: green;"></div>

						<label for="author">저자</label> <input type="text"
							class="form-control" id="author" name="author" autocorrect="off"
							autocapitalize="none" placeholder="정세랑" value="" required>
						<div class="invalid-feedback">저자를 입력해주세요</div>
						<div id="valid-feedback" style="color: green;"></div>

						<label for="publisher">출판사</label> <input type="text"
							class="form-control" id="publisher" name="publisher"
							autocorrect="off" autocapitalize="none" placeholder="문학동네"
							value="" required>
						<div class="invalid-feedback">출판사를 입력해주세요</div>
						<div id="valid-feedback" style="color: green;"></div>


						<div id="rentStatus">
							<label for="status1"><input type="radio" id="status1"
								name="status" value="1" checked>대출가능</label> <label
								for="status0"><input type="radio" id="status0"
								name="status" value="0">대출불가능</label>
						</div>
						<div id="valid-feedback" style="color: green;"></div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">취소</button>
							<button type="submit" class="btn btn-success">등록</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
	// 선택된 값을 확인하고 서버로 전달
	function getStatus() {
	  var status1 = document.getElementById("status1");
	  var status0 = document.getElementById("status0");
	  var rentStatusInput = document.getElementById("rentStatus");

	  if (status1.checked) {
	    rentStatusInput.value = "1"; // 대출 가능 상태일 때의 값
	  } else if (status0.checked) {
	    rentStatusInput.value = "0"; // 대출 불가능 상태일 때의 값
	  }
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

	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
</html>