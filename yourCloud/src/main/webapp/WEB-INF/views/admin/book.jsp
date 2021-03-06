<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE>
<html>
<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>니가 그린 구름 그림</title>

	<script>
      $(document).ready(function(){
         var progressStatus = "";
         $("#btnUpdate").click(function(){
               
            var projectNo = $("#projectNo").val();
            if(confirm("등록하시겠습니까?")){
            progressStatus = $("#progressStatus").val();
               location.href = "reportUpdate.ad?projectNo="+projectNo+"&progressStatus="+progressStatus;
               
            }
            opener.parent.location.reload();
      	 	window.close();
         });
      });
      function st_close(){
    	  opener.parent.location.reload();
      	  window.close();
      };
      
      
  
      
</script>
  <!-- Custom fonts for this template-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css">
  
    <!-- Custom styles for this page -->
  <link href="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
	
	
	<style>
  .outer{
  
  width:350px;
  margin:auto;
  font-family: 'Gothic A1', sans-serif;
  
  }
  
  
  .td2{
  
  	width:400px;
  	margin-left:100px;
  
  }
  
  .td3{
  	
  	width:100px;
  	margin-left:30px;
  
  }
  
  #td4{
  	
  	padding-left:100px;
  
  }
  </style>


</head>

<body id="page-top">

  <!-- Page Wrapper -->
  <div id="wrapper">
   <jsp:include page="../common/admin_menubar.jsp"/>


    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">

      <!-- Main Content -->
      <div id="content">

         <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

          <!-- Sidebar Toggle (Topbar) -->
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>

          <!-- Topbar Search -->
          <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
            <div class="input-group">
              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
              <div class="input-group-append">
                <button class="btn btn-primary" type="button">
                  <i class="fas fa-search fa-sm"></i>
                </button>
              </div>
            </div>
          </form>

          <!-- Topbar Navbar -->
          <ul class="navbar-nav ml-auto">

            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
            <li class="nav-item dropdown no-arrow d-sm-none">
              <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-search fa-fw"></i>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in" aria-labelledby="searchDropdown">
                <form class="form-inline mr-auto w-100 navbar-search">
                  <div class="input-group">
                    <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
                    <div class="input-group-append">
                      <button class="btn btn-primary" type="button">
                        <i class="fas fa-search fa-sm"></i>
                      </button>
                    </div>
                  </div>
                </form>
              </div>
            </li>

            <!-- Nav Item - Alerts -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-bell fa-fw"></i>
                <!-- Counter - Alerts -->
                <span class="badge badge-danger badge-counter">3+</span>
              </a>
              <!-- Dropdown - Alerts -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="alertsDropdown">
                <h6 class="dropdown-header">
                  Alerts Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-primary">
                      <i class="fas fa-file-alt text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 12, 2019</div>
                    <span class="font-weight-bold">A new monthly report is ready to download!</span>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-success">
                      <i class="fas fa-donate text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 7, 2019</div>
                    $290.29 has been deposited into your account!
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="mr-3">
                    <div class="icon-circle bg-warning">
                      <i class="fas fa-exclamation-triangle text-white"></i>
                    </div>
                  </div>
                  <div>
                    <div class="small text-gray-500">December 2, 2019</div>
                    Spending Alert: We've noticed unusually high spending for your account.
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
              </div>
            </li>

            <!-- Nav Item - Messages -->
            <li class="nav-item dropdown no-arrow mx-1">
              <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <i class="fas fa-envelope fa-fw"></i>
                <!-- Counter - Messages -->
                <span class="badge badge-danger badge-counter">7</span>
              </a>
              <!-- Dropdown - Messages -->
              <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="messagesDropdown">
                <h6 class="dropdown-header">
                  Message Center
                </h6>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/fn_BT9fwg_E/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div class="font-weight-bold">
                    <div class="text-truncate">Hi there! I am wondering if you can help me with a problem I've been having.</div>
                    <div class="small text-gray-500">Emily Fowler · 58m</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/AU4VPcFN4LE/60x60" alt="">
                    <div class="status-indicator"></div>
                  </div>
                  <div>
                    <div class="text-truncate">I have the photos that you ordered last month, how would you like them sent to you?</div>
                    <div class="small text-gray-500">Jae Chun · 1d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/CS2uCrpNzJY/60x60" alt="">
                    <div class="status-indicator bg-warning"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Last month's report looks great, I am very happy with the progress so far, keep up the good work!</div>
                    <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                  </div>
                </a>
                <a class="dropdown-item d-flex align-items-center" href="#">
                  <div class="dropdown-list-image mr-3">
                    <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60" alt="">
                    <div class="status-indicator bg-success"></div>
                  </div>
                  <div>
                    <div class="text-truncate">Am I a good boy? The reason I ask is because someone told me that people say this to all dogs, even if they aren't good...</div>
                    <div class="small text-gray-500">Chicken the Dog · 2w</div>
                  </div>
                </a>
                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
              </div>
            </li>

            <div class="topbar-divider d-none d-sm-block"></div>

            <!-- Nav Item - User Information -->
            <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">통합 관리자</span>
              </a>
              <!-- Dropdown - User Information -->
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                  Settings
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                  Activity Log
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>

          </ul>

        </nav>
        <!-- End of Topbar -->

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="d-sm-flex align-items-center justify-content-between mb-4">
            <h1 class="h3 mb-0 text-gray-800">장부관리</h1>
          </div>

          <div class="row">

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-primary shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">총 매출 (월)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">12,000,000 원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-calendar fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-success shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-success text-uppercase mb-1">총 매출 (전체)</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">124,221,000 원</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-dollar-sign fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Earnings (Monthly) Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-info shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-info text-uppercase mb-1">Tasks</div>
                      <div class="row no-gutters align-items-center">
                        <div class="col-auto">
                          <div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
                        </div>
                        <div class="col">
                          <div class="progress progress-sm mr-2">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- Pending Requests Card Example -->
            <div class="col-xl-3 col-md-6 mb-4">
              <div class="card border-left-warning shadow h-100 py-2">
                <div class="card-body">
                  <div class="row no-gutters align-items-center">
                    <div class="col mr-2">
                      <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Pending Requests</div>
                      <div class="h5 mb-0 font-weight-bold text-gray-800">18</div>
                    </div>
                    <div class="col-auto">
                      <i class="fas fa-comments fa-2x text-gray-300"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="row">

            <div class="col-lg-6">


              <!-- Collapsable Card Example -->
              <div class="card shadow mb-4">
                <!-- Card Header - Accordion -->
                <a href="#collapseCardExample" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCardExample">
                  <h6 class="m-0 font-weight-bold text-primary">입출금 입력</h6>
                </a>
                <!-- Card Content - Collapse -->
                <div class="collapse hide" id="collapseCardExample">
                  <div class="card-body">
                    		 <strong>입출금액관리</strong>
                    		 <!-- 전체div -->
<div class="outer">
<br>
    <!-- 회원가입 폼 -->
  <div>
  <form action="joinInput.me" method="post">
  	<table>
  	  	
    	
  	
  		<tr><td><br></td></tr>
  	
  		<tr>
  			<td>프로젝트번호</td>
  			<td><input type="text" name="projectNo" class="td2" required></td>
  		</tr> 
  		
  		<tr><td><br></td></tr>
  			
   		<tr>
  			<td></td>
  			<td><input type="text" name="project" class="td2" id="userId" required></td>
  			<td><button onclick="return duplicationCheck();" class="btn btn-info" >중복</button></td>
  		</tr> 		
  		
  		<tr><td><br></td></tr>
  		
  		<tr>
  			<td>*비밀번호</td>
  			<td><input type="password" name="userPwd" id="pass1" class="td2" required></td>
  		</tr> 	
  		
  		<tr><td><br></td></tr>  		
		
  		<tr>
  			<td>*비밀번호 확인</td>
  			<td><input type="password" id="pass2" class="td2" required></td>
  		</tr>  		

   		<tr><td><br></td></tr>
  		
    	<tr>
  			<td>*이메일</td>
  			<td><input type="text" name="email" class="td2" id="inputEmail" required></td>
  			<td><button id="mailbtn" class="btn btn-info" onclick="return emailCheck();">인증요청</button></td>
  		</tr>   		

  		<tr><td><br></td></tr> 
  	
  		<tr>
  			<td>인증번호</td>
  			<td><input type="text" name="" class="td2" id="randomNum" required></td>
  			<td><button  class="btn btn-info"  id="pushNum" onclick="return confirm();">확인</button></td>
  		</tr>
  		
  		<tr><td><br></td></tr> 
  		<tr><td><br></td></tr> 
  		<tr><td><br></td></tr> 
  	
  		<tr>
  			<td><b>+ 추가사항</b></td>
  			<td>(모두 입력시1000P 적립)</td>
  		</tr>
  		
  		<tr><td><br></td></tr>  		
  		
  		<tr>
  			<td>연령대</td>
  			<td id="td4">
  			<input type="checkbox" name="age"  value="10">20대 미만  &nbsp; <input type="checkbox" name="age" value="20">20대 이상 ~ 30대 미만 &nbsp; <input type="checkbox" name="age" value="30">30대 이상 ~ 40대 미만
  			<br>
  			<input type="checkbox" value="40" name="age">40대 이상 ~ 50대 미만  &nbsp; <input type="checkbox" value="50" name="age">50대 이상 ~ 60대 미만  &nbsp; <input type="checkbox" value="60" name="age">60대 이상  			
  			</td>
  		</tr>
  		
  		<tr><td><br></td></tr>  		
  		
  		<tr>
  			<td>성별</td>
  			<td id="td4">
  			<input type="checkbox" value="F"  name="gender">여성  &emsp;&emsp;&emsp;&emsp; <input type="checkbox" value="M" name="gender">남성
  			</td>
  		</tr>
  		
  		<tr><td><br></td></tr>  		
  		

  		<tr>
  			<td>관심<br>카테고리</td>
  			<td id="td4">
  			<input type="checkbox" value="A1" name="memberCategory">테크,가전  &emsp;&emsp; <input type="checkbox" name="memberCategory" value="A2">패션,잡화  &emsp;&emsp; <input type="checkbox" name="memberCategory" value="A3">뷰티  &emsp;&emsp; <input type="checkbox"  name="memberCategory" value="A4">도서   <br>
  			<input type="checkbox" name="memberCategory" value="A5">푸드  &emsp;&emsp; <input type="checkbox"  name="memberCategory" value="A6">홈리빙  &emsp;&emsp; <input type="checkbox"  name="memberCategory" value="A7">키즈  <br>
  			<input type="checkbox" name="memberCategory" value="A8">여행,레저 &emsp;&emsp; <input type="checkbox" name="memberCategory"  value="A9">스포츠   &emsp;&emsp; <input type="checkbox"  name="memberCategory" value="A10">반려동물  &emsp;&emsp;
  			</td>
  		</tr>

  		
  		<tr><td><br></td></tr>  		
  		
  		<tr>
  			<td>이메일<br>수신동의</td>
  			<td class="td4">
  			이메일을 통해 쿠폰 및 이벤트 정보를 받아보실  수 있습니다.
  			<br>
  			<input type="checkbox" name="emailAgree" value="Y">이메일 수신을 동의합니다
  			</td>
  		</tr>

  		<tr><td><br></td></tr>  
  		
  	</table>
  <button id="sumbmitbutton" class="btn btn-info" onclick="return finalcheck();">확인</button>
  </form>
  
  <br><br>
  
  </div>
  

</div>    
                  </div>
                </div>
              </div>

            </div>

          </div>

        </div>
        
         <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <h1 class="h3 mb-2 text-gray-800">장부관리</h1>
          <!-- <p class="mb-4">회원리스트입니다.</p> -->

          <!-- DataTales Example -->
          <div class="card shadow mb-4">
            <div class="card-header py-3">
              <h6 class="m-0 font-weight-bold text-primary">장부관리</h6>
            </div>
            <div class="card-body">
              <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  <thead>
                    <tr>
                      <th>장부번호</th>
                      <th>프로젝트번호</th>
                      <th>프로젝트명</th>
                      <th>대표자명</th>
                      <th>구분</th>
                      <th>금액</th>
                      <th>잔고</th>
                    </tr>
                  </thead>
                  <tfoot>
                    <tr>
                      <th>장부번호</th>
                      <th>프로젝트번호</th>
                      <th>프로젝트명</th>
                      <th>대표자명</th>
                      <th>구분</th>
                      <th>금액</th>
                      <th>잔고</th>
                    </tr>
                  </tfoot>
                  <tbody>
                    <tr>
                      <td>1</td>
                      <td>1</td>
                      <td>[당신의옷]너무나멋진똥간닦개</td>
                      <td>황민하</td>
                      <td>입금</td>
                      <td><fmt:formatNumber value="2000000" type="currency"/></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>2</td>
                      <td>1</td>
                      <td>[당신의옷]너무나멋진똥간닦개</td>
                      <td>황민하</td>
                      <td>출금</td>
                      <td><fmt:formatNumber value="2000000" type="currency"/></td>
                      <td></td>
                    </tr>
                    
                  </tbody>
                </table>
              </div>
            </div>
          </div>

        </div>
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->
        <!-- /.container-fluid -->

      </div>
      <!-- End of Main Content -->

      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy; Your Website 2019</span>
          </div>
        </div>
      </footer>
      <!-- End of Footer -->

    </div>
    <!-- End of Content Wrapper -->

  </div>
  <!-- End of Page Wrapper -->

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Logout Modal-->
  <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">×</span>
          </button>
        </div>
        <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
        <div class="modal-footer">
          <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
          <a class="btn btn-primary" href="login.html">Logout</a>
        </div>
      </div>
    </div>
  </div>
  
  

  <!-- Bootstrap core JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

  <!-- Custom scripts for all pages-->
  <script src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/jquery.dataTables.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/vendor/datatables/dataTables.bootstrap4.min.js"></script>

  <!-- Page level custom scripts -->
  <script src="${pageContext.request.contextPath}/resources/js/demo/datatables-demo.js"></script>



</body>

</html>
