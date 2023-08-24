<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<c:set var="show" value="0" />
<html lang="en">

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>상품구매(결제)페이지</title>
		<script src="https://kit.fontawesome.com/01debed61a.js" crossorigin="anonymous"></script>
		  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
		  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous"> 
		  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
		  
   
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

    .payment {
      position: fixed;
      left: 75%;
      bottom: 0.5%;
    }

  </style>

</head>


<body>


<jsp:include page="../includes/headerNav.jsp" />

  <div class="container">
   

 <form action="${ctxPath}/orderInsert.do" method="get" class="mb-5">
        

            <div class="">
           
                <h3 class="mt-5 text-end"><strong>주문서작성/결제</strong></h3>
            

                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    
                    <div class="d-flex justify-content-center">
                        
                        <div class="col-6 text-center ">
                            <img alt="" width="300px" src="/web/download/asd?imageFileName=${order_info.imagePath}">
                        </div>
                        
                        
                        
                       <div class="col-6">
                        	<input type="hidden" id="product_num"  name = "product_num" value = "${order_info.product_num}" class="form-control" readonly>
                            <input type="hidden" id="product_name" name = "product_name" value ="${order_info.product_name}" class="form-control" readonly>
                            <input type="hidden" id="p_size" name="p_size" value ="${order_info.p_size}" class="form-control" readonly>
                           <input type="hidden"  id="amount" name="amount" value ="${order_info.amount}" class="form-control" readonly>
                        	<input type="hidden" id="hidden" name="price" value ="${order_info.price}"class="form-control" readonly>
                        
                        <div>
	
	                      
	                        
	                        <ul class="list-group w-75 mt-3">
							  <li class="list-group-item mb-4">상품명 : <a href="productView.do?product_name=${order_info.product_name}" style="color:black"> ${order_info.product_name} </a></li>
							  <li class="list-group-item mb-4">사이즈 :  ${order_info.p_size}</li>
							  <li class="list-group-item mb-4">수량 : ${order_info.amount}</li>
							  <li class="list-group-item mb-4">가격 : ${order_info.price}원</li>
							</ul>
	                        
	                        	
	                        
                        </div>
                        
                            
                            
                            
                          
                         
                         
                        
                        
                        
                        </div>

                        
                   
                    </div>  <!-- 영역끝 -->
                    
                    
                    
                    
                   

                </div>
           </div>
          
          
          
          
        
        
        
        
        
        
        


        <div class="row d-flex mt-5">
            <div class="col-2"></div>

            <div class="row col-5">

                <div>
                    <h5 class="mb-3"><strong>주문 고객정보</strong></h5>
                    <div class="bg-opacity-10 border border-2 border-start-0 border-end-0">

                      <div class="mt-5 mb-5 row justify-content-start">
                        <div class="row d-flex m-2">
                          <label class="col-3"><strong>이름</strong></label>
                          <input type="text" id="user_name" name="user_name" value ="${user_info.name}" class="form-control" readonly>
                       		<input type="hidden" id="user_id" name="user_id" value="${user_info.user_id}" }>
                        </div>

                        <div class="row d-flex m-2">
                          <label class="col-3"><strong>휴대폰번호</strong></label>
                          <input type="text" value ="${user_info.phone}" class="form-control" readonly>
                        </div>

                        <div class="row d-flex m-2">
                           <label class="col-3"><strong>이메일</strong></label>
                          <input type="text" value ="${user_info.email}" class="form-control" readonly>
                        </div>
                      </div>

                    </div>
                </div>

                <div>
                    <h5 class="mt-5 mb-3"><strong>배송 정보</strong></h5>
                    <div class="bg-opacity-10 border border-2 border-start-0 border-end-0">

                      <div class="mt-5 mb-5 row justify-content-start">

                        <div class="row d-flex m-2">
                          <label class="col-3"><strong>이름 <label style="color: red;">*</label></strong></label>
                          <input type="text" id="name" name="name" class="col-5 border">
                        </div>

                        <div class="row d-flex m-2">
                          <label class="col-3"><strong>휴대폰번호 <label style="color: red;">*</label></strong></label>
                          <input type="text" id="phone" name="phone" class="col-5 border">
                        </div>

                        <div class="row d-flex m-2">
                           <label class="col-3"><strong>주소 <label style="color: red;">*</label></strong></label>
                           <input type="text"  id="address" name="address" class="col-5 border">&nbsp;
                           <input type="button" class="col-2 btn btn-outline-secondary rounded-0 btn-sm" value="우편번호">
                        </div>


                         <div class="row d-flex m-2">
                            <label class="col-3"><strong>배송시 <br> 요청사항</strong></label>
                            <input type="text" class="col-8 border">
                        </div>

                      </div>

                    </div>
                </div>
                
               
            </div>    <!-- col-5 -->




            <div class="payment col-3">
                <div class="p-4 border border-3 border-secondary">
                    <h5 class="m-2"><strong>결제정보</strong></h5>
                    <hr>
                    <div class="m-2">
                        <div class="d-flex justify-content-between">
                            <p>총 정상가</p>
                            <p>${order_info.price}</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>총 할인금액</p>
                            <p>0 원</p>
                        </div>
                        <div class="d-flex justify-content-between">
                            <p>적립금 사용</p>
                            <p>0 원</p>
                        </div>
                    </div>
                    <hr>
                    <div class="m-2">
                        <div class="d-flex justify-content-between">
                            <p><strong>총 결제예정금액</strong></p>
                            <h3 style="color: red;"><strong>${order_info.price}</strong></h3>
                        </div>
                    </div>
                    <div class="mt-5">
                         <input type="submit" value="결제하기" class="btn btn-dark w-100 rounded-0 p-3">
                    </div>

                </div>
            </div>    <!-- col-3 -->


            <div class="col-2"></div>
        </div>


        

        </form>
      </div>    <!-- end main -->























      

      <div class="p-2 bg-secondary bg-opacity-10 border border-start-0 border-end-0">
        <div class="d-flex">
          <div class="col-2"></div>
          <div class="col-5">
            <div class="d-flex">
              <p class="m-1" style="font-size: 0.9em;"><strong>통합고객센터</strong></p>
              <p class="m-1" style="font-size: 0.9em;">1588-1234</p>
              <p class="m-1" style="color: rgb(144, 143, 143); font-size: 0.9em;"">월~금 09:00 ~ 12:00 / 13:00 ~ 18:00 (주말,공휴일 휴무)</p>
            </div>
          </div>
          <div class="col-1">
            <div class="m-1">
              <a href="#" class="link-body-emphasis link-offset-2 link-underline-opacity-0" style="font-size: 0.9em;"><strong>NOTICE</strong></a>
            </div>
          </div>
        </div>
      </div>





      <!-- footer -->

      <div>
       <div class="row mb-3">
        <div class="col-2"></div>
        <div class="col-5">
          <img src="https://image.a-rt.com/art/system/site/202207/1658299296317.png" style="width: 18%;" class="mb-3 mt-3">
          <p style="font-size: 0.7em; color: rgb(105, 105, 105);">
            (주)에이비씨마트 코리아 대표이사 ｜ 이기호 주소 ｜ 서울특별시 중구 을지로 100, B동 21층 (을지로 2가, 파인에비뉴)<br>
            사업자등록번호 ｜ 201-81-76174 통신판매업신고 ｜ 제 2015-서울중구-1036호<br>
            개인정보보호 책임자 ｜ 박영수 이메일 ｜ abcmartcs@abcmartkorea.com
          </p>
          <p style="font-size: 0.7em;">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">사업자정보확인</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">개인정보처리방침</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">이용약관</a> ｜ 
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">멤버십 이용약관</a>
          </p>
        </div>
        <div class="col-1 mt-4">
          <p style="font-size: 0.9em; color: rgb(36, 36, 36);"><strong>HELP</strong></p>
          <p style="font-size: 0.9em; color: rgb(105, 105, 105);">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">고객센터</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">매장찾기</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">입점/제휴문의</a>
          </p>
        </div>

        <div class="col-1 mt-4">
          <p style="font-size: 0.9em; color: rgb(36, 36, 36);"><strong>BRAND</strong></p>
          <p style="font-size: 0.9em; color: rgb(105, 105, 105);">
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">HAWKINS</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">SPERRY</a><br>
            <a href="#" class="link-secondary link-offset-2 link-underline-opacity-0">DANNER</a>
          </p>
        </div>

        
        
       </div>
      </div>  <!-- footer -->

  </div>  <!-- main -->
  




        <script>
        
            function productList(){
        		location.href="${ctxPath}/productList.do"
        	}

            function productView(){
        		location.href="${ctxPath}/productView.do"
        	}
        </script>

</body>
</html>