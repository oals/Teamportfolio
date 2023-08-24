<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <script src="https://kit.fontawesome.com/01debed61a.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> 
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
  <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
  
  <style>
    .search:focus {
      outline: none;
    }

    .a_link {
      color: black;
      text-decoration-line: none;
    }

    .hearder_link {
      color: black;
      text-decoration-line: none;
    }

    .hearder_label {
      cursor: pointer;
    }

  </style>

</head>
<body>

    <div class="container">

      <div class="logo row p-1">

        <div class="col-4 p-2 m-auto">
          <a href="${ctxPath}/productList.do">
          <img src="https://image.a-rt.com/art/system/site/202207/1658299296317.png">
          </a>
        </div>

        <div class="col-4 mt-4">
         <div class="border-2 border-bottom border-secondary row d-flex justify-content-center">
          <div class="col-10 align-self-center">
          	<form action="${ctxPath}/productSerchList.do" id="searchForm">
            	<input type="text" class="search border border-0 w-100 h-100" name="keyword" placeholder="검색어를 입력하세요.">
            </form>
          </div>
          <div class="col-2 d-flex justify-content-end" onclick="productSerchList()">
            <div class="d-flex m-2">
             <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
             <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
             </svg>
            </div>
          </div>
         </div>
        </div>

        <div class="col-4">
          <div class="m-auto d-flex justify-content-between w-25">

			<c:choose>
			<c:when test="${sessionScope.login_chk == 'true'}">
			
					<a href="#" class="hearder_link" onclick="orderList()">
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
					  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
					</svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">MYPAGE</label>
	          </div>
	          </a>
				
				  <a href="${ctxPath}/logout.do" class="hearder_link">  <!-- 로그아웃 버튼 -->
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
	              <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
	              <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">logout</label>
	          </div>
	          </a>

			</c:when>
			<c:otherwise>
				  <a href="${ctxPath}/login_page.do" class="hearder_link">  <!-- 로그인 버튼 -->
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
	              <path fill-rule="evenodd" d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z"/>
	              <path fill-rule="evenodd" d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">LOGIN</label>
	          </div>
	          </a>
	
	          <a href="${ctxPath}/user_register.do" class="hearder_link">
	          <div class="row p-3 d-block align-content-center">
	              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
	              <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6Zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0Zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4Zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10Z"/>
	              </svg>
	              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">JOIN</label>
	          </div>
	          </a>
			
			
			</c:otherwise>
			</c:choose>
        



          <a href="#" class="hearder_link" onclick="cartlist()">
          <div class="row p-3 d-block align-content-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-bag" viewBox="0 0 16 16">
              <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
              </svg>
              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">CART</label>
          </div>
          </a>




          
          <c:if test="${sessionScope.admin == 'true'}">
          <a href="#" class="hearder_link" onclick="admin_sellingList()">
          <div class="row p-3 d-block align-content-center">
              <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-shop-window" viewBox="0 0 16 16">
              <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h12V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zm2 .5a.5.5 0 0 1 .5.5V13h8V9.5a.5.5 0 0 1 1 0V13a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V9.5a.5.5 0 0 1 .5-.5z"/>
              </svg>
              <label class="hearder_label mt-1 text-center" style="font-size: 0.8em;">Admin</label>
          </div>
          </a>
          </c:if>
          </div>
        </div>

     </div>  <!-- logo -->
    </div>  <!-- container -->
     
      <nav class="navbar navbar-expand-lg p-1" style="background-color: rgb(240, 36, 36);">
        <div class="container-fluid">
         <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <div class="col-2"></div>
            <ul class="navbar-nav me-auto col-4 justify-content-start">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="javascript:void(0);" style="color: yellow; margin-right: 1em; cursor: default;">BRAND</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${ctxPath}/productList_nike.do" style="color: white; margin-right: 1em;">NIKE</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${ctxPath}/productList_adidas.do" style="color: white; margin-right: 1em;">ADIDAS</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${ctxPath}/productList_newbalance.do" style="color: white; margin-right: 1em;">NEWBALANCE</a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${ctxPath}/productList_puma.do" style="color: white; margin-right: 1em;">PUMA</a>
              </li>

            </ul>
            <ul class="navbar-nav me-auto col-4 justify-content-end">
              <li class="nav-item ">
                <a class="nav-link active" aria-current="page" href="#" style="color: white;" onclick="qnaList()"><strong>문의사항</strong></a>
              </li>
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="#" style="color: white; margin-left: 0.8em;" onclick="noticeList()"><strong>공지사항</strong></a>
              </li>
            </ul>
            <div class="col-2"></div>
          </div>
        </div>
      </nav>

  





  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript">

    $(function(){
      
      document.getElementById('slide_hidden').style.display = 'none';
      document.getElementById('mule_hidden').style.display = 'none';
      document.getElementById('zaxy_hidden').style.display = 'none';

      document.getElementById('crocsBtn').style.color = "red";

      $('#crocsBtn').on("click",function(){

        $('#crocs_hidden').show();
        $('#slide_hidden').hide();
        $('#mule_hidden').hide();
        $('#zaxy_hidden').hide();


        document.getElementById('crocsBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
      })


      $('#slideBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#mule_hidden').hide();
        $('#zaxy_hidden').hide();
        
        document.getElementById('slide_hidden').style.display = 'block';
        
        
        document.getElementById('slideBtn').style.color = "red";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
      })


      $('#muleBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#slide_hidden').hide();
        $('#zaxy_hidden').hide();
        
        document.getElementById('mule_hidden').style.display = 'block';

        document.getElementById('muleBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('zaxyBtn').style.color = "grey";
        
      })


      $('#zaxyBtn').on("click",function(){
        $('#crocs_hidden').hide();
        $('#slide_hidden').hide();
        $('#mule_hidden').hide();
        
        document.getElementById('zaxy_hidden').style.display = 'block';

        document.getElementById('zaxyBtn').style.color = "red";
        document.getElementById('slideBtn').style.color = "grey";
        document.getElementById('crocsBtn').style.color = "grey";
        document.getElementById('muleBtn').style.color = "grey";
        
      })

      
    })
    
    function cartlist(){
			location.href="${ctxPath}/cartlist.do"
		}
    function orderList(){
		location.href="${ctxPath}/orderList.do"
	}
    function joinRegist(){
		location.href="${ctxPath}/join/joinRegist.jsp"
	}
    
    function qnaList(){
		location.href="${ctxPath}/qnaList.do"
	}
    
    function noticeList(){
		location.href="${ctxPath}/noticeList.do"
	}
    function admin_sellingList(){
		location.href="${ctxPath}/admin_sellingList.do"
	}
    function productView(){
		location.href="${ctxPath}/productView.do"
	}
    function productList(){
		location.href="${ctxPath}/productList.do"
	}
    
    function productSerchList(){
    	$('#searchForm').submit();
	}




  </script>

</body>
</html>