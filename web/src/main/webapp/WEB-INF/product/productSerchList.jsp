<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> 

<style>
  .delivery_form:focus, .delivery_form {
    outline: none;
    border: 0;
  }

</style>

</head>
<body>
    
  <jsp:include page="../includes/headerNav.jsp" />

    <div class="productSearchList mt-5 mb-5">


      <div class="row d-flex">
        <div class="col-2"></div>

		<c:choose>
		<c:when test="${not empty SearchList}">	
        <div class="col-8">

		
          <h2 class="text-center m-5"><strong>"${keyword}" 에 대한 검색 결과입니다.</strong></h2>
          <hr class="border-2">

          <div class="mt-5 mb-5 row d-flex align-content-center flex-wrap">
            <c:forEach var="item" items="${SearchList}">
            <div class="col-3 mb-5" onclick="prouductView()" style="cursor: pointer;">
              <a href="${ctxPath}/productView.do?product_name=${item.product_name}" style="text-decoration:none; color:black">
              
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
        </c:when>
        <c:otherwise>
        	<h2 class="text-center m-5"><strong>${msg}</strong></h2>
        </c:otherwise>
        	
		</c:choose>
		
        <div class="col-2"></div>
      </div>



    </div>    <!-- end productSearchList -->


    <jsp:include page="../includes/footer.jsp" />

  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript"> 
    
    function productList(){
			location.href="${ctxPath}/productView.do"
		}
    
    function productSerchList(){
    	$('#searchForm').submit();
	}
    
  </script>

</body>
</html>