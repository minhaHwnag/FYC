<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">

<link rel="stylesheet" href="/yc/resources/css/animate.css">
<link href="/yc/resources/css/main.css" rel="stylesheet" />
<title>Insert title here</title>
<style>
@
keyframes fade_in {
	from {opacity: 0
}

to {
	opacity: 1
}

}
@
keyframes fade_out {
	from {opacity: 1
}

to {
	opacity: 0
}

}
.right-box {
	position: absolute;
	top: 0;
	right: 5%;
}

#floating {
	background-color: white;
	position: fixed;
	right: 50%;
	top: 20%;
	margin-right: -49%;
	text-align: center;
	width: 320px;
	border-radius: 8px;
	margin-top: -6%;
	margin-bottom: 5%;
	size: auto;
	display: none;
	opacity: 0;
	z-index: 99;
	animation-duration: 0.5s;
	animation-fill-mode: forwards;
}

.webTest {
	margin-left: 100px;
}
</style>
</head>
<body>
	<span class="position-absolute trigger"> <!-- hidden trigger to apply 'stuck' styles -->
	</span>
	<nav class="navbar navbar-expand-sm sticky-top navbar-dark">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbar1">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbar1">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link active"
						href="index.jsp">리워드 홈</a></li>
					<li class="nav-item"><a class="nav-link" href="category.bo">카테고리</a></li>
					<li class="nav-item"><a class="nav-link" href="intro">회사소개</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="notice.bo">공지사항</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="guide.bo">이용가이드</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="openExpectation.bo">오픈예정</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="openBoardList.bo">사용후기</a>
					</li>
				</ul>
			</div>
		</div>
		<!--container end-->
		<!--   플로팅 메뉴 -->
		
	</nav>
</body>
</html>