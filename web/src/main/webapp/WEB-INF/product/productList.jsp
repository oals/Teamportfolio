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

  <div class="main">
    

	<jsp:include page="../includes/headerNav.jsp" />


      <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
          <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
        </div>

        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230602100214370.jpg?fitting=large|1920:600" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230616165455717.jpg?fitting=large|1920:600" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230619181553966.jpg?fitting=large|1920:600" class="d-block w-100" alt="...">
          </div>
          <div class="carousel-item">
            <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230616141208997.jpg?fitting=large|1920:600" class="d-block w-100" alt="...">
          </div>
          
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>



      <div class="mt-5">
        <h2 class="d-flex justify-content-center"><strong>NEW ARRIVALS</strong></h2>
        <a href="#" class="d-flex justify-content-end link-underline link-underline-opacity-0" style="margin-right: 17em; color: rgb(112, 112, 112);"><strong>MORE ></strong></a>
      </div>  
      

<!-- 나이키 -->
	
	
	
      <div id="carouselExample" class="carousel carousel-dark slide">
        <div class="carousel-inner mb-5">


          <div class="carousel-item active">
            <div class="d-flex justify-content-center">
            
            <c:forEach var="item" items="${nike_list}" begin="0" end="3">
              <a class="link-secondary"  style="text-decoration:none; " href="${ctxPath}/productView.do?product_name=${item.product_name}">
     
              
              <div class="m-1">
              
              <img alt="" width="200px" src="/web/download/asd?imageFileName=${item.imagePath}">
              
                
                <p class="m-2"><strong>${item.product_brand}</strong></p>
                
                <p class="m-2" style="font-size: 0.8em; color: rgb(91, 90, 90);">${item.product_name}</p>
                <p></p>
                <h5 class="m-2"><strong>${item.price}원</strong></h5>
              </div>
              </a>
              </c:forEach>
              
            
            </div>
          </div>


	
<!-- 아디다스 -->


	

          <div class="carousel-item">
            <div class="d-flex justify-content-center">
            <c:forEach var="item" items="${ads_list}" begin="0" end="3" >
              <a class="link-secondary" style="text-decoration:none; " href="${ctxPath}/productView.do?product_name=${item.product_name}">
              <div class="m-1">
                 <img alt="" width="200px" src="/web/download/asd?imageFileName=${item.imagePath}">
                <p class="m-2"><strong>${item.product_brand}</strong></p>
                <p class="m-2" style="font-size: 0.8em; color: rgb(91, 90, 90);">${item.product_name}</p>
                <h5 class="m-2"><strong>${item.price}원</strong></h5>
              </div>
			</a>
        </c:forEach>   
            </div>
          </div>



<!-- 뉴발란스 -->
		
	
	
          <div class="carousel-item">
            <div class="d-flex justify-content-center">
            <c:forEach var="item" items="${newbal_list}" begin="0" end="3">
              <a class="link-secondary"  style="text-decoration:none; "  href="${ctxPath}/productView.do?product_name=${item.product_name}">
              
              <div class="m-1">
                <img alt="" width="200px" src="/web/download/asd?imageFileName=${item.imagePath}">
                <p class="m-2"><strong>${item.product_brand}</strong></p>
                <p class="m-2" style="font-size: 0.8em; color: rgb(91, 90, 90);">${item.product_name}</p>
                <p></p>
                <h5 class="m-2"><strong>${item.price}원</strong></h5>
              </div>
              </a>

               </c:forEach>
            </div>
          </div>
        </div>
        
      
        
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    





     



      <!-- TREND ON -->

      <div class="row mb-3">
        <div class="col-2"></div>
          <div class="col-8">
            <div class="text-center mt-5"><h2><strong>TREND ON</strong></h2></div>
          </div>
        <div class="col-2"></div>
      </div> 


      <div class="row mb-4">
        <div class="col-1"></div>

        <div class="col-10">
          <div class="">
            <div class="d-flex justify-content-center">
              <div class="m-2">
                <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230613152401566.jpg?shrink=285:356" class="w-100" alt="...">
                <p class="m-auto mt-2" style="color: rgb(131, 131, 131);"><strong>EDITORIAL</strong></p>
                <p class="mt-1"><strong>SUMMER<br>DIARY</strong></p>
              </div>
              <div class="m-2">
                <img src="https://image.a-rt.com//art/display/gs/contents/202304/20230425190323393.jpg?shrink=285:356" class="w-100" alt="...">
                <p class="m-auto mt-2" style="color: rgb(131, 131, 131);"><strong>크록스 워크(WORK)화</strong></p>
                <p class="mt-1"><strong>CROCS<br>BISTRO COLLECTION</strong></p>
              </div>
              <div class="m-2">
                <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230612152538760.jpg?shrink=285:356" class="w-100" alt="...">
                <p class="m-auto mt-2" style="color: rgb(131, 131, 131);"><strong>G-log</strong></p>
                <p class="mt-1"><strong>나의 스타일을 공유하고<br>의견을 나누는 공간, click!</strong></p>
              </div>
              <div class="m-2">
                <img src="https://image.a-rt.com//art/display/gs/contents/202306/20230614153315142.jpg?shrink=285:356" class="w-100" alt="...">
                <p class="m-auto mt-2" style="color: rgb(131, 131, 131);"><strong>CATALOGUE</strong></p>
                <p class="mt-1"><strong>젝시믹스 키즈<br>우리 아이를 더욱 응원하는 마음으로</strong></p>
              </div>
            </div>
            </div>
        </div>  <!-- col-10 -->

        <div class="col-1"></div>
      </div>






      
      <div class="row">
        <div class="col-2"></div>
          <div class="col-8">
            <div class="text-center mt-5"><h2><strong>+ PICK</strong></h2></div>

            <div class="d-flex">
              <div class="col-2"></div>
              <div class="col-8">
                <div class="d-flex justify-content-center mb-2" style="color: grey;">
                  <h6 class="m-3"><strong>다양한 상품을 한 눈에 모아 볼 수 있는 묶음상품을 만나보세요.</strong></h6>
                </div>
              </div>
              <div class="col-2">
                <div class="d-flex justify-content-end mb-2">
                  <a href="#" style="color: grey;" class="m-3 link-underline link-underline-opacity-0"><strong>MORE ></strong></a>
                </div>
              </div>
            </div>  <!-- d-flex -->
          </div>  <!-- col-8 -->
        <div class="col-2"></div>
      </div>  <!-- row -->
      




  

          




      <div class="d-flex mb-4">
        <div class="col-6">
          <img src="https://image.a-rt.com//art/display/contents/202306/1686894407909.jpg" class="w-100">
        </div>
        <div class="col-6">
          <img src="https://image.a-rt.com//art/display/contents/202306/1686894437181.jpg" class="w-100">
        </div>
      </div>

      <jsp:include page="../includes/footer.jsp" />

  </div>  <!-- main -->
  





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
    	 	if(${sessionScope.login_chk == 'true'}){
    	 		location.href="${ctxPath}/cartlist.do"
    	 	}else{
    	 		alert("로그인을 해야 가능한 서비스 입니다")
    	 		location.href="${ctxPath}/login_page.do"
    	 	}
    	 	
    	 	
    	 
			
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

    function productSerchList(){
    	$('#searchForm').submit();
	}


  </script>

</body>
</html>