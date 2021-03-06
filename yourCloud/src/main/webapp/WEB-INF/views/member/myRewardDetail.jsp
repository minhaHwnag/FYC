<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 리워드 상세보기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="${contextPath }/resources/css/myPage.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
</head>

<body>
	<jsp:include page="../common/customer_menubar.jsp"/>
	<jsp:include page="../common/myPage_menuList.jsp" />
	<br />
	<div id="outer">
		<div id="myReward">
			<div>
				<h2><c:out value="${ loginUser.userName }"/>님의 리워드</h2>
				<hr />
				<br /> 
				<h4>펀딩내역</h4>
				<br /> 
				<div class="rewards"> 
					<div class="left">
						<p class="category"><c:out value="${ r.categoryDiv }"/></p>	
						<p class="status smallText"><c:out value="${ r.endDate }"/> 종료</p>
						<p class="projectTitle"><c:out value="${ r.projectTitle }"/></p>
					</div>				
					<div class="right">
						<p><c:out value="${ r.fundDate }"/> 펀딩</p>	
					</div>
				</div>
				<div class="rewards">
					<div class="left">
						<p>펀딩 번호</p>
						<p>펀딩 날짜</p>
						<p>펀딩 마감일</p>
					</div>
					<div class="right">
						<p><c:out value="${ r.fundNo }"/></p>
						<p><c:out value="${ r.fundDate }"/></p>
						<p><c:out value="${ r.endDate }"/></p>
					</div>
				</div>
				<c:choose>
				<c:when  test="${r.payStatus eq '결제실패'}">
				<div class="payStatusForm rewards">
					<label style="color:lightgray" class="smallText">펀딩 상태</label>
					<p class="payStatus"><c:out value="${ r.payStatus  }"/></p>
					<p class="smallNotice">프로젝트가 실패하여, 결제가 진행되지 않습니다.</p>
				</div>
				</c:when>
				<c:when  test="${r.payStatus eq '결제전'}">
				<div class="payStatusForm rewards">
					<label style="color:lightgray" class="smallText">펀딩 상태</label>
					<p class="payStatus"><c:out value="${ r.payStatus  }"/></p>
					<p class="smallNotice">프로젝트가 진행중이여서, 결제 대기중입니다.</p>
				</div>
				</c:when>
				<c:when  test="${r.payStatus eq '결제완료'}">
				<div class="payStatusForm rewards">
					<label style="color:lightgray" class="smallText">펀딩 상태</label>
					<p class="payStatus"><c:out value="${ r.payStatus  }"/></p>
					<p class="smallNotice">프로젝트가 성공하여, 결제가 완료되었습니다.</p>
				</div>
				</c:when>
				</c:choose>
				<p>&nbsp;</p>
				<p class="smallNotice">&nbsp;* 펀딩하기는 쇼핑하기가 아닙니다!</p>
				<div class="rewards">
					<div class="left">
						<p class="smallText">결제 내역</p>
						<p class="projectTitle">리워드 이름</p>
						<p>가격 | 수량</p>
						<p>발송 시작일</p>
						<p>옵션</p>
					</div>
					<div class="right">
						<p class="smallText">&nbsp;</p>
						<p class="projectTitle"><c:out value="${ r.projectTitle }"/></p>
						<p><c:out value="${ r.rewardMoney }"/> 원</p>
						<p><c:out value="${ r.startDate  }"/></p>
						<p><c:out value="${ r.options }"/></p>
					</div>
				</div>
				<div class="rewards" style="background:#D4EAE5">
					<div class="left">
						<p>펀딩금액</p>
						<p>포인트 차감금액</p>
						<p>배송비</p>
						<hr />
						<p>펀딩 마감일</p>
					</div>
					<div class="right">
						<p><c:out value="${ r.rewardMoney }"/> 원</p>
						<p>- <c:out value="${ r.point }"/> 원</p>
						<p><c:out value="${ r.deliveryMoney }"/> 원</p>
						<hr />
						<p style="font-size:1.1em;font-weight:bold"><c:out value="${ r.rewardMoney + r.deliveryMoney - r.point}"/> 원</p>
					</div>
				</div>
				<div class="rewards">
					<div class="left">
						<p class="smallText">결제 정보</p>
						<p>결제 방법</p>
						<p>계좌 번호</p>
					</div>
					<div class="right">
						<p>&nbsp;</p>
						<p>신한카드</p>
						<p><c:out value="${ r.account }"/></p>
					</div>					
				</div>
				<div class="rewards">
					<div class="left">
						<p class="smallText">배송지 정보</p>
						<p><c:out value="${ loginUser.userName }"/></p>
						<p><c:out value="${ r.memberPhone }"/></p>
						<p><c:out value="${ r.deliverySite }"/></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#printBtn").mouseover(function(){
			$(this).css("cursor","pointer");
		});
	</script>
</body>
</html>