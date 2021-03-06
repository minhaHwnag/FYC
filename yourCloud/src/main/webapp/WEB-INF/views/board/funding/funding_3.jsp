<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String a= request.getParameter("blind"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/animate.css">
<link href="${pageContext.request.contextPath}/resources/css/main.css"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Gothic+A1&display=swap"
	rel="stylesheet">
<title>니가그린구름그림</title>
<style>
.outer {
	width: 900px;
	margin: auto;
	font-family: 'Gothic A1', sans-serif;
}

.circle2 {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background: #1DE9B6;
	font-size: 14px;
	text-align: center;
	line-height: 100px;
}

.circle1 {
	border: 1px;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	background: #EEEEEE;
	font-size: 14px;
	text-align: center;
	line-height: 100px;
}

#step {
	margin-left: 250px;
}

#div1 {
	width: 700px;
	margin-left: 100px;
	color: #1DE9B6;
	text-align: center;
	font-size: x-large;
	border: 2px solid #1DE9B6;
	padding: 20px;
}

#table1 tr td {
	background: #EEEEEE;
	font-size: small;
	padding: 20px 40px;
}

#p1 {
	float: left;
}

#p2 {
	float: right;
}

.box {
	border: 1px;
	width: 500px;
	height: 200px;
	background: #EEEEEE;
	font-size: 14px;
	text-align: center;
	line-height: 100px;
}

#table2 tr td {
	padding: 10px 30px;
}

#div3 {
	margin-left: 20px;
}
</style>
</head>
<body>
	<jsp:include page="../../common/customer_menubar.jsp" /><br>
	<br>
	<jsp:include page="../../common/customer_menuList.jsp" /><br>
	<div class="outer" style="min-height: 800px;">

		<div id="step">
			<table>
				<tr>
					<td class="circle1">리워드 선택</td>
					<td>&emsp;-&emsp;</td>
					<td class="circle1">결제예약</td>
					<td>&emsp;-&emsp;</td>
					<td class="circle2"><b>소문내기</b></td>
				</tr>
			</table>
		</div>

		<br> <br>

		<div id="div1">
			
			<b> <% if(a.equals("0")) { %>
					<c:out value="${ sessionScope.loginUser.userName }" /> 님<br> 펀딩에 참여해주셔서 정말 감사합니다!
				<% }  else {%>
				<c:if test="${ blind == 0 }">익명 서포터님<br> 펀딩에 참여해주셔서 정말 감사합니다!</c:if> 
				<% } %>
			</b>
		</div>

		<br> <br>

		<div>
			<table id="table1">
				<tr>
					<th>니가그린구름그림 리워드 펀딩은 결제예약 시스템을 이용합니다.</th>
				<tr>
					<td>쇼핑하기처럼 지금 결제가 되지 않았습니다. 프로젝트가 성공하면 결제가 실행됩니다. 프로젝트
						종료일(2019.09.01)의 다음 영업일에 펀딩 성공여부에 따라 결제실행/결제취소가 진행됩니다. 프로젝트 실패 시
						결제예약 정보가 자동으로 삭제되고 결제가 진행되지 않습니다. 결제실행일에 결제자 귀책사유(카드재발급, 한도초과,
						이용정지 등)로 인하여 결제가 실패할 수 있으니, 결제예약으로 등록하신 카드가 유효한지 다시 한번 확인하세요. 1차
						결제 실패 시 실패일로부터 3 영업일 동안 재 결제를 실행합니다. 결제 실패 문자를 받으시면, 카드사와 카드결제 불가
						사유(한도초과 또는 카드재발급 등)를 확인해 주세요. 결제할 카드를 변경하시려면, 마이페이지 > 나의 펀딩현황의
						결제정보에서 카드정보를 변경해주세요. 1차 결제 실패 이후 3 영업일 동안 재 결제 시도에서 결제가 정상적으로 실행되지
						않으면, 펀딩참여가 취소됩니다.</td>
				</tr>
			</table>
		</div>

		<br> <br>

		<div id="div2">
			<p id="p1">결제예약결과 및 배송예상일 조회는 나의 펀딩현황에서 확인하세요.</p>
			<p id="p2">
				<input type="button" id="goMyReward" value="바로가기"
					class="btn btn-info">
			</p>
			<br> <br>
		</div>
		<br> <br>



	</div>

	<br>
	<br>
	<br>

	<script>
		$("#goMyReward").click(function() {
			location.href = "myReward.me";
		});
	</script>
	<jsp:include page="../../common/customer_footer.jsp" />
</body>
</html>