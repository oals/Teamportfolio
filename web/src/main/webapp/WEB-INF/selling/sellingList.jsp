<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>관리자 페이지</title>

    <!-- Custom fonts for this template-->
    <link href="./Resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="./Resources/css/sb-admin-2.min.css" rel="stylesheet">
	
	<style type="text/css">
		.pagination > li > a
		{
		    background-color: white;
		    color: rgb(240, 36, 36);
		}
		
		.pagination > li > a:focus,
		.pagination > li > a:hover,
		.pagination > li > span:focus,
		.pagination > li > span:hover
		{
		    color: #5a5a5a;
		    background-color: #eee;
		    border-color: #ddd;
		}
		
		.pagination > .active > a
		{
		    color: white;
		    background-color: rgb(240, 36, 36) !Important;
		    border: solid 1px rgb(240, 36, 36) !Important;
		}
		
		.pagination > .active > a:hover
		{
		    background-color: rgb(240, 36, 36) !Important;
		    border: solid 1px rgb(240, 36, 36);
		}
		
		
		
	</style>
	
	
</head>

<body id="page-top">
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="${ctxPath}/admin_sellingList.do">
                <div class="sidebar-brand-icon">
                    <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16">
					  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Zm-9 8c0 1 1 1 1 1h5.256A4.493 4.493 0 0 1 8 12.5a4.49 4.49 0 0 1 1.544-3.393C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4Zm9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
					</svg>
                </div>
                <div class="sidebar-brand-text mx-3">관리자 페이지 </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">
                메뉴
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>상품 관리</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <a class="collapse-item" href="${ctxPath}/admin_productList.do">상품 목록</a>
                        <div class="collapse-divider"></div>
                    </div>
                </div>
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

        </ul>
        <!-- End of Sidebar -->

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
                    <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                        	<div>
	                        	<button class="btn btn-danger" type="button" onclick="productList()">
	                                메인페이지로 이동
	                            </button>
                            </div>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-danger" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>


                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                <img class="img-profile rounded-circle"
                                    src="./Resources/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
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
                        <h1 class="h3 mb-0 text-gray-800"></h1>
                    </div>


                    <!-- Content Row -->

                    <div class="row">

                        <!-- Area Chart -->
                        <div class="col-xl-12 col-lg-12">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-danger">주문 목록</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                    <div class="chart-area">
                                        
                                        <div class="main">
								        <div class="container mt-5">
								          <div class="w-100 m-auto mt-5">
								            <table class="table">
								              <thead class="table-light">
								                <tr>
								                  <th scope="col" style="width: 10%">번호</th>
								                  <th scope="col" style="width: 30%">상품번호</th>
								                  <th scope="col" style="width: 30%">상품명</th>
								                  <th scope="col" style="width: 15%">아이디</th>
								                  <th scope="col" style="width: 25%">처리상태</th>
								                  <th scope="col" style="width: 15%">주문날짜</th>
								                </tr>
								              </thead>
								              <tbody>
								              
								              <c:forEach var ="item" items="${sell_info}" step="1">
								              
								                <tr>
								                  <th scope="row">${item.sell_num}</th>
								                  <td style="cursor: pointer">
								                   <a href="${ctxPath}/admin_sellingSelect.do?order_num=${item.order_num}">${item.product_num}</a>
								                  </td>
								                   <td id="center">${item.product_name}</td>
								                  <td id="center">${item.user_id}</td>
								                  <td id="center">${item.result}</td>
								                  <td id="center">${item.indate}</td>
								                </tr>
								                
								                </c:forEach>
								                
								              </tbody>
								            </table>
								
								
								
								
								            <div class="d-flex justify-content-center p-4">

		
	             
			<nav aria-label="...">
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
	                       	 <c:if test="${section > 1 && page==1 }">
		                      	<li class="page-item ">
		                        	<a class="page-link" href="${ctxPath}/admin_sellingList.do?pageBlock=${section-1}&pageNum=1">이전</a>
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" href="${ctxPath}/admin_sellingList.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:when>
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	<a class="page-link" href="${ctxPath}/admin_sellingList.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link" href="${ctxPath}/admin_sellingList.do?pageBlock=${section+1}&pageNum=1">다음</a>
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
								              
								              
								              
								              
								              
								            </div>
								          </div>
								        </div>
								      </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
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
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">관리자 로그아웃</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃 하시겠습니까?</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-danger" href="${ctxPath}/productList.do">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="./Resources/vendor/jquery/jquery.min.js"></script>
    <script src="./Resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="./Resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="./Resources/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="./Resources/vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="./Resources/js/demo/chart-area-demo.js"></script>
    <script src="./Resources/js/demo/chart-pie-demo.js"></script>
	
	<script type="text/javascript">
		function productList(){
			location.href="${ctxPath}/productList.do"
		}
		function admin_productList(){
			location.href="${ctxPath}/admin_productList.do"
		}
		function admin_sellingSelect(){
			location.href="${ctxPath}/admin_sellingSelect.do"
		}
	</script>
	
</body>

</html>