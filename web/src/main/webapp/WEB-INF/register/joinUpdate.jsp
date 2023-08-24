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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js" integrity="sha384-fbbOQedDUMZZ5KreZpsbe1LCZPVmfTnH7ois6mU1QK+m14rQ1l2bGBq41eYeM/fS" crossorigin="anonymous"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/01debed61a.js" crossorigin="anonymous"></script>
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
      left: 60%;
      bottom: 0.5%;
    }
    
    .underline{
      BORDER-BOTTOM: lightgray 1px solid;
      BORDER-LEFT: medium none;
      BORDER-RIGHT: medium none;
      BORDER-TOP: medium none;
      FONT-SIZE: 9pt
    }
    .underline:focus{
      outline: none;
    }
    
      textarea {
        width: 100%;
        height: 5rem;
        resize: none;
        margin-bottom: 5px;
      }
      ::placeholder {
        font-size: inherit !important;
      }
      li::marker{
        font-size: 0.5rem;
      }
  </style>
</head>
<body>
<div>joinRegist.jsp</div>
<body>

<div class="main">

	<jsp:include page="../includes/headerNav.jsp" />
		
		<div class="main mt-5 mb-5">
        
        <div class="row d-flex">
            <div class="col-3"></div>

            <div class="col-6 row justify-content-center mb-5">
                
                <div class="w-100 row p-5" style="height: 300px;">
                  <div class="col-12 m-auto d-flex justify-content-center">
                    <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-check-circle" viewBox="0 0 16 16">
                      <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
                      <path d="M10.97 4.97a.235.235 0 0 0-.02.022L7.477 9.417 5.384 7.323a.75.75 0 0 0-1.06 1.06L6.97 11.03a.75.75 0 0 0 1.079-.02l3.992-4.99a.75.75 0 0 0-1.071-1.05z"/>
                    </svg>
                  </div>
                    <div class="d-flex row w-75 m-auto col-12 text-center mt-4">
                      <span style="font-size: 1.5rem;" class="col-12">온라인 <strong>회원가입이 완료</strong>되었습니다.</span>
                      <span style="font-size: 1rem; color: lightslategray;" class="col-12">로그인 후 이용가능합니다.</span>
                    </div>
                    <div class="col-12 m-auto d-flex justify-content-center mt-4">
                      <button type="button" onclick ="login()" class="btn btn-lg btn-dark rounded-0">로그인하러 가기</button>
                </div>
                </div>
                

            </div>    <!-- col-8 -->


            <div class="col-3"></div>
        </div>

        


          
      
      </div>
    
    <jsp:include page="../includes/footer.jsp" />
    
    
</div>

</body>

    <script type="text/javascript">
    
	    function login(){
			location.href="${ctxPath}/login_page.do"
		}
    
	    $(function(){
		console.log('jquery')
		
		
		
			
		
		
		}); // end function
    	
    </script>
    
    
</body>
</html>