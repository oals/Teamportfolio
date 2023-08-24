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
		.card {
			height: 60rem;
		}
		textarea {
			resize: none;
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
                                    <h6 class="m-0 font-weight-bold text-danger">상품 등록</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                        <div class="main mt-5">
								        <div class="container">
									    <form action="${ctxPath}/admin_productInsert.do" method="get" class="mb-5">
									    
									    
									    
								            <div class="w-75 m-auto mt-5">
								              
								              
								              
								              <div class="mb-3 row">
								                <label for="selectBoard" class="col-sm-2 col-form-label align-self-center"
								                  >브랜드</label
								                >
								                <div class="col-sm-10 align-self-center">
								                  <select
								                    class="custom-select"
								                    aria-label="Default select example"
								                    id="product_brand"
								                    name="product_brand"
								                  >
								                    <option selected>브랜드를 선택해주세요.</option>
								                    <option value="1">nike</option>
								                    <option value="2">adidas</option>
								                    <option value="3">newbalance</option>
								                    <option value="4">puma</option>
								                    <option value="5">converse</option>
								                  </select>
								                </div>
								              </div>
								              <div class="mb-3 row">
								                <label for="title" class="col-sm-2 col-form-label align-self-center">상품명</label>
								                <div class="col-sm-10 align-self-center">
								                  <input
								                    type="text"
								                    name="product_name"
								                    class="form-control border rounded-1 p-2"
								                    id="product_name"
								                    placeholder="상품명을 입력해주세요."
								                  />
								                </div>
								              </div>
								              <div class="mb-3 row">
								                <label for="selectBoard" class="col-sm-2 col-form-label align-self-center"
								                  >성별</label
								                >
								                <div class="col-sm-10 align-self-center">
								                  <select
								                    class="custom-select"
								                    aria-label="Default select example"
								                    id="gender"
								                    name="gender"
								                  >
								                    <option selected>성별을 선택해주세요.</option>
								                    <option value="1">남</option>
								                    <option value="2">여</option>
								                  </select>
								                </div>
								              </div>
								              <div class="mb-3 row">
								                <label for="title" class="col-sm-2 col-form-label align-self-center">가격</label>
								                <div class="col-sm-10 align-self-center ">
								                  <input
								                    type="text"
								                    name="price"
								                    class="form-control border rounded-1 p-2"
								                    id="price"
								                    placeholder="가격을 입력해주세요."
								                  />
								                </div>
								              </div>
								            <div class="mb-3 row">
								              <label for="content" class="col-sm-2 col-form-label">상품설명</label>
								              <div class="col-sm-10">
								                <textarea
								                  name="description"
								                  class="form-control border rounded-1 p-2"
								                  id="description"
								                  rows="10"
								                >상품설명 내용</textarea
								                >
								              </div>
								            </div>
								              <div class="mb-5 row">
								                <label for="imageFileName" class="col-sm-2 col-form-label align-self-center"
								                  >이미지</label
								                >
								                <div class="col-sm-10 align-self-center">
								                  <input
								                    type="file"
								                    class="form-control p-2"
								                    name="imagePath"
								                    id="imagePath"
								                    style="height:3rem;"
								                  />
								                </div>
								              </div>
								              <div class="mb-3 row">
								                <label for="title" class="col-sm-2 col-form-label align-self-center">재고</label>
								                <div class="col-sm-10 align-self-center">
								                  <input
								                    type="text"
								                    name="in_count"
								                    class="form-control border rounded-1 p-2"
								                    id="in_count"
								                    placeholder="재고를 입력해주세요."
								                  />
								                </div>
								              </div>
								            </div>
								            
								
								            <div class="m-auto d-flex justify-content-center">
								              <div class="w-75 d-flex justify-content-end">
								                <div>
								                  <button
								                    type="submit"
								                    class="btn btn-outline-danger"
								                  >
								                    저장
								                  </button>
								                  <button
								                    type="button"
								                    class="btn btn-outline-secondary"
								                    onclick="admin_productList()"
								                  >
								                    목록
								                  </button>
								                </div>
								              </div>
								            </div>
								          </form>
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
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; My Website 2023</span>
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
		function admin_sellingList(){
			location.href="${ctxPath}/admin_sellingList.do"
		}
	    function admin_productList(){
			location.href="${ctxPath}/admin_productList.do"
		}
	</script>
	
</body>

</html>