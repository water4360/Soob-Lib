<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>::자유게시판 - 숲::</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<style>
table {
    table-layout: auto;
    width: 80%;
}
</style>

</head>
<body>
	<header>
		<jsp:include page="../topMenu.jsp"></jsp:include>
	</header>
    <section>
        <div class="container col-5 mt-5">
            <div class="text-center">
                <h2>문의글 작성</h2>
            </div>
            <form action="add-post.do" method="post">
            <input type="hidden" name="writer" value="${loginUser.id}">
                <div class="mb-3">
                    <input type="text" class="form-control" name="title" placeholder="제목을 입력해 주세요.">
                </div>
                <div class="mb-3">
                    <textarea class="form-control" name="content" rows="10" placeholder="내용을 입력하세요."></textarea>
                </div>
                <div class="mb-3 justify-content-center">
                    <button type="submit" class="btn mr-2 btn-success">글등록</button>
                    <a href="board.do" class="btn btn-secondary">목록으로</a>
                </div>
            </form>
        </div>
    </section>
	<footer>
		<jsp:include page="/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>
