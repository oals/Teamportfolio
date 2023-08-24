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
        <title>공지사항 조회</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
        
        <style>
      .inputBox {
        border: none;
      }
      .inputBox:focus {
      	outline: none;
      	box-shadow: none;
      }
      .nameLabel {
        padding-left: 20px;
      }
      textarea {
      	border: none;
		outline: none;
		}
    </style>
    </head>
<body>
<div>noticeView.jsp</div>
<jsp:include page="../includes/headerNav.jsp" />



<div class="main">
        <div class="container">
          <div class="w-75 m-auto mt-5">
          <form action="${ctxPath}/noticeModify.do">
            <h4 class="p-2" style="font-weight: 600;">공지사항</h4>
            <input type="hidden" id="article_No" name="article_No" value = "${shop_Write_AdminBoardDTO.article_No}">
          </div>
          <div class="w-75 m-auto">
            <div class="row">
            <hr style="border: solid 2px black;">
              <div class="col-8">
                <input
                  type="text"
                  name="title"
                  readonly
                  class="inputBox nameLabel mb-3"
                  id="title"
                  value="${shop_Write_AdminBoardDTO.title}"
                  style="font-size: 1.2rem; font-weight: 600;"
                />
              </div>
              <div class="col-4 text-end">
                <input
                  type="text"
                  name="write_date"
                  id="write_date"
                  class="inputBox"
                  readonly
                  value="${shop_Write_AdminBoardDTO.write_date}"
                  style="width: 100px"
                />
              </div>
              <hr>
            </div>
            <div class="mb-3 row">
              <div class="col-12">
                <textarea
                  readonly
                  name="content"
                  class="nameLabel w-100"
                  id="content"
                  rows="10"
                  style="resize:none;"
                >${shop_Write_AdminBoardDTO.content} </textarea>
              </div>
            </div>
            <div class="mb-5 row">
            <hr class="mb-4">
              <label for="imageFileName" class="col-2 col-form-label"
                >첨부파일</label
              >
              <div class="col-10">
                <input
                  type="file"
                  readonly
                  class="form-control p-2"
                  name="imageFileName"
                  id="imageFileName"
                />
              </div>
            </div>
          </div>

          <div class="m-auto d-flex justify-content-center mb-5">
            <div class="w-75 d-flex justify-content-between">
              <div>
              
              <c:if test="${sessionScope.admin == 'true'}">
                <button
                  type="submit"
                  class="btn btn-outline-secondary"
                >
                  수정
                </button>
                
                </form>
                
                <button
                  type="button"
                  class="btn btn-outline-secondary"
                  onclick="noticeDelete()"
                >
                  삭제
                </button>
                
                </c:if>
                
              </div>
              <div>
                <button
                  type="button"
                  class="btn btn-danger"
                  onclick="noticeList()"
                >
                  목록
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
      <jsp:include page="../includes/footer.jsp" />
      
                            
        
        
        <script type="text/javascript">
        	
        
        	function productList(){
           		location.href="${ctxPath}/productList.do"
           	}
        	
        	function noticeModify(){
        		location.href="${ctxPath}/noticeModify.do"
        	}
        	function noticeDelete(){
        		location.href="${ctxPath}/noticeDelete.do?article_No=" + "${shop_Write_AdminBoardDTO.article_No}"
        	}
        	function noticeList(){
        		location.href="${ctxPath}/noticeList.do"
        	}
        	function productSerchList(){
            	$('#searchForm').submit();
        	}
        </script>
        
   
</body>
</html>