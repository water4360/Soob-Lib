<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 아이디 찾기 - 숲 ::</title>
</head>
<style>
section {
	min-height: 600px;
	position: relative;
	display: flex;
	flex-direction: row;
	align-items: center;
	padding-top: 50px;
}

#findIdBox {
	position: relative;
	display: flex;
	align-items: center;
	flex-direction: row;
}
</style>

<body>
	<header>
		<div id="top">
			<jsp:include page="../topMenu.jsp"></jsp:include>
		</div>
	</header>
	<section>
		<div align="center">
			<!-- 	액션이 갈지 말지 선택하는걸 이 onsubmit 에서 ... -->
			<div class="card" style="width: 20rem" align="center">
				<!-- 	submit 눌렀을때 어디로 보낼지 여기서 결정!-->
				<form id="findIdBox" method="post" action="findIdResult.do"
					name="findIdForm" style="height: 400px"
					onsubmit="return checkForm()">
					<input type="hidden" name="findId" value="id">
					<div class="form-group" align="center">
						<h3>아이디 찾기</h3>
						<h6>가입할 당시 입력했던 정보를 입력해주세요</h6>
						<label for="name"> <input type="text" class="form-control"
							placeholder="이름" id="name" name="name">
						</label> <label for="phone"> <input type="text"
							class="form-control" placeholder="연락처" id="phone" name="phone">
						</label>
						<div id="findIdError" style="color: red;">
							<c:if test="${findIdResult ne ''}">
							${findIdResult}
						</c:if>
						</div>
						<button type="submit" class="btn btn-success">아이디 찾기</button>
						<div>
							<a href="findPw.do">비밀번호 찾기</a>
							| <a href="signup.do">회원가입</a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</section>
	<footer>
		<jsp:include page="/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>
</html>