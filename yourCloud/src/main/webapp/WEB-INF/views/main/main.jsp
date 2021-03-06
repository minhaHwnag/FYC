<%@page import="com.kh.yc.member.model.vo.Member"%>
<%@page import="com.kh.yc.project.model.vo.Project"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	ArrayList<Project> list = (ArrayList) request.getAttribute("list");
	Member m = (Member)request.getAttribute("loginUser");
	ArrayList<Project> rankList = (ArrayList) request.getAttribute("rankList");
%>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
   href="${pageContext.request.contextPath}/resources/css/animate.css">
<link href="${pageContext.request.contextPath}/resources/css/main.css"
   rel="stylesheet" />

<title>more</title>
</head>
<body>

	<jsp:include page="../common/main_menubar.jsp" />
	<jsp:include page="../common/customer_menuList.jsp" />
	<!--Section-1-->
	
	<section class="section-1">
		<div class="jumbotron d-flex align-items-center" style="background-image:url('/yc/resources/uploadFiles/<%= list.get(0).getAttachment().get(0).getNewFileName() %>')">
			<div class="gradient"></div>
			<div class="container-fluid content">
				<h1 data-aos="fade-up" data-aos-delay="100"><%= list.get(0).getProjectTitle() %></h1>
				<h2 data-aos="fade-up" data-aos-delay="300">"<%= list.get(0).getSummary() %>"</h2>
				</br> </br> </br>
				<p data-aos="fade-up" data-aos-delay="700">
					<a href="about.html" class="btn btn-success">스토리 읽어보러 가기</a>
				</p>
			</div>
		</div>
	</section>
	<section class="section-2">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-sm-12 col-12 box-1">
					<div class="row box" data-aos="fade-left" data-aos-delay="300">
						<div class="col-lg-2 col-sm-12">
							<i class="fa fa-desktop" aria-hidden="true"></i>
						</div>
						<div class="col-lg-10 col-sm-12">
							<h3>
								<a href="services.html">디자인.</a>
							</h3>
							<p>어렵기만 했던 리워드 펀딩을 조금 더 감각적으로 디자인하세요.</p>
							<p>
								<a href="services.html"><img
									src="/yc/resources/images/plus.png" alt="plus"></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12 col-12 box-2">
					<div class="row box" data-aos="fade-left" data-aos-delay="500">
						<div class="col-lg-2 col-sm-12">
							<i class="fa fa-code" aria-hidden="true"></i>
						</div>
						<div class="col-lg-10 col-sm-12">
							<h3>
								<a href="services.html">메이커.</a>
							</h3>
							<p>투명한 과정 공개와 진솔한 스토리의 메이커를 만나 보다 가치있는 후원을 시작하세요.</p>
							<p>
								<a href="services.html"><img
									src="/yc/resources/images/plus.png" alt="plus"></a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-sm-12 col-12 box-3">
					<div class="row box" data-aos="fade-left" data-aos-delay="700">
						<div class="col-lg-2 col-sm-12">
							<i class="fa fa-comments-o" aria-hidden="true"></i>
						</div>
						<div class="col-lg-10 col-sm-12">
							<h3>
								<a href="services.html">모르겠다.</a>
							</h3>
							<p>뭘써야하냐....</p>
							<p>
								<a href="services.html"><img
									src="/yc/resources/images/plus.png" alt="plus"></a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr>
	<section class="section-4">
		<div class="container">
			<div class="row heading">
				<div class="col-sm-6 col-12">
					<h3>
						회원님께 추천하는 <span>프로젝트 입니다</span>
					</h3>
				</div>
				<div class="col-sm-6 col-12">
					<a href="category.bo" class="btn btn-success">더 많은 프로젝트 보러가기</a>
				</div>
			</div>
			<% 
				if(list.size() > 0){

			%>
			<div class="row">
				<div class="col-lg-4 col-sm-12 col-12 box-1" data-aos="fade-right"
					data-aos-delay="300">
					<figure class="figure">
						<a href="categoryOne.ca?projectNo=<%= list.get(0).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= list.get(0).getAttachment().get(0).getNewFileName() %>"
							class="figure-img img-fluid" style="height: 50%;"alt="blog"></a>
						<figcaption class="figure-caption">
							<h2>
								<a href="categoryOne.ca?projectNo=<%= list.get(0).getProjectNo()%>&userNo=123"> <%=list.get(0).getProjectTitle()%>
								</a>
							</h2>
							<p><%=list.get(0).getSummary()%></p>
							<a href="categoryOne.ca?projectNo=<%= list.get(0).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</figcaption>
					</figure>
				</div>
				<%
				}
					if (list.size() >= 2) {
				%>
				<div class="col-lg-8 col-sm-12 col-12" data-aos="fade-left"
					data-aos-delay="300">
					<div class="row">
						<div class="col-sm-6 col-12 box-2">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= list.get(1).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= list.get(1).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-3">
							<h4>
								<a href=categoryOne.ca?projectNo=<%= list.get(1).getProjectNo()%>&userNo=123><%=list.get(1).getProjectTitle()%></a>
							</h4>
							<h5><%=list.get(1).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= list.get(1).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						if (list.size() >= 3) {
					%>
					<div class="row">
						<div class="col-sm-6 col-12 box-4">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= list.get(2).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= list.get(2).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-5">
							<h4>
								<a href="categoryOne.ca?projectNo=<%= list.get(2).getProjectNo()%>&userNo=123"><%=list.get(2).getProjectTitle()%></a>
							</h4>
							<h5><%=list.get(2).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= list.get(2).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						}
							if (list.size() >= 4) {
					%>
					<div class="row">
						<div class="col-sm-6 col-12 box-6">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= list.get(3).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= list.get(3).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-7">
							<h4>
								<a href="categoryOne.ca?projectNo=<%= list.get(3).getProjectNo()%>&userNo=123"><%=list.get(3).getProjectTitle()%></a>
							</h4>
							<h5><%=list.get(3).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= list.get(3).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<hr>
	<section class="section-4">
		<div class="container">
			<div class="row heading">
				<div class="col-sm-6 col-12">
					<h3>
						요즘 유행하는<span> 프로젝트 랭킹 입니다</span>
					</h3>
				</div>
				<div class="col-sm-6 col-12">
					<a href="blog.html" class="btn btn-success">더 많은 프로젝트 보러가기</a>
				</div>
			</div>
			<% 
				if(rankList.size() > 0){

			%>
			<div class="row">
				<div class="col-lg-4 col-sm-12 col-12 box-1" data-aos="fade-right"
					data-aos-delay="300">
					<figure class="figure">
						<a href="categoryOne.ca?projectNo=<%= rankList.get(0).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= rankList.get(0).getAttachment().get(0).getNewFileName() %>"
							class="figure-img img-fluid" style="height: 50%;"alt="blog"></a>
						<figcaption class="figure-caption">
							<h2>
								<a href="categoryOne.ca?projectNo=<%= rankList.get(0).getProjectNo()%>&userNo=123"> <%=rankList.get(0).getProjectTitle()%>
								</a>
							</h2>
							<p><%=rankList.get(0).getSummary()%></p>
							<a href="categoryOne.ca?projectNo=<%= rankList.get(0).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</figcaption>
					</figure>
				</div>
				<%
				}
					if (rankList.size() >= 2) {
				%>
				<div class="col-lg-8 col-sm-12 col-12" data-aos="fade-left"
					data-aos-delay="300">
					<div class="row">
						<div class="col-sm-6 col-12 box-2">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= rankList.get(1).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= rankList.get(1).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-3">
							<h4>
								<a href="categoryOne.ca?projectNo=<%= rankList.get(1).getProjectNo()%>&userNo=123"><%=rankList.get(1).getProjectTitle()%></a>
							</h4>
							<h5><%=rankList.get(1).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= rankList.get(1).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						if (rankList.size() >= 3) {
					%>
					<div class="row">
						<div class="col-sm-6 col-12 box-4">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= rankList.get(2).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= rankList.get(2).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-5">
							<h4>
								<a href="categoryOne.ca?projectNo=<%= rankList.get(2).getProjectNo()%>&userNo=123"><%=rankList.get(2).getProjectTitle()%></a>
							</h4>
							<h5><%=rankList.get(2).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= rankList.get(2).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						}
							if (rankList.size() >= 4) {
					%>
					<div class="row">
						<div class="col-sm-6 col-12 box-6">
							<figure class="figure">
								<a href="categoryOne.ca?projectNo=<%= rankList.get(3).getProjectNo()%>&userNo=123"><img src="/yc/resources/uploadFiles/<%= rankList.get(3).getAttachment().get(0).getNewFileName() %>"
									class="figure-img img-fluid" alt="blog"></a>
							</figure>
						</div>
						<div class="col-sm-6 col-12 box-7">
							<h4>
								<a href="categoryOne.ca?projectNo=<%= rankList.get(3).getProjectNo()%>&userNo=123"><%=rankList.get(3).getProjectTitle()%></a>
							</h4>
							<h5><%=rankList.get(3).getSummary()%></h5>
							<a href="categoryOne.ca?projectNo=<%= rankList.get(3).getProjectNo()%>&userNo=123" class="btn btn-success">+ more</a>
						</div>
					</div>
					<%
						}
					%>
				</div>
				<%
					}
				%>
			</div>
		</div>
	</section>
	<section class="section-6" data-aos="fade-up">
		<div class="container">
			<div class="row main" data-aos="fade-up" data-aos-delay="300">
				<div class="col-lg-6 col-sm-12 col1">
					<div class="heading"></div>
				</div>
				<div class="col-lg-6 col-sm-12 col1">
					<form>
						<div class="input-group"></div>
					</form>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../common/customer_footer.jsp" />

</body>

</html>