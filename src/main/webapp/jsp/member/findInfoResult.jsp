<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 아이디/비밀번호 찾기결과 - 숲 ::</title>
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

#findInfoBox {
	position: relative;
	display: flex;
	align-items: center;
	flex-direction: column;
	justify-content: center;
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
			<div class="card" style="width: 400px" align="center">
				<!-- 	submit 눌렀을때 어디로 보낼지 여기서 결정!-->
				<form id="findInfoBox" method="post" action="" name="findInfoForm"
					style="height: 300px; width: 400px;" onsubmit="return checkForm()">
					<div class="form-group" id="result-box" align="center">
						<h3>
							<b>${findInfo}</b>찾기 결과
						</h3>
						<div id="findInfoResult">
							<h5>
								<span>${findInfoResult}</span>
								<c:choose>
									<c:when test="${findInfo eq '아이디'}">
										<span>회원님의 아이디는 [<b style="color: #28A745">${findIdResult}</b>]이예요.
										</span>
										<div>
											<button type="submit" class="btn btn-outline-success"
												formaction="findPw.do">비밀번호 찾기</button>
										</div>
									</c:when>
									<c:when test="${findInfo eq '비밀번호'}">
										<span>회원님의 비밀번호는 [<b style="color: #28A745">${findPwResult}</b>]이예요.
										</span>
										<div>
											<button type="submit" class="btn btn-outline-success"
												formaction="findId.do">아이디 찾기</button>
										</div>
									</c:when>
								</c:choose>
							</h5>
							<button type="submit" class="btn btn-success"
								formaction="login.do">로그인하러 가기</button>
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