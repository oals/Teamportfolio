<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
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

    
      <form action="${ctxPath}/orderModify.do">
    <div class="orderView mt-5 mb-5">
      <div class="row d-flex">
        <div class="col-2"></div>

        <div class="col-8">

          <h5 class="mb-3"><strong>주문 상세 내역</strong></h5>

                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    <div class="">
                        <table class="table table-borderless">
                            <thead class="table-light">
                              <tr>
                                <th class="col-2 text-center">상품번호</th>
                                <th class="col-3 text-center">상품옵션</th>
                                <th class="col-1 text-center">상품수량</th>
                                <th class="col-2 text-center">주문금액</th>
                                <th class="col-1 text-center">주문상태</th>
                              </tr>
                            </thead>
                            <tbody>
                              <tr>
                                <td class="col-2 text-center"  onclick="productView()" style="cursor: pointer">
                                  <a class="link-secondary" href="${ctxPath}/productView.do?product_name=${order.product_name}">${order.product_name}</a>
                                </td>
                                <td class="col-3 text-center">${order.product_opt}사이즈</td>
                                <td class="col-1 text-center">${order_info.amount}</td>
                                <td class="col-1 text-center">${product_info.price * order_info.amount}원</td>
                                <td class="col-1 text-center">${order_info.result}</td>
                              </tr>
                            </tbody>
                          </table>
                    </div>
                </div>

                <div class="d-flex justify-content-end mt-2">
                  <input type="submit" value="주문취소 · 교환 · 환불" class="btn btn-dark btn-sm rounded-0 p-2">
                </div>

        </div>    <!-- end col-8 -->


        <div class="col-2"></div>
      </div>



      <div class="mt-5">
        <div class="row">
          <div class="col-2"></div>

          <div class="col-4">
            <h5 class="mb-3"><strong>배송지 정보</strong></h5>

              <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                  <div>
                    <div class="mt-5 mb-5 row justify-content-start">

                      <div class="row d-flex m-2">
                        <label class="col-3"><strong>이름</strong></label>
                        <input type="text" class="col-8 delivery_form" value="${order_info.name}" readonly>
                      </div>

                      <div class="row d-flex m-2">
                        <label class="col-3"><strong>휴대폰번호</strong></label>
                        <input type="text" class="col-8 delivery_form" value="010-2222-3333" readonly>
                      </div>

                      <div class="row d-flex m-2">
                         <label class="col-3"><strong>주소</strong></label>
                         <input type="text" class="col-8 delivery_form" value="${order_info.address}" readonly>
                      </div>

                       <div class="row d-flex m-2">
                          <label class="col-3"><strong>배송시 요청사항</strong></label>
                          <input type="text" class="col-8 delivery_form" value="경비실로" readonly>
                      </div>

                    </div>
                  </div>
              </div>

          </div>    <!-- col-4 -->


          <div class="col-4">
            <h5 class="mb-3"><strong>최종 결제 정보</strong></h5>

              <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                  <div>
                    <div class="mt-5 mb-5 row justify-content-start">

                      <div class="row d-flex m-2">
                        <label class="col-3"><strong>상품 합계</strong></label>
                        <input type="text" class="col-8 delivery_form" value="${product_info.price * order_info.amount}원" readonly>
                      </div>

                      <div class="row d-flex m-2">
                        <label class="col-3"><strong>쿠폰 할인</strong></label>
                        <input type="text" class="col-8 delivery_form" value="-0원" readonly>
                      </div>

                      <div class="row d-flex m-2">
                         <label class="col-3"><strong>적립금 사용</strong></label>
                         <input type="text" class="col-8 delivery_form" value="-0원" readonly>
                      </div>

                      <div class="row d-flex m-2">
                        <label class="col-3"><strong>최종 결제 금액</strong></label>
                        <input type="text" class="col-8 delivery_form" value="${product_info.price * order_info.amount}원" readonly>
                     </div>

                    </div>
                  </div>
              </div>

          </div>    <!-- col-4 -->

          <div class="col-2"></div>
        </div>
      </div>

	
	<input type="hidden" id="product_num" name="product_num" value="${product_info.product_num}"}>
	<input type="hidden" id="order_num" name="order_num" value="${order_info.order_num}">
	<input type="hidden" id="product_name" name="product_name" value="${product_info.product_name}">
	


    </div>    <!-- end orderView -->
	</form>

	<jsp:include page="../includes/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript"> 
    
    function productView(){
      location.href="${ctxPath}/productView.do?product_name=" + ${order.product_name}
    }

    function orderModify(){
      location.href="${ctxPath}/orderModify.do"
    }
    
    
  </script>


</body>
</html>