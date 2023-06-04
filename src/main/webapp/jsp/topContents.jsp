<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
#top-contents {
	width: 100%;
	min-height: 300px;
	position: relative;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-end;
}

#top-search {
	bottom : 30px;
}
</style>
<div id="top-contents">
	<div id="top-search">
		<input id="title" type="radio" name="searchBy" checked>
		<label for="title"> 제목 </label>
		<input id="writer" type="radio" name="searchBy">
		<label for="writer"> 저자 </label>
		<input type="text" id="search" />
		<button id="searchBtn">검색</button>
	</div>
</div>