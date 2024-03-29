<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<title>::${param.searchKeyword}에 대한 검색결과 - 숲::</title>
<head>
<meta charset="UTF-8">
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
	<style>
	section {
		min-height: 600px;
	}
	</style>
<body>
	<header>
		<div id="top">
			<jsp:include page="../topMenu.jsp"></jsp:include>
		</div>
	</header>

<section>
	<div class="container" align="center">
		<!-- <table class="table table-striped table-hover"> -->
		<h2>
			<b style="color: #28A745">'${ param.searchKeyword }'</b>
			<h5>
				<b>${searchOption}</b> 검색 결과(${bookList.size()}건)
			</h5>
		</h2>
		<c:choose>
			<c:when test="${ empty bookList }">
				<img alt="검색결과 없음" src="./source/src-img/gr-magnifying-glass.png"
					width="50px">
				<h4>'${ param.searchKeyword }'에 대한 검색 결과가 없어요</h4>
				<ul>
					<li>띄어쓰기를 한번 더 확인하고 검색해 주세요</li>
					<li>검색어의 철자가 정확한지 확인해 주세요</li>
					<li>다른 검색어로 재검색을 해주세요</li>
					<li>특수문자는 제외하는 것이 좋습니다</li>
				</ul>
			</c:when>

			<c:otherwise>
				<c:set var="books" value="${bookList}" />
				<div id="bookMenu">
					<!-- 관리자메뉴 -->
					<c:if test="${loginMember.memberCode =='9'}">
						<div class="btn-group">
							<button type="button" class="btn btn-success" data-toggle="modal"
								data-target="#addNewBook" aria-expanded="false">신규도서 등록</button>
						</div>
					</c:if>
				</div>
				<script>
					function redirectToLogin() {
						alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
						window.location.href = "login.do";
					}
					

					function confirmButton(button) {
						console.log("여기는 테스트버튼 원본");
						// data-bookNo의 속성 값을 가지고 옴.
						var book = button.getAttribute("data-book");
						var bookNo = button.getAttribute("data-bookNo");
						var bookTitle = button.getAttribute("data-bookTitle");
						var bookAuthor = button.getAttribute("data-bookAuthor");

						console.log("도서: ", book);
						console.log("도서번호: ", bookNo);
						console.log("도서명: ", bookTitle);
						console.log("저자: ", bookAuthor);
						var msg = "도서번호 : " + bookNo + ", 도서명 : " + bookTitle + "를 대출"
						let select = window.confirm(msg + "할까요?");

						// 도서 관리번호를 사용하여 필요한 작업 수행


						if (select) {
							alert(msg + "했습니다!");
							window.location.href = "myLibrary.do"
						} else {
							alert(msg + "하지 않습니다");
						}

					}
					// 페이지 로드 시 버튼 업데이트
					window.onload = function () {
						confirmButton();
					};

					
				</script>

				<%-- 테이블 시작 --%>
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">도서번호</th>
							<th scope="col">도서명</th>
							<th scope="col">저자</th>
							<th scope="col">출판사</th>
							<c:choose>
								<c:when test="${loginMember.memberCode == '9' }">
									<th scope="col">대출 상태</th>
									<th scope="col">도서 관리</th>
								</c:when>
								<c:otherwise>
									<th scope="col">도서 대출</th>
								</c:otherwise>
							</c:choose>
						</tr>
					</thead>
					<%-- 테이블 내용 --%>
					<tbody>
						<c:forEach var="book" items="${books}">
							<tr>
								<td><a href="#" onclick="bookDetails{'$book.manageNo}'">${book.manageNo}</a>
								</td>
								<td class="book-title">${book.title}</td>
								<td class="book-author">${book.author}</td>
								<td class="book-publisher">${book.publisher}</td>
								<td>
									<%-- 로그인정보가 없을때에도 보이도록. --%>
									<c:choose>
								<c:when test="${empty loginMember}">
									<div class="btn-group">
										<button type="button" class="btn btn-success"
											data-toggle="modal" data-target="#rentBook"
											aria-expanded="false" id="rent-btn"
											onclick="redirectToLogin()"
											${book.status=='0'
																? 'disabled' : '' }>
											${book.status == '0' ? '대출불가' : '로그인 후 대출'}</button>
									</div>
								</c:when>
								<c:otherwise>
									<c:if test="${loginMember.memberCode == '9' }">
										<span style="color:red">${book.status == '0' ? '대출중' : ''}</span>
									</c:if>
									<c:if test="${loginMember.memberCode == '1' }">
									<div class="btn-group">
										<button type="submit" class="btn btn-success"
											data-toggle="modal" data-target="#rentBook"
											aria-expanded="false" data-book="${book}"
											data-bookNo="${book.manageNo}" data-bookTitle="${book.title}"
											data-bookAuthor="${book.author}" id="rent-btn"
											onclick="rentBook(this)"
											${book.status == '0' ? 'disabled' : ''}>
											${book.status == '0' ? '대출불가' : '대출가능'}</button>
									</div>
									</c:if>
									<c:if test="${loginMember.memberCode == '9' }">
										<td>
											<div class="btn-group">
												<button type="button" class="btn btn-danger"
													data-toggle="modal" data-target="#deleteBook"
													data-bookNo="${book.manageNo}"
													data-bookTitle="${book.title}"
													data-bookAuthor="${book.author}" aria-expanded="false"
													id="delete-btn" onclick="deleteBook(this)"
													${book.status=='0' ? 'disabled' : '' }>
													${book.status == '0' ? '삭제' : '삭제'}</button>
											</div>
										</td>
									</c:if>
								</c:otherwise>
							</c:choose>



								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>


			</c:otherwise>
		</c:choose>
	</div>


<%-- 도서 신규등록 모달 --%>
	<div class="modal fade" id="addNewBook" tabindex="-1"
		aria-labelledby="newBookModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content input-form mx-auto">
				<div class="modal-header">
					<h2 class="modal-title" id="addNewBook">신규도서 등록</h2>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%-- 모달 내용 --%>
				<div class="modal-body">
					<form method="post" action="addBook.do" name="addBookForm"
						class="validation-form" novalidate>
						<div id="rentStatus">
							<label for="status1"><input type="radio" id="status1"
								name="status" value="1" checked> 대출활성화</label> <label
								for="status0"><input type="radio" id="status0"
								name="status" value="0"> 대출비활성화</label>
						</div>

						<label for="isbn">ISBN</label> <input type="text"
							class="form-control" id="isbn" name="isbn" autocorrect="off"
							autocapitalize="none" placeholder="공백이나 -없이 10~13자리" value=""
							pattern="([0-9]{13})$" disabled>
						<div class="invalid-feedback">일단은 DB에서 자동생성 돼요^^;</div>
						<div id="invalid-feedback" style="color: red;"></div>
						<div id="valid-feedback" style="color: green;"></div>


						<label for="title">도서명</label> <input type="text"
							class="form-control" id="title" name="title" autocorrect="off"
							autocapitalize="none" placeholder="시선으로부터" value="" required>
						<div class="invalid-feedback">도서명을 입력해주세요</div>

						<label for="author">저자</label> <input type="text"
							class="form-control" id="author" name="author" autocorrect="off"
							autocapitalize="none" placeholder="정세랑" value="" required>
						<div class="invalid-feedback">저자를 입력해주세요</div>

						<label for="publisher">출판사</label> <input type="text"
							class="form-control" id="publisher" name="publisher"
							autocorrect="off" autocapitalize="none" placeholder="문학동네"
							value="" required>
						<div class="invalid-feedback">출판사를 입력해주세요</div>

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
function rentBook(button) {
	console.log("테스트버튼 눌림");
	// data-bookNo의 속성 값을 가지고 옴.
	var book = button.getAttribute("data-book");
	var bookNo = button.getAttribute("data-bookNo");
	var bookTitle = button.getAttribute("data-bookTitle");
	var bookAuthor = button.getAttribute("data-bookAuthor");

	document.getElementById("bookNo").innerText = bookNo;
	document.getElementById("bookTitle").innerText = bookTitle;
	document.getElementById("bookAuthor").innerText = bookAuthor;
	
	document.getElementById("bookNoInput").value = bookNo;

	console.log("도서: ", book);
	console.log("도서번호: ", bookNo);
	console.log("도서명: ", bookTitle);
	console.log("저자: ", bookAuthor);
	var msg = "도서번호 : " + bookNo + ", 도서명 : " + bookTitle + "를 대출"
	//let select = window.confirm(msg + "할까요?");

	// 도서 관리번호를 사용하여 필요한 작업 수행


	if (select) {
		alert(msg + "했습니다!");
		window.location.href = "myLibrary.do"
	} else {
		alert(msg + "하지 않습니다");
	}
}
</script>
	
	
	
	
	
	




	<%-- 도서 신규등록 모달 --%>
	<div class="modal fade" id="addNewBook" tabindex="-1"
		aria-labelledby="newBookModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content input-form mx-auto">
				<div class="modal-header">
					<h5 class="modal-title" id="addNewBook">신규도서 등록</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<%-- 모달 내용 --%>
				<div class="modal-body">
					<form method="post" action="add-book-process.do" name="addBookForm"
						class="validation-form" novalidate>
						<div id="rentStatus">
							<label for="status1"><input type="radio" id="status1"
								name="status" value="1" checked> 대출활성화</label> <label
								for="status0"><input type="radio" id="status0"
								name="status" value="0"> 대출비활성화</label>
						</div>

						<label for="isbn">ISBN</label> <input type="number"
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
	function updateButtons() {
        var checkboxes = document.getElementsByName('check');

        for (var i = 0; i < checkboxes.length; i++) {
            var status = checkboxes[i].getAttribute('data-status');

            if (status === '0') {
                checkboxes[i].disabled = true; // 대출 불가능일 때 체크박스 비활성화
            } else {
                checkboxes[i].disabled = false; // 대출 가능일 때 체크박스 활성화
            }
        }
    }
    // 페이지 로드 시 체크박스 업데이트
    window.onload = function() {
        updateButtons();
    };
	
	
	
	function selectBook(bookNumber) {
		  // 선택된 도서 번호를 저장하는 코드 또는 필요한 동작 수행
		  // 대출 가능/불가능 상태를 확인하고 체크박스를 비활성화
		  var checkbox = document.getElementById('checkbox-' + bookNumber); // 체크박스 요소 선택
		  var status = checkbox.getAttribute('${book.status}'); // 도서의 대출 상태를 가져오는 함수 호출

		  if (status === '0') {
		    checkbox.disabled = true; // 대출 불가능 상태일 때 체크박스 비활성화
		  }
		}
	
	
		// 대출상태 서버로 전달
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
		
		
		
		//폼 유효성 체크
		window.addEventListener('load', () => {
		      const forms = document.getElementsByClassName('validation-form');

		      Array.prototype.filter.call(forms, (form) => {
		        form.addEventListener('submit', function (event) {
		          if (form.checkValidity() === false) {
		            event.preventDefault();
		            event.stopPropagation();
		          } else {
		        	  
		          }

		          form.classList.add('was-validated');
		        }, false);
		      });
		    }, false);
		
	</script>
	</section>
		<footer>
		<jsp:include page="/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>