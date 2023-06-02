<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<style>
			#verticalBox {
				left: 0;
				top: 0;
				width: 30%;
				height: 100%;
				background-color: #5967ff;
				display: flex;
				align-items: center;
				justify-content: center;
			}
		</style>
		<div id="verticalBox">
			세로 좌측정렬
			<div id="logo">
				로고자리
			</div>
			<div>
				<c:if test="${ loginUser.type eq 'S' }">
					회원관리 |
				</c:if>
				<a href="/WebLib/jsp/book/bookList.jsp">도서검색</a> |
				<a href="/WebLib/jsp/board/boardList.jsp">게시판</a> |
				<c:choose>
					<c:when test="${ empty loginUser }">
						<a href="/WebLib/jsp/login/join.jsp">회원가입</a> |
						<a href="/WebLib/jsp/login/login.jsp">로그인</a> |
					</c:when>
					<c:otherwise>
						<a href="/WebLib/jsp/login/myPage.jsp">마이페이지</a> |
						<a href="/WebLib/jsp/login/logout.jsp">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</div>
		<c:if test="${ not empty loginUser }">
			[${ loginUser.name }(${ loginUser.id })님 접속중!]
		</c:if>
		</div>

