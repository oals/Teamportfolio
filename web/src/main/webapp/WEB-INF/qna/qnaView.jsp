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
        <title>문의사항 조회</title>
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
<div>qnaView.jsp</div>
<jsp:include page="../includes/headerNav.jsp" />

<div class="main">
  <div class="container">
    <div class="w-75 m-auto mt-5">
      <h4 class="">문의사항 ></h4>
      <hr />
    </div>
    <div class="w-75 m-auto">
      <div class="row">
        <div class="col-sm-4">
          <label for="" class="nameLabel">글쓴이 : </label>
          <input
            type="text"
            name=""
            id=""
            class="inputBox"
            readonly
            value="${qna_info.user_id}"
            style="width: 60px"
          />
        </div>
        <div class="col-sm-8 text-end">
          <label for="">작성일 : </label>
          <input
            type="text"
            name=""
            id=""
            class="inputBox"
            readonly
            value="${qna_info.write_date}"
            style="width: 100px"
          />
        </div>
      </div>
      <div class="mb-3 row mt-5">
        <label for="title" class="col-sm-2 col-form-label">제목</label>
        <div class="col-sm-10">
          <input
            type="text"
            name="title"
            readonly
            class="form-control-plaintext border rounded-1 p-2"
            id="title"
            value="${qna_info.qna_title}"
          />
        </div>
      </div>
      <div class="mb-3 row">
        <label for="content" class="col-sm-2 col-form-label">내용</label>
        <div class="col-sm-10">
          <textarea
            readonly
            name="content"
            class="form-control-plaintext border rounded-1 p-2"
            id="content"
            rows="10"
          >
${qna_info.qna_content} </textarea
          >
        </div>
      </div>
      <div class="mb-5 row">
        <label for="imageFileName" class="col-sm-2 col-form-label"
          >답변</label
        >
        <div class="col-sm-10">
          <input
            type="text"
            readonly
            class="form-control p-2"
            name="imageFileName"
            id="imageFileName"
            value="${qna_info.qna_reply}"
          />
        </div>
      </div>
    </div>

          <div class="m-auto d-flex justify-content-center mb-5">
            <div class="w-75 d-flex justify-content-between">
              <div>
                <button
                  type="button"
                  class="btn btn-outline-secondary"
                  onclick="qnaModify()"
                >
                  수정
                </button>
                <button
                  type="button"
                  class="btn btn-outline-secondary"
                  onclick="qnaDelete()"
                >
                  삭제
                </button>
              </div>
              <div>
                <button
                  type="button"
                  class="btn btn-outline-secondary"
                  onclick="qnaReply()"
                >
                  답글
                </button>
                <button
                  type="button"
                  class="btn btn-danger"
                  onclick="qnaList()"
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
        
        function qnaModify(){
          location.href="${ctxPath}/qnaModify.do" + "?qna_num=${qna_num}"
        }
        function qnaDelete(){
          
          var chk = confirm('삭제하시겟습니까?');
          if(chk == 1){
            location.href="${ctxPath}/qnaDelete.do" + "?qna_num=${qna_num}"
          }
          
          
        }
        function qnaReply(){
          location.href="${ctxPath}/qnaReply.do"
        }
        function qnaList(){
          location.href="${ctxPath}/qnaList.do"
        }
      </script>
        
   
</body>
</html>