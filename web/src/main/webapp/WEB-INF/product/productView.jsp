<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
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

    .review_text {
      border: 0;
    }

    .review_text:focus, .product_name, .product_price:focus, .all_price:focus {
      outline: none;
    }

    .qna_text:focus, .qna_content:focus, .review_content:focus, .reply_content:focus {
      box-shadow: none;
      outline: none;
    }

    #qna {
      cursor: pointer;
    }

  </style>

</head>


<body>

<div class="main">
  
  <jsp:include page="../includes/headerNav.jsp" />


      <div class="productView mt-5">
        
        <div class="row d-flex">
            <div class="col-2"></div>

            <div class="col-4 row justify-content-center">
                   <img alt="" width="200px" src="/web/download/asd?imageFileName=${product_info.imagePath}">

             
            </div>


            <div class="col-4">
            <div class="">
            <form action="${ctxPath}/orderRegister.do">
                <a href="#"  style="text-decoration:none; color:black; font-size:1.5em">${product_info.product_brand}</a>
                <br>
                <input type="hidden" id="product_num" name="product_num" value="${product_info.product_num}">
                <input type="text" name="product_name" id="product_name" value="${product_info.product_name}" class="product_name border-0" style="font-size: 1.8em;" readonly>
                <br>
                <br>
                <input type="text" name="all_price" id="all_price" value="${product_info.price}원" class="product_price border-0" style="font-size: 1.3em;" readonly>
                
                <hr>

                <div class="d-flex">
                    <label class="col-3">사이즈</label>
                    <select id="size_opt" name="size_opt" class="form-select form-select-sm w-75 col-3">
                        <option selected value="220">220</option>
                        <option value="230">230</option>
                        <option value="240">240</option>
                        <option value="250">250</option>
                        <option value="260">260</option>
                        <option value="270">270</option>
                    </select>
                </div>
                

                <hr>
                <div class="d-flex justify-content-end">
                	<input type="text" id="amount" name="amount" value="1" class="form-control"readonly>
                	<button type="button"  class="badge bg-secondary mx-1" id="plus">+</button>
                	<button type="button" class="badge bg-secondary" id="minus">-</button>
                	
                </div>
                <hr>

                <div class="d-block d-flex justify-content-center align-items-center">
                <div class="col-5">
                	<h5 class="mt-1 mb-1">총 결제 금액</h5>
                  
                </div>
                <div class="col-7">
                 <input type="text" name="price" id="price" value="${product_info.price}" 
                  class=" w-75 all_price border-0 text-end" style="font-size: 1.8em;" readonly>
                  <span class="h2">원</span>
                	
                </div>
                  
                 
                </div>


                <div class="mt-4 d-flex">
                      <c:if test="${user_id  ne 'admin'}">
                    	<input type="button" id="plus_cart" value="장바구니" class="btn btn-secondary w-75 rounded-0 p-3 m-2">
                    	<input type="submit"  value="바로구매" class="btn btn-dark w-75 rounded-0 p-3 m-2">
                    

                  	</c:if>
                </div>
                

					<input type="hidden" id="user_id" name="user_id" value="${user_id}">
					<input type="hidden" id="imagePath" name="imagePath" value="${product_info.imagePath}">
				                
			</form>
            </div>

            <div class="col-2"></div>
        </div>


        <div class="mt-5">
            <div class="row d-flex">
                <div class="col-2"></div>

                <div class="col-8">
                    <div class="d-flex justify-content-center"">
                        <div class="col-4 text-center">
                            <h6 style="cursor: pointer" id="productBtn"><strong>상품정보</strong></h6>
                        </div>
                        <div class="col-4 text-center" style="color: grey;">
                            <h6 style="cursor: pointer" id="reviewBtn"><strong>상품후기</strong></h6>
                        </div>
                        <div class="col-4 text-center" style="color: grey;">
                            <h6 style="cursor: pointer" id="qnaBtn"><strong>상품문의</strong></h6>
                        </div>
                      </div> 

                      <hr>

                </div>

                <div class="col-2"></div>
            </div>
        </div>


        
        <div class="mt-5" id="product">
          <div class="row d-flex">
              <div class="col-2"></div>

              <div class="col-8">


                <p>${product_info.description }</p>


               <hr> 
              </div>

              
              <div class="col-2"></div>
          </div>
        </div>


        <div class="mt-5">
          <div class="row d-flex">
              <div class="col-2"></div>

              <div class="col-8">
                  <div class="d-flex justify-content-center">
                      <div class="col-4 text-center" style="color: grey;">
                          <h6 style="cursor: pointer" id="productBtn2"><strong>상품정보</strong></h6>
                      </div>
                      <div class="col-4 text-center">
                          <h6 style="cursor: pointer" id="reviewBtn2"><strong>상품후기</strong></h6>
                      </div>
                      <div class="col-4 text-center" style="color: grey;">
                          <h6 style="cursor: pointer" id="qnaBtn2"><strong>상품문의</strong></h6>
                      </div>
                    </div> 

                    <hr>

              </div>

              <div class="col-2"></div>
          </div>
      </div>

        <div class="mt-5" id="review">
          <div class="row d-flex">
              <div class="col-2"></div>

              <div class="col-8">




				
				<div id = "review_data">
				<c:forEach var="item" items="${review}">
				<div id = "new_review"></div>

							
               <div class="m-3">
                <div class="row">
                  <input type="text" class="review_text" value="${item.content}" readonly>
                </div>
                <div class="mt-3 d-flex justify-content-between" >
                
                <span type="text" value="${item.articleNo}" class="review_text" style="font-size: 0.8em; color: gray;" readonly>${item.articleNo}
                 
                 <input type="text" value="${item.user_id}" class="review_text" style=" color: gray;" readonly>
                
                </span>

                       <input type="text" value="${item.write_date}" class="review_text" style="font-size: 0.8em; color: gray;" readonly>
                
                
         
                </div>
               </div>
               <hr>
               
				</c:forEach>
				</div>


              </div>

              
              <div class="col-2"></div>
          </div>
        </div>


        <div class="mt-1 mb-5">
          <div class="row d-flex">
            <div class="col-2"></div>
            

            <div class="col-8 d-flex justify-content-center">
            
            
            
            <c:if test="${totArticles !=null }">   <!-- 리뷰 -->
          <div id="review_paging">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
		                     
		                     <div id="prevbtn"></div>
	                       	 <c:if test="${section2 > 1 && page==1 }">
		                       	<li class="page-item ">
		                        	<a class="page-link" id="prev" name="prev" onclick="review_page(${section2-1},${page},${product_info.product_num},2)">이전</a>
		                        	
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum2}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" id="${page}" onclick="review_page(${section2},${page},${product_info.product_num})">${(section2-1)*10 + page}</a>
			                      	
			                     </li>
	   	                    	</c:when>
	   	                    	
	   	                    	
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	
			                     <a class="page-link" id="${page}" onclick="review_page(${section2},${page},${product_info.product_num})">${(section2-1)*10 + page}</a>
			                     
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link"  id="next" name="next"  onclick="review_page(${section2+1},${pageNum},${product_info.product_num},1)">다음</a>
	                        
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
                </div>
                
                
                </c:if>
              
              
              
            </div>
            

            <div class="col-2"></div>
          </div>
        </div>


        <div class="mt-5 mb-5">
          <div class="row d-flex">
            <div class="col-2"></div>
            

            <div class="col-8 m-1">
             <c:if test="${user_id  ne 'admin'}">
              <div class="row">
              <h5>상품 리뷰 작성</h5>
              <hr class="border border-1 border-secondary">
              <div>
              
              <textarea class="review_content form-control"rows="3" style="resize: none;" id="review_text">내용</textarea>
              <div class="mb-3">
                <input type="button" id= "review_insert" value="후기 등록하기" class="btn btn-dark btn-sm rounded-0 p-2 mt-4">
              </div>
              </c:if>
              
              </div>
              <hr class="border border-1 border-secondary">
              </div>
            </div>
            

            <div class="col-2"></div>
          </div>
        </div>



	





        <div class="mt-5">
          <div class="row d-flex">
              <div class="col-2"></div>


              <div class="col-8">
                  <div class="d-flex justify-content-center">
                      <div class="col-4 text-center" style="color: grey;">
                          <h6 style="cursor: pointer"id="productBtn3"><strong>상품정보</strong></h6>
                      </div>
                      <div class="col-4 text-center" style="color: grey;">
                          <h6 style="cursor: pointer" id="reviewBtn3"><strong>상품후기</strong></h6>
                      </div>
                      <div class="col-4 text-center">
                          <h6 style="cursor: pointer" id="qnaBtn3"><strong>상품문의</strong></h6>
                      </div>
                    </div> 

                    <hr>

              </div>

              <div class="col-2"></div>
          </div>
        </div>


      <div>   
        <div class="row">
          <div class="col-2"></div>

          <div class="col-8">

        <table class="table table-borderless">
         
            
            	<h4 class="text-center"> 상품 문의 </h4>
	        	
	          	
	          	 <!-- foreach 기준 -->
		          	 <div class="m-3">
		                <div class="row">
		                  <input type="text" class="review_text" value="${qna_title}" readonly>
		                </div>
		                <div id = "pboard">
		                <div id= "new_p_board">
			                <c:forEach var="item" items="${p_board}" step="1"> 
				                <div class="mt-3">
				                
				                	<input type="text" value="${item.articleNo}" class="review_text" style="font-size: 1em; color: gray;" readonly>
					                <input type="text" value="${item.user_id}" class="review_text" style="font-size: 1em; color: gray;" readonly>
					                <input type="text" value="${item.qna_title}" class="review_text" style="font-size: 1em; color: black;" readonly>
					                <input type="text" value="${item.write_date}" class="review_text" style="font-size: 1em; color: gray;" readonly>
				                
				                </div>
			                </c:forEach>
			                </div>
			                
		                </div>
		             	
		                
	               </div>
	               <hr>
	          	  
	          	
	          	
	          	
               
	          	
	          	
          </tbody>
        </table>
        <div id="qna_view">
          <textarea class="qna_text form-control border border-0" rows="3" style="resize: none;" readonly>내용 readonly</textarea>
          <img src="https://image.folderstyle.com/data/folderstyle_data/images/product/00/00/05/74/27/m_0000057427.gif" style="width: 10%;" class="mt-2">
          <div class="mb-3 mt-3">
            <input type="button" value="수정" class="btn btn-dark btn-sm rounded-0 p-2 mt-4">
            <input type="button" id="replyBtn" value="답글달기" class="btn btn-dark btn-sm rounded-0 p-2 mt-4"> <!-- 관리자 전용 -->


            <!-- 관리자 전용 답글달기 폼 -->
            <div id="adminReply">
              <hr class="border border-1 border-secondary">
              <div class="mt-2">
                <textarea class="reply_content form-control" rows="2" style="resize: none;">내용</textarea>
                <input type="button" value="답변 등록하기" class="btn btn-dark btn-sm rounded-0 p-2 mt-4">
              </div>
            </div>

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
		                        	<a class="page-link" id="prev" name="prev" onclick="p_board_page(${section2-1},${page},${product_info.product_num},2)">이전</a>
		                        	
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum2}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" id="${page}" onclick="p_board_page(${section2},${page},${product_info.product_num})">${(section2-1)*10 + page}</a>
			                      	
			                     </li>
	   	                    	</c:when>
	   	                    	
	   	                    	
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	
			                     <a class="page-link" id="${page}" onclick="p_board_page(${section2},${page},${product_info.product_num})">${(section2-1)*10 + page}</a>
			                     
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section2 < totSection2}">
	                      <li class="page-item">
	                        <a class="page-link"  id="next" name="next"  onclick="p_board_page(${section2+1},${pageNum},${product_info.product_num},1)">다음</a>
	                        
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
                </div>
                </c:if>
        





        <div class="row mt-5">
        <c:if test="${user_id  ne 'admin'}">
          <h5>상품 문의 작성</h5>
          <hr class="border border-1 border-secondary">
          <div>
          <textarea class="qna_content form-control" id="p_board_text" name="p_board_text" rows="3" style="resize: none;">내용</textarea>
          <div class="mb-3 ">
            <input type="button" id="p_board" value="문의 등록하기" class="btn btn-dark btn-sm rounded-0 p-2 mt-4">
          </div>
          </c:if>
          
          </div>
          <hr class="border border-1 border-secondary">
          </div>


          </div>

          <div class="col-2"></div>
        </div>
      </div>

        



		</div>
      </div>    <!-- end productView -->
		

      <jsp:include page="../includes/footer.jsp" />

  </div>  <!-- main -->


  <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
  <script type="text/javascript">

  
  
  
  function review_page(section2,pageNum2,product_num2,chk){  //리뷰 페이징
	  
	
	  $.ajax({
			type: 'post',
			async: false,
			url: "${ctxPath}/reviewList.do",

			
			data:{
				pageBlock : section2,
				pageNum: pageNum2,
				product_num : product_num2
				
			},
			success: function(data, textStatus){
				var jsonInfo = JSON.parse(data)
				$('#review_data').html('')
				$('#review_paging').html('')
				
				for(let i = 0; i < 4; i++){
					
					if(jsonInfo.list[i] == null){
						break;
						
					}
					
				$('#review_data').append(
				                "<div class='m-3' >"
				                +"<div class='row'>"
				                  +"<input type='text' class='review_text' value='"+ jsonInfo.list[i].content +"' readonly>"
				                +"</div>"
				                +"<div class='mt-3 d-flex justify-content-between'>"
				                +"<span type='text' class='review_text' style='font-size: 0.8em; color: gray;' readonly>"
				                + jsonInfo.list[i].articleNo 
				                +"<input type='text' value='"+ jsonInfo.list[i].user_id  +"' class='review_text' style='color: gray;' readonly>"
				                 
				                +"</span>"
				               
				                  +"<input type='text' value='2020-06-05' class='review_text' style='font-size: 0.8em; color: gray;' readonly>"
				                +"</div>"
				               +"</div>"
				               +"<hr>"
							
					)
				
				}

				
			$('#review_paging').html(jsonInfo.paging[0].data)
				
			},error:function(data,textStatus){
				alert("다시 시도해주시길 바랍니다")
			}
			
		}); // end ajax  
		
		
	
}
  
  
  	function p_board_page(section2,pageNum2,product_num2,chk){  //문의사항 페이징
  	    
  		
         	$.ajax({
				type: 'post',
				async: false,
				url: "${ctxPath}/inquiryList.do",
				data:{
					pageBlock : section2,
					pageNum: pageNum2,
					product_num : product_num2
					
				},
				success: function(data, textStatus){
					var jsonInfo = JSON.parse(data)
					$('#pboard').html('')
					$('#paging').html('')
					
					for(let i = 0; i < 4; i++){
						if(jsonInfo.list[i] == null){
							break;
						}
						
						
					$('#pboard').append(
					                "<div class='mt-3'>"
					                + "<input type='text' value='"+ jsonInfo.list[i].articleNo  +"'class='review_text' style='font-size: 1em; color: gray;' readonly>"
					                + "<input type='text' value='"+ jsonInfo.list[i].user_id  +"'class='review_text' style='font-size: 1em; color: gray;' readonly>"
					                + "<input type='text' value='"+ jsonInfo.list[i].qna_title  +"'class='review_text' style='font-size: 1em; color: black;' readonly>"
					                + "<input type='text' value='"+ jsonInfo.list[i].write_date  +"'class='review_text' style='font-size: 1em; color: gray;' readonly>"
					               + "</div>" 
							 )
					}
					
				$('#paging').html(jsonInfo.paging[0].data)
						
					
				},error:function(data,textStatus){
					alert("다시 시도해주시길 바랍니다")
				}
				
			}); // end ajax  
			
  	}
  	
  	
  	
     $(function(){

      document.getElementById('qna_view').style.display = 'none';
      document.getElementById('adminReply').style.display = 'none';

      
      var b = $('#price').val()
      
      $('#plus').click(function(){
    	  var a = $('#amount').val()
    	  $('#amount').val(parseInt(a)+1)
    	  var c = $('#price').val()
    	  $('#price').val( (parseInt(c) + parseInt(b)) )
    	  
      })
      
        $('#minus').click(function(){
    	  var a = $('#amount').val()
    	  var c = $('#price').val()
    	if(parseInt(a) <= 1){
    		alert('주문 최소 수량은 1개 입니다')
    	}else{ 
    	
    	  $('#amount').val(parseInt(a)-1)
    	  $('#price').val( ((parseInt(c)-parseInt(b))))
    	}
        
        })
      
      
      
        var action = true;
        $('#qna').on("click",function(){

          if(action){
            $('#qna_view').show();

            }else{
              $('#qna_view').hide();
            }
            action = !action;

        })
          var action2 = true;
          $('#replyBtn').on("click",function(){

            if(action2){
            $('#adminReply').show();

            }else{
              $('#adminReply').hide();
            }
            action2 = !action2;
            
        })
        
        
        
       
    
       
$('#plus_cart').click(function(e){
				
				e.preventDefault();
				var user_id2 = $('#user_id').val() 
				var product_num2 = $('#product_num').val()
				var product_name2 =$('#product_name').val()
				var amount2 = $('#amount').val()  //체크값
				var price2 = $('#price').val()
				var p_size2 = $('#size_opt').val()   //체크값
				var imagePath2 = $('#imagePath').val()
				
				
				var isCheck = confirm('장바구니에 추가 하겠습니까?');
				alert(imagePath2)
				
				
				if(isCheck){
					
				 $.ajax({
					type: 'post',
					async: false,
					url: "${ctxPath}/cartInsert.do",
					data:{
						user_id : user_id2,
						product_num: product_num2,
						product_name : product_name2,
						amount : amount2,
						price : price2,
						p_size : p_size2,
						imagePath : imagePath2
					},
					success: function(data, textStatus){
						if(data == 'false'){
							alert('이미 장바구니에 있습니다')
						}else{
							alert('장바구니에 추가되었습니다')
						}
						
						
					},error:function(data,textStatus){
						alert("다시 시도해주시길 바랍니다")
					}
					
				}); // end ajax 
				
				
				} // end if
		
			}) // end delBtn 
        
       
		
			
			
$('#review_insert').click(function(e){
				e.preventDefault();
				
				var user_id2 = $('#user_id').val() 
				var product_num2 = $('#product_num').val()
				var content2 = $('#review_text').val() 
				var imagePath2 = $('#imagePath').val()
				
					
				 $.ajax({
					type: 'post',
					async: false,
					url: "${ctxPath}/reviewInsert.do",
					data:{
						user_id : user_id2,
						product_num : product_num2,
						content : content2,
						imagePath : imagePath2
					},
					success: function(data, textStatus){
						
						if(data == 'false'){
							alert('리뷰 쓰기 권한이 없습니다')
						}else{
							
							if(data == 'chk_false'){
								alert('리뷰는 한 번만 작성 할 수 있습니다.')
								
							}else{
								alert(data)
								$('#new_review').empty()
								$('#review_data').html(data)
								
								alert('리뷰 작성되었습니다')
								
							}
							
							
							
						}
						
						
					},error:function(data,textStatus){
						alert("다시 시도해주시길 바랍니다")
					}
					
				}); // end ajax 
				
				
		
			}) // end delBtn 
        
			

			
			$('#p_board').click(function(e){
				e.preventDefault();
				
				var user_id2 = $('#user_id').val() 
				var product_num2 = $('#product_num').val()
				var content2 = $('#p_board_text').val() 
				var imagePath2 = $('#imagePath').val()
				
				
					
				 $.ajax({
					type: 'post',
					async: false,
					url: "${ctxPath}/inquiryInsert.do",
					data:{
						user_id : user_id2,
						product_num : product_num2,
						qna_title : content2,
						imagePath : imagePath2
					},
					success: function(data, textStatus){
						if(data == 'false'){
							alert('잠시후 다시 시도해주시길 바랍니다.')
						}else{
							
							$('#new_p_board').empty()
							$('#pboard').html(data)
							
							alert('문의사항 작성되었습니다')
						}
						
					},error:function(data,textStatus){
						alert("잠시후 다시 시도해주시길 바랍니다.")
					}
					
				}); // end ajax 
				
		
			}) // end delBtn 
        
			
			
          
        $('#productBtn, #productBtn2, #productBtn3').on("click", function(){
	        const offset = $('#product').offset();
	          $('html, body').animate({scrollTop: offset.top}, 0);
        })

        $('#reviewBtn, #reviewBtn2, #reviewBtn3').on("click", function(){
	        const offset = $('#review').offset();
	          $('html, body').animate({scrollTop: offset.top}, 0);
        })

        $('#qnaBtn, #qnaBtn2, #qnaBtn3').on("click", function(){
	        const offset = $('#qna').offset();
	          $('html, body').animate({scrollTop: offset.top}, 0);
        })


     })


     function productSerchList(){
    	$('#searchForm').submit();
	}

  </script>

</body>
</html>