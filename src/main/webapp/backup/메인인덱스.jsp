<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>:: 라이브러리, 숲 ::</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="./css/style.css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
</head>

<style>


#main-top {
	height: 100%;
	display: flex;
	position: relative;
	flex-direction: row;
}

#main-center {
	min-height: 300px;
	width:500px;
}

#main-bottom {
	width: 100%;
	/* min-height : 100%; */
	/* min-height: 300px; */
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
}

section {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	background-color: gray;
}

#notice {
	width: 50%;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: bisque;
}

#list {
	width: 50%;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	background-color: aquamarine;
}

#famous {
	display:flex;
	top : 200px;
	font-size: xx-large;
	text-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
}

</style>

<body>
	<header>
		<div id="main-top">
			<jsp:include page="${pageContext.request.contextPath}/jsp/topMenu.jsp"></jsp:include>
		</div>
	</header>
	<section>
<!-- 		<div id="main-center"> -->
<!-- 		<img src="./source/src-img/img/library8.jpg"> -->
<!-- 		</div> -->

	<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="./source/src-img/img/library8.jpg" class="d-block w-100" alt="...">
      <div id="famous" class="carousel-caption d-none d-md-block">
        <h3>책 속에는 과거의 모든 영혼이 가로누워 있다</h3>
        <p>- 칼라일 -</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./source/src-img/img/library10.jpg" class="d-block w-100" alt="...">
      <div id="famous" class="carousel-caption d-none d-md-block">
        <h3>한 권의 책은 세계에 대한 하나의 버전이다</h3>
        <p>- 살만 루시디 -</p>
      </div>
    </div>
    <div class="carousel-item">
      <img src="./source/src-img/img/library7.jpg" class="d-block w-100" alt="...">
      <div id="famous" class="carousel-caption d-none d-md-block">
        <h3>닫혀있기만 한 책은 블록일 뿐이다</h3>
        <p>- 토마스 풀러 - </p>
      </div>
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </button>
</div>




	</section>
	<footer>
		<jsp:include page="${pageContext.request.contextPath}/jsp/bottom.jsp"></jsp:include>
	</footer>
</body>

</html>