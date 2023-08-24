<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="ctxPath" value="<%=request.getContextPath() %>" />
<c:set var="loginCheck" value="<%=session.getAttribute(\"loginInfo\")%>" />


<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>문의사항</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
		<style>
      th {
        text-align: center;
      }
      #center {
      	text-align: center;
      }
      h6 {
        color: lightslategray;
      }
      .pagination > li > a
		{
		    background-color: white;
		    color: rgb(240, 36, 36);
		}
		
		.pagination > li > a:focus,
		.pagination > li > a:hover,
		.pagination > li > span:focus,
		.pagination > li > span:hover
		{
		    color: #5a5a5a;
		    background-color: #eee;
		    border-color: #ddd;
		}
		
		.pagination > .active > a
		{
		    color: white;
		    background-color: rgb(240, 36, 36) !Important;
		    border: solid 1px rgb(240, 36, 36) !Important;
		}
		
		.pagination > .active > a:hover
		{
		    background-color: rgb(240, 36, 36) !Important;
		    border: solid 1px rgb(240, 36, 36);
		}
		.nameLabel {
        padding-left: 20px;
      }
    </style>
    </head>
    
    
<body>
<div class="main">

<jsp:include page="../includes/headerNav.jsp" />

        <div class="container mt-5">
          <div class="w-75 m-auto">
            <h4 class="nameLabel" style="font-weight: 600;">문의사항</h4>
          </div>
          <div class="w-75 m-auto mt-3">
            <hr style="border: solid 2px black;">
            <table class="table">
              <thead class="table-light">
                <tr>
                  <th scope="col" style="width: 10%" id="center">No</th>
                  <th scope="col" style="width: 65%" id="center">제목</th>
                  <th scope="col" style="width: 10%" id="center">글쓴이</th>
                  <th scope="col" style="width: 15%" id="center">작성일</th>
                </tr>
              </thead>
              <tbody>
                <c:forEach var="item" items = "${board_list}" step="1">
              	
              
              
                <tr>
                  <th scope="row">${item.qna_num}</th>
                  <td onclick="qnaSelect()" style="cursor: pointer">
                  <a href = "${ctxPath}/qnaSelect.do?qna_num=${item.qna_num}">${item.qna_title}</a>
                    
                  </td>
                  <td id="center">${item.user_id}</td>
                  <td id="center">${item.write_date}</td>
                </tr>
                
                	</c:forEach>
                
              </tbody>
            </table>

            <div class="d-flex justify-content-between p-4 mb-3">
              <div>
                <button type="button" class="btn btn-outline-primary invisible">
                  더미용
                </button>
              </div>
              
	<nav aria-label="...">
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
	                       	 <c:if test="${section > 1 && page==1 }">
		                      	<li class="page-item ">
		                        	<a class="page-link" href="${ctxPath}/qnaList.do?pageBlock=${section-1}&pageNum=1">이전</a>
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" href="${ctxPath}/qnaList.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:when>
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	<a class="page-link" href="${ctxPath}/qnaList.do?pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link" href="${ctxPath}/qnaList.do?pageBlock=${section+1}&pageNum=1">다음</a>
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
              
              
              
              <div>
                <button
                  type="button"
                  class="btn btn-danger"
                  onclick="qnaRegister()"
                >
                  글쓰기
                </button>
              </div>
            </div>
          </div>
        </div>
        
        <jsp:include page="../includes/footer.jsp" />
        
      </div>

        <script type="text/javascript">
	        
	        function productList(){
	    		location.href="${ctxPath}/productList.do"
	    	}
	        function qnaSelect(){
	    		location.href="${ctxPath}/qnaSelect.do"
	    	}
        	function qnaRegister(){
        		location.href="${ctxPath}/qnaRegister.do"
        	}
        	
        </script>
        
        
</body>
</html>