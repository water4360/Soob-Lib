<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#container {
	width: 100%;
	height: 400px;
	background-color: forestgreen;
	display: flex;
	flex-direction: column;
	align-items: center;
	position: relative;
}
</style>
<div id="container">
	<div id="menu">
		<c:if test="${ not empty loginUser }">
		[${ loginUser.userName }(${ loginUser.id })님 접속중!]
		</c:if>
		<c:choose>
			<c:when test="${ empty loginUser }">
				<a href="join.do">회원가입</a>
				<a href="login.do">로그인</a>
			</c:when>
			<c:otherwise>
				<a href="myPage.do">내정보</a>
				<a href="logout.do" id="userInfo">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>
	
	
	<!-- 	<div id="logo"><img src="./source/forest.png" width="10%"/><br>(로고)도서관, 숲</div> -->
	<div id="logo">
		<img src="./source/forest.png" width="10%" /><br>(로고)도서관, 숲
	</div>
	
	
	
	<div id="search">
		전체도서검색 <input id="title" type="radio" name="searchBy" checked>
		<label for="title"> 제목 </label> <input id="writer" type="radio"
			name="searchBy"> <label for="writer"> 저자 </label> <input
			type="text" id="search" />
		<button id="searchBtn">검색</button>
	</div>

</div>