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

    .page-link {
      color: #000; 
      background-color: #fff;
      border: 1px solid #ccc; 
    }

    .page-item.active .page-link {
      z-index: 1;
      color: #555;
      font-weight:bold;
      background-color: #f1f1f1;
      border-color: #ccc;
    }

    .page-link:focus, .page-link:hover {
      color: #000;
      background-color: #fafafa; 
      border-color: #ccc;
    }

</style>

</head>
<body>

<jsp:include page="../includes/headerNav.jsp" />
    
    <div class="orderList mt-5">
        <div class="row d-flex">
            <div class="col-2"></div>

            <div class="col-8">
                <h5 class="mb-3"><strong>주문내역</strong></h5>

                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    <div class="">
                        <table class="table table-borderless">
                            <thead class="table-light">
                              <tr>
                                <th class="col-2 text-center">상품이름</th>
                                <th class="col-3 text-center">상품옵션</th>
                                <th class="col-2 text-center">주문날짜</th>
                                <th class="col-2 text-center">주문상태</th>
                              </tr>
                            </thead>
                            <tbody id="order">
                            	
                            	
                                <c:forEach var="item" items="${order_list}" step="1">
             
				                   <tr>
				                  <td scope="row" class="text-center">  <a class="link-secondary"  href="${ctxPath}/orderView.do?order_num=${item.order_num}&user_id=${item.user_id}&product_num=${item.product_num}&product_name=${item.product_name}&product_opt=${item.product_opt}&result=${item.result}"> ${item.product_name} </a></td>
				                  <td style="cursor: pointer" class="text-center">
				                    ${item.product_opt}
				                  </td>
	
				                  <td id="center" class="text-center" > ${item.indate}</td>
				                  <td id="center" class="text-center"> ${item.result}</td>
				                </tr>
				                
				              
				              </c:forEach>
                              
                            </tbody>
                          </table>
                    </div>
                </div>
                
                <input type="hidden" id="user_id" name="user_id" value = "${order_list[0].user_id}">
				
				 <c:if test="${totArticles != null }">
		<div id="order_paging" class=" d-flex justify-content-center mt-2">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
		                     
		                     <div id="prevbtn"></div>
	                       	 <c:if test="${section > 1 && page==1 }">
		                       	<li class="page-item ">
		                        	<a class="page-link"  onclick="order_page(${section-1},${page},2)">이전</a>
		                        	
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" onclick="order_page(${section},${page},1)">${(section-1)*10 + page}</a>
			                      	
			                     </li>
	   	                    	</c:when>
	   	                    	
	   	                    	
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	
			                     <a class="page-link"  onclick="order_page(${section},${page},1)">${(section-1)*10 + page}</a>
			                     
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link"  onclick="order_page(${section+1},${pageNum},1)">다음</a>
	                        
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
                </div>
                </c:if>
                
                
        
				
				


                
                <h5 class="mb-3 mt-5"><strong>쿠폰</strong></h5>
                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    <div class="">
                        <table class="table table-borderless">
                            <thead class="table-light">
                              <tr>
                                <th class="col-3 text-center">쿠폰명</th>
                                <th class="col-3 text-center">개수</th>
                                <th class="col-3 text-center">할인율</th>
                                <th class="col-3 text-center">유효기간</th>
                              </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="item" items="${coupon_list}">
                              <tr>
                                <td class="col-3">${item.cp_name}</td>
                                <td class="col-3">${item.cp_result}</td>
                                <td class="col-3 text-center">${item.cp_sale}</td>
                                <td class="col-3 text-center">~ ${item.cp_expiration}</td>
                              </tr>
                                </c:forEach>
                            </tbody>
                          </table>
                    </div>
                </div>



                <h5 class="mb-3 mt-5"><strong>상품문의</strong></h5>
                <div class="p-2 bg-opacity-10 border border-2 border-start-0 border-end-0">
                    <div class="">
                        <table class="table table-borderless">
                            <thead class="table-light">
                              <tr>
                                <th class="col-2 text-center">문의상품</th>
                                <th class="col-3 text-center">내용</th>
                                <th class="col-2 text-center">작성일</th>
                                <th class="col-2 text-center">처리상태</th>
                              </tr>
                            </thead>
                            <tbody id ="pboard">
                            
                             <c:forEach var="item" items="${p_board_list}" step="1">
                             
                              <tr>
                                <td class="col-2 text-center "><a class="link-secondary" href="${ctxPath}/productView.do?product_name=${item.product_name}">${item.product_name} </a></td>
                                <td class="col-3 text-center">${item.qna_title}</td>
                                <td class="col-2 text-center">${item.articleNo}</td>
                                <td class="col-2 text-center">${item.rep_check}</td>
                              </tr>
                               
                              </c:forEach>
                               
                            </tbody>
                          </table>
                    </div>
                </div>
                
                
                
        <c:if test="${totArticles2 != null }">
		<div id="paging" class="d-flex justify-content-center">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage2}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
		                     
		                     <div id="prevbtn"></div>
	                       	 <c:if test="${section2 > 1 && page==1 }">
		                       	<li class="page-item ">
		                        	<a class="page-link" id="prev" name="prev" onclick="p_board_page(${section2-1},${page},2)">이전</a>
		                        	
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum2}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" id="${page}" onclick="p_board_page(${section2},${page})">${(section2-1)*10 + page}</a>
			                      	
			                     </li>
	   	                    	</c:when>
	   	                    	
	   	                    	
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	
			                     <a class="page-link" id="${page}" onclick="p_board_page(${section2},${page})">${(section2-1)*10 + page}</a>
			                     
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section2 < totSection2}">
	                      <li class="page-item">
	                        <a class="page-link"  id="next" name="next"  onclick="p_board_page(${section2+1},${pageNum},1)">다음</a>
	                        
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
                </div>
                </c:if>
        
                



            </div>      <!-- col-8 -->
            
            <div class="col-2"></div>
        </div>
        </form>
    </div>
    

<jsp:include page="../includes/footer.jsp" />


  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript">

	function order_page(section,pageNum,chk){
	
		
		var user_id2 = $('#user_id').val()
  		
     	$.ajax({
			type: 'post',
			async: false,
			url: "${ctxPath}/OrderUserList.do",
			data:{
				user_id : user_id2,
				pageBlock : section,
				pageNum: pageNum
				
			},
			success: function(data, textStatus){
				var jsonInfo = JSON.parse(data)
				
				
				$('#order').html('')
				$('#order_paging').html('')
				
				
				
				 for(let i = 0; i < 5; i++){
						if(jsonInfo.list[i] == null){
							break;
							
						}
					 
				$('#order').append(
						 "<tr>"
		                   +"<td style='cursor: pointer'  class='text-center'>"
		                   +"<a class='link-secondary' href='${ctxPath}/orderView.do?order_num=" 
			                + jsonInfo.list[i].order_num 
			                +"&user_id=" + jsonInfo.list[i].user_id 
							+ "&product_name=" + jsonInfo.list[i].product_name 
							+ "&product_opt=" + jsonInfo.list[i].product_opt 
							+ "&result=" + jsonInfo.list[i].result + "'>" + jsonInfo.list[i].product_name 
							+ "</a></td>"
							
							
							
		                 + "<td style='cursor: pointer' class='text-center' >"
		                 + jsonInfo.list[i].product_opt
		                 + "</td>"

		                 + "<td id='center' class='text-center'>" + "2020-05-30"+ "</td>"
		                 + "<td id='center' class='text-center'>" + jsonInfo.list[i].result + "</td>"
		               + "</tr>"
		               )
      		      
				} 
				
				
				
				
			$('#order_paging').html(jsonInfo.paging[0].data)
					
				
			},error:function(data,textStatus){
				alert("다시 시도해주시길 바랍니다")
			}
			
		}); // end ajax  
		
		
	}

	
	
	




	function p_board_page(section2,pageNum2,chk){  //문의사항 페이징
  	    
		var user_id2 = $('#user_id').val()
  		
     	$.ajax({
			type: 'post',
			async: false,
			url: "${ctxPath}/InquiryUserList.do",
			data:{
				user_id : user_id2,
				pageBlock : section2,
				pageNum: pageNum2
				
			},
			success: function(data, textStatus){
				var jsonInfo = JSON.parse(data)
				
				console.log($('#pboard').html())
				$('#pboard').html('')
				$('#paging').html('')
				
				
				 for(let i = 0; i < 5; i++){
					 
						if(jsonInfo.list[i] == null){
							break;
							
						}
					 
				$('#pboard').append(
                      "<tr>"
      		        + "<td class='col-2 text-center'> <a class='link-secondary' href='${ctxPath}/productView.do?product_name="+jsonInfo.list[i].product_name + "'>" + jsonInfo.list[i].product_name+ "</a>"+ "</td>"
      		        + "<td class='col-3 text-center' >" + jsonInfo.list[i].qna_content+ "</td>"
      		        + "<td class='col-2 text-center'>" + jsonInfo.list[i].articleNo + "</td>"
      		        + "<td class='col-2 text-center'>" + jsonInfo.list[i].rep_check + "</td>"
      		      + "</tr>")
      		      
				} 
				
				
				
			$('#paging').html(jsonInfo.paging[0].data)
					
				
			},error:function(data,textStatus){
				alert("다시 시도해주시길 바랍니다")
			}
			
		}); // end ajax  
		
	}
	



    function orderView(){
		location.href="${ctxPath}/orderView.do"
	}





</script>

</body>
</html>