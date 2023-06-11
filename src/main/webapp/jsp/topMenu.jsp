<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

<style>
#container {
	width: 100%;
	height: 120px;
	display: flex;
	justify-content: space-around;
	align-items: center;
	height: 100%;
	font-size: larger;
}

#logo {
	width: 80px;
	display: flex;
	align-items: center;
	flex-direction: row;
}

#menu {
	display: flex;
	align-items: center;
}

#library-name {
	font-size: xx-large;
	font-weight: 800;
	font-style: italic;
}

a {
	margin: 5px;
}
</style>
	<div id="container">
	<div id="topMenu-logo">
		<a href="main.do">
		<img alt="logo" id="logo" src="./source/src-img/gr-books2.png">
<!-- 		<img alt="logo" id="logo" src="./source/logo.gif"> -->
		</a>
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
		</form>
		<div>
		<button type="button" class="btn btn-success"
			onclick="location.href='allBooks.do'">전체도서목록</button>
			</div>
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

	<div id="firstMenu">
		<c:if test="${ not empty loginMember }">
					ID : ${ loginMember.id }(${ loginMember.name })
		</c:if>
		<c:choose>
			<c:when test="${ empty loginMember }">
				<a href="login.do">로그인</a>
				<a href="login.do">나의정보</a>
				<a href="login.do">나의서재</a>
			</c:when>
			<c:otherwise>
				<!-- 리디는 회원가입/로그인 외에도 항상 아이콘으로 표시,
				로그인이 안되어 있어도 클릭 가능하고 로긴중 아니면 로긴창. -->
				<!-- 관리자메뉴 -->
				<c:if test="${loginMember.memberCode == '9'}">
					<a href="admin-member.do">회원관리</a>
					<a href="admin-board.do">게시판관리</a>
				</c:if>
				<!-- 회원메뉴 -->
				<c:if test="${loginMember.memberCode != '9'}">
					<a href="myPage.do">나의정보</a>
					<a href="myLibrary.do">나의서재</a>
				</c:if>
				<a href="logout.do" id="userInfo">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
</div>
<hr>