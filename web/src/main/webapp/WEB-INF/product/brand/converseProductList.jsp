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

  <div class="main">
    <jsp:include page="../../includes/headerNav.jsp" />

		<div class="productSearchList mt-5 mb-5">

	      <div class="row d-flex">
	        <div class="col-2"></div>
	
	        <div class="col-8">
	
			
	          <h2 class="text-center mt-3 mb-5"><strong>CONVERSE</strong></h2>
	          <hr class="border-2">
	
	          <div class="mt-5 mb-5 row d-flex align-content-center flex-wrap">
	            <c:forEach var="item" items="${converse_list}">
	            <div class="col-3 mb-5" onclick="prouductView()" style="cursor: pointer;">
	              <a class="link-secondary" href="${ctxPath}/productView.do?product_name=${item.product_name}">
	              
	              <div class="m-1">
	              
	              <img alt="" width="200px" src="/web/download/asd?imageFileName=${item.imagePath}">
	                
	                <p class="m-2"><strong>${item.product_brand}</strong></p>
	                
	                <p class="m-2" style="font-size: 0.8em; color: rgb(91, 90, 90);">${item.product_name}</p>
	                <p></p>
	                <h5 class="m-2"><strong>${item.price}원</strong></h5>
	              </div>
	              </a>
	            </div>
	            </c:forEach>
	            
	          </div>
	          
	        </div>    <!-- col-8 -->
			
	        <div class="col-2"></div>
	      </div>
	
	
	
	    </div>




      <jsp:include page="../../includes/footer.jsp" />

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
			location.href="${ctxPath}/cartlist.do"
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