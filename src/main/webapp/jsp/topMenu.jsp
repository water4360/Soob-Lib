<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
#container {
	width: 100%;
	height: 80px;
	background-color: darkseagreen;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#logo {
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
	<!-- 	<div id="logo"><img src="./source/forest.png" width="10%"/><br>(로고)도서관, 숲</div> -->
	<div id="logo">
		<a href="main.do"> <span id="library-name">라이브러리, 숲</span></a>
	</div>

	<div id="menu">
		<c:if test="${ not empty loginMember }">
					ID : ${ loginMember.id }(${ loginMember.name })
		</c:if>
		<c:choose>
			<c:when test="${ empty loginMember }">
				<a href="signup.do">회원가입</a>
				<a href="login.do">로그인</a>
			</c:when>
			<c:otherwise>
				<!-- 리디는 회원가입/로그인 외에도 항상 아이콘으로 표시,
				로그인이 안되어 있어도 클릭 가능하고 로긴중 아니면 로긴창. -->
				<!-- 관리자메뉴 -->
				<c:if test="${loginMember.memCode == '9'}">
					<a href="">회원관리</a>
					<a href="${ pageContext.request.contextPath }/bookManagement.do">도서관리</a>
					<a href="">게시판관리</a>
				</c:if>
				<!-- 회원메뉴 -->
				<c:if test="${loginMember.memCode == '1'}">
					<a href="myPage.do">나의정보</a>
					<a href="myLibrary.do">나의서재</a>
				</c:if>
				<a href="logout.do" id="userInfo">로그아웃</a>
			</c:otherwise>
		</c:choose>
	</div>



</div>