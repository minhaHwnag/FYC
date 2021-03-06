<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath }/resources/css/myPage.css" />
<title>사용후기 상세보기</title>
<style>
table * {
	padding: 5px;
}

.center{
	text-align: center;!important;
}

.comment {
	text-decoration: underline;
}
.comment:hover {
	cursor: pointer;
	color: blue;
}
.comment:visited{
	color: black;
}
</style>

</head>
<body>
<jsp:include page="../common/customer_menubar.jsp" />
<jsp:include page="../common/customer_menuList.jsp" />
	<br />
	<div id="outer">
		<table align="center" style="width: 60%;">
			<tr style="background:#1AAB8A;border: 1px solid black;">
				<th class="center" style="color:white">제목</th>
				<td colspan="2" class="center"style="color:white"><c:out value="${ b.bTitle }" escapeXml="false"/></td>
				<td></td>
			</tr>
			<tr>
				<th class="center" >카테고리</th>
				<td style="text-align:left;" class="center">
					<c:out value="${ b.bCategory }" escapeXml="false"/>
				</td>
				<th class="center" >조회수</th>
				<td class="center"><c:out value="${ b.bCount }"/></td>
			</tr>
			<tr>
				<th class="center" >작성자</th>
				<td><c:out value="${ b.writer }" escapeXml="false"/></td>
				<th class="center" >작성일 </th>
				<td class="center"><c:out value="${ b.createDate }" escapeXml="false"/></td>
			</tr>
			<tr>
				<th colspan="4" class="center" style="border:1px solid black;">내용</th>
			</tr>
			<tr>
				<td colspan="4" style="width:80%; border:1px solid lightgray;"><div style="min-height: 500px;"><c:out value="${ b.bcontent }" escapeXml="false"/></div></td>
			</tr>
			<tr style="height: 100px;">
				<td></td>
				<td colspan="2" class="center">
				<c:if test="${ sessionScope.loginUser.userId eq b.writer or sessionScope.loginUser.userId eq 'admin'}">
					<button type="button" class="btn" style="width:100px;" onclick="updateBoard();">수정</button>
					<button type="button" class="btn" style="width:100px;" onclick="deleteBoard();">삭제</button>
				</c:if>
				</td>
			</tr>
		</table>
		<table align="center" id="commentTable" style="width: 60%;">
			<tr style="background:#1AAB8A;border: 1px solid black; color:white;">
				<th class="center">댓글 번호</th>
				<th colspan="2" width="50%;" class="center">댓글 내용</th>
				<th class="center">작성자</th>
				<th class="center">작성일</th>
				<th colspan="4"></th>
			</tr>
			<c:forEach var="r" items="${ c }">
				<c:if test="${ '0' eq r.refCNo }">
					<tr>
						<td class="center"><c:out value="${ r.cNo }"/></td>
						<td colspan="2"><c:out value="${ r.content }"/></td>
						<td class="center"><c:out value="${ r.writer }"/></td>
						<td class="center"><c:out value="${ r.createDate }"/></td>
						<td class="reComment comment">답글</td>
					<c:if test="${ r.writer eq sessionScope.loginUser.userId }">
						<td class="updateComment comment">수정</td>
						<td class="deleteComment comment">삭제</td>
					</c:if>
					</tr>
				</c:if>
				<c:forEach var="rc" items="${ rc }">
					<c:if test="${ r.cNo eq rc.refCNo }">
						<tr>
							<td style="text-align:center; color:red;">☞</td>
							<td colspan="2"><c:out value="${ rc.content }"/></td>
							<td class="center"><c:out value="${ rc.writer }"/></td>
							<td class="center"><c:out value="${ r.createDate }"/></td>
						<c:if test="${ rc.writer eq sessionScope.loginUser.userId }">
							<td colspan="3" class="updateReComment comment">수정</td>
						</c:if>
						</tr>
					</c:if>
				</c:forEach>
			</c:forEach>
			<c:if test="${ !empty rc }">
			<tr>
				<td colspan="8" style="height:10%;">		
					<div id="pagingArea" align="center">
						<c:if test="${ pi.currentPage <= 1 }">
							[이   전] &nbsp;
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="blistBack" value="selectBoardOne.bo">
								<c:param name="currentPage" value="${ pi.currentPage - 1 }"/>
								<c:param name="target" value="${ b.bNo }"/>
							</c:url>
							<a href="${ blistBack }">[이   전]</a> &nbsp;
						</c:if>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<font color="red" size="4"><b>[  ${ p }  ]</b></font>
							</c:if>
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="blistCheck" value="selectBoardOne.bo">
									<c:param name="currentPage" value="${ p }"/>
									<c:param name="target" value="${ b.bNo }"/>
								</c:url>
								<a href="${ blistCheck }">${ p }</a>
							</c:if>
						</c:forEach>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="blistEnd" value="selectBoardOne.bo">
								<c:param name="currentPage" value="${ pi.currentPage + 1 }"/>
								<c:param name="target" value="${ b.bNo }"/>
							</c:url>
							<a href="${ blistEnd }">[다   음]</a>
						</c:if>
						<c:if test="${ pi.currentPage >= pi.maxPage}">
							[다   음]
						</c:if>
					</div>
				</td>
			</tr>
			</c:if>
			<tr>
				<td colspan="8" class="center"><textarea name="inputComment" id="inputComment" style="width:100%;" cols="30" rows="5"></textarea></td>
			</tr>
			<tr>
				<td colspan="8" class="center"><button type="button" class="btn submitBtn" style="width:100px;" onclick="insertComment();">댓글 등록</button></td>
			</tr>
		</table>
	</div>
	<jsp:include page="../common/customer_footer.jsp"/>
	<script>
		var target = ${b.bNo};
		$(function(){
			$(".deleteComment").click(function(){
				var $deleteTarget = $(this).siblings().eq(0).text();
				
				if(confirm("댓글을 삭제하시겠습니까?")){
					$.ajax({
						url:"deleteComment.bo",
						type:"POST",
						data:{"target":$deleteTarget},
						success:function(data){
							alert("댓글이 삭제되었습니다.");
							location.reload();
						}
					});
				}
			});
		});
		function updateBoard(){
			if(confirm("글을 수정하시겠습니까?")){
				location.href="updateBoardFrm.bo?target="+target;
			}
		}
		function deleteBoard(){
			if(confirm("#삭제된 글은 노출되지 않지만 데이터베이스에 남아있습니다#\n정말로 글을 삭제하시겠습니까?")){
				location.href="deleteBoard.bo?target="+target;
			}
		}
		function insertComment(){
			var $inputComment = $("#inputComment");
			var text = $inputComment.val();
			var writer = '${ sessionScope.loginUser.userNo}';
			console.log(target);
			console.log(writer);
			if(confirm("댓글을 등록하시겠습니까?")){
				if(writer.length == 0) {
					alert("로그인이 필요한 기능입니다.");
				} else {
					if(text.length == 0 || text == ""){
						alert("댓글 내용을 입력해주세요");
					} else {
						 $.ajax({
							url:"insertComment.bo",
							type: "post",
							data:{"text":text, "target":target, "writer":writer},
							success:function(data){
								alert("댓글이 등록되었습니다.");
								location.reload();
							}
						});
					}
				}
			} else {
				$inputComment.val("");
			}
			
		}
		
		$(".updateComment").click(function(){
			var $updateTarget = $(this).siblings().eq(0).text();
			var $text = $(this).siblings().eq(1).text();
			var textForm = "<td colspan='2'><input type='text' id='updateForm'>";
			var targetTd = $(this).siblings().eq(1);
			
			$(this).siblings().eq(1).replaceWith(textForm);
			$("#updateForm").css("width","100%");
			$("#updateForm").val($text);
			$(".reComment").remove();
			$(".deleteComment").remove();
			$("#inputComment").remove();
			$(".submitBtn").remove();
			var td = "<button type='button' id='updateCommentBtn' class='btn'>수정";
			td += "<button type='button' id='cancelBtn' class='btn'>취소";
			
			$(this).replaceWith(td);
			$(".comment").remove();
			
			$("#updateCommentBtn").click(function(){
				var updateText = $("#updateForm").val();
				$.ajax({
					url: "updateComment.bo",
					type: "POST",
					data: {"text":updateText, "target":$updateTarget},
					success:function(data){
						alert("댓글이 수정되었습니다");
						location.reload();
					}, error:function(data){
						alert(data);
					}
				});
			});
			
			$("#cancelBtn").click(function(){
				if(confirm("댓글 수정을 취소하시겠습니까?")){
					location.reload();
				}
			});
		});
		
		$(".reComment").click(function(){
			$(".deleteComment").remove();
			$("#inputComment").remove();
			$(".submitBtn").remove();
			var writer = '${ sessionScope.loginUser.userNo}';
			var refCNo = $(this).siblings().eq(0).text();
			if(writer.length == 0){
				alert("로그인이 필요한 기능입니다.");
				return false;
			}
			
			
			var bNo = $(this).siblings().eq(0).text();
			var textForm = "<tr><td style='text-align:center'>☞</td><td colspan='3'><input type='text' id='insertReCommentForm'></td><td><button type='button' id='insertReComment' class='btn'>등록";
			var appendTarget = $(this).parent();
			
			appendTarget.after(textForm);
			$("#insertReCommentForm").css("width","100%");
			$("#insertReComment").click(function(){
				var content = $("#insertReCommentForm").val();
				
				$.ajax({
					url:"insertReComment.bo",
					type:"POST",
					data:{"refCNo":refCNo, "writer":writer, "content":content, "bNo":target},
					success:function(data){
						alert("댓글이 등록되었습니다.");	
						location.reload();
					}, error:function(data){
						alert("댓글 등록에 실패했습니다.\n실패사유 : " + data);
					}
				});
			});
		});
		
		
	</script>
</body>
</html>