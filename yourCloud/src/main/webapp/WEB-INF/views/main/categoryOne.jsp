<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
   Date nowTime = new Date();
   SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ekko-lightbox/5.3.0/ekko-lightbox.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.css">
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>   
<style>
body, ul {
   margin: 0;
   padding: 0;
}

li {
   list-style-type: none;
}

a {
   text-decoration: none;
}

.tab-list {
   text-align: center;
}

.tab-list ul {
   display: inline-block;
   *display: inline;
   zoom: 1;
}

.tab-list ul li {
   float: left;
   margin-left: -1px;
   z-index: 1;
}

.tab-story a {
   height: 40px;
   padding: 0 30px;
   line-height: 30px;
}

* {
   word-break: break-all;
}

.reward-body {
   width: 100%;
}

.dd {
   
   width: 75%;
   margin: 0 auto;
}
/* 컨텐츠 영역  */
.sub-contents {
   float: left;
   border: 1px solid purple;
   width: 65%;
   
   margin: 0 auto;
   margin-right: 18px;
}
/* 오른쪽 영역  */
.opener-info {
   float: left;
   border: 1px solid black;
   width: 24%;
}

.btn-funding {
   /*    border:1px solid #00c4c4; */
   border: 0;
   outline: 0;
   font-size: 17px;
   background: #00c4c4;
   padding: 1.19px 23.9999px 0px;
   color: white;
   width: 85%;
   height: 45px;
}

.btn-question, .btn-share {
   width: 28%;
   border: 1px solid skyblue;
   background: white;
   height: 35px;
}

.btn-like {
   width: 28%;
   background: white;
   height: 34.6px;
   border:0;
   outline:0;
}
.btn-meker-question {
   
   border:1px solid rgba(0, 0, 0, 0.15);
   border-radius: 3px;
   background-color: #fff;
   cursor: pointer;
   padding: 0 1.41176em;
   height: 48px;
    vertical-align: middle;
    line-height: 1;
    color: rgba(0, 0, 0, 0.54);
    font-size: 17px;
    width:90%;
    margin: 0 auto;
    text-align: center;
   
}
.projectTitle{
   margin-bottom: 10px;
    font-weight: 500;
    font-size: 15px;
    color: #777;
}.reward-list{
   position: relative;
 
    width: 100%;
    margin-bottom: 20px;
   /*  background: #d19cfa; */
    border: 1px solid #eaeaea;
    text-align: left;
    background: white;
   
}
.reward-list .reward-qty em {
    padding: 2px 5px;
    font-weight: 500;
    background: #f6ecfe;
}
.reward-list .reward-soldcount {
    font-size: 13px;
    line-height: 21px;
    color: #00132C;
}
.reward-info .reward-qty {
    margin-bottom: 5px;
    font-size: 13px;
    line-height: 21px;
    color: #c88af9;
}

.btn-declaration {
   width: 100%; 
   height: 40px;
   background: rgb(231, 76, 60);
   border: 0;
   color: white;
   
}

.reward-header{
   text-align:center;
    border: 1px solid black;
    height:-1px;
    top: -20px;
    background-size: cover;
    background: #001328!important;
    color: white;
   }


.dropbtn {
  background-color: #ea2129;
  color: white;
  padding: 16px;
  font-size: 16px;
  border: none;
}

.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f1f1f1;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}

.contents-view img{
   width: 700px;
}

.title-img img{
   width: 500px;
    display:block;
    margin-left:auto;
    margin-right:auto;
}

</style>
<meta charset="UTF-8">
<title>니가 그린 구름 그림</title>
</head>
<body>
<jsp:include page="../common/customer_menubar.jsp"/>
   <jsp:include page="../common/customer_menuList.jsp" />
<script type="text/javascript">

   $(function(){
      $("html").css({"background-image":"linear-gradient('')", "background":"white"});
      
   })
</script>
	<div id="outer" style="background:white;">
	<!-- 리워드 헤더 이미지  -->
	<div class="reward-header">
		<p class="title-info">
			<h6 style="color:#5cdede;">
				<c:choose>
					<c:when test="${detail.category eq 'A1' }"> 테크,가전</c:when>
					<c:when test="${detail.category eq 'A2' }"> 패션,잡화</c:when>
					<c:when test="${detail.category eq 'A3' }"> 키즈</c:when>
					<c:when test="${detail.category eq 'A4' }"> 여행,레저</c:when>
					<c:when test="${detail.category eq 'A5' }"> 뷰티</c:when>
					<c:when test="${detail.category eq 'A6' }"> 도서</c:when>
					<c:when test="${detail.category eq 'A7' }"> 반려동물</c:when>
					<c:when test="${detail.category eq 'A8' }"> 스포츠</c:when>
					<c:when test="${detail.category eq 'A9' }"> 푸드</c:when>
					<c:when test="${detail.category eq 'A10' }"> 홈리빙</c:when>
					<c:otherwise>카테고리 미정</c:otherwise>
				</c:choose> &emsp;
			<strong style="color:white">${ detail.projectShortTitle }</strong>
			</h6> 
		<h2 class="title-header" style="color: white;"> ${ detail.projectTitle } </h2>
		</p>
	</div>
	
	<br/>
	
	<div class="tab-list">
		<ul class="tab-story">
			<li><a href="#" class="tab-link">스토리</a></li>
			<li><a href="categoryOneFunding.ca?projectNo=${detail.projectNo}" class="tab-link">펀딩안내</a></li>
			<li><a href="categoryOneNews.ca?projectNo=${detail.projectNo}" class="tab-link">새소식</a></li>
			<li><a href="categoryOneCommunity.ca?projectNo=${detail.projectNo}" class="tab-link">커뮤니티</a></li>
			<li><a href="categoryOneSupporter.ca?projectNo=${detail.projectNo}" class="tab-link">서포터</a></li>
		</ul>
	</div>
	
	<hr/>
	
	<div class="reward-body">
			<div class="dd">
			<div class="sub-contents">
				
				<!-- 이미지 앤 동영상 영역 -->
				<br>
				<div class="title-img">
					<img src="/yc/resources/uploadFiles/<c:out value="${detail.newFileName}"/>" width="100%">
				</div> 
				<br />

				<div style="padding: 20px; background: #eafbf7; background: rgba(0, 204, 163, 0.1)">
					<p style="color: black; font-size: 20px; linc-height: 20px; margin-bottom: 10px;">
						<strong>목표 금액</strong> &nbsp; ${ detail.money }원  &nbsp; &nbsp; 
						<strong>펀딩 마감일</strong> &nbsp; ${ detail.endDate } 까지
					</p>
					
					<p style="color: #4a4a4a; font-size: 12px; line-height: 19px;">
						<strong>100% 이상 모이면 펀딩이 성공되는 프로젝트</strong> <br /> 
						이 프로젝트는 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.
					</p>
				</div>
				<!-- 스토리 영역 -->
				<!-- 에이터 영역님이다 -->
				<br />
				<br />
				<div class="story" style="text-align:left; padding-left:40px; padding-right:40px;">
					<strong class="title-story" style="color:#673AB7">스토리</strong> <br />
					<br />
					
					<div class="contents-view">
						
						${detail.story}

						<!-- 프로젝트 일정 --><br><br>
						<p style="color:#673AB7">
							<strong>프로젝트 일정 안내</strong>
						</p>
						<p>
							<strong style="color:#B39DDB"> 펀딩 전 프로젝트 일정을 꼭 확인해 주세요! </strong> 
							<br> ${ detail.projectShortTitle }의 일정은 새소식을 통해 업데이트 하도록 하겠습니다.
						</p>
						<p style="color:#80CBC4">
							 ${detail.endDate } : 프로젝트 마감 
						</p>
						<p style="color:#B39DDB">
							<br />
						<strong >배송 안내</strong>
						<p>
						<p>
							1. 리워드는 CJ 대한통운 택배사를 통해 발송됩니다. <br /> 2. 배송 소식은 새소식을 통해 내용을 공유해
							드리겠습니다. <br /> &nbsp; - ${detail.delivery }후 부터 일일 1,000개씩 순차배송 <br />
							&nbsp; - 배송시 포장상태 : 에어캡 + 박스포장 <br /> 3. 도서/산간 지방도 택배 발송이 되며, 지역에
							관게없이 배송비는 없습니다. <br> &emsp; 단 , 배송 예정일이 지연될 수 있음을 미리 안내드립니다. &nbsp; <br />
							4. 제품 및 배송 관련 문의사항문의 &nbsp; : <a style="color:#536DFE">${detail.email }</a>
						</p>
						<br>

					</div>
				</div>
			</div>
		</div>
		</div>
	<input type="hidden" id="bNum" value="${ projectNo }" />
		
		<!-- 오른쪽 영역 -->
		<div class="opener-info" style="text-align:center;">
			<div class=state-box>
				<p class="remin-day"> 
				
				<c:if test="${detail.progressStatus eq '실패' || detail.progressStatus eq '성공'}">
					<h3>마감된 프로젝트입니다</h3><br>
					<img alt="" src="/yc/resources/images/stopwatch.png" style="width:80px;">
				</c:if>
				
				<c:if test="${detail.progressStatus eq '오픈' }">
					<script>
  	 					var now = new Date();
  						var then = new Date('${ detail.endDate }');
   						var gap = now.getTime() - then.getTime();
   						gap = Math.floor(gap / (1000 * 60 * 60 * 24)) * -1;
   						document.write('<div id="dday" style="font-size:34px;">D-<span style="font-size:34px;">' + gap+ "일 남음" + '</span></div>');
					</script>
				
				</c:if>
				
				</p>
				<hr />
				
							
			<c:set var="money" value="${detail.money}"/>
			<c:set var="sumFundMoney" value="${sumFundMoney}"/>
			<c:set var="sum" value="${ Math.round((sumFundMoney/ detail.money)*100) }"></c:set>
				
				<strong style="font-size: 24px;"> <c:out value="${sum}"/> </strong>% 달성   
				<p class="total-money" style="font-size: 24px;">
					<strong>${sumFundMoney}</strong> 원 펀딩
				</p>
				<p class="total-supporter" style="font-size: 24px;">
					<strong>${supportCount}</strong> 명의 서포터  
				</p>
			</div>

	<c:if test="${ empty sessionScope.loginUser }"> 
			<button type="button" onclick="goFunding();" class="btn-funding">펀딩하기</button><br>
	</c:if>
			
		<c:if test="${ ! empty sessionScope.loginUser }"> 	
			<c:if test="${detail.progressStatus ne '성공'}">
				<c:if test="${ '0' == fundCnt }">
					<button type="button" onclick="goFunding();" class="btn-funding">펀딩하기</button><br>
				</c:if>	
				<c:if test="${ '0' != fundCnt }">
					<button type="button" onclick="goCancle();" class="btn-funding">펀딩 취소하기</button><br>
				</c:if>
			</c:if>
				
			<c:if test="${detail.progressStatus eq '성공'}">
				<c:if test="${ encoreCount >= 1}">
					<button class="btn-funding" onclick="noEncore();">앵콜하기</button><br>	
				</c:if>
				
				<c:if test="${ encoreCount == 0}">
					<button class="btn-funding" id="encore">앵콜하기</button><br>			
				</c:if>
			</c:if>
		</c:if>
		<script>
		$(function(){
			$('#encore').click(function(){
				
				var projectNo = ${detail.projectNo};
				var userNo = ${loginUser.userNo};
				
				console.log(projectNo);
				console.log(userNo);
				
				$.ajax({
					url : "encore.ca",
					type : "get",
					dataType : "json",
					data : { projectNo : projectNo, userNo : userNo },
					success: function(data){
						alert("앵콜 신청이 완료되었습니다!");
						location.reload();
					},error : function(data){
						alert("에러!");
					}
				})
				
			})
		})
	</script>	
	
	<script>
		function noEncore(){
			alert("이미 앵콜신청하신 프로젝트입니다");
		}
	
	
	</script>
			
			
			<br />
			<script>
				function goFunding(){
					var userNo = '${ sessionScope.loginUser.userNo}';
					if(userNo == 0){
						alert("로그인이 필요한 기능입니다.");
					} else {
						location.href="funding_1.bo?projectNo="+'${projectNo}'+"&userNo="+'${sessionScope.loginUser.userNo}';
					}
				};
				function goCancle(){
					var userNo = '${ sessionScope.loginUser.userNo}';
					location.href="cancleFund.pa?projectNo="+'${projectNo}'+"&userNo="+'${sessionScope.loginUser.userNo}';
					$.ajax({
						url:"cancleFund.pa",
						type:"POST",
						data:{"userNo":userNo, "projectNo":'${projectNo}'},
						success:function(){
							alert("펀딩이 취소되었습니다.");
							location.reload();
						}, error:function(){
							alert("에러가 발생했습니다. 관리자에게 문의해주세요");
						}
					})
				}
			</script>
			<div class=btn-wrap>
				<div class="btn-wrap-flex">
				
				<input type="text" id="userNo" value="${ loginUser.userNo }" hidden>
											
						<!-------------------- 좋아요 기능 19.9.19 완성---------------------->
		<a onclick= 
			 	<c:if test="${ empty sessionScope.loginUser }"> "alert('로그인 후 이용가능합니다'); return false;" 
			 		<button class="btn-like" id="like">
			 			<img src="/yc/resources/images/empty_heart.png" style="width: 40px; height: auto;" id="heart">
			 		</button>	
 				</c:if>>
 				<c:if test= "${ !empty sessionScope.loginUser }">
 					<c:if test="${likeCount == 0 }">
						<button class="btn-like" id="like">
							<img src="/yc/resources/images/empty_heart.png" style="width: 40px; height: auto;" id="heart">
						</button>
					</c:if>						
					
					<c:if test="${likeCount == 1 }">
						<button class="btn-like" id="like">
							<img src="/yc/resources/images/like_heart.png" style="width: 40px; height: auto;" id="heart">	
						</button>
					</c:if>
				</c:if>
		</a>		
					<!------------------------------------------------------------------>
					
					
					<button class="btn-share" id="createBtn">QR코드</button>
			
				</div>
					<div>
							<img id="qrcode" src='' />
	</div>
	</div>
	<script>
	cnt = ${ likeCount };
	
	$(function(){
		
		$('#like').click(function(){
			
			var pNo = ${ detail.projectNo };
			var mNo = ${ param.userNo };
			
			cnt++;
			$.ajax({
				url : "like.ca",
				type:"get",
				dataType:"json",
				data:{ pNo : pNo, mNo : mNo, cnt : cnt},
				success: function(data){
					
					var cnt2 = data.cnt;
					console.log(cnt)
					if(cnt2 == 0) {
				 		
						var $like = $('#like');
						var $heart = $('#heart');
						
						$heart.remove();
					
						var $heart2 = ('<img src="/yc/resources/images/like_heart.png" style="width: 40px; height: auto;" id="heart">');
						
						$like.append($heart2); 
				
					}else {
						var $like = $('#like');
						var $heart = $('#heart');
						
						$heart.remove();
						var $heart2 = ('<img src="/yc/resources/images/empty_heart.png" style="width: 40px; height: auto;" id="heart">');
						
						$like.append($heart2); 
					}
					
					console.log("ajax 넘어오는지 확인  2단계");
				},
				error : function(data){
					/* alert("에러"); */
				}
			});
		});
	})
	</script>	
			<hr />
			
			<div class="project-meker-info">
				<h5>메이커 정보</h5>
				<div class="maker-box"><br>

					<table style="width: 100%;">
						<tr>
							<td>
								<c:if test="${makerImg eq null}">
									<img alt="메이커이미지" src="/yc/resources/images/null.png"; style="width:100px; height:100px;"> 
								</c:if>
								<c:if test="${makerImg ne null}">
								<c:choose>
									<c:when test="${ fn: contains(makerImg, '.') }">
										<img alt="메이커이미지" src="/yc/resources/uploadFiles/<c:out value="${makerImg}"/>" style="width:100px; height:100px;border-radius: 50%;"> 	
									</c:when>
									<c:otherwise>
										<img alt="메이커이미지" src="/yc/resources/uploadFiles/<c:out value="${makerImg}"/>.JPG" style="width:100px; height:100px;border-radius: 50%;"> 	
									</c:otherwise>
								</c:choose>
								</c:if>
						
							</td>
							<td>${ detail.companyName }</td> 
						</tr>
						<tr>
							<td><br/></td>
						</tr>
	
						<tr>
						
						<c:if test="${ empty sessionScope.loginUser }">
							<td colspan="2" align="center"><button class="btn-meker-question" onclick="noMessage()">
								메이커에게 문의하기</button></td>
						</c:if>
						
						<c:if test="${! empty sessionScope.loginUser }">
						
							<c:if test="${loginUser.userNo eq detail.userNo}">
								<td colspan="2" align="center"><button class="btn-meker-question" onclick="selfMessage()">
								메이커에게 문의하기</button></td>
							</c:if>
						
							<c:if test="${loginUser.userNo ne detail.userNo}">
							<td colspan="2" align="center">
								<button class="btn-meker-question" onclick="window.open('sendMessage.me?userNo=${loginUser.userNo}&makerNo=${detail.userNo}'
								,'_black','width=460,height=513');return false;">
								메이커에게 문의하기</button>			
							</td>
							</c:if>
						
						</c:if>
						
						</tr>
						<tr>
							<td><br /></td>
						</tr>
						
						<tr>
							<td colspan="2">
								<p style="font-size: 12x;">
									메이커 연락처 : ${ detail.phone }</p>
							</td>
						</tr>
						
					</table>
				</div>
			</div>
			
			<script>
			function selfMessage(){
				alert("회원님이 오픈한 프로젝트입니다");
			}
			
			function noMessage(){
				alert("로그인 후 이용 가능합니다");
			}
			
			</script>
			
			
			<br />
			<div class="moveRewards">
				<div class="wd-gift">
					<h3 class="projectTitle"><b>리워드 선택</b></h3>
					<button class="reward-list"  onclick="goFunding();">
						 <div class="reward-info" style="padding:10px 10px 10px 10px;">
						 	<c:forEach var="re" items="${reward }">
									<p style="color:#9E9E9E;">&nbsp;<b>NO . <c:out value="${re.rewardNo }"/></b></p>
									<p style="font-size:1.2em"> 
										<b><c:out value="${re.rewardName }"/></b>
									</p>
									<p><c:out value="${re.rewardMoney }"></c:out>원 펀딩하기</p>
									<p style="color:#757575">[구성] <br><c:out value="${re.rewardDetail}"></c:out>
								<ul class="data-info">
									<li class="shipping" style="font-size:0.9em; color:#FFAB91">
										배송비 : &nbsp;<c:out value="${re.deliveryMoney }"></c:out>원
									</li>
									<li class="date" style="font-size:0.9em; color:#8D6E63;">
										리워드 발송 시작일 &nbsp;:&nbsp;<c:out value="${re.startDate }"></c:out>
									</li>
								</ul>
								<p class="reward-qty">
									제한수량 &nbsp;
									<strong><c:out value="${re.limitCount }"/></strong>개
								</p><br>
						</c:forEach>
						</div>
					</button>
				</div>	
			</div>
						<!-------------------------- 신고 영역 --------------------------------->
			<div style="font-size: 14px;">
				<p style="font-size:20px; color:#EF5350;"><b>신고하기란?</b></p> 
				<p> 해당 프로젝트에 허위내용 및 지적재산권 <br/> 을 침해하는 내용이 있다면 제보해주세요. </p>
				
				<a onclick=
					<c:if test="${ empty sessionScope.loginUser }"> "alert('로그인 후 이용가능합니다'); return false;"
						<button>
							<img src="/yc/resources/images/alarm.png" style="width: 40px; height: auto;">	
						</button>
 					</c:if>>
 				
 					<c:if test= "${ !empty sessionScope.loginUser }">
 						<c:if test="${ reportCount == 0 }">
							<button onclick="window.open('reportProject.ca?pNo=${detail.projectNo}','_blank', 'width=700,height=550');return false;" style="border:0; background:white;">
								<img src="/yc/resources/images/alarm.png" style="width:40px; height: auto;"> 
							</button>
						</c:if>
					
						<c:if test="${ reportCount == 1 }"> 
							<button onclick="successReport()" style="background:white; border:0;">
								<img src="/yc/resources/images/alarm.png" style="width:40px; height: auto;"> 
							</button>
						</c:if>
					
					</c:if>
				</a>
			</div>
			
			
			
						<input type="hidden" id="endDate" value="${ detail.endDate }">
		</div>
		<script type="text/javascript">
			function successReport(){
				alert("이미 신고한 게시물입니다");
			}
		</script>
	
		<script>
		$(function(){			
			$('#report').click(function(){

				var pNo = ${ detail.projectNo };
				
				$.ajax({
					
					url: "reportProject.ca",
					type : "get",
					data : {pNo : pNo},
					success : function(data){
						
						  location.reload();
						
					}
				})
			})
		})
		</script> 
	
<script type="text/javascript">

   $(document).ready(function(){

      var bNum=$("#bNum").val();
      var userNo=$("#userNo").val();
      var endDate=$("#endDate").val();
      
      
      
      var paramsString = "&userNo";
      var searchParams = new URLSearchParams(paramsString);
      searchParams.set("userNo", "userNo");
var userNoString=searchParams.toString();
console.log("D:::"+userNoString)
      
      
      
     
      
      
      
      $('#createBtn').on('click',function(){
         console.log("dddddddd"+bNum);2
         console.log("dddddddd"+userNo);
         console.log("dddddddd"+endDate);
         googleQRUrl = "https://chart.googleapis.com/chart?chs=177x177&cht=qr&chl="+"http://192.168.130.142:8001/yc/categoryOne.ca?projectNo="+bNum;
         console.log("DdddddddDD"+googleQRUrl)
             // 이미지가 나타날 영역에 원하는 내용을 넣은 QR code의 이미지를 출력합니다.

             // 여기 주소 부분을 변경해주면 원하는 값을 언제든 맘대로

            $('#qrcode').attr('src', googleQRUrl +"%26userNo=" + userNo + "%26endDate=" + endDate

       +'&choe=UTF-8');


      });
    

   });

</script>


</body>
<div style="width: 100%; float: left;"><jsp:include page="../common/customer_footer.jsp" /></div>
</html>