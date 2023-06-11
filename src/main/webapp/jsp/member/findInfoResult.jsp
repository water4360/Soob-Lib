<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>:: ���̵�/��й�ȣ ã���� - �� ::</title>
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
			<!-- 	�׼��� ���� ���� �����ϴ°� �� onsubmit ���� ... -->
			<div class="card" style="width: 400px" align="center">
				<!-- 	submit �������� ���� ������ ���⼭ ����!-->
				<form id="findInfoBox" method="post" action="" name="findInfoForm"
					style="height: 300px; width: 400px;" onsubmit="return checkForm()">
					<div class="form-group" id="result-box" align="center">
						<h3>
							<b>${findInfo}</b>ã�� ���
						</h3>
						<div id="findInfoResult">
							<h5>
								<span>${findInfoResult}</span>
								<c:choose>
									<c:when test="${findInfo eq '���̵�'}">
									<div>
										<p>ȸ������ ���̵�� [<b style="color: #28A745">${findIdResult}</b>]�̿���.
										</p>
										</div>
										<div>
											<button type="submit" class="btn btn-outline-success"
												formaction="findPw.do">��й�ȣ ã��</button>
											<button type="submit" class="btn btn-success"
												formaction="login.do">�α����Ϸ� ����</button>
										</div>
									</c:when>
									<c:when test="${findInfo eq '��й�ȣ'}">
									<div>
										<p>ȸ������ ��й�ȣ�� [<b style="color: #28A745">${findPwResult}</b>]�̿���.
										</p>
										</div>
										<div>
											<button type="submit" class="btn btn-outline-success"
												formaction="findId.do">���̵� ã��</button>
											<button type="submit" class="btn btn-success"
												formaction="login.do">�α����Ϸ� ����</button>
										</div>
									</c:when>
								</c:choose>
							</h5>
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