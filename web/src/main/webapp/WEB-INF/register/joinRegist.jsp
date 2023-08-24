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
                <h3 class="mb-5 mt-5 text-center"><strong>회원가입을 환영합니다!</strong></h3>
                <div class="w-100 border border-2 border-black row p-5" style="height: 200px;">
                  <div class="col-3 m-auto">
                    <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" fill="currentColor" class="bi bi-person-plus" viewBox="0 0 16 16">
                      <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H1s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C9.516 10.68 8.289 10 6 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                      <path fill-rule="evenodd" d="M13.5 5a.5.5 0 0 1 .5.5V7h1.5a.5.5 0 0 1 0 1H14v1.5a.5.5 0 0 1-1 0V8h-1.5a.5.5 0 0 1 0-1H13V5.5a.5.5 0 0 1 .5-.5z"/>
                    </svg>
                  </div>
                    <div class="d-flex row w-50 m-auto col-6">
                      <span style="font-size: 1.2rem;" class="col-12"><strong>온라인회원 가입</strong></span>
                      <span style="font-size: 0.8rem; color: lightslategray;" class="col-12">신규 가입 즉시 <span style="color: black;">5,000원</span> 할인쿠폰 지급!</span>
                    </div>
                    <div class="col-3 m-auto d-flex justify-content-end">
                      <a href="${ctxPath}/user_register_form.do" class="hearder_link">
                  <svg xmlns="http://www.w3.org/2000/svg" width="75" height="75" fill="currentColor" class="bi bi-arrow-right" viewBox="0 0 16 16">
                    <path fill-rule="evenodd" d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z"/>
                  </svg>
                </a>
                </div>
                </div>
                <ul class="p-4" style="font-size: 0.9rem;">
                  <li>
                    <font style="color: red; font-weight: bold;">회원 탈퇴 후 재가입 시, 신규 가입 5,000P와 가입 축하 할인 쿠폰(5,000원)은 지급되지 않습니다.</font>
                    <br>
                    <font style="color: gray; font-weight: bold;">(아트닷컴 오픈 이전 기존 ABC-MART 회원 탈퇴 시에도 해당)</font>
                  </li>
                  <li>
                    신규 가입 5,000P는 <font style="color: red;">이벤트 포인트로 단일 품목 3만원 이상 구매 시 사용 가능합니다.</font>
                  </li>
                  <li>
                    쿠폰은 일부 품목 적용 제외될 수 있으며, 사용 전 쿠폰 사용 조건을 확인해주시기 바랍니다.
                  </li>
                </ul>
                

            </div>    <!-- col-8 -->


            <div class="col-3"></div>
        </div>

        


          
      
      </div>
    
    <jsp:include page="../includes/footer.jsp" />
    
    
</div>

</body>

    <script type="text/javascript">
    
	    function productList(){
			location.href="${ctxPath}/productList.do"
		}
	    function orderRegister(){
			location.href="${ctxPath}/orderRegister.do"
		}
    
	    $(function(){
		console.log('jquery')
		
		
		
			
		
		
		}); // end function
    	
    </script>
    
    
</body>
</html>