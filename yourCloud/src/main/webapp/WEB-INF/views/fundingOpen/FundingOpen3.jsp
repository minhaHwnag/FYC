<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩하기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
	 $(document).ready(function(){
         var browsers = "";
         $("#btnSubmit").click(function(){
        	 
        	 var projectNo = $('#projectNo').val();
        	 var userNo = $('#userNo').val();
               
            var browsers = $("#browsers").val();
            if(confirm("선택한 카테고리로 하시겠습니까?")){
            browsers = $("#browsers").val();
            alert(browsers);
               location.href = "FundingOpen3.fd?category="+browsers + "&userNo=" + userNo + "&projectNo=" +projectNo;
               
            }
            console.log(browsers);
           
         });
      });
	</script>
<link href="https://fonts.googleapis.com/css?family=Sunflower:300&display=swap" rel="stylesheet">
<style>
	body{
		font-family: 'Sunflower', sans-serif;
	}
	#browsers {
		width:500px;
		height:50px;
		font-weight:bolder;
		font-size: 20px; 
		font-family: 'Sunflower', sans-serif;
	}
	#funding2 {
		margin: 0px auto;
		margin-top: 5%;
		font-family: 'Sunflower', sans-serif;
	}
	#next {
		width:300px;
		height:40px;
		margin-left: 35%; 
		font-family: 'Sunflower', sans-serif;
		
	} 
</style>


</head>
<body>
	<input type="hidden" id="projectNo" value="${pro.projectNo}" name="projectNo" />
	<input type="hidden" id="userNo" value="${pro.userNo}" name="userNo" />
	<input type='button' onclick='input_Text()' value='버튼'/>
	<input type='text' id='test' value='test용'/>


	<script type="text/javascript">
		function input_Text(){
	    document.getElementById("test").value = ${pro.projectNo};
			//console.log(input);
	}

		
	</script>
	<jsp:include page="../common/customer_menuList.jsp"/>
	<div id="funding2">
	<h1 align="center">어떤 분야의 프로젝트를 진행할 예정인가요?</h1>
	<h4 align="center">진행하려는 프로젝트에 적합하거나 가장 유사한 카테고리를 선택하세요.<br>
	나중에 수정할 수 있습니다.</h4>
	<br>
	<div align="center"> 
	 <select id="browsers">
	    <option value="">카테고리 선택하기</option>
	    <option value="A1">테크-가전</option>
	    <option value="A2">패션-잡화</option>
	    <option value="A3">키즈</option>
	    <option value="A4">여행-레저</option>
	    <option value="A5">뷰티</option>
	    <option value="A6">도서</option>
	    <option value="A7">반려동물</option>
	    <option value="A8">스포츠</option>
	    <option value="A9">푸드</option>
	    <option value="A10">홈리빙</option>
	</select>
	<input type="button" id="btnSubmit" value="다음으로">
	
	</div>
	<div style="c"></div>
	<hr>
	</div>
	<jsp:include page="../common/customer_footer.jsp"/>
</body>
</html>