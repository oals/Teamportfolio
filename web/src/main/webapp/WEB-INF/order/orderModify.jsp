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

    .inputBox, .input:focus {
        color: grey;
        border: none;
        outline: none;
    }

    .modify_form, .modify_form:focus {
        border: none;
        outline: none;
    }
</style>

    </head>
<body>
    
    <jsp:include page="../includes/headerNav.jsp" />
<form action="${ctxPath}/orderUpdate.do">
    <div class="orderModify mt-5 mb-5">
        <div class="row d-flex">
            <div class="col-2"></div>

            <div class="col-8">
                <h5 class="mb-3"><strong>주문취소 · 교환 · 환불</strong></h5>

                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    
                    <div class="d-flex justify-content-between">
                        <div>
                            <label><strong></strong></label>
                            <input type="text" value="" class="inputBox" readonly>
                        </div>
                        <div>
                            <label><strong>주문날짜 : </strong></label>
                            <input type="text" value="2023.07.02" class="inputBox" readonly>
                        </div>
                    </div>

                    <div>
                        <div class="mt-5 row">
    
    
    					<div class="row d-flex m-2">
                            <label class="col-4"><strong>주문 번호</strong></label>
                            <input type="text" value="${product_info.order_num}" id="order_num" name="order_num"class="col-8 modify_form" readonly>
                          </div>
                       
                       
                          <div class="row d-flex m-2">
                            <label class="col-4"><strong>상품명</strong></label>
                            <input type="text" value="${product_info.product_name}" class="col-8 modify_form" readonly>
                          </div>
    						<input type="hidden" value="${product_info.product_num}" id="product_num" name="product_num">
                        
    
                           <div class="row d-flex m-2">
                              <label class="col-4"><strong>처리상태</strong></label>
                              <div class="col-8">
							        <select id="del_opt" name="del_opt" class="form-select form-select-sm w-75 col-3">
							                        <option selected>구매취소</option>
							                        <option value="구매취소">단순변심</option>
							                        <option value="구매취소">사이즈 문제</option>
							                        <option value="구매취소">기타</option>
							        </select>
                              </div>
                          </div>
    
                          <div class="d-flex justify-content-end">
                          <input type="submit" value="완료"  class="btn btn-dark btn-sm rounded-0 m-1 p-2">
                          
                          </form>
                          
                          <input type="button" value="취소" onclick="orderList()" class="btn btn-dark btn-sm rounded-0 m-1 p-2">
                          </div>

                        </div>
                    </div>

                </div>



            </div>      <!-- col-8 -->
            
            <div class="col-2"></div>
        </div>
    </div>


	<jsp:include page="../includes/footer.jsp" />

<script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
<script type="text/javascript"> 


	function orderUpdate(){
	location.href="${ctxPath}/orderUpdate.do"
	}
	
	function orderList(){
		location.href="${ctxPath}/orderList.do"
	}






</script>

</body>
</html>