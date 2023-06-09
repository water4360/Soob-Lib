<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 회원가입 - 숲 ::</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>



<script>
//아이디 중복검사 체크
$(function(){
	
	// 버튼 누를 필요 없이 실시간 이벤트
	$("#id").on("keyup", function(){
		var $checkID = $(this).val();
        var $error = $("#invalid-feedback");
        var $msg = $("#valid-feedback");

		console.log("keyup: " + $checkID);

		if($checkID === ""){
			$error.html("");
			$msg.html("");
			console.log("아이디 없음")
			return;
		}
		
		$.ajax({
			type : "POST",
			url: "./jsp/checkId.jsp",
			data : { "id" : $checkID },
			dataType : "html",
			async : true,
			success : function(data){
				console.log("jsp data : "+data)
				
				//중복된 아이디라면
				if(data.trim() == "true"){
					$error.html("❌이미 존재하는 아이디예요");
					$msg.html("")
				}else{
					//중복은 아니지만 4글자 미만
					if($checkID.length < 4) {
							$error.html("❌아이디가 너무 짧아요");
							$msg.html("")
							console.log("아이디 짧음")
					} else {
						$error.html("");
						$msg.html("✔사용가능한 아이디예요")
					}
				}
			}
		})
	})
})








//비밀번호 & 비밀번호 확인 일치 체크
function checkPw() {
	let f = document.joinForm
	let pw = f.pw
	let pw2 = f.pw2
	let pwFeedback = document.getElementById("pw2-feedback")
	
	if(pw.value !== pw2.value) {
		pw2.classList.add("is-invalid");
		pwFeedback.innerText = ('❌비밀번호가 일치하지 않아요');
		pwFeedback.style.color = "red";
		return false;
	} else {
		pw2.classList.remove("is-invalid");
		pwFeedback.innerText = ('✔비밀번호가 일치해요');
		pwFeedback.style.color = "green";
		return true;
	}
}

</script>



<style>
body {
	min-height: 100vh;
}

.input-form {
	min-width: 400px;
	max-width: 500px;
	margin-top: 20px;
	padding: 32px;
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
}
</style>
</head>
<header>
	<jsp:include page="/jsp/topMenu.jsp"></jsp:include>
</header>
<body style="background-color: white">
	<div class="container">
		<h3 align="center">회원가입</h3>

		<div class="input-form-backgroud row">
			<div class="input-form mx-auto"
				style="min-width: 400px; max-width: 500px;">

				<form method="post" action="signupProcess.do" name="joinForm"
					class="validation-form" novalidate>
					<div class="col-12 mb-3">
						<label for="id">아이디</label> <input type="text"
							class="form-control" id="id" name="id" autocorrect="off"
							autocapitalize="none" placeholder="4~20자 영문, 숫자 입력" value=""
							pattern="[a-zA-Z0-9]{4,20}" required>
						<div class="invalid-feedback">아이디를 입력해주세요</div>
						<div id="invalid-feedback" style="color: red;"></div>
						<div id="valid-feedback" style="color: green;"></div>

					</div>

					<div class="col-12 mb-3">
						<label for="pw">비밀번호</label> <input type="password"
							class="form-control" id="pw" name="pw"
							placeholder="4~12자 영문+숫자+특수문자" value=""
							onchange="checkPw()" required>
						<div class="invalid-feedback">비밀번호를 입력해주세요</div>
					</div>
					<div class="col-12 mb-3">
						<label for="pw2">비밀번호 확인</label> <input type="password"
							class="form-control" id="pw2" name="pw2" placeholder="비밀번호 재입력"
							value="" onchange="checkPw()" required>
						<div id="pw2-feedback" style="color: red;"></div>
					</div>


					<div class="col-12 mb-3">
						<label for="name">이름</label> <input type="text"
							class="form-control" id="name" name="name" placeholder="이름 입력"
							value="" pattern="[가-힣a-zA-Z]{1,20}" required>
						<div class="invalid-feedback">이름을 입력해주세요</div>
					</div>
					<div class="col-12 mb-3">
						<label for="phone">연락처</label> <input type="number"
							class="form-control" id="phone" name="phone"
							placeholder="예)01023456789" value=""
							pattern="[0-9]{10,11}" required>
						<div class="invalid-feedback">연락처 형식이 올바르지 않아요</div>
					</div>
					<div class="col-12 mb-3">
						<label for="email">이메일</label> <input type="email"
							class="form-control" id="email" name="email"
							placeholder="예)soob@library.com" required>
						<div class="invalid-feedback">이메일 주소가 올바르지 않아요</div>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="agreement"
							required> <label class="custom-control-label"
							for="agreement">(필수)개인정보 수집 및 이용에 동의할게요</label>
					</div>
					<div class="mb-4"></div>
					<button class="btn btn-success btn-lg btn-block" type="submit"
						id="signup-btn">회원가입</button>
				</form>
			</div>
		</div>
	</div>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>

</html>