<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctxPath" value="${pageContext.request.contextPath}" />
<c:set var="user_id" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">


body {
  margin: 0;
}

* {
  box-sizing: border-box;
}

p,
span {
  margin: 0;
}

a {
  color: black;
}

img {
  display: block;
  width: 80%;
  height: 80px;
  margin: auto;
}

.cart {
  width: 80%;
  margin: auto;
  padding: 30px;
}

.cart ul {
  background-color: whitesmoke;
  padding: 30px;
  margin-bottom: 50px;
  border: whitesmoke solid 1px;
  border-radius: 5px;
  font-size: 13px;
  font-weight: 300;
}

.cart ul :first-child {
  color: rgb(240, 36, 36);
}

table {
  border-top: solid 1.5px black;
  border-collapse: collapse;
  width: 100%;
  font-size: 14px;
}

thead {
  text-align: center;
  font-weight: bold;
}

tbody {
  font-size: 12px;
}

td {
  padding: 15px 0px;
  border-bottom: 1px solid lightgrey;
}

.cart__list__detail :nth-child(3) {
  vertical-align: top;
}

.cart__list__detail :nth-child(3) a {
  font-size: 12px;
}

.cart__list__detail :nth-child(3) p {
  margin-top: 6px;
  font-weight: bold;
}

.cart__list__smartstore {
  font-size: 12px;
  color: gray;
}

.cart__list__option {
  vertical-align: top;
  padding: 20px;
}

.cart__list__option p {
  margin-bottom: 25px;
  position: relative;
}

.cart__list__option p::after {
  content: "";
  width: 90%;
  height: 1px;
  background-color: lightgrey;
  left: 0px;
  top: 25px;
  position: absolute;
}

.cart__list__optionbtn {
  background-color: white;
  font-size: 10px;
  border: lightgrey solid 1px;
  padding: 7px;
}

.cart__list__detail :nth-child(4),
.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  border-left: 2px solid whitesmoke;
}

.cart__list__detail :nth-child(5),
.cart__list__detail :nth-child(6) {
  text-align: center;
}

.cart__list__detail :nth-child(5) button {
  background-color: rgb(240, 36, 36);
  color: white;
  border: none;
  border-radius: 5px;
  padding: 4px 8px;
  font-size: 12px;
  margin-top: 5px;
}

.price {
  font-weight: bold;
}

.cart__mainbtns {
  width: 420px;
  height: 200px;
  padding-top: 40px;
  display: block;
  margin: auto;
}

.cart__bigorderbtn {
  width: 200px;
  height: 50px;
  font-size: 16px;
  margin: auto;
  border-radius: 5px;
}

.cart__bigorderbtn.left {
  background-color: white;
  border: 1px lightgray solid;
}

.cart__bigorderbtn.right {
  background-color: rgb(240, 36, 36);
  color: white;
  border: none;
}
</style>
</head>
<body>

<body>
<jsp:include page="../includes/headerNav.jsp" />

    <section class="cart">
        <div class="cart__information">
            <ul>
                <li>장바구니 상품은 최대 30일간 저장됩니다.</li>
                <li>가격, 옵션 등 정보가 변경된 경우 주문이 불가할 수 있습니다.</li>
                <li>오늘출발 상품은 판매자 설정 시점에 따라 오늘출발 여부가 변경될 수 있으니 주문 시 꼭 다시 확인해 주시기 바랍니다.</li>
            </ul>
        </div>
        <table class="cart__list">
            <form>
                <thead>
                    <tr>
                        <td><input type="checkbox"></td>
                        <td colspan="2">상품정보</td>
                        <td>옵션</td>
                        <td>상품금액</td>
                        <td>배송비</td>
                    </tr>
                </thead>
                <tbody>
                
				<c:if test="${not empty cart_list}">
				
               	<c:forEach var="item" items="${cart_list}" step ="1">
                
                    <tr class="cart__list__detail">
                    
                    	<input type="hidden" id="user_id" name="user_id" value ="${item.user_id}">
                    	
                        <td><input type="checkbox" id="chk" name="chk" value="${item.product_num}"></td>
                        <td><img alt="" width="200px" src="/web/download/asd?imageFileName=${item.imagePath}"></td>
                        <td>
                            <p><a class="link-secondary" href="${ctxPath}/productView.do?product_name=${item.product_name}">상품 이름 : ${item.product_name}</a></p>
                            
                            <sapn class="price">${item.price}원</sapn>
                            
                            <span
                                style="text-decoration: line-through; color: lightgray;"> 119,000원
                             </span>
                        </td>
                        <td class="cart__list__option">
                        
                            <p class="mt-2">size : ${item.p_size} / 수량 : ${item.amount}</p>
                            
                            
                            <div class="d-flex justify-content-center">
                            
                            <div class="ml-3200">

		                    </div>
		                    
		                    <div>
		                    
		                    

                           </div>
                   			</div>
                        
                        </td>
                        <td><span class="price">${item.price}원</span><br>
                        
                            <button class="cart__list__orderbtn btn btn-danger btn-sm "><a href="${ctxPath}/orderRegister.do?user_id=${item.user_id}&product_num=${item.product_num}&amount=${item.amount}&product_name=${item.product_name}&price=${item.price}&size_opt=${item.p_size}&imagePath=${item.imagePath}" style="color:white">주문하기</a></button>
                        
                        </td>
                        <td class="text-center">무료</td>
                    </tr>
                  </c:forEach>
                    
                </c:if>
                
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="3">
                        	<input type="checkbox">
							<button class="cart__list__optionbtn" id="delBtn">선택상품 삭제</button>
                            <button class="cart__list__optionbtn" id="delAllBtn">장바구니 비우기</button>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tfoot>
            </form>
        </table>
        <div class="cart__mainbtns">
            <button class="cart__bigorderbtn left" onclick="productList()">쇼핑 계속하기</button>
            <button class="cart__bigorderbtn right" onclick="orderRegister()">주문하기</button>
        </div>
    </section>
    
    <jsp:include page="../includes/footer.jsp" />
    
    
</body>

    <script type="text/javascript">
    
	    function productList(){
			location.href="${ctxPath}/productList.do"
		}
	    function orderRegister(){
			location.href="${ctxPath}/orderRegister.do"
		}
    
	    $(function(){
		
		
		
		$('#delAllBtn').click(function(e){
			e.preventDefault();
			
			var cartid = $('#cart_id').val()
			var path = $('#ctxPath').val()
			var isDelete = confirm('장바구니를 전부 비우시겠습니까?');
			
			if(isDelete){
				$.ajax({
					type: 'post',
					async: false,
					url: "${ctxPath}/cartdeleteall.do",
					dataType:"text",
					data: {
						user_id: "123"
					},
					success: function(data, textStatus){
						alert("삭제되었습니다")
			    		location.href="/web/cartlist.do"
					}
					
				}); // end ajax
				
				}
			
		}) 
		
		
		
		
		$('#delBtn').click(function(e){
			
			e.preventDefault();
			var user_id = $('#user_id').val()
			var path = $('#ctxPath').val()
			var chk_val = []
			
			$("input:checkbox[name='chk']").each(function(){
				if($(this).is(":checked")==true){
					chk_val.push($(this).val())
					
				}
			})
			
			
			var isDelete = confirm('해당 상품을 장바구니에서 삭제하시겠습니까?');
			
			if(isDelete){
				$.ajax({
					type: 'post',
					async: false,
					url: "${ctxPath}/cartdelete.do",
					dataType:"text",
					traditional:true,
					data: {
						user_id : user_id,
						checkbox: chk_val
					},
					success: function(data, textStatus){
						alert("삭제되었습니다")
			    		location.href="/web/cartlist.do"
					}
					
				}); // end ajax
				
				}
			
		}) 
		
		
		
		
		
	}); // end function
	
	
	
	function productSerchList(){
    	$('#searchForm').submit();
	}
	
    	
    </script>
    
    
</body>
</html>